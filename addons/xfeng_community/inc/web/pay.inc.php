<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台支付方式设置
 */
global $_W,$_GPC;
$do = $_GPC['do'];
$method = $_GPC['method'] ? $_GPC['method'] : 'manage';
$GLOBALS['frames'] = $this->NavMenu($do,$method);
$xqmenu = $this->xqmenu();
$id = intval($_GPC['id']);
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'add';
$type = intval($_GPC['type']) ? intval($_GPC['type']) : 1;
if ($op == 'add') {
	
	if (checksubmit('submit')) {
		$data = array(
				'uniacid' => $_W['uniacid'],
				'pay' => serialize($_GPC['pay']),
				'type' => $_GPC['type'],
			);
		
		if ($id) {
			pdo_update('xcommunity_pay',$data,array('id' => $id));
		}else{
			if ($data['type']) {
				$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_pay')."WHERE uniacid=:uniacid AND type=:type",array(':uniacid' => $_W['uniacid'],':type' => $data['type']));
				if ($item) {
					message('类型已存在，无需在添加',referer(),'error');exit();
				}
			}
			pdo_insert('xcommunity_pay',$data);
		}
			message('提交成功',$this->createWebUrl('pay',array('op' => 'list')),'success');
	}
	if ($id) {
		$setdata = pdo_fetch("SELECT * FROM".tablename('xcommunity_pay')."WHERE id=:id",array(':id' => $id));
		$set = unserialize($setdata['pay']);
	}
	include $this->template('web/set/pay/add');
}elseif ($op == 'list') {
	$list = pdo_fetchall("select * from " . tablename('xcommunity_pay') . ' where uniacid=:uniacid', array(
	            ':uniacid' => $_W['uniacid']
	        ));
	foreach ($list as $key => $value) {
		$list[$key]['pay'] = unserialize($value['pay']);
	}
	include $this->template('web/set/pay/list');
}elseif ($op == 'delete') {
	if (empty($id)) {
		message('缺少参数',referer(),'error');
	}
	$r = pdo_delete("xcommunity_pay",array('id'=>$id));
	if ($r) {
		message('删除成功',referer(),'success');
	}
}elseif($op == 'service'){
	if(checksubmit('submit')){
		$data = array(
			'uniacid' => $_W['uniacid'],
			'switch' => intval($_GPC['switch']),
			'mchid' => $_GPC['mchid'],
			'signkey' => $_GPC['signkey']
		);
		if(empty($item)){
			pdo_insert('xcommunity_service_set',$data);
		}else{
			pdo_update('xcommunity_service_set',$data,array('uniacid' => $_W['uniacid']));
		}
		message('操作成功',referer(),'success');
	}
	$item = pdo_get('xcommunity_service_set',array('uniacid' => $_W['uniacid']),array('switch','mchid','signkey'));
	include $this->template('web/set/pay/service');
}elseif($op == 'sub'){
	$operation = !empty($_GPC['operation']) ? $_GPC['operation'] : 'add';
	if($operation == 'add'){
		$companies = pdo_getall('xcommunity_property',array('weid' => $_W['uniacid']),array('id','title'));
		if($id){
			$item = pdo_get('xcommunity_service_data',array('id'=>$id),array('type','tid','sub_mch_id'));
		}
		if(checksubmit('submit')){
			$data = array(
				'uniacid' => $_W['uniacid'],
				'type' => intval($_GPC['type']),
				'sub_mch_id' => $_GPC['sub_mch_id'],
				'tid' => intval($_GPC['tid']),
			);
			if($id){
				pdo_update('xcommunity_service_data',$data,array('id' => $id));
			}else{
				pdo_insert('xcommunity_service_data',$data);
			}
			message('操作成功',$this->createWebUrl('pay',array('op'=>'sub','operation' => 'list')),'success');
		}
		include $this->template('web/set/sub/add');
	}elseif($operation =='list'){
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 20;
		$sql = "SELECT * FROM".tablename('xcommunity_service_data')."as d left join ".tablename('xcommunity_property')."as p on d.tid = p.id WHERE d.uniacid='{$_W['uniacid']}' LIMIT ".($pindex - 1) * $psize.','.$psize;
		$list   = pdo_fetchall($sql);
		$total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_service_data')."as d left join ".tablename('xcommunity_property')."as p on d.tid = p.id WHERE d.uniacid='{$_W['uniacid']}'");
		$pager  = pagination($total, $pindex, $psize);
		include $this->template('web/set/sub/list');
	}elseif($operation =='delete'){
		if (empty($id)) {
			message('缺少参数',referer(),'error');
		}
		$r = pdo_delete("xcommunity_service_data",array('id'=>$id));
		if ($r) {
			message('删除成功',referer(),'success');
		}
	}
}
