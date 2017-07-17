<?php
/**
 * Created by 微小区.
 * User: 晓锋
 * Date: 16/9/5
 * Time: 下午6:02
 * Function:
 */
global $_W,$_GPC;
$op = in_array($_GPC['op'],array('list','open','ajax','visit','door','qrcreate')) ? $_GPC['op'] : 'list';
$member = pdo_fetch("SELECT * FROM".tablename('xcommunity_member')."WHERE openid=:openid AND weid=:uniacid AND enable = 1 AND open_status = 1 AND status = 1",array(':uniacid' => $_W['uniacid'],':openid' => $_W['fans']['from_user']));

if($op == 'list'){
    if(empty($member)){
        message('您还没有使用智能门禁的权限,请联系物业办理');exit();
    }
    $list = pdo_getall('xcommunity_building_device',array('regionid' =>$member['regionid'],'type' => 2),array('id','title'));

    include $this->template($this->xqtpl('opendoor/list'));
}elseif($op == 'open'){
    $list = pdo_getall('xcommunity_building_device',array('regionid' =>$member['regionid'],'type' => 2),array('id','title'));


    include $this->template($this->xqtpl('opendoor/door'));
}elseif($op == 'ajax'){
    if($_W['isajax']){
        $condition = " ";
        if($member['regionid']){
            $condition .="regionid =:regionid";
            $params[':regionid'] = $member['regionid'];
        }
        if($member['build']){
            $build = $member['build'].'栋';
            $condition .=" AND title =:build";
            $params[':build'] = $build;
        }
        if($member['unit']){
            $unit = $member['unit'].'单元';
            $condition .=" AND unit =:unit";
            $params[':unit'] = $unit;
        }
        $item = pdo_fetch("SELECT * FROM".tablename('xcommunity_building_device')."WHERE $condition",$params);
        //$item = pdo_get('xcommunity_building_device',$condition,array('id'));
        $id = $item['id'];
        //    if(empty($id)){
        //        message('设备不存在,请联系物业','ajax');exit();
        //    }else{
        echo json_encode(array('status' => 1,'id' => $id));exit();
        //    }
    }


}elseif($op == 'visit'){
    if($_W['isajax']){
        $type = intval($_GPC['type']);
        $door = intval($_GPC['door']);
        //二维码开门数据
        $data = array(
            'uniacid' => $_W['uniacid'],
            'regionid' => $member['regionid'],
            'opentime' => $_GPC['opentime'],
            'type' => $type,
            'createtime' => TIMESTAMP,
            'build' => $member['build'].'栋',
            'unit' => $member['unit'].'单元',
            'room' => $member['room'].'室',
            'address' => $member['address']
         );
        pdo_insert('xcommunity_opendoor_data',$data);
        $did = pdo_insertid();
        if($door){
            //说明是大门
            $url = $this->createMobileUrl('opendoor',array('op' => 'qrcreate','id' => $door,'did' => $did));
            echo json_encode(array('url' => $url,'status' => 1));exit();
        }else{
            //单元门
            $condition = " ";
            if($member['regionid']){
                $condition .="regionid =:regionid";
                $params[':regionid'] = $member['regionid'];
            }
            if($member['build']){
                $build = $member['build'].'栋';
                $condition .=" AND title =:build";
                $params[':build'] = $build;
            }
            if($member['unit']){
                $unit = $member['unit'].'单元';
                $condition .=" AND unit =:unit";
                $params[':unit'] = $unit;
            }
//            echo $condition;
            $item = pdo_fetch("SELECT * FROM".tablename('xcommunity_building_device')."WHERE $condition",$params);
//            print_r($item);

            if(empty($item[id])){
                //用户缺少楼栋和单元
                message('您还未开通智能门禁,请联系物业','ajax');exit();
            }else{
                $url = $this->createMobileUrl('opendoor',array('op' => 'qrcreate','id' => $item['id'],'did' => $did));
                echo json_encode(array('url' => $url,'status' => 1));exit();
            }

        }

    }

    include $this->template($this->xqtpl('opendoor/visit'));
}elseif($op == 'door'){
    if($_W['isajax']){
//        $member = $this->changemember();
        $list = pdo_getall('xcommunity_building_device',array('regionid' =>$member['regionid'],'type' => 2),array('id','title'));
        echo json_encode($list);
    }
}elseif($op == 'qrcreate'){
    $id = intval($_GPC['id']);
    $did = intval($_GPC['did']);
    require_once IA_ROOT. '/framework/library/qrcode/phpqrcode.php';
    $url = $_W['siteroot'] . "app/index.php?i={$_W['uniacid']}&c=entry&id={$id}&did={$did}&do=lock&m=xfeng_community";//二维码内容
    //		QRcode::png($url);
    $errorCorrectionLevel = 'L';//容错级别
    $matrixPointSize = 10;//生成图片大小
    //生成二维码图片
    QRcode::png($url, 'qrcode.png', $errorCorrectionLevel, $matrixPointSize, 2);
    //    $logo = $user['tag']['avatar'];//准备好的logo图片
    $QR = 'qrcode.png';//已经生成的原始二维码图
    echo "<div style='font-size: 48px;text-align:center;margin:0 auto '>长按二维码转发给朋友哦！</div><img src='qrcode.png' style='width: 100%;margin-top: 20px'>";
}

