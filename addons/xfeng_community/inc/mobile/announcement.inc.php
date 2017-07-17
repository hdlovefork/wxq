<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端公告页面
 */
global $_GPC, $_W;
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
$id = intval($_GPC['id']);
$member = $this->changemember();
$region = $this->mreg();
if ($op == 'list') {
    if($_W['isajax']){
        $pindex = max(1, intval($_GPC['page']));
        $psize = 100;
        $sql = "select * from " . tablename("xcommunity_announcement") . " where weid='{$_W['weid']}' order by id desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize;
        $row = pdo_fetchall($sql);
        $list = array();
        foreach ($row as $key => $value) {
            if ($value['regionid'] != 'N;') {
                $regions = unserialize($value['regionid']);
                if (@in_array($member['regionid'], $regions)) {
                    $r = pdo_fetch("SELECT * FROM" . tablename('xcommunity_reading_member') . "WHERE aid=:aid AND openid=:openid", array(':aid' => $value['id'], ':openid' => $_W['fans']['from_user']));
                    $dat = date('Y-m', $value['createtime']);
                    $da = date('d', $value['createtime']);
                    $css = $r ? 'ggok_read':'ggno_read';
                    $p = $r ? '已读':'未读';
                    $pcss = $r ? 'ggok':'ggno';
                    $url = $this->createMobileUrl('announcement', array('op' => 'detail', 'id' => $value['id']));
                    $region = $this->region($member['regionid']);
                    $reason = $value['reason'];
                    $title = $value['title'];
                    $list[] = array(
                        'id' => $value['id'],
                        'createtime' => $value['createtime'],
                        'title' => $title,
                        'rstatus' => $r ? $r : 1,
                        'datetime' => $value['datetime'],
                        'location' => $value['location'],
                        'reason' => $reason,
                        'remark' => $value['remark'],
                        'content' => $value['content'],
                        'dat' => $dat,
                        'da'=>$da,
                        'css' => $css,
                        'p'=> $p,
                        'url' => $url,
                        'pcss' => $pcss,
                        'regionname' => $region['title']
                    );
                }
            }
        }
        $data = array();
        $data['list'] = $list;
        die(json_encode($data));
    }
    include $this->template($this->xqtpl('announcement/list'));
}
elseif ($op == 'detail') {
    $item = pdo_fetch("select * from " . tablename("xcommunity_announcement") . "where weid='{$_W['weid']}' and id =:id", array(':id' => $id));
    $flag = $_W['fans']['from_user'].$item['id'];
    if($_GPC['visit_flag'] == $flag){
//        echo "已经访问过！";
    }else{
//        echo "第一次访问";
        $data = array(
            'uniacid' => $_W['uniacid'],
            'aid'     => $item['id'],
            'openid'  => $_W['fans']['from_user'],
            'status'  => 1,
        );
        $result = pdo_insert('xcommunity_reading_member', $data);
    }
    isetcookie("visit_flag",$flag);

    include $this->template($this->xqtpl('announcement/detail'));
}
elseif ($op == 'ajax') {
    $r = pdo_fetch("SELECT * FROM" . tablename('xcommunity_reading_member') . "WHERE aid=:aid AND openid=:openid", array(':aid' => $id, ':openid' => $_W['fans']['from_user']));
    if (empty($r)) {
        $data = array(
            'uniacid' => $_W['uniacid'],
            'aid'     => $id,
            'openid'  => $_W['fans']['from_user'],
            'status'  => 1,
        );
        $result = pdo_insert('xcommunity_reading_member', $data);
        if ($result) {
            echo json_encode(array('s' => 1));
            exit();
        }
    }
}
	