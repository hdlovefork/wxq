<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');

load()->model('module');
load()->model('wxapp');

$dos = array('edit', 'get_categorys', 'save_category', 'del_category', 'switch_version', 'download', 'account_list', 'save_connection');
$do = in_array($do, $dos) ? $do : 'edit';
$_W['page']['title'] = '小程序 - 管理';

if ($do == 'del_category') {
	$id = $_GPC['id'];
	$result = pdo_delete('site_category', array('id' => $id));

}

if ($do == 'get_categorys') {
	$multiid = intval($_GPC['multiid']);
	$categorys = pdo_getall('site_category', array('uniacid' => $_GPC['uniacid'], 'multiid' => $multiid));
	return iajax(1, $categorys, '');
}

if ($do == 'save_category') {
	$post =  $_GPC['post'];
	$multiid = intval($_GPC['multiid']);
	foreach ($post as $category) {
		if (!empty($category['id'])) {
			$update = array('name' => $category['name'], 'displayorder' => $category['displayorder'], 'linkurl' => $category['linkurl']);
			pdo_update('site_category', $update, array('uniacid' => $_GPC['uniacid'], 'id' => $category['id']));
		} else {
			if (!empty($category['name'])) {
				$insert = $category;
				$insert['uniacid'] = $_GPC['uniacid'];
				$insert['multiid'] = $multiid;
				unset($insert['$$hashKey']);
				pdo_insert('site_category', $insert);
			}
		}
	}
	return iajax(1, 1, '');
}

if ($do == 'edit') {
	$multiid = intval($_GPC['multiid']);
	$operate = $_GPC['operate'];
	$version_id = intval($_GPC['version_id']);
	if ($operate == 'delete') {
		$type = $_GPC['type'];
		$id = intval($_GPC['id']);
		pdo_delete('site_'.$type, array('id' => $id));
		itoast('删除成功', url('wxapp/version/edit', array('multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'version_id' => $version_id, 'wxapp' => $type)), 'success');
	}
	if (checksubmit('submit')) {
		$slide = $_GPC['slide'];
		$nav = $_GPC['nav'];
		$recommend = $_GPC['recommend'];
		$id = intval($_GPC['id']);
		if (!empty($slide)) {
			if (empty($id)) {
				$slide['uniacid'] = $_GPC['uniacid'];
				$slide['multiid'] = $multiid;
				pdo_insert('site_slide', $slide);
				itoast('添加幻灯片成功', url('wxapp/version/edit', array('multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'version_id' => $version_id, 'wxapp' => 'slide')), 'success');
			} else {
				$result = pdo_update('site_slide', $slide, array('uniacid' => $_GPC['uniacid'], 'multiid' => $multiid, 'id' => $id));
				itoast('更新幻灯片成功', url('wxapp/version/edit', array('multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'version_id' => $version_id, 'wxapp' => 'slide')), 'success');
			}
		}
		if (!empty($nav)) {
			if (empty($id)) {
				$nav['uniacid'] = $_GPC['uniacid'];
				$nav['multiid'] = $multiid;
				$nav['status'] = 1;
				pdo_insert('site_nav', $nav);
				itoast('添加导航图标成功', url('wxapp/version/edit', array('wxapp' => 'nav', 'multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'version_id' => $version_id, 'wxapp' => 'nav')), 'success');
			} else {
				pdo_update('site_nav', $nav, array('uniacid' => $_GPC['uniacid'], 'multiid' => $multiid, 'id' => $id));
				itoast('更新导航图标成功', url('wxapp/version/edit', array('wxapp' => 'nav', 'multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'version_id' => $version_id, 'wxapp' => 'nav')), 'success');
			}
		}
		if (!empty($recommend)) {
			if (empty($id)) {
				$recommend['uniacid'] = $_GPC['uniacid'];
				$result = pdo_insert('site_article', $recommend);
				itoast('添加推荐图片成功', url('wxapp/version/edit', array('wxapp' => 'recommend', 'multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'version_id' => $version_id, 'wxapp' => 'recommend')), 'success');
			} else {
				pdo_update('site_article', $recommend, array('uniacid' => $_GPC['uniacid'], 'id' => $id));
				itoast('更新推荐图片成功', url('wxapp/version/edit', array('wxapp' => 'recommend', 'multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'version_id' => $version_id, 'wxapp' => 'recommend')), 'success');
			}
		}
	}
	$slides = pdo_getall('site_slide', array('uniacid' => $_GPC['uniacid'], 'multiid' => $multiid));
	$navs = pdo_getall('site_nav', array('uniacid' => $_GPC['uniacid'], 'multiid' => $multiid));
	if (!empty($navs)) {
		foreach($navs as &$nav) {
			$nav['css'] = iunserializer($nav['css']);
		}
	}
	$recommends = pdo_getall('site_article', array('uniacid' => $_GPC['uniacid']));
	$version_info = pdo_get('wxapp_versions', array('multiid' => $multiid, 'uniacid' => $_GPC['uniacid'], 'id' => $version_id), array('id', 'version', 'uniacid', 'connection', 'modules', 'design_method'));
	$wxapp_info = pdo_get('account_wxapp', array('uniacid' => $version_info['uniacid']));
	$versionid = $version_info['id'];
	$modules = json_decode($version_info['modules'], true);
	$connection = json_decode($version_info['connection'], true);
	if (!empty($connection)) {
		foreach ($connection as $module => $uniacid) {
			if (!empty($uniacid)) {
				$accounts = uni_account_default($uniacid);
				if (!empty($accounts) && $accounts['isdeleted'] == 0 && $accounts['type'] != 4) {
					$accounts['thumb'] = tomedia('headimg_'.$accounts['acid']. '.jpg').'?time='.time();
					$account_list[$module] = $accounts;
				}
			}
			
		}
	}
	if (!empty($modules)) {
		foreach ($modules as $module => &$version) {
			$version = module_fetch($module);
			if (file_exists(IA_ROOT.'/addons/'.$version['name'].'/icon-custom.jpg')) {
				$version['logo'] = tomedia(IA_ROOT.'/addons/'.$version['name'].'/icon-custom.jpg');
			} else {
				$version['logo'] = tomedia(IA_ROOT.'/addons/'.$version['name'].'/icon.jpg');
			}
			$module_connections[$module] = (array)$version;
			$module_connections[$module]['connection'] = $account_list[$module];
			$module_connections[$module]['link_name'] = !empty($module_connections[$module]['connection']) ? $module_connections[$module]['connection']['name'] : $wxapp_info['name'];
		}
		unset($version);
	}
	template('wxapp/wxapp-edit');
}

if ($do == 'account_list') {
	$uni_account_modules = pdo_getall('uni_account_modules', array('module' => $_GPC['module'], 'enabled' => '1'), array('uniacid'), 'uniacid');
	foreach ($uni_account_modules as $key=>$val) {
		$accounts = uni_account_default($key);
		if (!empty($accounts) && $accounts['isdeleted'] == 0 && $accounts['type'] != 4) {
			$accounts['thumb'] = tomedia('headimg_'.$accounts['acid']. '.jpg').'?time='.time();
			$account_list[$key] = $accounts;
		}
	}
	iajax(0, $account_list, '');
}

if ($do == 'save_connection') {
	$connection_info = pdo_get('wxapp_versions', array('id' => intval($_GPC['version_id'])), array('connection'));
	$connections = json_decode($connection_info['connection'], true);
	$connections[$_GPC['module']] = intval($_GPC['uniacid']);
	$result = pdo_update('wxapp_versions', array('connection' => json_encode($connections)), array('id' => intval($_GPC['version_id'])));
	$account_info = uni_account_default($_GPC['uniacid']);
	$account_info['thumb'] = tomedia('headimg_' . $account_info['acid'] . '.jpg') . '?time=' .time();
	if (is_error($result)) {
		iajax(-1, $result['message'], '');
	}
	iajax(0, $account_info, '');
}

if ($do == 'switch_version') {
	$uniacid = intval($_GPC['uniacid']);
	if (!empty($uniacid)) {
		$wxapp_version_lists = pdo_getall('wxapp_versions', array('uniacid' => $uniacid));
	}
	template('wxapp/switch-version');
}

if ($do == 'download') {
	$version_id = intval($_GPC['version_id']);
	$version_info = pdo_get('wxapp_versions', array('id' => $version_id));
	$account_info = pdo_get('account_wxapp', array('uniacid' => $version_info['uniacid']));
	if ($version_info['design_method'] == 3) {
		$redirect_modules = json_decode(($version_info['redirect']), true);
		$redirect_modules['url'] = explode(',', $redirect_modules['url']);
		$bindings_lists = pdo_getall('modules_bindings', array('module' => $redirect_modules['module'], 'eid IN' => $redirect_modules['url']));
	}
	$package = array(
		'name' => $account_info['name'],
		'modules' => json_decode($version_info['modules'], true),
		'app.js' => '',
		'app.json' => '',
		'app.wxss' => '',
		'siteInfo' => array(
			'uniacid' => $account_info['uniacid'],
			'acid'    => $account_info['acid'],
			'multiid' => $version_info['multiid'],
			'version' => $version_info['version'],
			'siteroot'=> $_W['siteroot'] . 'app/index.php',
			'design_method' => $version_info['design_method'],
			'redirect_module' => $bindings_lists[0]['url'],
			'template' => $version_info['template'],
		),
		'tabBar' => json_decode($version_info['quickmenu'], true),
	);
	$result = wxapp_getpackage($package);
	if (is_error($result)) {
		itoast($result['message'], '', 'error');
	}
	header('content-type: application/zip');
	header('content-disposition: attachment; filename="'.$package['name'].'v'.$version_info['version'].'.zip"');
	echo $result;
	exit;
}