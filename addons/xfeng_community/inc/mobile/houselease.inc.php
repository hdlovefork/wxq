<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端房屋租赁
 */


global $_W, $_GPC;
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
$id = intval($_GPC['id']);

//查对应的小区编号
$member = $this->changemember();
$region = $this->mreg();
$set = ln_syssetting_read($member['regionid'],'xqset');
if ($op == 'add') {
    load()->model('mc');
    $m = mc_fetch($_W['member']['uid'], array('realname', 'mobile', 'address'));

    if (!empty($id)) {
        $item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_houselease') . "WHERE id=:id", array(':id' => $id));
        $images = $item['images'];
        if ($images&&$item['images'] !='N;') {
            $imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$images})");
        }
    }

    $category = !empty($_GPC['category']) ? $_GPC['category'] : 1;

    if ($_W['isajax']) {

        $data = array(
            'weid'         => $_W['weid'],
            'openid'       => $_W['fans']['from_user'],
            'regionid'     => $member['regionid'],
            'category'     => $category,
            'way'          => $_GPC['way'],
            'model_room'   => $_GPC['model_room'],
            'model_hall'   => $_GPC['model_hall'],
            'model_toilet' => $_GPC['model_toilet'],
            'model_area'   => $_GPC['model_area'],
            'floor_layer'  => $_GPC['floor_layer'],
            'floor_number' => $_GPC['floor_number'],
            'fitment'      => $_GPC['fitment'],
            'house'        => $_GPC['house'],
            'allocation'   => substr($_GPC['allocation'], 0, strlen($_GPC['allocation']) - 1),
            'price_way'    => $_GPC['price_way'],
            'price'        => $_GPC['price'],
            'checktime'    => $_GPC['checktime'],
            'title'        => $_GPC['title'],
            'realname'     => $_GPC['realname'],
            'mobile'       => $_GPC['mobile'],
            'content'      => $_GPC['content'],
            'createtime'   => TIMESTAMP,
            'images'       => substr($_GPC['picIds'], 0, strlen($_GPC['picIds']) - 1),

        );
        $set = $this->set();
        $data['enable'] = $set['houselease_status'] ? 1 : 0; //0审核通过
        if (empty($id)) {
            $r = pdo_insert('xcommunity_houselease', $data);

        }
        else {
            $r = pdo_update('xcommunity_houselease', $data, array('id' => $id));

        }
        if ($r) {
            $result = array(
                'status' => 1,
            );
            echo json_encode($result);
            exit();
        }
    }
    include $this->template($this->xqtpl('houselease/add'));
}
elseif ($op == 'list') {
    //房屋租赁列表
    $set = $this->set();

    if ($_W['isajax']) {
        $pindex = max(1, intval($_GPC['page']));
        $psize = 10;
        $price = trim($_GPC['price']);
        $category = intval($_GPC['category']);
        $keyword = trim($_GPC['keyword']);
        $condition = '';
        if ($category) {
            $condition .= " AND category =:category";
            $params[':category'] = $category;
        }
        if (empty($set['house_status'])) {
            $condition .= " AND regionid='{$member['regionid']}'";
        }

        if($price == '1000'){
            $condition .=" and price < 1000";
        }elseif($price == '2000'){
            $condition .=" and price > 1000 and price < 2000";
        }elseif ($price == '4000'){
            $condition .=" and price > 2000 and price < 4000";
        }elseif($price == '6000'){
            $condition .=" and price >= 4000";
        }
        if (!empty($keyword)) {
            $condition .= " AND title LIKE '%{$_GPC['keyword']}%'";
        }
        $list = pdo_fetchall('SELECT * FROM' . tablename('xcommunity_houselease') . "WHERE enable =0 and weid='{$_W['weid']}' $condition order by id desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize, $params);
        foreach ($list as $key => $value) {
            $image = $value['images'];
            if ($image) {
                $imgs = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_images') . "WHERE id in({$image})");
                $list[$key]['img'] = $imgs[0][src];
            }else{
                $thumb = MODULE_URL . "template/mobile/style1/static/image/house.jpg";
                $list[$key]['img'] = $thumb;
            }
            $url = $this->createMobileUrl('houselease', array('op' => 'detail', 'id' => $value['id']));
            $list[$key]['url'] = $url;
            $datetime = date('Y-m-d H:i:s', $value['createtime']);
            $list[$key]['datetime'] = $datetime;
            $reg = $this->region($value['regionid']);
            $list[$key]['regionname'] = $reg['title'];
            $list[$key]['city'] = $reg['city'];
            $list[$key]['dist'] = $reg['dist'];
        }
        $data = array();
        $data['list'] = $list;
        die(json_encode($data));
    }

    include $this->template($this->xqtpl('houselease/list'));
}
elseif ($op == 'my') {
    $category = !empty($_GPC['category']) ? $_GPC['category'] : 1;
    if ($_W['isajax']) {
        $pindex = max(1, intval($_GPC['page']));
        $psize = 10;
        $condition = '';
        if ($category) {
            $condition .= " AND category =:category";
            $params[':category'] = $category;
        }
        $list= pdo_fetchall('SELECT * FROM' . tablename('xcommunity_houselease') . "WHERE weid='{$_W['weid']}' AND regionid='{$member['regionid']}' AND openid='{$_W['fans']['from_user']}' $condition order by id desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize, $params);
        foreach ($list as $key => $value) {
            $url = $this->createMobileUrl('houselease', array('op' => 'add', 'id' => $value['id']));
            $list[$key]['url'] = $url;
            $datetime = date('Y-m-d H:i:s', $value['createtime']);
            $list[$key]['datetime'] = $datetime;
            $reg = $this->region($value['regionid']);
            $list[$key]['regionname'] = $reg['title'];
            $image = $value['images'];
            if ($image) {
                $imgs = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_images') . "WHERE id in({$image})");
                $list[$key]['img'] = $imgs[0][src];
            }else{
                $thumb = MODULE_URL . "template/mobile/style1/static/image/house.jpg";
                $list[$key]['img'] = $thumb;
            }
        }
        $data = array();
        $data['list'] = $list;
        die(json_encode($data));
    }
    include $this->template($this->xqtpl('houselease/my'));
}
elseif ($op == 'detail') {
    if (empty($id)) {
        message('缺少参数', referer(), 'error');
    }
    $item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_houselease') . "WHERE weid=:weid AND id=:id", array(':weid' => $_W['uniacid'], ':id' => $id));
    //判断是否开启房屋租赁托管服务
    $set = pdo_fetch("SELECT * FROM" . tablename('xcommunity_set') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
    if ($set['h_status']) {
        $region = $this->region($item['regionid']);
    }
    if (empty($item)) {
        message('信息已删除或不存在', referer(), 'error');
    }
    if ($item['images'] && $item['images'] != 'N;') {
        $imgs = pdo_fetchall("SELECT src FROM" . tablename('xcommunity_images') . "WHERE id in({$item['images']})");
    }
    include $this->template($this->xqtpl('houselease/detail'));
}
elseif ($op == 'delete') {
    $id = intval($_GPC['id']);
    if (pdo_delete('xcommunity_houselease', array('id' => $id))) {
        $result['state'] = 0;
        message($result, '', 'ajax');
    }
}
elseif ($op == 'finish') {
    $id = intval($_GPC['id']);
    if ($id) {
        $r = pdo_update('xcommunity_houselease', array('status' => 1), array('id' => $id));
        if ($r) {
            echo json_encode(array('result' => 1));
        }
    }
}elseif($op == 'del'){
    $id = intval($_GPC['id']);
    pdo_delte('xcommunity_images',array('id' => $id));
}






