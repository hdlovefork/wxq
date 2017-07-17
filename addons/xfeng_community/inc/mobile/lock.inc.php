<?php
/**
 * Created by 微小区.
 * User: 晓锋
 * Date: 16/8/31
 * Time: 下午8:41
 * Function:
 */
global $_W,$_GPC;
$did = intval($_GPC['did']); //二维码
$id = intval($_GPC['id']);
if(empty($did)){
    if (empty($_W['fans']['follow'])) {
        message('请先关注我们的公众号，注册成为业主，即可使用智能门禁');exit();
    }
}
if(empty($id)){
    message('设备不存在,请联系物业');exit();
}
$device = pdo_get('xcommunity_building_device',array('id' =>$id),array('regionid','api_key','device_code','lock_code','type','unit','title','openurl'));

if($did){
    $time = time();
    $user = pdo_get('xcommunity_opendoor_data',array('id'=> $did),array('createtime','opentime','address','unit','build','regionid'));
    $address = $user['unit'] ? $user['build'].$user['unit'] : $user['build'];
    $lasttime = $user['createtime'];
    $regionid = $user['regionid'];
    $betweentime =getdate($time - $lasttime);
    if($user['opentime']<$betweentime['minutes']){
        message("二维码已经过期,请重新获取");exit();
    }
}else{
    if($device){
        //设备存在
//        load()->model('mc');
//        $userinfo = mc_oauth_userinfo();
        $member = pdo_get('xcommunity_member',array('regionid' => $device['regionid'],'openid' => $_W['fans']['from_user'],'status' => 1,'type' =>0,'enable' => 1,'open_status' => 1),array('id','address','build','unit','regionid','openid','realname'));
        $address = $member['unit'] ? $member['build'].'栋'.$member['unit'].'单元' : $member['build'].'栋';
        $regionid = $member['regionid'];
        $set = $this->set();
        if($set['open_status']){
            $cost = pdo_get('xcommunity_cost_list',array('homenumber' => $member['address'],'regionid' => $device['regionid']),array('status'));
            if($cost['status'] =='否'){
                message('因欠物业费，暂无法使用智能门禁,请联系物业办理！');exit();
            }
        }
    }
    if(empty($member)){
        //判断业主是否有微信开门权限
        message('您还没有使用智能门禁的权限,请联系物业办理');exit();
    }
}

//print_r($device['type']);exit();
if($device['type'] == 2){
    //大门
    $resp = $this->auth($device['api_key'],$device['device_code'],$device['lock_code']);
}else{
    //单元门

    $str = $device['unit'] ? $device['title'].$device['unit'] : $device['title'];
    if($address == $str){
        //包含,是当前楼栋单元用户
        $resp = $this->auth($device['api_key'],$device['device_code'],$device['lock_code']);
    }else{
        if(empty($did)){
            message('您不是该小区'. $str.'用户');exit();
        }else{
            message('不存在'.$st.'业主');exit();
        }
    }
}
if($device['openurl']){
    $url = $device['openurl'];
}else{
    $url = $this->createMobileUrl('home');
}
if(empty($resp['code'])){
    $data = array(
        'uniacid' => $_W['uniacid'],
        'regionid' => $regionid,
        'openid' => $member['openid'],
        'createtime' => TIMESTAMP,
        'type' => $device['title'].$device['unit']
    );
    $data['realname'] = $did ? '临时访客' : $member['realname'];
    pdo_insert('xcommunity_open_log',$data);
    echo "<script language='javascript'>";
    echo "  alert('".$resp['info']."');";
    echo "  window.location='".$url."';";
    echo "</script>";
}elseif($resp['code'] == '1'){
    echo "<script language='javascript'>";
    echo "  alert('".$resp['info']."');";
    echo "  window.location='".$url."';";
    echo "</script>";
}

