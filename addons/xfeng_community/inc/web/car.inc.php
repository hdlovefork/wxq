<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区拼车
 */


	global $_GPC,$_W;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] :'list';
	$id = intval($_GPC['id']);
    $user = $this->user();
	if ($op == 'list') {
		$condition = 'f.weid=:weid';
		$params[':weid'] = $_W['uniacid'];
		if (!empty($_GPC['type'])) {
			$condition .=" AND f.type = '{$_GPC['type']}'";
		}
        if ($user[type]  == 3) {
            //小区管理员
            $condition .=" and r.id in({$user['regionid']})";
        }
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 10;
		$list = pdo_fetchall("SELECT f.*,r.city,r.dist,r.title as rtitle FROM".tablename('xcommunity_carpool')."as f left join ".tablename('xcommunity_region')."as r on f.regionid = r.id WHERE  $condition AND f.black = 0  LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
		$total = pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_carpool')."as f left join ".tablename('xcommunity_region')."as r on f.regionid = r.id WHERE $condition AND f.black = 0",$params);
		$pager  = pagination($total, $pindex, $psize);
		//删除
		if ($_W['ispost']) {
			$ids=$_GPC['ids'];
			if (!empty($ids)) {
				foreach ($ids as $key => $id) {
					pdo_delete('xcommunity_carpool',array('id' => $id));
				}
				message('删除成功',referer(),'success');
			}
		}
		include $this->template('web/car/list');
	}elseif ($op == 'delete') {
		if ($_W['isajax']) {
			if (empty($id)) {
				exit('缺少参数');
			}
			$r = pdo_delete("xcommunity_carpool",array('id' => $id));
			if ($r) {
				$result = array(
						'status' => 1,
					);
				echo json_encode($result);exit();
			}
		}
	}elseif ($op == 'toblack') {
		if ($id) {
			pdo_query("UPDATE ".tablename('xcommunity_carpool')."SET black =1 WHERE id=:id",array(':id' => $id));
			echo json_encode(array('state' => 1));
		}
	}elseif($op == 'verify'){
		//审核用户
		$id = intval($_GPC['id']);
		$type = $_GPC['type'];
		$data = intval($_GPC['data']);
		if (in_array($type, array('enable'))) {
			$data = ($data==0?'1':'0');
			pdo_update("xcommunity_carpool", array($type => $data), array("id" => $id, "weid" => $_W['uniacid']));
			die(json_encode(array("result" => 1, "data" => $data)));
		}
	}


