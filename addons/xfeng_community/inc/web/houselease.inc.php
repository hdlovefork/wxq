<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区租赁信息
 */

	global $_GPC,$_W;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
	$id        = intval($_GPC['id']);
    $user = $this->user();
    $regions = $this->regions();
	if ($op == 'list') {
		//搜索
		$condition = 'h.weid=:weid';
		$params[':weid'] = $_W['uniacid'];
		if (!empty($_GPC['category'])) {
			$condition .= " AND h.category = '{$_GPC['category']}'";
		}
		if ($_GPC['status'] != '') {
			$condition .=" AND h.status = '{$_GPC['status']}'";
		}
		$starttime = strtotime($_GPC['birth']['start']) ;
		$endtime   = strtotime($_GPC['birth']['end']) ;
		if (!empty($starttime) && $starttime==$endtime) {
			$endtime = $endtime+86400-1;
		}
		if ($starttime && $endtime) {
			$condition .=" AND h.createtime between '{$starttime}' and '{$endtime}'";
		}
		if ($user[type] == 3) {
            //普通管理员
            $condition .=" and r.id in({$user['regionid']})";
        }

		$pindex = max(1, intval($_GPC['page']));
		$psize  = 10;
		$sql    = "select h.*,r.city,r.dist,r.title as rtitle,b.address from ".tablename('xcommunity_houselease')."as h left join(".tablename('xcommunity_region')."as r left join".tablename('xcommunity_member')."as b on b.regionid = r.id ) on h.openid = b.openid  AND h.regionid = r.id  where $condition group by h.id LIMIT ".($pindex - 1) * $psize.','.$psize;
		$list   = pdo_fetchall($sql,$params);
		foreach ($list as $key => $value) {
				$list[$key]['cctime'] = date('Y-m-d H:i',$value['createtime']);
				if($value['status'] == '0') {
					$list[$key]['s'] = '未成交';
				}elseif ($value['status'] == '1') {
					$list[$key]['s'] = '已成交';
				}elseif ($value['status'] == '2') {
					$list[$key]['s'] = '已取消';
				}
		}
			if ($_GPC['export'] == 1) {
				$this->export($list,array(
			            "title" => "租赁服务数据-" . date('Y-m-d-H-i', time()),
			            "columns" => array(
			                array(
			                    'title' => '姓名',
			                    'field' => 'realname',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '手机号',
			                    'field' => 'mobile',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '地址',
			                    'field' => 'address',
			                    'width' => 25
			                ),
			                array(
			                    'title' => '标题',
			                    'field' => 'title',
			                    'width' => 20
			                ),
			                array(
			                    'title' => '是否成交',
			                    'field' => 's',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '发布时间',
			                    'field' => 'cctime',
			                    'width' => 18
			                ),
			            )
			        ));
		}
		$total  = pdo_fetchcolumn('select count(*) from'.tablename("xcommunity_houselease")."as h left join(".tablename('xcommunity_region')."as r left join".tablename('xcommunity_member')."as b on b.regionid = r.id ) on h.openid = b.openid AND h.regionid = r.id where $condition",$params);
		$pager  = pagination($total, $pindex, $psize);
		//删除
		if ($_W['ispost']) {
			$ids=$_GPC['ids'];
			if (!empty($ids)) {
				foreach ($ids as $key => $id) {
					pdo_delete('xcommunity_houselease',array('id' => $id));
				}
				message('删除成功',referer(),'success');
			}
		}
		load()->func('tpl');
		include $this->template('web/houselease/list');
	}elseif($op == 'add'){
		//编辑
		if ($id) {
			$item       = pdo_fetch("SELECT * FROM".tablename('xcommunity_houselease')."WHERE id=:id",array(':id' => $id));
			$images = $item['images'];
			if ($images) {
				$imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$images})");
			}
			
		}
		include $this->template('web/houselease/add');
	}elseif ($op == 'delete') {
		//删除
		if ($id) {
			pdo_delete("xcommunity_houselease",array('id' => $id));
			message('房屋租赁信息删除成功。',referer(),'success');
		}
		
	}elseif($op == 'verify'){
		//审核用户
		$id = intval($_GPC['id']);
		$type = $_GPC['type'];
		$data = intval($_GPC['data']);
		if (in_array($type, array('enable'))) {
			$data = ($data==0?'1':'0');
			pdo_update("xcommunity_houselease", array($type => $data), array("id" => $id, "weid" => $_W['uniacid']));
			die(json_encode(array("result" => 1, "data" => $data)));
		}
	}
