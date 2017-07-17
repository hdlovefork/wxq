<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台打印机设置
 */
global $_W,$_GPC;
$do = $_GPC['do'];
$method = $_GPC['method'] ? $_GPC['method'] : 'manage';
$GLOBALS['frames'] = $this->NavMenu($do,$method);
$xqmenu = $this->xqmenu();
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
$id = intval($_GPC['id']);
if ($op == 'add') {
	if ($id) {
		$settings = pdo_fetch("SELECT * FROM".tablename('xcommunity_print')."WHERE uniacid=:uniacid AND id=:id",array(":uniacid" => $_W['uniacid'],":id" => $id));
		if (empty($settings)) {
			message('该信息不存在或已删除',referer(),'error');
		}
		$condition = " weid=:weid ";
		$params[':weid'] = $_W['uniacid'];
        $regs = iunserializer($item['regionid']);
	}
	if ($_W['ispost']) {
		$birth = $_GPC['birth'];
        $regionid = explode(',',$_GPC['regionid']);
		$data = array(
			'uniacid'     => $_W['uniacid'],
			'print_type'  => intval($_GPC['print_type']),
			'member_code' => $_GPC['member_code'],
			'api_key'     => $_GPC['api_key'],
			'deviceNo'    => $_GPC['deviceNo'],
			'print_status' => intval($_GPC['print_status']),
			'province' => $birth['province'],
			'city' => $birth['city'],
			'dist' => $birth['district'],
            'regionid' => serialize($regionid)
		);
        if ($user[type]==2 || $user[type] == 3) {
            //普通管理员
            $data['uid'] = $_W['uid'];
        }
		if (empty($id)) {
			pdo_insert('xcommunity_print',$data);
		}else{
			pdo_update('xcommunity_print',$data,array('id' => $id));
		}
		message('提交成功',referer(),'success');
	}
	include $this->template('web/print/add');
}elseif ($op == 'list') {
	$pindex = max(1, intval($_GPC['page']));
	$psize  = 20;
	$condition = '';
    if ($user[type] == 2 || $user[type] == 3) {
        //普通管理员
        $condition .= " AND uid='{$_W['uid']}'";
    }
	$list = pdo_fetchall("SELECT * FROM".tablename('xcommunity_print')."WHERE uniacid = :uniacid $condition LIMIT ".($pindex - 1) * $psize.','.$psize,array(':uniacid' => $_W['uniacid']));
	$total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_print')."WHERE uniacid = :uniacid $condition ",array(':uniacid' => $_W['uniacid']));
	$pager  = pagination($total, $pindex, $psize);
	include $this->template('web/print/list');
}elseif($op == 'delete'){
		if (pdo_delete('xcommunity_print',array('id' => $id))) {
			$result = array(
					'status' => 1,
				);
			echo json_encode($result);exit();
		}
	}
