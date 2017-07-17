<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台物业团队
 */
	global $_GPC,$_W;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do,$method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
	if ($op == 'list') {
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 20;
		$condition = '';
		if (!empty($_GPC['keyword'])) {
			$condition .= " AND title LIKE :keyword";
			$params[':keyword'] = "%{$_GPC['keyword']}%";
		}

        if ($user[type] == 2 || $user[type] == 3) {
            //普通管理员
            $condition .= " AND uid='{$_W['uid']}'";
        }


		$list = pdo_fetchall("SELECT * FROM".tablename('xcommunity_property')."WHERE weid='{$_W['uniacid']}' $condition LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
		$total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_property')."WHERE weid='{$_W['uniacid']}' $condition",$params);
		$pager  = pagination($total, $pindex, $psize);
		include $this->template('web/property/list');
	}elseif ($op == 'add') {
		$id = intval($_GPC['id']);
		//删除后,小区可绑定多个物业，实现区域管理
//		$regions = pdo_fetchall("SELECT * FROM".tablename('xcommunity_region')."WHERE weid='{$_W['weid']}' AND pid=0");
//		if (empty($id)) {
//			if (empty($regions)) {
//				message('已无未绑定的小区，请先添加小区',$this->createWebUrl('region',array('op' => 'add')),'error');
//			}
//		}
		if ($id) {
			$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_property')."WHERE weid=:weid AND id=:id",array(":weid" => $_W['uniacid'],":id" => $id));
			if (empty($item)) {
				message('该信息不存在或已删除',referer(),'error');
			}
			$condition = " weid=:weid ";
			$params[':weid'] = $_W['uniacid'];
			$regs = iunserializer($item['regionid']);
//			print_r($regions);
		}
		if ($_W['ispost']) {
			$regionid = explode(',',$_GPC['regionid']);
			$birth = $_GPC['birth'];
			$data = array(
					'weid' => $_W['uniacid'],
					'title' => $_GPC['title'],
					'topPicture' => $_GPC['thumb'],
					'content' => htmlspecialchars_decode($_GPC['content']),
					'createtime' => TIMESTAMP,
					'regionid' => serialize($regionid),
					'telphone' => $_GPC['telphone'],
					'province' => $birth['province'],
					'city' => $birth['city'],
					'dist' => $birth['district'],
                    'regionid' => serialize($regionid)
				);
            if ($user[type]==2 || $user[type] == 3) {
                //普通管理员
                $data['uid'] = $_W['uid'];
            }
			if ($id) {
				foreach (@$regs as $key => $value) {
					pdo_query("UPDATE ".tablename("xcommunity_region")."SET pid=0 WHERE id='{$value}'");
				}
				pdo_update('xcommunity_property',$data,array("id" => $id));
			}else{
				pdo_insert('xcommunity_property',$data);
				$id = pdo_insertid();
			}
			foreach ($regionid as $key => $value) {
				pdo_query("UPDATE ".tablename("xcommunity_region")."SET pid='{$id}' WHERE id='{$value}'");
			}	
			message('提交成功',referer(), 'success');
		}
		load()->func('tpl');
		include $this->template('web/property/add');
	}elseif ($op == 'delete') {
		$id = intval($_GPC['id']);
		if ($_W['isajax']) {
			if (empty($id)) {
			message('缺少参数',referer(),'error');
			}
			$item = pdo_fetch("SELECT id,topPicture FROM".tablename('xcommunity_property')."WHERE weid='{$_W['weid']}' AND id=:id",array(':id' => $id));
			if (empty($item)) {
				message('该物业不存在或已被删除',referer(),'error');
			}
			$r = pdo_delete("xcommunity_property",array('id' => $id));
			if ($r) {
				$result = array(
						'status' => 1,
					);
				echo json_encode($result);exit();
			}
		}
	}
	











