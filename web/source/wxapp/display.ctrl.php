<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');
define('IN_GW', true);

$_W['page']['title'] = '小程序列表';

$dos = array('display', 'switch', 'rank', 'home');
$do = in_array($do, $dos) ? $do : 'display';

if ($do == 'display') {
	$pindex = max(1, intval($_GPC['page']));
	$psize = 20;
	$start = ($pindex - 1) * $psize;

	$condition = '';
	$param = array();
	$keyword = trim($_GPC['keyword']);
	if (!empty($_W['isfounder'])) {
		$condition .= " WHERE a.default_acid <> 0 AND b.isdeleted <> 1 AND b.type = 4";
		$order_by = " ORDER BY a.`rank` DESC";
	} else {
		$condition .= "LEFT JOIN ". tablename('uni_account_users')." as c ON a.uniacid = c.uniacid WHERE a.default_acid <> 0 AND c.uid = :uid AND b.isdeleted <> 1 AND b.type = 4";
		$param[':uid'] = $_W['uid'];
		$order_by = " ORDER BY c.`rank` DESC";
	}
	if(!empty($keyword)) {
		$condition .=" AND a.`name` LIKE :name";
		$param[':name'] = "%{$keyword}%";
	}
	if(isset($_GPC['letter']) && strlen($_GPC['letter']) == 1) {
		$letter = trim($_GPC['letter']);
		if(!empty($letter)){
			$condition .= " AND a.`title_initial` = :title_initial";
			$param[':title_initial'] = $letter;
		}else {
			$condition .= " AND a.`title_initial` = ''";
		}
	}
	$tsql = "SELECT COUNT(*) FROM " . tablename('uni_account'). " as a LEFT JOIN". tablename('account'). " as b ON a.default_acid = b.acid {$condition} {$order_by}, a.`uniacid` DESC";
	$sql = "SELECT * FROM ". tablename('uni_account'). " as a LEFT JOIN". tablename('account'). " as b ON a.default_acid = b.acid  {$condition} {$order_by}, a.`uniacid` DESC LIMIT {$start}, {$psize}";
	$total = pdo_fetchcolumn($tsql, $param);
	$wxapp_lists = pdo_fetchall($sql, $param, 'uniacid');
	if(!empty($wxapp_lists)) {
		foreach($wxapp_lists as &$account) {
			$account['url'] = url('wxapp/display/switch', array('uniacid' => $account['uniacid']));
			$account['details'] = uni_accounts($account['uniacid']);
			if(!empty($account['details'])) {
				foreach ($account['details'] as  &$account_val) {
					$account_val['thumb'] = tomedia('headimg_'.$account_val['acid']. '.jpg').'?time='.time();
				}
			}
			$account['role'] = uni_permission($_W['uid'], $account['uniacid']);
			$account['setmeal'] = uni_setmeal($account['uniacid']);
			$current_versions = pdo_fetch("SELECT * FROM " . tablename('wxapp_versions'). ' WHERE uniacid = :uniacid ORDER BY version DESC', array(':uniacid' => $account['uniacid']));
			$account['versions'] = $current_versions;
		}
		unset($account_val);
		unset($account);
	}
	$pager = pagination($total, $pindex, $psize);
	template('wxapp/account-display');
} elseif ($do == 'switch') {
	$uniacid = intval($_GPC['uniacid']);
	$version = pdo_getall('wxapp_versions', array('uniacid' => $uniacid), array('version', 'multiid', 'id', 'uniacid'), '', 'version DESC', 1);
	$version = $version[0];
	$cache_key = cache_system_key("{$_W['username']}:lastaccount");
	$cache_lastaccount = cache_load($cache_key);
	$cache_lastaccount['wxapp'] = $uniacid;
	cache_write($cache_key, $cache_lastaccount);
	header('Location: ' . url('wxapp/version/edit', array('multiid' => $version['multiid'], 'uniacid' => $uniacid, 'version_id' => $version['id'])));
	exit;
} elseif ($do == 'rank') {
	$uniacid = intval($_GPC['uniacid']);
	$exist = pdo_get('uni_account', array('uniacid' => $uniacid));
	if (empty($exist)) {
		itoast('公众号不存在', '', '');
	}
	if (!empty($_W['isfounder'])) {
		$max_rank= pdo_fetch("SELECT max(rank) as maxrank FROM ".tablename('uni_account'));
		pdo_update('uni_account', array('rank' => ($max_rank['maxrank']+1)), array('uniacid' => $uniacid));
	}else {
		$max_rank= pdo_fetch("SELECT max(rank) as maxrank FROM ".tablename('uni_account_users'));
		pdo_update('uni_account_users', array('rank' => ($max_rank['maxrank']+1)), array('uniacid' => $uniacid, 'uid' => $_W['uid']));
	}
	itoast('更新成功', '', '');
} elseif ($do == 'home') {
	$cache_key = cache_system_key("{$_W['username']}:lastaccount");
	$cache_lastaccount = cache_load($cache_key);
	$uniacid = $cache_lastaccount['wxapp'];
	if (!empty($uniacid)) {
		$version = pdo_fetch("SELECT version, multiid, id, uniacid FROM " . tablename('wxapp_versions') . " WHERE uniacid = :uniacid ORDER BY version DESC", array(':uniacid' => $uniacid));
		if (!empty($version)) {
			header('Location: ' . url('wxapp/version/edit', array('multiid' => $version['multiid'], 'uniacid' => $uniacid, 'version_id' => $version['id'])));
		} else {
			header('Location: ' . url('wxapp/display/display'));
		}
	} else {
		header('Location: ' . url('wxapp/display/display'));
	}
	exit;
}