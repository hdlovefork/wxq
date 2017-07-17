<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');


function user_register($user) {
	if (empty($user) || !is_array($user)) {
		return 0;
	}
	if (isset($user['uid'])) {
		unset($user['uid']);
	}
	$user['salt'] = random(8);
	$user['password'] = user_hash($user['password'], $user['salt']);
	$user['joinip'] = CLIENT_IP;
	$user['joindate'] = TIMESTAMP;
	$user['lastip'] = CLIENT_IP;
	$user['lastvisit'] = TIMESTAMP;
	if (empty($user['status'])) {
		$user['status'] = 2;
	}
	$result = pdo_insert('users', $user);
	if (!empty($result)) {
		$user['uid'] = pdo_insertid();
	}
	return intval($user['uid']);
}


function user_check($user) {
	if (empty($user) || !is_array($user)) {
		return false;
	}
	$where = ' WHERE 1 ';
	$params = array();
	if (!empty($user['uid'])) {
		$where .= ' AND `uid`=:uid';
		$params[':uid'] = intval($user['uid']);
	}
	if (!empty($user['username'])) {
		$where .= ' AND `username`=:username';
		$params[':username'] = $user['username'];
	}
	if (!empty($user['status'])) {
		$where .= " AND `status`=:status";
		$params[':status'] = intval($user['status']);
	}
	if (empty($params)) {
		return false;
	}
	$sql = 'SELECT `password`,`salt` FROM ' . tablename('users') . "$where LIMIT 1";
	$record = pdo_fetch($sql, $params);
	if (empty($record) || empty($record['password']) || empty($record['salt'])) {
		return false;
	}
	if (!empty($user['password'])) {
		$password = user_hash($user['password'], $record['salt']);
		return $password == $record['password'];
	}
	return true;
}


function user_single($user_or_uid) {
	$user = $user_or_uid;
	if (empty($user)) {
		return false;
	}
	if (is_numeric($user)) {
		$user = array('uid' => $user);
	}
	if (!is_array($user)) {
		return false;
	}
	$where = ' WHERE 1 ';
	$params = array();
	if (!empty($user['uid'])) {
		$where .= ' AND `uid`=:uid';
		$params[':uid'] = intval($user['uid']);
	}
	if (!empty($user['username'])) {
		$where .= ' AND `username`=:username';
		$params[':username'] = $user['username'];
	}
	if (!empty($user['email'])) {
		$where .= ' AND `email`=:email';
		$params[':email'] = $user['email'];
	}
	if (!empty($user['status'])) {
		$where .= " AND `status`=:status";
		$params[':status'] = intval($user['status']);
	}
	if (empty($params)) {
		return false;
	}
	$sql = 'SELECT * FROM ' . tablename('users') . " $where LIMIT 1";
	$record = pdo_fetch($sql, $params);
	if (empty($record)) {
		return false;
	}
	if (!empty($user['password'])) {
		$password = user_hash($user['password'], $record['salt']);
		if ($password != $record['password']) {
			return false;
		}
	}
	if($record['type'] == ACCOUNT_OPERATE_CLERK) {
		$clerk = pdo_get('activity_clerks', array('uid' => $record['uid']));
		if(!empty($clerk)) {
			$record['name'] = $clerk['name'];
			$record['clerk_id'] = $clerk['id'];
			$record['store_id'] = $clerk['storeid'];
			$record['store_name'] = pdo_fetchcolumn('SELECT business_name FROM ' . tablename('activity_stores') . ' WHERE id = :id', array(':id' => $clerk['storeid']));
			$record['clerk_type'] = '3';
			$record['uniacid'] = $clerk['uniacid'];
		}
	} else {
				$record['name'] = $record['username'];
		$record['clerk_id'] = $user['uid'];
		$record['store_id'] = 0;
		$record['clerk_type'] = '2';
	}
	return $record;
}


function user_update($user) {
	if (empty($user['uid']) || !is_array($user)) {
		return false;
	}
	$record = array();
	if (!empty($user['username'])) {
		$record['username'] = $user['username'];
	}
	if (!empty($user['password'])) {
		$record['password'] = user_hash($user['password'], $user['salt']);
	}
	if (!empty($user['lastvisit'])) {
		$record['lastvisit'] = (strlen($user['lastvisit']) == 10) ? $user['lastvisit'] : strtotime($user['lastvisit']);
	}
	if (!empty($user['lastip'])) {
		$record['lastip'] = $user['lastip'];
	}
	if (isset($user['joinip'])) {
		$record['joinip'] = $user['joinip'];
	}
	if (isset($user['remark'])) {
		$record['remark'] = $user['remark'];
	}
	if (isset($user['type'])) {
		$record['type'] = $user['type'];
	}
	if (isset($user['status'])) {
		$status = intval($user['status']);
		if (!in_array($status, array(1, 2))) {
			$status = 2;
		}
		$record['status'] = $status;
	}
	if (isset($user['groupid'])) {
		$record['groupid'] = $user['groupid'];
	}
	if (isset($user['starttime'])) {
		$record['starttime'] = $user['starttime'];
	}
	if (isset($user['endtime'])) {
		$record['endtime'] = $user['endtime'];
	}
	if(isset($user['lastuniacid'])) {
		$record['lastuniacid'] = intval($user['lastuniacid']);
	}
	if (empty($record)) {
		return false;
	}
	return pdo_update('users', $record, array('uid' => intval($user['uid'])));
}


function user_hash($passwordinput, $salt) {
	global $_W;
	$passwordinput = "{$passwordinput}-{$salt}-{$_W['config']['setting']['authkey']}";
	return sha1($passwordinput);
}


function user_level() {
	static $level = array(
		'-3' => '锁定用户',
		'-2' => '禁止访问',
		'-1' => '禁止发言',
		'0' => '普通会员',
		'1' => '管理员',
	);
	return $level;
}


function user_group_detail_info($groupid = 0) {
	$groupid = is_array($groupid) ? 0 : intval($groupid);
	if(empty($groupid)) {
		return false;
	}
	$group_info = array();
	$packages = uni_groups();
	$group_info = pdo_get('users_group', array('id' => $groupid));
	if(!empty($group_info)) {
		$group_info['package'] = (array)iunserializer($group_info['package']);
		foreach ($packages as $packages_key => $packages_val) {
			foreach ($group_info['package'] as $group_info_val) {
				if($group_info_val == -1) {
					$group_info['module_and_tpl'][-1] = array(
						'id' => '-1',
						'name' => '所有服务',
						'modules' => array('title' => '系统所有模块'),
						'templates' => array('title' => '系统所有模板'),
					);
					continue;
				}
				if($packages_key == $group_info_val) {
					$group_info['module_and_tpl'][] = array(
						'id' => $packages_val['id'],
						'name' => $packages_val['name'],
						'modules' => $packages_val['modules'],
						'wxapp' => $packages_val['wxapp'],
						'templates' => $packages_val['templates'],
					);
					continue;
				}
			}
		}
	}
	return $group_info;	
}


function user_account_detail_info($uid) {
	$wxapps = $wechats = $account_lists = array();
	
	$sql = "SELECT b.uniacid, b.role, a.type FROM " . tablename('account'). " AS a LEFT JOIN ". tablename('uni_account_users') . " AS b ON a.uniacid = b.uniacid WHERE a.acid <> 0 AND a.isdeleted <> 1 AND b.uid = :uid";
	$account_users_info = pdo_fetchall($sql, array(':uid' => $uid), 'uniacid');
	foreach ($account_users_info as $uniacid => $account) {
		if ($account['type'] == ACCOUNT_TYPE_OFFCIAL_NORMAL || $account['type'] == ACCOUNT_TYPE_OFFCIAL_AUTH) {
			$app_user_info[$uniacid] = $account;
		} elseif ($account['type'] == ACCOUNT_TYPE_APP_NORMAL) {
			$wxapp_user_info[$uniacid] = $account;
		}
	}
	if (!empty($wxapp_user_info)) {
		$wxapps = pdo_fetchall("SELECT w.name, w.level, w.acid, a.* FROM " . tablename('uni_account') . " a INNER JOIN " . tablename(uni_account_tablename(ACCOUNT_TYPE_APP_NORMAL)) . " w USING(uniacid) WHERE a.uniacid IN (".implode(',', array_keys($wxapp_user_info)).") ORDER BY a.uniacid ASC", array(), 'acid');
	}
	if (!empty($app_user_info)) {
		$wechats = pdo_fetchall("SELECT w.name, w.level, w.acid, a.* FROM " . tablename('uni_account') . " a INNER JOIN " . tablename(uni_account_tablename(ACCOUNT_TYPE_OFFCIAL_NORMAL)) . " w USING(uniacid) WHERE a.uniacid IN (".implode(',', array_keys($app_user_info)).") ORDER BY a.uniacid ASC", array(), 'acid');
	}
	$accounts = array_merge($wxapps, $wechats);
	if (!empty($accounts)) {
		foreach ($accounts as &$account_val) {
			$account_val['thumb'] = tomedia('headimg_'.$account_val['acid']. '.jpg');
			foreach ($account_users_info as $uniacid => $user_info) {
				if ($account_val['uniacid'] == $uniacid) {
					$account_val['role'] = $user_info['role'];
					if ($user_info['type'] == ACCOUNT_TYPE_APP_NORMAL) {
						$account_lists['wxapp'][$uniacid] = $account_val;
					} elseif ($user_info['type'] == ACCOUNT_TYPE_OFFCIAL_NORMAL || $user_info['type'] == ACCOUNT_TYPE_OFFCIAL_AUTH) {
						$account_lists['wechat'][$uniacid] = $account_val;	
					}
				}
			}
		}
		unset($account_val);
	}
	return $account_lists;
}



function user_modules() {
	global $_W;
	load()->model('module');
	$cachekey = cache_system_key("user_modules:" . $_W['uid']);
	$cache = cache_load($cachekey);
	if (!empty($cache)) {
		return $cache;
	}
	$user_info = user_single(array('uid' => $_W['uid']));
	if ($_W['isfounder']) {
		$modules = pdo_getall('modules', array(), array(), 'name');
	} elseif (empty($user_info['groupid'])) {
		$modules = pdo_getall('modules', array('issystem' => 1), array(), 'name');
	} else {
		$user_group_info = pdo_get('users_group', array('id' => $user_info['groupid']));
		$user_group_info = iunserializer($user_group_info);
		$user_group_modules = array();
		if (!empty($user_group_info['package']) && is_array($user_group_info['package'])) {
			$uni_groups = pdo_fetchall('SELECT * FROM ' . tablename('uni_group') . ' WHERE id IN ' . "('" .  implode("','", $user_group_info['package']) . "')");
			if (!empty($uni_groups)) {
				foreach ($uni_groups as $uni_group_modules) {
					$user_group_modules = array_merge($user_group_modules, $uni_group_modules);
				}
			}
		}
		$modules = pdo_getall('modules', array('name' => $user_group_modules), array(), 'name');
	}

	if (!empty($modules)) {
		$module_list = array();		$plugin_list = pdo_getall('modules_plugin', array(), array(), 'name');
		$have_plugin_module = pdo_fetchall('SELECT GROUP_CONCAT(name) as plugin_list, main_module FROM ' . tablename('modules_plugin') . " GROUP BY main_module", array(), 'main_module');
		foreach ($modules as $name => &$module) {
			if (in_array($name, array_keys($plugin_list))) {
				continue;
			}
			$module = module_parse_info($module);
			$module['main_module'] = '';
			$module_list[$name] = $module;
			if (in_array($name, array_keys($have_plugin_module))) {
				$module_plugin_list = explode(',', $have_plugin_module[$name]['plugin_list']);
				$module_list[$name]['plugin'] = $module_plugin_list;
				if (is_array($module_plugin_list) && !empty($module_plugin_list)) {
					foreach ($module_plugin_list as $plugin) {
						$plugin = $modules[$plugin];
						if (empty($plugin)) {
							continue;
						}
						$plugin['main_module'] = $name;
						$plugin = module_parse_info($plugin);
						$module_list[$plugin['name']] = $plugin;
					}
				}
			}
		}
	}
	cache_write($cachekey, $module_list);
	return $module_list;
}
