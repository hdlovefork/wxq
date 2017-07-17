<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台系统更新
 */
require XQ_PATH .'version.php';
global $_W,$_GPC;
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'display';
$do = $_GPC['do'].$op;
$method = $_GPC['method'] ? $_GPC['method']: 'system';
$GLOBALS['frames'] = $this->NavMenu($do,$method);
$xqmenu = $this->xqmenu();
load()->func('communication');
if($op == 'display'){
    $domain = $_SERVER['SERVER_NAME'];
    $siteid = $_W['setting']['site']['key'];
    $ip = $_W['clientip'];
    $result = ihttp_request('http://cloud.we7xq.com/addons/bull_manage/api.php', array('type' => 'checkauth','module' => 'xfeng_community'),null,5);
    $result = @json_decode($result['content'], true);
    $result = $result['data'];
    if (checksubmit()) {
        $resp = ihttp_request('http://cloud.we7xq.com/addons/bull_manage/api.php', array('type' => 'grant','module' => 'xfeng_community','code' => trim($_GPC['code']),'domain' => $domain,'siteid' => $siteid,'ip'=>$ip),null,1);
        $resp = @json_decode($resp['content'], true);
        if($resp['err_code'] == 1){
            message($resp['err_msg']);
        }else{
            message($resp['err_msg']);
        }
    }
    include $this->template('web/system/auth');
}elseif($op == 'upgrade'){
    $result = ihttp_request('http://cloud.we7xq.com/addons/bull_manage/api.php', array('type' => 'checkauth','module' => 'xfeng_community'),null,5);
    $result = @json_decode($result['content'], true);
    $result = $result['data'];
    if($result['status'] == 1){
        message('您还未授权，请授权后再试！',$this->createWebUrl('system',array('op'=> 'display')),'warning');exit();
    }
    if($result['status'] == 2){
        message('您的服务已过期，请联系开发者续费！',$this->createWebUrl('system',array('op'=> 'display')),'warning');exit();
    }
    if($result['status'] == 4){
        message('当前是标准版，暂无升级！',$this->createWebUrl('system',array('op'=> 'display')),'warning');exit();
    }
    if($result['status'] == 5){
        message('系统维护，暂停升级！',$this->createWebUrl('system',array('op'=> 'display')),'warning');exit();
    }
    $version = XQ_VERSION;
    $versionfile = XQ_PATH . 'version.php';
    $release = date('YmdHis', filemtime($versionfile));
    $resp = ihttp_post('http://cloud.we7xq.com/addons/bull_manage/api.php', array(
        'type' => 'check',
        'module' => 'xfeng_community',
        'version' => $version
    ));

    $upgrade = @json_decode($resp['content'], true);
    $upgrade = $upgrade['data'];
    if (is_array($upgrade)) {
        if ($upgrade['result'] == 1) {
            $files = array();
            if (!empty($upgrade['files'])) {
                foreach ($upgrade['files'] as $file) {
                    $entry = IA_ROOT . '/addons/xfeng_community/' . $file['path'];
                    if (!is_file($entry) || md5_file($entry) != $file['md5']) {
                        $files[] = array(
                            'path' => $file['path'],
                            'download' => 0,
                            'entry'=>$entry,
                        );
                    }
                }
            }
            if(!empty($files)){
                $upgrade['files'] = $files;
                $tmpdir = IA_ROOT . '/addons/xfeng_community/temp';
                if (!is_dir($tmpdir)) {
                    mkdir($tmpdir);
                }
                file_put_contents($tmpdir . '/file.txt', json_encode($upgrade));
            }else{
                unset($upgrade);
            }
        }else{
            message($upgrade['message']);
        }
    }else{
        message('服务器错误:' . $resp['content'] . '. ');
    }
    include $this->template('web/system/upgrade');
}elseif ($op =='process'){

    include $this->template('web/system/process');
}elseif ($op =='download'){
    $tmpdir = IA_ROOT . '/addons/xfeng_community/temp';
    $f = file_get_contents($tmpdir . '/file.txt');
    $upgrade = json_decode($f, true);
    $files = $upgrade['files'];
    //判断是否存在需要更新的文件
    $path = "";
    foreach ($files as $f) {
        if (empty($f['download'])) {
            $path = $f['path'];
            break;
        }
    }

    if (!empty($path)) {
        $resp = ihttp_post('http://cloud.we7xq.com/addons/bull_manage/api.php', array(
            'type' => 'download',
            'module' => 'xfeng_community',
            'path' => $path
        ));
        $ret = @json_decode($resp['content'], true);
        $ret = $ret['data'];
        if (is_array($ret)) {
            //检查路径
            $path = $ret['path'];
            $dirpath = dirname($path);
            if (!is_dir(IA_ROOT . '/addons/xfeng_community/' . $dirpath)) {
                mkdir(IA_ROOT . '/addons/xfeng_community/' . $dirpath, '0777');
            }
            //获取更新文件
            $content = base64_decode($ret['content']);
            @file_put_contents(IA_ROOT . '/addons/xfeng_community/' . $path, $content);
            $success = 1;
            foreach ($files as & $f) {
                if ($f['path'] == $path) {
                    $f['download'] = 1;
                    break;
                }
                if ($f['download']) {
                    $success++;
                }
            }
            unset($f);
            $upgrade['files'] = $files;
            $tmpdir = IA_ROOT . '/addons/xfeng_community/temp';
            if (!is_dir($tmpdir)) {
                mkdir($tmpdir);
            }
            file_put_contents($tmpdir . '/file.txt', json_encode($upgrade));
            die(json_encode(array(
                'result' => 1,
                'total' => count($files) ,
                'success' => $success,
                'path' => $path
            )));
        }
    } else {

        $updatefile = IA_ROOT . '/addons/xfeng_community/upgrade.php';
        require $updatefile;
        $tmpdir = IA_ROOT . '/addons/xfeng_community/temp';
        @rmdir($tmpdir);
        message('恭喜您，系统更新成功！',$this->createWebUrl('system',array('op' => 'upgrade')),'success');
    }
}
