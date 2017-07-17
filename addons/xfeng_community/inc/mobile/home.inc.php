<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端首页
 */

global $_GPC, $_W;
$set = $this->set();
$member = $this->member($_W['fans']['from_user']);
if($member['mobile']&&empty($member['status']) ){
    message('耐心等待管理员审核', '', 'success');
    exit();
}
if (empty($set['visitor_status'])) {
    $member = $this->changemember();
    $regionid = $member['regionid'];
    if (empty($member['status'])) {
        message('耐心等待管理员审核', '', 'success');
        exit();
    }
}
else {
   // $member = pdo_get('xcommunity_member', array('openid' => $_W['fans']['from_user'],'enable' => 1), array('id', 'regionid', 'mobile'));
    $regionid = intval($_GPC['regionid']) ? intval($_GPC['regionid']) : $member['regionid'];
    $member = pdo_get('xcommunity_member', array('openid' => $_W['fans']['from_user'],'regionid' => $regionid), array('id', 'regionid', 'mobile'));
    if ($regionid&&empty($member)) {
        //查当前绑定的小区,解除绑定
        $userinfo = $this->member($_W['fans']['from_user']);
        pdo_update('xcommunity_member',array('enable' => 0),array('id' => $userinfo['id']));
        $data = array(
            'weid'       => $_W['uniacid'],
            'createtime' => TIMESTAMP,
            'regionid'   => $regionid,
            'status'     => 1,
            'openid'     => $_W['fans']['from_user'],
            'memberid'   => $_W['member']['uid'],
            'type'       => 1,
            'enable'     => 1
        );
        pdo_insert('xcommunity_member', $data);
        $id = pdo_insertid();
    }
//    else {
//        pdo_update('xcommunity_member', array('regionid' => $regionid), array('id' => $member['id']));
//    }
}
$region = $this->mreg();
$slide = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_slide') . "WHERE weid=:uniacid", array(':uniacid' => $_W['uniacid']));
if ($slide) {
    $slides = array();
    foreach ($slide as $key => $value) {
        $regions = unserialize($value['regionid']);
        if (@in_array($regionid, $regions)) {
            $slides[] = array(
                'id'    => $value['id'],
                'title' => $value['title'],
                'thumb' => $value['thumb'],
                'url'   => $value['url']
            );
        }
    }
}
//一级菜单数据
$menu = pdo_get('xcommunity_nav', array('uniacid' => $_W['uniacid'], 'status' => 1, 'pcate' => 0, 'isshow' => 1), array('title'));
//$list = pdo_getall('xcommunity_nav', array('uniacid' => $_W['uniacid'], 'status' => 1, 'pcate' => 0), array('title', 'id', 'regionid', 'enable'));
$list = pdo_fetchall("SELECT * FROM".tablename('xcommunity_nav')."WHERE uniacid = :uniacid AND status = 1 AND pcate = 0 order by displayorder asc",array(":uniacid" => $_W['uniacid']));
$g = array();
foreach ($list as $key => $value) {
    $regions = unserialize($value['regionid']);
    if ($value['enable'] == 1) {
        $g[] = array(
            'id'    => $value['id'],
            'title' => $value['title'],
        );
    }
    else {
        if (@in_array($regionid, $regions)) {
            $g[] = array(
                'id'    => $value['id'],
                'title' => $value['title'],
            );
        }
    }
}
//二级菜单数据
$children = array();
foreach ($g as $k => $val) {
    //$childs = pdo_getall('xcommunity_nav', array('pcate' => $val['id'], 'uniacid' => $_W['uniacid'], 'status' => 1, 'isshow' => 1), array('id', 'title', 'enable', 'thumb', 'url', 'icon', 'bgcolor', 'view', 'regionid'));
    $childs = pdo_fetchall("SELECT * FROM".tablename('xcommunity_nav')." WHERE pcate =:pcate AND uniacid = :uniacid AND status = 1  AND isshow = 1 order by displayorder asc",array(":pcate"=> $val['id'],'uniacid' => $_W['uniacid']));
    $navs = array();
    foreach ($childs as $k => $v) {
            $regions = unserialize($v['regionid']);
            if ($v['enable'] == 1) {
                $navs[] = array(
                    'title'   => $v['title'],
                    'id'      => $v['id'],
                    'thumb'   => $v['thumb'],
                    'url'     => $v['url'],
                    'icon'    => $v['icon'],
                    'bgcolor' => $v['bgcolor'],
                    'view'    => $v['view']
                );
            }
            else {
                if (@in_array($regionid, $regions)) {
                    $navs[] = array(
                        'title'   => $v['title'],
                        'id'      => $v['id'],
                        'thumb'   => $v['thumb'],
                        'url'     => $v['url'],
                        'icon'    => $v['icon'],
                        'bgcolor' => $v['bgcolor'],
                        'view'    => $v['view']
                    );
                }
            }
    }
    $children[$val['id']] = $navs;
}
$page = intval($_GPC['page']);
$good = $this->goods($regionid,$page);
//首页推荐商品
if ($_W['isajax']) {
    $page = intval($_GPC['page']);
    $goods = $this->goods($regionid,$page);
    $data = array();
    $data['list'] = $goods;
    die(json_encode($data));

}

//获取购物车数量
$carttotal = $this->getCartTotal();
//最新公告
$notice = notice($regionid);
//最新公告
$activities = activity($regionid);
//菜单;
$menus = pdo_getall('xcommunity_nav',array('uniacid' => $_W['uniacid'],'status' => 1,'isshow' => 1),array('title','url','thumb','view','id','enable','pcate','regionid'));
$n =array();
foreach ($menus as $k => $v) {
    if($v['pcate']){
        $regions = unserialize($v['regionid']);
        if ($v['enable'] == 1) {
            $n[] = array(
                'title'   => $v['title'],
                'id'      => $v['id'],
                'thumb'   => $v['thumb'],
                'url'     => $v['url'],
                'view'    => $v['view']
            );
        }
        else {
            if (@in_array($regionid, $regions)) {
                $n[] = array(
                    'title'   => $v['title'],
                    'id'      => $v['id'],
                    'thumb'   => $v['thumb'],
                    'url'     => $v['url'],
                    'view'    => $v['view']
                );
            }
        }
    }
}
$s = json_encode($n);
$categories = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid=:weid AND isshow =1 AND parentid = 0 AND type=5 order by displayorder desc ",array('weid' => $_W['uniacid']));

include $this->template($this->xqtpl('home/home'));
















