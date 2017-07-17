<?php

defined('IN_IA') or exit('Access Denied');
global $_W, $_GPC;
load()->model('activity');
$op = trim($_GPC['op']) ? trim($_GPC['op']) : 'consume';
$user_permission = uni_user_permission('system');
if($op == 'consume') {
	$type = intval($_GPC['type']);
	$qrcode = trim($_GPC['code']);
	if($_W['isajax']) {
		$code = trim($_GPC['code']);
		$record = pdo_get('coupon_record', array('code' => $code));
		if(empty($record)) {
			iajax(-1, '卡券记录不存在', '');
		}
		$status = activity_coupon_use($record['couponid'], $record['id'], 'paycenter');
		if (!is_error($status)) {
			iajax('0', '', '');
		} else {
			iajax('-1', $status['message'],'' );
		}
	}
}
include $this->template('cardconsume');