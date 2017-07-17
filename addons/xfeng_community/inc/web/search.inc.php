<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区常用查询
 */
	global $_W,$_GPC;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op'])?$_GPC['op']:'list';
	$id = intval($_GPC['id']);
	//判断是否是操作员
	$user = $this->user();
	if ($op == 'add') {
            $regions = $this->regions();

			if($id){
				$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_search')."WHERE id=:id",array(':id' => $id));
//				print_r($item);exit();
				if (empty($item)) {
					message('信息不存在或已被删除',referer(),'error');
				}
				$condition = " weid=:weid ";
				$params[':weid'] = $_W['uniacid'];
				$regs = iunserializer($item['regionid']);
			}
			if($_W['ispost']){
				$birth = $_GPC['birth'];
                $regionid = explode(',',$_GPC['regionid']);
				$data = array(
					'weid'  => $_W['weid'],
					'sname' => $_GPC['sname'],
					'surl'  => $_GPC['surl'],
					'icon'  => $_GPC['icon'],
					'status' => $_GPC['status'],
					'regionid' => $regionid,
					'province' => $birth['province'],
					'city' => $birth['city'],
					'dist' => $birth['district'],
                    'regionid' => serialize($regionid)
				);
                if ($user[type]==2 || $user[$type] == 3) {
                    //普通管理员
                    $data['uid'] = $_W['uid'];
                }
				if (empty($_GPC['id'])) {
					pdo_insert("xcommunity_search",$data);
				}else {
					pdo_update("xcommunity_search",$data,array('id' => $id));
				}
				message('更新成功',referer(),'success');
			}
			load()->func('tpl');
			include $this->template('web/search/add');
	}elseif($op == 'list'){
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 20;
		$condition = '';
		if ($user['type'] == 3 || $user[type] == 2) {
			$condition .=" AND uid = {$_W['uid']}";
		}
		$sql = "SELECT * FROM".tablename('xcommunity_search')."WHERE weid='{$_W['weid']}' $condition LIMIT ".($pindex - 1) * $psize.','.$psize;
		$list   = pdo_fetchall($sql);
		$total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_search')."WHERE weid='{$_W['weid']}'");
		$pager  = pagination($total, $pindex, $psize);	
		include $this->template('web/search/list');
	}elseif($op == 'delete'){
		pdo_delete("xcommunity_search",array('id' => $_GPC['id']));
		message('删除成功',referer(),'success');
	}elseif ($op == 'set') {
		$id = intval($_GPC['id']);
		if (empty($id)) {
			message('缺少参数',referer(),'error');
		}
		$type = $_GPC['type'];
		$data = intval($_GPC['data']);

		if (in_array($type, array('status'))) {
			$data = ($data==1?'0':'1');
			pdo_update("xcommunity_search", array($type => $data), array("id" => $id, "weid" => $_W['uniacid']));
			die(json_encode(array("result" => 1, "data" => $data)));
		}
		die(json_encode(array("result" => 0)));
	}

