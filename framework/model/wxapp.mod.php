<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');


function wxapp_getpackage($data) {
	$request_cloud_data = json_encode($data);
	load()->classs('cloudapi');
	$api = new CloudApi();
	$result = $api->post('wxapp', 'download', $request_cloud_data, 'html');
	if(strpos($result, 'error:') === 0){
		return error(-1, substr($result, 6));
	}
	return $result;
}

function wxapp_account_create($uniacid, $account) {
	$accountdata = array('uniacid' => $uniacid, 'type' => $account['type'], 'hash' => random(8));
	pdo_insert('account', $accountdata);
	$acid = pdo_insertid();
	$account['acid'] = $acid;
	$account['token'] = random(32);
	$account['encodingaeskey'] = random(43);
	$account['uniacid'] = $uniacid;
	unset($account['type']);
	pdo_insert('account_wxapp', $account);
	return $acid;
}
