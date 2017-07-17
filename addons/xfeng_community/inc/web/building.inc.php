<?php
/**
 * Created by 微小区.
 * User: 晓锋
 * Date: 16/8/31
 * Time: 下午5:12
 * Function:楼宇管理
 */
global $_GPC,$_W;
$do = $_GPC['do'];
$method = 'fun';
$GLOBALS['frames'] = $this->NavMenu($do, $method);
$xqmenu = $this->xqmenu();
$op = in_array($_GPC['op'],array('add','list','delete','qrcreate')) ? $_GPC['op'] : 'list';
$id = intval($_GPC['id']);
$user = $this->user();
if($op  == 'list'){

    $pindex = max(1, intval($_GPC['page']));
    $psize  = 10;
    $condition ='';
    if ($user['type']==3) {
        //普通管理员
        $condition .= " AND  regionid in({$user['regionid']})";
    }
    $sql    = "select * from ".tablename("xcommunity_building_device")."where  uniacid =:uniacid $condition LIMIT ".($pindex - 1) * $psize.','.$psize;
    $params[':uniacid'] = $_W['uniacid'];
    $list   = pdo_fetchall($sql,$params);
    $total  = pdo_fetchcolumn('select count(*) from'.tablename("xcommunity_building_device")."where  uniacid =:uniacid AND regionid=:regionid",$params);
    $pager  = pagination($total, $pindex, $psize);

    include $this->template('web/building/list');
}elseif($op == 'add'){
    $regions = $this->regions();
    if($id){
        $item = pdo_get('xcommunity_building_device',array('id'=> $id),array('id','title','unit','device_code','type','regionid'));
    }
    if(checksubmit('submit')){
        $data = array(
            'uniacid' => $_W['uniacid'],
            'title' => $_GPC['title'],
//            'api_key' => $_GPC['api_key'],
            'device_code' => $_GPC['device_code'],
//            'lock_code' => $_GPC['lock_code'],
            'type' => intval($_GPC['type']),
            'openurl' => $_GPC['openurl'],
            'regionid' => intval($_GPC['regionid'])
        );
        if($data['type'] == 1){
            $data['unit'] = $_GPC['unit'];
        }else{
            $data['unit'] = '空';
        }
        if ($user[type]==2 || $user[type] == 3) {
            //普通管理员
            $data['uid'] = $_W['uid'];
        }
        if($id){
            pdo_update('xcommunity_building_device',$data,array('id' => $id));
        }else{
            pdo_insert('xcommunity_building_device',$data);
        }
        message('操作成功',$this->createWebUrl('building',array('op' => 'list','regionid' => $regionid)),'success');
    }
    include $this->template('web/building/add');
}elseif($op == 'delete'){
    if($id){
        $r = pdo_delete('xcommunity_building_device',array('id' => $id));
        if($r){
            message('操作成功',$this->createWebUrl('building',array('op' => 'list','regionid' => $regionid)),'success');
        }
    }
}elseif($op == 'qrcreate'){
    global $_W,$_GPC;
    $id = intval($_GPC['id']);
    require_once IA_ROOT. '/framework/library/qrcode/phpqrcode.php';
    $url = $_W['siteroot'] . "app/index.php?i={$_W['uniacid']}&c=entry&id={$id}&do=lock&m=xfeng_community";//二维码内容
    //		QRcode::png($url);
    $errorCorrectionLevel = 'L';//容错级别
    $matrixPointSize = 10;//生成图片大小
    //生成二维码图片
    QRcode::png($url, 'qrcode.png', $errorCorrectionLevel, $matrixPointSize, 2);
//    $logo = $user['tag']['avatar'];//准备好的logo图片
    $QR = 'qrcode.png';//已经生成的原始二维码图
        echo "<img src='qrcode.png' >";
//    if ($logo !== FALSE) {
//        $QR = imagecreatefromstring(file_get_contents($QR));
//        $logo = imagecreatefromstring(file_get_contents($logo));
//        $QR_width = imagesx($QR);//二维码图片宽度
//        $QR_height = imagesy($QR);//二维码图片高度
//        $logo_width = imagesx($logo);//logo图片宽度
//        $logo_height = imagesy($logo);//logo图片高度
//        $logo_qr_width = $QR_width / 5;
//        $scale = $logo_width/$logo_qr_width;
//        $logo_qr_height = $logo_height/$scale;
//        $from_width = ($QR_width - $logo_qr_width) / 2;
//        //重新组合图片并调整大小
//        imagecopyresampled($QR, $logo, $from_width, $from_width, 0, 0, $logo_qr_width,
//            $logo_qr_height, $logo_width, $logo_height);
//    }
//    //输出图片
//    imagepng($QR, 'qr.png');
//    echo "<img src='qr.png'>";

}