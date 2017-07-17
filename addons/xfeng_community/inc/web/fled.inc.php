<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区二手交易
 */

	
	global $_W,$_GPC;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] :'list';
	$id = intval($_GPC['id']);
    $user = $this->user();
    $regions = $this->regions();
	if ($op == 'list') {
		$condition = 'f.weid=:weid';
		$params[':weid'] = $_W['uniacid'];
		if (!empty($_GPC['category'])) {
			$condition .= " AND f.category = '{$_GPC['category']}'";
		}
		if (!empty($_GPC['status'])) {
			$condition .=" AND f.status = '{$_GPC['status']}'";
		}
        if ($user[type] == 3) {
            //小区管理员
            $condition .=" and r.id in({$user['regionid']})";
        }
		$categories = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid='{$_W['weid']}' AND type=4");
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 10;
		$list = pdo_fetchall("SELECT f.*,r.city,r.dist,r.title as rtitle,b.address FROM".tablename('xcommunity_fled')."as f left join(".tablename('xcommunity_region')."as r left join".tablename('xcommunity_member')."as b on b.regionid = r.id ) on f.openid = b.openid AND f.regionid = r.id WHERE $condition AND f.black = 0 group by f.id  LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
		$total = pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_fled')."as f left join(".tablename('xcommunity_region')."as r left join".tablename('xcommunity_member')."as b on b.regionid = r.id ) on f.openid = b.openid AND f.regionid = r.id WHERE $condition AND f.black = 0",$params);
		$pager  = pagination($total, $pindex, $psize);
		//删除
		if ($_W['ispost']) {
			$ids=$_GPC['ids'];
			if (!empty($ids)) {
				foreach ($ids as $key => $id) {
					pdo_delete('xcommunity_fled',array('id' => $id));
				}
				message('删除成功',referer(),'success');
			}
		}
		include $this->template('web/fled/list');
	}elseif ($op == 'delete') {
		$id = intval($_GPC['id']);
		if ($_W['isajax']) {
			if (empty($id)) {
				exit('缺少参数');
			}
			$r = pdo_delete("xcommunity_fled",array('id' => $id));
			if ($r) {
				$result = array(
						'status' => 1,
					);
				echo json_encode($result);exit();
			}
		}
	}elseif ($op == 'detail') {
		$item = pdo_fetch("SELECT * FROM".tablename("xcommunity_fled")."WHERE id=:id",array(':id' => $id));
		if (!$item) {
			message('该商品不存在');
		}
		$images = $item['images'];
		if ($images&&$item['images'] !='N;') {
		    $imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$images})");
		}
		include $this->template('web/fled/detail');
	}elseif ($op == 'toblack') {
		if ($id) {
			pdo_query("UPDATE ".tablename('xcommunity_fled')."SET black =1 WHERE id=:id",array(':id' => $id));
			echo json_encode(array('state' => 1));
		}
	}elseif ($op == 'category') {
		$list = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid=:weid AND type =4",array(':weid' => $_W['weid']));
		if (checksubmit('submit')) {
			$count = count($_GPC['names']);
			// print_r($count);exit();
			for ($i=0; $i < $count; $i++) { 
				$ids = $_GPC['ids'];
				$id  = trim(implode(',', $ids),',');
				$data = array(
									'name'   =>  $_GPC['names'][$i] ,
									'weid'    =>  $_W['weid'],
									'type' => 4,
				 			);
				if($ids[$i]){
					$r = pdo_update("xcommunity_category",$data,array('id'=>$ids[$i]));
				}else{
					$r = pdo_insert("xcommunity_category",$data);
				}
			}
			message('提交成功',$this->createWebUrl('fled',array('op' => 'list')));

		}

		include $this->template('web/fled/category');
	}elseif ($op == 'del') {
		if ($id) {
			pdo_delete("xcommunity_category",array('id' => $id));
			message('删除成功。',referer(),'success');
		}
		
	}elseif($op == 'verify'){
		//审核用户
		$id = intval($_GPC['id']);
		$type = $_GPC['type'];
		$data = intval($_GPC['data']);
		if (in_array($type, array('enable'))) {
			$data = ($data==0?'1':'0');
			pdo_update("xcommunity_fled", array($type => $data), array("id" => $id, "weid" => $_W['uniacid']));
			die(json_encode(array("result" => 1, "data" => $data)));
		}
	}


	