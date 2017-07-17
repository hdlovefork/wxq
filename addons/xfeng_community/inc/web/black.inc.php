<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台黑名单管理
 */
global $_W,$_GPC;
$do = $_GPC['do'];
$method = 'fun';
$GLOBALS['frames'] = $this->NavMenu($do,$method);
$xqmenu = $this->xqmenu();
$op = !empty($_GPC['op'])?$_GPC['op']:'list';
$id = intval($_GPC['id']);
$type = !empty($_GPC['type']) ? $_GPC['type'] : 2;
if ($type == 2) {
		$table = 'xcommunity_fled';
}else{
	$table = 'xcommunity_carpool';
}
$user = $this->user();
if ($op == 'list') {
	$pindex = max(1, intval($_GPC['page']));
	$psize  = 10;
	$condition = '';
    if ($user[type] == 3) {
        //普通管理员
        $condition .=" and r.id in({$user['regionid']})";
    }
	$list = pdo_fetchall("SELECT f.*,r.title FROM".tablename($table)."as f left join ".tablename('xcommunity_region')."as r on f.regionid = r.id WHERE f.weid='{$_W['weid']}' AND f.black = 1 $condition LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
	$total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename($table)."as f left join ".tablename('xcommunity_region')."as r on f.regionid = r.id WHERE f.weid='{$_W['weid']}' AND f.black = 1 $condition ",$params);
	$pager  = pagination($total, $pindex, $psize);
	include $this->template('web/black/list');
}elseif ($op == 'delete') {
	if ($_W['isajax']) {
		if (empty($id)) {
			exit('缺少参数');
		}
		$r = pdo_delete($table,array('id' => $id));
		if ($r) {
			$result = array(
					'status' => 1,
				);
			echo json_encode($result);exit();
		}
	}
}elseif ($op == 'toblack') {
	if ($id) {
		pdo_query("UPDATE ".tablename($table)."SET black =0 WHERE id=:id",array(':id' => $id));
		echo json_encode(array('status' => 1));exit();
	}
}


