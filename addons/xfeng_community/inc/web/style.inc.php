<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台菜单和风格设置
 */

	global $_W,$_GPC;
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
$do = $_GPC['do'];
$method = $_GPC['method'] ? $_GPC['method'] : 'manage';
$GLOBALS['frames'] = $this->NavMenu($do, $method);
$xqmenu = $this->xqmenu();
	//风格
//	$item = pdo_get('xcommunity_template',array('uniacid' => $_W['uniacid']),array('styleid'));
//	if(checksubmit('submit')) {
//		$data = array(
//			'styleid' => $_GPC['styleid'],
//			'uniacid' => $_W['uniacid'],
//		);
//		if(empty($item)){
//			pdo_insert('xcommunity_template',$data);
//		}else{
//			pdo_update('xcommunity_template',$data,array('uniacid' => $_W['uniacid']));
//		}
//		message('更新设置成功！', 'refresh');
//	}
	load()->model('setting');
	$community = 'community'.$_W['uniacid'];
	$style = $_W['setting'][$community]['styleid'];
	if(checksubmit('submit')) {
		$data = array(
			'styleid' => $_GPC['styleid'],
		);
		setting_save($data, $community);
		message('更新设置成功！', 'refresh');
	}
	$path = IA_ROOT . '/addons/xfeng_community/template/mobile/';
	if(is_dir($path)) {  //判定文件名是否是一个目录
		if ($handle = opendir($path)) { //打开指定目录
			while (false !== ($templatepath = readdir($handle))) { //读取指定目录
				if ($templatepath != '.' && $templatepath != '..') {
					if(is_dir($path.$templatepath)){
						$template[] = $templatepath;
					}
				}
			}
		}
	}
	include $this->template('web/style/style');