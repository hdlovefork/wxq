<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端常用查询
 */

	global $_W,$_GPC;
	//判断是否注册
	$member = $this->changemember();
	$region = $this->mreg();
	$rows = pdo_fetchall("SELECT * FROM".tablename("xcommunity_search")."WHERE status='1' AND weid='{$_W['weid']}'");
	$list = array();
	foreach ($rows as $key => $value) {
		$regions = unserialize($value['regionid']);
		if (@in_array($member['regionid'], $regions)) {
			$list[$key]['sname'] = $value['sname'];
			$list[$key]['surl'] = $value['surl'];
			$list[$key]['icon'] = tomedia($value['icon']);
		}
	}
include $this->template($this->xqtpl('search/list'));

