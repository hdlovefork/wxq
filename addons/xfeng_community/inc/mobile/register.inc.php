<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端注册页面
 */
global $_GPC, $_W;
//判断是否从微信端进入
//if ($_W['container'] != 'wechat') {
//    include $this->template($this->xqtpl('register/wechat'));exit();
//}
//if (empty($_W['fans']['follow'])) {
//    message('请先关注我们的公众号，才能使用哦！',$this->createMobileUrl('gz'),'success');exit();
//}
//$regions = $this->regions();
//if (empty($regions)) {
//    message('该公众号还没有小区信息,请联系相关负责人添加小区', referer(), 'error');
//}
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'region';
$set = $this->set();
$regionid = intval($_GPC['regionid']);
$user = pdo_get('xcommunity_member',array('regionid'=>$regionid,'openid'=>$_W['fans']['from_user'],'enable' => 1),array('id','status','mobile'));
$sms = pdo_fetch("SELECT verifycode,verify FROM" . tablename('xcommunity_wechat_smsid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
if ($op == 'member') {

    $type = intval($_GPC['type']);//判断是否扫码
    if($type){
        $u = pdo_get('xcommunity_member',array('openid' => $_W['fans']['from_user'],'regionid' => $regionid),array('id'));
        if($u){
            if(!$u['enable']){
                $userinfo = $this->member($_W['fans']['from_user']);
                pdo_update('xcommunity_member',array('enable' => 0),array('id' => $userinfo['id']));
                pdo_update('xcommunity_member',array('enable' => 1),array('id' => $u['id']));
            }
            header("Location:".$this->createMobileUrl('home'));exit();
        }
    }
    if ($set['visitor_status']&&$type) {
        //游客模式下，扫描二维码获取url
            $url = $this->createMobileUrl('home',array('regionid' => $regionid));
            header("Location:".$url);exit();
    }


    if($user['mobile']){
        if(empty($user['status'])){
            //只有一个小区判断是否业主已注册
            message('您已经提交切换小区，请耐心等待管理员审核', '', 'success');exit();
        }
        //判断扫描二维码，是已注册业主，直接跳转到首页
        header("Location:".$this->createMobileUrl('home'));exit();
    }
    include $this->template($this->xqtpl('register/register'));
}
elseif ($op == 'region') {

    //判断业主是否是等待审核
    $member = pdo_get('xcommunity_member', array('openid' => $_W['fans']['from_user'], 'status' => 0), array('id'));
    if ($member) {
        header("Location:" . $this->createMobileUrl('register', array('op' => 'verify')));exit();
    }
    //判断是否为一个小区
    $regions = $this->regions();
    $count = count($regions);
    if ($count == 1) {
        $set = $this->set();
        if ($set['visitor_status']) {
            $url = $this->createMobileUrl('home', array('regionid' => $regions[0][id]));
            header("Location:" . $url);exit();
        }
        else {
            header("Location:" . $this->createMobileUrl('register', array('op' => 'member', 'regionid' => $regions[0][id])));
            exit();
        }
    }
    //搜索
    if ($_W['ispost'] || $_W['isajax']) {
        $keyword = $_GPC['keyword'];
        $url = $this->createMobileUrl('register', array('op' => 'region', 'keyword' => $keyword));
        header("Location:{$url}");
        exit();
    }
    include $this->template($this->xqtpl('register/region'));
}
elseif ($op == 'getaround') {
    $lng = $_GPC['lng'];
    $lat = $_GPC['lat'];
    if ($_W['isajax']) {
        $pindex = max(1, intval($_GPC['page']));
        $psize = 10;
        $params = array();
        $params[':weid'] = $_W['uniacid'];
        //是否开启小区定位
        $set = $this->set();
        $condition = '';
        $keyword = $_GPC['keyword'];
        if ($keyword) {
            $condition .= "AND title like '%{$keyword}%'";
        }
        else {
            if ($set['region_status']) {
                if ($set['range']) {
                    $range = $set['range'];
                }
                else {
                    $range = 5;
                }
                $point = $this->squarePoint($lng, $lat, $range);
                $condition .= "AND lat<>0 AND lat >= '{$point['right-bottom']['lat']}' AND lat <= '{$point['left-top']['lat']}' AND lng >= '{$point['left-top']['lng']}' AND lng <= '{$point['right-bottom']['lng']}'";

            }
        }

        $sql = "SELECT id,title,address,linkway,thumb,url,city,dist,lat,lng FROM " . tablename('xcommunity_region') . " WHERE weid = :weid  $condition LIMIT " . ($pindex - 1) * $psize . ',' . $psize;
        $list = pdo_fetchall($sql, $params);

        $arr =array();
        if ($list) {
            foreach ($list as $key => $value) {
                $u = pdo_get('xcommunity_member',array('regionid' => $value['id'],'openid' => $_W['fans']['from_user'],'weid' => $_W['uniacid']),array('id'));
                if(!$u){
                    $thumb = tomedia($value['thumb']);
                    if ($value['url']) {
                        $url = $value['url'];
                    }
                    else {
                        $set = $this->set();
                        $member = $this->member($_W['fans']['from_user']);
                        if ($set['visitor_status']) {
                            $url = $this->createMobileUrl('home', array('regionid' => $value['id']));
                        }
                        else {
                            $url = $this->createMobileUrl('register', array('op' => 'member', 'regionid' => $value['id']));
                        }
                    }
                    $arr[] = array(
                        'id' => $value['id'],
                        'title' => $value['title'],
                        'address' => $value['address'],
                        'linkway' => $value['linkway'],
                        'thumb' => $thumb,
                        'url' => $url,
                        'city' => $value['city'],
                        'dist' => $value['dist'],
                        'lat' => $value['lat'],
                        'lng' => $value['lng']
                    );
                }
            }
//            print_r($arr);exit();
            $min = -1;
            $count = count($list);
            foreach ($arr as &$row) {
                $row['distance'] = $this->GetDistance($lat, $lng, $row['lat'], $row['lng']);
                if ($min < 0 || $row['distance'] < $min) {
                    $min = $row['distance'];
                }
            }
            // echo $row['distance'];
            unset($row);

            $temp = array();
            for ($i = 0; $i < $count; $i++) {
                foreach ($arr as $j => $row) {
                    if (empty($temp['distance']) || $row['distance'] < $temp['distance']) {
                        $temp = $row;
                        $h = $j;
                    }
                }
                if (!empty($temp)) {

                    $juli = floor($temp['distance'])/1000;
                    $rows[] = array(
                        'juli'  => sprintf('%.1f', (float)$juli),
                        'id' => $temp['id'],
                        'title' => $temp['title'],
                        'address' => $temp['address'],
                        'linkway' => $temp['linkway'],
                        'thumb' => $temp['thumb'],
                        'url' => $temp['url'],
                        'city' => $temp['city'],
                        'dist' => $temp['dist']
                    );
                    unset($arr[$h]);
                    $temp = array();
                }
            }
        }
//        print_r($arr);
//        sortArrByField($arr,'juli');
        $data = array();
        $data['list'] = $rows;
        die(json_encode($data));
    }
}
elseif ($op == 'room') {
    $mobile = $_GPC['mobile'];
    $code = $_GPC['code'];
    $regionid = intval($_GPC['regionid']);
    //是否开启导入房号显示
    $set = $this->set();
    if ($set['room_enable']) {
        if (strlen($mobile) == 11 || strlen($code) == 4) {
            //查询小区房号
            $condition = ' uniacid =:uniacid AND regionid =:regionid';
            $params[':uniacid'] = $_W['uniacid'];
            $params[':regionid'] = $regionid;
            if ($mobile) {
                $condition .= " AND mobile =:mobile";
                $params[':mobile'] = $mobile;
            }
            if ($code) {
                $condition .= " AND code=:code";
                $params[':code'] = $code;
            }
            $sql = "SELECT code,room FROM" . tablename('xcommunity_room') . "WHERE $condition";
            $rooms = pdo_fetchall($sql, $params);
            if ($rooms) {
                $result = array(
                    'status'  => 1,
                    'content' => json_encode($rooms),
                );
                echo json_encode($result);
                exit();
            }
            else {
                $region = pdo_fetch("SELECT linkway FROM" . tablename('xcommunity_region') . "WHERE id=:regionid AND weid=:weid", array(':regionid' => $regionid, ':weid' => $_W['uniacid']));
                $result = array(
                    'status'  => 2,
                    'content' => json_encode($region),
                );
                echo json_encode($result);
                exit();
            }
        }
    }
}
elseif ($op == 'verify') {
    //审核状态提醒
    include $this->template($this->xqtpl('register/verify'));
}elseif($op == 'ajax'){
    if ($_W['isajax']) {
        //判断手机号是否注册
        // if (!$member) {
        //是否开启房号注册码验证，//是否开启切换小区审核

        if (empty($set['r_enable'])) {
            $res = pdo_fetch("SELECT * FROM" . tablename('xcommunity_member') . "WHERE mobile=:mobile AND  weid=:weid AND regionid=:regionid", array(':mobile' => $_GPC['mobile'], ':weid' => $_W['weid'], ':regionid' => intval($_GPC['regionid'])));
            if ($res) {
                $result = array(
                    'status' => 2,
                );
                echo json_encode($result);
                exit();
            }
        }
        // }
        //判断有没有注册 status=1 注册成功
        if($set['r_enable'] || $sms['verify']){
            $status = 0;
        }
        //判断是否开启短信验证 && 人工审核
        $sms = pdo_fetch("SELECT verifycode,verify FROM" . tablename('xcommunity_wechat_smsid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
        if ($sms['verifycode']) {
            //判断手机验证码是否正确
            load()->classs('wesession');
            WeSession::start($_W['uniacid'], $_W['fans']['from_user'], 60);
            $verifycode = intval($_GPC['verifycode']);
            // echo $verifycode;exit();
            if (empty($verifycode)) {
                $result = array(
                    'status' => 3,
                );
                echo json_encode($result);
                exit();
            }


            if ($verifycode) {
                if ($verifycode != $_SESSION['code']) {
                    $result = array(
                        'status' => 3,
                    );
                    echo json_encode($result);
                    exit();
                }
            }
        }

        if ($set['room_enable']) {
            //是否开启房号显示
            if (empty($_GPC['address'])) {
                $result = array(
                    'status' => 7,
                );
                echo json_encode($result);
                exit();
            }
            else {
                $address = $_GPC['address'];
                $room = pdo_get('xcommunity_room',array('regionid' => $_GPC['regionid'],'room'=> $address),array('build','unit','house'));
                $build = $room['build'];
                $unit = $room['unit'];
                $room = $room['house'];
            }
        }
        else {
            $region = $this->region($_GPC['regionid']);
            if (empty($_GPC['build']) || empty($_GPC['room'])) {
                $result = array(
                    'status' => 8,
                );
                echo json_encode($result);
                exit();
            }
            if ($_GPC['unit']) {
                $address = $_GPC['build'] . '栋' . $_GPC['unit'] . '单元' . $_GPC['room'] . '室';
            }
            else {
                $address = $_GPC['build'] . '栋' . $_GPC['room'] . '室';
            }
            $build = $_GPC['build'];
            $unit = $_GPC['unit'];
            $room = $_GPC['room'];
        }

        $data = array(
            'weid'       => $_W['uniacid'],
            'createtime' => TIMESTAMP,
            'regionid'   => intval($_GPC['regionid']),
            'status'     => $status,
            'remark'     => $_GPC['remark'],
            'openid'     => $_W['fans']['from_user'],
            'realname'   => $_GPC['realname'],
            'mobile'     => $_GPC['mobile'],
            'build'      => $build,
            'unit'       => $unit,
            'room'       => $room,
            'address'    => $address,
            'type'       => 0,
            'open_status' => $set['door_status'] ? 1:0
        );
        //			$rs = mc_update($_W['fans']['uid'], array('mobile' => $data['mobile'],'realname' => $data['realname'],'address' => $data['address']));
        $rs = pdo_update('mc_members', array('mobile' => $data['mobile'], 'realname' => $data['realname'], 'address' => $data['address']), array('uid' => $_W['member']['uid']));
        if ($rs) {
            //$userinfo = mc_fansinfo($_W['fans']['from_user']);
            //$data['memberid'] = $userinfo['uid'];
            $data['memberid'] = $_W['member']['uid'];
        }
        if ($user) {
            //游客完善资料
            $r = pdo_update('xcommunity_member',$data,array('id' => $user['id']));


        }else {
            $members = pdo_getall('xcommunity_member',array('openid' => $_W['fans']['from_user'],'weid' => $_W['uniacid']),array('id'));
            if(empty($members)){
                $data['enable'] = 1 ;
            }else{
                //查当前绑定的小区,解除绑定
                $userinfo = $this->member($_W['fans']['from_user']);
                pdo_update('xcommunity_member',array('enable' => 0),array('id' => $userinfo['id']));
                $data['enable'] = 1 ;
            }
            $r = pdo_insert('xcommunity_member', $data);
            //
        }
        if ($set['room_enable']) {
//            $condition =" regionid = '{$_GPC['regionid']}'";
            $code = intval($_GPC['code']);
//            if($code){
//                $condition .=" code = '{$code}'";
//            }else{
//                $condition .=" mobile = '{$_GPC['mobile']}'";
//            }
            if($code){
                pdo_update('xcommunity_room', array('status' => 1), array('regionid' => $_GPC['regionid'],'code' => $code));
            }else{
                pdo_update('xcommunity_room', array('status' => 1), array('regionid' => $_GPC['regionid'],'mobile' => $_GPC['mobile']));
            }

    }
        $s = $set['r_enable'] ? 6:1;
        if($r){
            echo json_encode(array('status' => $s));exit();
        }
    }
}
