<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');


function module_types() {
	static $types = array(
		'business' => array(
			'name' => 'business',
			'title' => '主要业务',
			'desc' => ''
		),
		'customer' => array(
			'name' => 'customer',
			'title' => '客户关系',
			'desc' => ''
		),
		'activity' => array(
			'name' => 'activity',
			'title' => '营销及活动',
			'desc' => ''
		),
		'services' => array(
			'name' => 'services',
			'title' => '常用服务及工具',
			'desc' => ''
		),
		'biz' => array(
			'name' => 'biz',
			'title' => '行业解决方案',
			'desc' => ''
		),
		'enterprise' => array(
			'name' => 'enterprise',
			'title' => '企业应用',
			'desc' => ''
		),
		'h5game' => array(
			'name' => 'h5game',
			'title' => 'H5游戏',
			'desc' => ''
		),
		'other' => array(
			'name' => 'other',
			'title' => '其他',
			'desc' => ''
		)
	);
	return $types;
}


function module_entries($name, $types = array(), $rid = 0, $args = null) {
	global $_W;
	$ts = array('rule', 'cover', 'menu', 'home', 'profile', 'shortcut', 'function', 'mine');
	if(empty($types)) {
		$types = $ts;
	} else {
		$types = array_intersect($types, $ts);
	}
	$bindings = pdo_getall('modules_bindings', array('module' => $name, 'entry' => $types));
	$entries = array();
	foreach($bindings as $bind) {
		if(!empty($bind['call'])) {
			$extra = array();
			$extra['Host'] = $_SERVER['HTTP_HOST'];
			load()->func('communication');
			$urlset = parse_url($_W['siteurl']);
			$urlset = pathinfo($urlset['path']);
			$response = ihttp_request($_W['sitescheme'] . '127.0.0.1/'. $urlset['dirname'] . '/' . url('utility/bindcall', array('modulename' => $bind['module'], 'callname' => $bind['call'], 'args' => $args, 'uniacid' => $_W['uniacid'])), array(), $extra);
			if (is_error($response)) {
				continue;
			}
			$response = json_decode($response['content'], true);
			$ret = $response['message'];
			if(is_array($ret)) {
				foreach($ret as $et) {
					if (empty($et['url'])) {
						continue;
					}
					$et['url'] = $et['url'] . '&__title=' . urlencode($et['title']);
					$entries[$bind['entry']][] = array('title' => $et['title'], 'do' => $et['do'], 'url' => $et['url'], 'from' => 'call', 'icon' => $et['icon'], 'displayorder' => $et['displayorder']);
				}
			}
		} else {
			if($bind['entry'] == 'cover') {
				$url = murl('entry', array('eid' => $bind['eid']));
			}
			if($bind['entry'] == 'menu') {
				$url = wurl("site/entry", array('eid' => $bind['eid']));
			}
			if($bind['entry'] == 'mine') {
				$url = $bind['url'];
			}
			if($bind['entry'] == 'rule') {
				$par = array('eid' => $bind['eid']);
				if (!empty($rid)) {
					$par['id'] = $rid;
				}
				$url = wurl("site/entry", $par);
			}
			if($bind['entry'] == 'home') {
				$url = murl("entry", array('eid' => $bind['eid']));
			}
			if($bind['entry'] == 'profile') {
				$url = murl("entry", array('eid' => $bind['eid']));
			}
			if($bind['entry'] == 'shortcut') {
				$url = murl("entry", array('eid' => $bind['eid']));
			}
			if(empty($bind['icon'])) {
				$bind['icon'] = 'fa fa-puzzle-piece';
			}
			$entries[$bind['entry']][] = array('eid' => $bind['eid'], 'title' => $bind['title'], 'do' => $bind['do'], 'url' => $url, 'from' => 'define', 'icon' => $bind['icon'], 'displayorder' => $bind['displayorder'], 'direct' => $bind['direct']);
		}
	}
	return $entries;
}

function module_app_entries($name, $types = array(), $args = null) {
	global $_W;
	$ts = array('rule', 'cover', 'menu', 'home', 'profile', 'shortcut', 'function');
	if(empty($types)) {
		$types = $ts;
	} else {
		$types = array_intersect($types, $ts);
	}
	$bindings = pdo_getall('modules_bindings', array('module' => $name, 'entry' => $types));
	$entries = array();
	foreach($bindings as $bind) {
		if(!empty($bind['call'])) {
			$extra = array();
			$extra['Host'] = $_SERVER['HTTP_HOST'];
			load()->func('communication');
			$urlset = parse_url($_W['siteurl']);
			$urlset = pathinfo($urlset['path']);
			$response = ihttp_request($_W['sitescheme'] . '127.0.0.1/'. $urlset['dirname'] . '/' . url('utility/bindcall', array('modulename' => $bind['module'], 'callname' => $bind['call'], 'args' => $args, 'uniacid' => $_W['uniacid'])), array('W'=>base64_encode(iserializer($_W))), $extra);
			if (is_error($response)) {
				continue;
			}
			$response = json_decode($response['content'], true);
			$ret = $response['message'];
			if(is_array($ret)) {
				foreach($ret as $et) {
					$et['url'] = $et['url'] . '&__title=' . urlencode($et['title']);
					$entries[$bind['entry']][] = array('title' => $et['title'], 'url' => $et['url'], 'from' => 'call');
				}
			}
		} else {
			if($bind['entry'] == 'cover') {
				$url = murl("entry", array('eid' => $bind['eid']));
			}
			if($bind['entry'] == 'home') {
				$url = murl("entry", array('eid' => $bind['eid']));
			}
			if($bind['entry'] == 'profile') {
				$url = murl("entry", array('eid' => $bind['eid']));
			}
			if($bind['entry'] == 'shortcut') {
				$url = murl("entry", array('eid' => $bind['eid']));
			}
			$entries[$bind['entry']][] = array('title' => $bind['title'], 'do' => $bind['do'], 'url' => $url, 'from' => 'define');
		}
	}
	return $entries;
}

function module_entry($eid) {
	$sql = 'SELECT * FROM ' . tablename('modules_bindings') . ' WHERE `eid`=:eid';
	$pars = array();
	$pars[':eid'] = $eid;
	$entry = pdo_fetch($sql, $pars);
	if(empty($entry)) {
		return error(1, '模块菜单不存在');
	}
	$module = module_fetch($entry['module']);
	if(empty($module)) {
		return error(2, '模块不存在');
	}
	$querystring = array(
		'do' => $entry['do'],
		'm' => $entry['module'],
	);
	if (!empty($entry['state'])) {
		$querystring['state'] = $entry['state'];
	}
	
	$entry['url'] = murl('entry', $querystring);
	$entry['url_show'] = murl('entry', $querystring, true, true);
	return $entry;
}


function module_build_form($name, $rid, $option = array()) {
	$rid = intval($rid);
	$m = WeUtility::createModule($name);
	if(!empty($m)) {
		return $m->fieldsFormDisplay($rid, $option);
	}else {
		return null;
	}

}


function module_fetch($name) {
	load()->model('account');
	load()->model('user');
	$modules = uni_modules(false);
	if (empty($modules[$name])) {
		$modules = user_modules();
	}
	return $modules[$name];
}


function module_build_privileges() {
	$uniacid_arr = pdo_fetchall('SELECT uniacid FROM ' . tablename('uni_account'));
	foreach($uniacid_arr as $row){
		$owneruid = pdo_fetchcolumn("SELECT uid FROM ".tablename('uni_account_users')." WHERE uniacid = :uniacid AND role = 'owner'", array(':uniacid' => $row['uniacid']));
		load()->model('user');
		$owner = user_single(array('uid' => $owneruid));
				if (empty($owner)) {
			$groupid = '-1';
		} else {
			$groupid = $owner['groupid'];
		}
		$modules = array();
		if (empty($groupid)) {
			return true;
		} elseif ($groupid == '-1') {
			$modules = pdo_fetchall("SELECT name FROM " . tablename('modules') . ' WHERE issystem = 0', array(), 'name');
		} else {
			$group = pdo_fetch("SELECT id, name, package FROM ".tablename('users_group')." WHERE id = :id", array(':id' => $groupid));
			$packageids = iunserializer($group['package']);
			if(empty($packageids)) {
				return true;
			}
			if (in_array('-1', $packageids)) {
				$modules = pdo_fetchall("SELECT name FROM " . tablename('modules') . ' WHERE issystem = 0', array(), 'name');
			} else {
				$wechatgroup = pdo_fetchall("SELECT `modules` FROM " . tablename('uni_group') . " WHERE id IN ('".implode("','", $packageids)."') OR uniacid = '{$row['uniacid']}'");
				if (!empty($wechatgroup)) {
					foreach ($wechatgroup as $li) {
						$li['modules'] = iunserializer($li['modules']);
						if (!empty($li['modules'])) {
							foreach ($li['modules'] as $modulename) {
								$modules[$modulename] = $modulename;
							}
						}
					}
				}
			}
		}
		$modules = array_keys($modules);
				$mymodules = pdo_fetchall("SELECT `module` FROM ".tablename('uni_account_modules')." WHERE uniacid = '{$row['uniacid']}' ORDER BY enabled DESC ", array(), 'module');
		$mymodules = array_keys($mymodules);
		foreach($modules as $module){
			if(!in_array($module, $mymodules)) {
				$data = array();
				$data['uniacid'] = $row['uniacid'];
				$data['module'] = $module;
				$data['enabled'] = 1;
				$data['settings'] = '';
				pdo_insert('uni_account_modules', $data);
			}
		}
	}
	return true;
}



function module_get_all_unistalled($status)  {
	global $_GPC;
	load()->func('communication');
	load()->model('cloud');
	load()->classs('cloudapi');
	$status = $status == 'recycle' ? 'recycle' : 'uninstalled';
	$uninstallModules =  cache_load(cache_system_key('module:all_uninstall'));
	if ($_GPC['c'] == 'system' && $_GPC['a'] == 'module' && $_GPC['do'] == 'not_installed' && $status == 'uninstalled') {
		$cloud_api = new CloudApi();
		$get_cloud_m_count = $cloud_api->get('site', 'stat', array('module_quantity' => 1), 'json');
		$cloud_m_count = $get_cloud_m_count['module_quantity'];
	} else {
		$cloud_m_count = $uninstallModules['cloud_m_count'];
	}
	if (empty($uninstallModules['modules']) || intval($uninstallModules['cloud_m_count']) !== intval($cloud_m_count) || is_error($get_cloud_m_count)) {
		$uninstallModules = cache_build_uninstalled_module();
	}
	if (ACCOUNT_TYPE == ACCOUNT_TYPE_APP_NORMAL) {
		$uninstallModules['modules'] = (array)$uninstallModules['modules'][$status]['wxapp'];
		$uninstallModules['module_count'] = $uninstallModules['wxapp_count'];
		return $uninstallModules;
	} else {
		$uninstallModules['modules'] = (array)$uninstallModules['modules'][$status]['app'];
		$uninstallModules['module_count'] = $uninstallModules['app_count'];
		return $uninstallModules;
	}
}


function module_permission_fetch($name) {
	$module = module_fetch($name);
	$data = array();
	if ($module['permissions']) {
		$data[] = array('title' => '权限设置', 'permission' => $name.'_permissions');
	}
	if($module['settings']) {
		$data[] = array('title' => '参数设置', 'permission' => $name.'_settings');
	}
	if($module['isrulefields']) {
		$data[] = array('title' => '回复规则列表', 'permission' => $name.'_rule');
	}
	$entries = module_entries($name);
	if(!empty($entries['home'])) {
		$data[] = array('title' => '微站首页导航', 'permission' => $name.'_home');
	}
	if(!empty($entries['profile'])) {
		$data[] = array('title' => '个人中心导航', 'permission' => $name.'_profile');
	}
	if(!empty($entries['shortcut'])) {
		$data[] = array('title' => '快捷菜单', 'permission' => $name.'_shortcut');
	}
	if(!empty($entries['cover'])) {
		foreach($entries['cover'] as $cover) {
			$data[] = array('title' => $cover['title'], 'permission' => $name.'_cover_'.$cover['do']);
		}
	}
	if(!empty($entries['menu'])) {
		foreach($entries['menu'] as $menu) {
			$data[] = array('title' => $menu['title'], 'permission' => $name.'_menu_'.$menu['do']);
		}
	}
	unset($entries);
	if(!empty($module['permissions'])) {
		$module['permissions'] = (array)iunserializer($module['permissions']);
		foreach ($module['permissions'] as $permission) {
			$data[] = array('title' => $permission['title'], 'permission' => $name . '_permission_' . $permission['permission']);
		}
	}
	return $data;
}


function module_parse_info($module_info) {
	if (empty($module_info)) {
		return array();
	}
	if ($module_info['issystem'] == 1) {
		$module_info['enabled'] = 1;
	} elseif (!isset($module_info['enabled'])) {
		$module_info['enabled'] = 1;
	}
	if (empty($module_info['config'])) {
		$module_info['config'] = array();
	}
	if (!empty($module_info['subscribes'])) {
		$module_info['subscribes'] = iunserializer($module_info['subscribes']);
	}
	if (!empty($module_info['handles'])) {
		$module_info['handles'] = iunserializer($module_info['handles']);
	}
	$module_info['isdisplay'] = 1;
	if (file_exists(IA_ROOT.'/addons/'.$module_info['name'].'/icon-custom.jpg')) {
		$module_info['logo'] = tomedia(IA_ROOT.'/addons/'.$module_info['name'].'/icon-custom.jpg'). "?v=". time();
	} else {
		$module_info['logo'] = tomedia(IA_ROOT.'/addons/'.$module_info['name'].'/icon.jpg'). "?v=". time();
	}
	unset($module_info['description']);
	return $module_info;
}


function module_uninstall($module_name, $is_clean_rule = false) {
	global $_W;
	load()->model('cloud');
	if (empty($_W['isfounder'])) {
		return error(1, '您没有卸载模块的权限！');
	}
	$module_name = trim($module_name);
	$module = module_fetch($module_name);
	if (empty($module)) {
		return error(1, '模块已经被卸载或是不存在！');
	}
	if (!empty($module['issystem'])) {
		return error(1, '系统模块不能卸载！');
	}
	if (!empty($module['plugin'])) {
		pdo_delete('modules_plugin', array('main_module' => $module_name));
	}
	$modulepath = IA_ROOT . '/addons/' . $module_name . '/';
	$manifest = ext_module_manifest($module_name);
	if (empty($manifest)) {
		$r = cloud_prepare();
		if (is_error($r)) {
			itoast($r['message'], url('cloud/profile'), 'error');
		}
		$packet = cloud_m_build($module_name, 'uninstall');
		if ($packet['sql']) {
			pdo_run(base64_decode($packet['sql']));
		} elseif ($packet['script']) {
			$uninstall_file = $modulepath . TIMESTAMP . '.php';
			file_put_contents($uninstall_file, base64_decode($packet['script']));
			require($uninstall_file);
			unlink($uninstall_file);
		}
	} elseif (!empty($manifest['uninstall'])) {
		if (strexists($manifest['uninstall'], '.php')) {
			if (file_exists($modulepath . $manifest['uninstall'])) {
				require($modulepath . $manifest['uninstall']);
			}
		} else {
			pdo_run($manifest['uninstall']);
		}
	}
	pdo_insert('modules_recycle', array('modulename' => $module_name));
	ext_module_clean($module_name, $is_clean_rule);
	cache_build_account_modules();
	cache_build_module_subscribe_type();
	cache_build_uninstalled_module();
	cache_delete(cache_system_key("user_modules:" . $_W['uid']));
	cache_delete("unimodules:{$_W['uniacid']}:1");
	cache_delete("unimodules:{$_W['uniacid']}:");

	return true;
}


function module_get_plugin_list($module_name) {
	$module_info = module_fetch($module_name);
	if (!empty($module_info['plugin'])) {
		$plugin_list = array();
		if (!empty($module_info['plugin']) && is_array($module_info['plugin'])) {
			foreach ($module_info['plugin'] as $plugin) {
				$plugin_info = module_fetch($plugin);
				if (!empty($plugin_info)) {
					$plugin_list[$plugin] = $plugin_info;
				}
			}
		}
		return $plugin_list;
	} else {
		return array();
	}
}
