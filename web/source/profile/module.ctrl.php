<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');

load()->model('module');
load()->model('account');
load()->model('user');

$dos = array('display', 'setting', 'shortcut', 'enable', 'permissions');
$do = !empty($_GPC['do']) ? $_GPC['do'] : 'display';

$modulelist = uni_modules(false);

if($do == 'display') {
	$_W['page']['title'] = '公众号 - 应用模块 - 更多应用';
	
	$pageindex = max(1, intval($_GPC['page']));
	$pagesize = 30;

	if (!empty($modulelist)) {
		foreach ($modulelist as $name => &$row) {
			if (!empty($row['issystem']) || !empty($row['main_module']) || (!empty($_GPC['keyword']) && !strexists($row['title'], $_GPC['keyword'])) || (!empty($_GPC['letter']) && $row['title_initial'] != $_GPC['letter'])) {
				unset($modulelist[$name]);
				continue;
			}
			$row['preview'] = $row['logo'];
			if ($row['issystem'] == 1) {
				$row['enabled'] = 1;
			} elseif (!isset($row['enabled'])) {
				$row['enabled'] = 1;
			}
			$row['isdisplay'] = 1;
		}
		unset($row);
		$total = count($modulelist);
		$modules = array();
		if (!empty($modulelist)) {
			$module_profile = pdo_getall('uni_account_modules', array('module' => array_keys($modulelist), 'uniacid' => $_W['uniacid']), array('module', 'enabled', 'shortcut'), 'module', array('displayorder DESC'));
			if (!empty($module_profile)) {
				foreach ($module_profile as $name => $row) {
					$modules[$name] = $modulelist[$name];
					$modules[$name]['enabled'] = $row['enabled'];
					$modules[$name]['shortcut'] = $row['shortcut'];
				}
			}
		}
		$modules = array_slice($modules, ($pageindex - 1) * $pagesize, $pagesize);
		$pager = pagination($total, $pageindex, $pagesize);
	}

	template('profile/module');
} elseif ($do == 'shortcut') {
	$status = intval($_GPC['shortcut']);
	$modulename = $_GPC['modulename'];
	$module = module_fetch($modulename);
	if(empty($module)) {
		itoast('抱歉，你操作的模块不能被访问！', '', '');
	}
	
	$module_status = pdo_get('uni_account_modules', array('module' => $modulename, 'uniacid' => $_W['uniacid']), array('id', 'shortcut'));
	if (empty($module_status)) {
		$data = array(
			'uniacid' => $_W['uniacid'],
			'module' => $modulename,
			'enabled' => STATUS_ON,
			'shortcut' => $status ? STATUS_ON : STATUS_OFF,
			'settings' => '',
		);
		pdo_insert('uni_account_modules', $data);
	} else {
		$data = array(
			'shortcut' => $status ? STATUS_ON : STATUS_OFF,
		);
		pdo_update('uni_account_modules', $data, array('id' => $module_status['id']));
	}
	if ($status) {
		itoast('添加模块快捷操作成功！', referer(), 'success');
	} else {
		itoast('取消模块快捷操作成功！', referer(), 'success');
	}
} elseif ($do == 'enable') {
	$modulename = $_GPC['modulename'];
	if(empty($modulelist[$modulename])) {
		itoast('抱歉，你操作的模块不能被访问！', '', '');
	}
	pdo_update('uni_account_modules', array(
		'enabled' => empty($_GPC['enabled']) ? STATUS_OFF : STATUS_ON,
	), array(
		'module' => $modulename,
		'uniacid' => $_W['uniacid']
	));
	cache_build_account_modules();
	itoast('模块操作成功！', referer(), 'success');
} elseif ($do == 'top') {
	$modulename = $_GPC['modulename'];
	$module = $modulelist[$modulename];
	if(empty($module)) {
		itoast('抱歉，你操作的模块不能被访问！', '', '');
	}
	$max_displayorder = (int)pdo_getcolumn('uni_account_modules', array('uniacid' => $_W['uniacid']), 'MAX(displayorder)');
	
	$module_profile = pdo_get('uni_account_modules', array('module' => $modulename, 'uniacid' => $_W['uniacid']));
	if (!empty($module_profile)) {
		pdo_update('uni_account_modules', array('displayorder' => ++$max_displayorder), array('id' => $module_profile['id']));
	} else {
		pdo_insert('uni_account_modules', array(
			'displayorder' => ++$max_displayorder, 
			'module' => $modulename,
			'uniacid' => $_W['uniacid'],
			'enabled' => STATUS_ON,
			'shortcut' => STATUS_OFF,
		));
	}
	itoast('模块置顶成功', referer(), 'success');
} elseif ($do == 'setting') {
	$modulename = $_GPC['m'];
	$module = $_W['current_module'] = $modulelist[$modulename];
	
	if(empty($module)) {
		itoast('抱歉，你操作的模块不能被访问！', '', '');
	}

	if(!uni_user_module_permission_check($modulename.'_settings', $modulename)) {
		itoast('您没有权限进行该操作', '', '');
	}
	
		define('CRUMBS_NAV', 1);
	
	$config = $module['config'];
	if (($module['settings'] == 2) && !is_file(IA_ROOT."/addons/{$module['name']}/developer.cer")) {
		
		if (empty($_W['setting']['site']['key']) || empty($_W['setting']['site']['token'])) {
			itoast('站点未注册，请先注册站点。', url('cloud/profile'), 'info');
		}
		
		if (empty($config)) {
			$config = array();
		}
		
		load()->model('cloud');
		load()->func('communication');
		
		$pro_attach_url = tomedia('pro_attach_url');
		$pro_attach_url = str_replace('pro_attach_url', '', $pro_attach_url);
		
		$module_simple = array_elements(array('name', 'type', 'title', 'version', 'settings'), $module);
		$module_simple['pro_attach_url'] = $pro_attach_url;
		
		$iframe = cloud_module_setting_prepare($module_simple, 'setting');
		$result = ihttp_post($iframe, array('inherit_setting' => base64_encode(iserializer($config))));
		if (is_error($result)) {
			itoast($result['message'], '', '');
		}
		$result = json_decode($result['content'], true);
		if (is_error($result)) {
			itoast($result['message'], '', '');
		}
		
		$module_simple = array_elements(array('name', 'type', 'title', 'version', 'settings'), $module);
		$module_simple['pro_attach_url'] = $pro_attach_url;
		
		$iframe = cloud_module_setting_prepare($module_simple, 'setting');
		template('profile/module_setting');
		exit();
	}
	$obj = WeUtility::createModule($module['name']);
	$obj->settingsDisplay($config);
	exit();
}