<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区设置
 */
global $_W,$_GPC;
$do = $_GPC['do'];
$method = $_GPC['method'] ? $_GPC['method'] : 'manage';
$GLOBALS['frames'] = $this->NavMenu($do,$method);
$xqmenu = $this->xqmenu();
$id = intval($_GPC['sid']);
if (checksubmit('submit')) {
		$data = array(
				'uniacid' => $_W['uniacid'],
				'code_status' => intval($_GPC['code_status']),
				'range' => intval($_GPC['range']),
				'room_status' => intval($_GPC['room_status']),
				'room_enable' => intval($_GPC['room_enable']),
				'h_status' => intval($_GPC['h_status']),
				's_status' => intval($_GPC['s_status']),
				'c_status' => intval($_GPC['c_status']),
				'r_status' => intval($_GPC['r_status']),
				'r_enable' => intval($_GPC['r_enable']),
				'region_status' => intval($_GPC['region_status']),
				'business_status' => intval($_GPC['business_status']),
				'visitor_status' => intval($_GPC['visitor_status']),
				'shop_credit' => intval($_GPC['shop_credit']),
				'business_credit' => intval($_GPC['business_credit']),
				'cost_credit' => intval($_GPC['cost_credit']),
				'fled_status' => intval($_GPC['fled_status']),
				'house_status' => intval($_GPC['house_status']),
				'car_status' => intval($_GPC['car_status']),
				'open_status' => intval($_GPC['open_status']),
                'repair_status' => intval($_GPC['repair_status']),
                'report_status' => intval($_GPC['report_status']),
                'houselease_status' => intval($_GPC['houselease_status']),
                'fleds_status' => intval($_GPC['fleds_status']),
                'cars_status' => intval($_GPC['cars_status']),
                'door_status' => intval($_GPC['door_status'])
			);
		if ($_GPC['tel']) {
				$data['tel'] = $_GPC['tel'];
			}
		if (empty($id)) {
			pdo_insert('xcommunity_set',$data);
		}else{
			pdo_update('xcommunity_set',$data,array('id' => $id));
		}
		message('提交成功',referer(),'success');
	}
$settings = pdo_fetch("SELECT * FROM".tablename('xcommunity_set')."WHERE uniacid=:uniacid",array(":uniacid" => $_W['uniacid']));

include $this->template('web/set/set');