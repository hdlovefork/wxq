<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区家政信息
 */
	global $_GPC,$_W;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
	$id        = intval($_GPC['id']);
	//查家政子类 家政主类ID=1
    $categories = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid='{$_W['weid']}' AND type=1");
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
		$list   = pdo_fetchall("SELECT h.*,r.city,r.dist,r.title FROM".tablename('xcommunity_homemaking')."as h left join".tablename('xcommunity_region')."as r on h.regionid = r.id WHERE $condition group by h.id order by h.createtime desc LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
		foreach ($list as $key => $value) {
				$list[$key]['cctime'] = date('Y-m-d H:i',$value['createtime']);
			}
		$total  = pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_homemaking')."as h left join".tablename('xcommunity_region')."as r on h.regionid = r.id WHERE $condition",$params);
		if ($_GPC['export'] == 1) {
				$this->export($list,array(
			            "title" => "家政服务数据-" . date('Y-m-d-H-i', time()),
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
			                    'title' => '服务时间',
			                    'field' => 'servicetime',
			                    'width' => 20
			                ),
			                array(
			                    'title' => '说明',
			                    'field' => 'content',
			                    'width' => 50
			                ),
			                array(
			                    'title' => '申请时间',
			                    'field' => 'cctime',
			                    'width' => 12
			                ),
			            )
			        ));
		}
		$pager  = pagination($total, $pindex, $psize);
		//删除
		if ($_W['ispost']) {
			$ids=$_GPC['ids'];
			if (!empty($ids)) {
				foreach ($ids as $key => $id) {
					pdo_delete('xcommunity_homemaking',array('id' => $id));
				}
				message('删除成功',referer(),'success');
			}
		}
		load()->func('tpl');
		include $this->template('web/homemaking/list');
	}elseif($op == 'add'){
		if (empty($id)) {
			message('缺少参数',referer(),'error');
		}
		//编辑
		$item  = pdo_fetch("SELECT * FROM".tablename('xcommunity_homemaking')."WHERE id=:id",array(':id' => $id));
		if (empty($item)) {
			message('信息不存在或已删除',referer(),'error');
		}
		
		if(checksubmit('submit')){
			$data = array(
			'status'               => $_GPC['status'],
			);
			pdo_update("xcommunity_homemaking",$data,array('id' => $id));
			message('修改成功',$this->createWebUrl('homemaking',array('op'=>'list')),'success');
		}
		include $this->template('web/homemaking/add');
	}elseif ($op == 'delete') {
		if ($id) {
			//删除
			pdo_delete("xcommunity_homemaking",array('id' => $id));
			message('家政服务信息删除成功。',referer(),'success');
		}
		
	}elseif ($op == 'category') {
		$list = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid=:weid AND type =1",array(':weid' => $_W['weid']));
		if (checksubmit('submit')) {
			$count = count($_GPC['names']);
			// print_r($count);exit();
			for ($i=0; $i < $count; $i++) { 
				$ids = $_GPC['ids'];
				$id  = trim(implode(',', $ids),',');
				$data = array(
									'name'   =>  $_GPC['names'][$i] ,
									'price' =>  $_GPC['prices'][$i],
									'weid'    =>  $_W['weid'],
									'type' => 1,
									'gtime' => $_GPC['gtimes'][$i],
									'description' => $_GPC['descriptions'][$i]
				 			);
				if($ids[$i]){
					$r = pdo_update("xcommunity_category",$data,array('id'=>$ids[$i]));
				}else{
					$r = pdo_insert("xcommunity_category",$data);
				}
			}
			message('提交成功',$this->createWebUrl('homemaking',array('op' => 'list')));

		}

		include $this->template('web/homemaking/category');
	}elseif ($op == 'del') {
		if ($id) {
			pdo_delete("xcommunity_category",array('id' => $id));
			message('删除成功。',referer(),'success');
		}
		
	}elseif($op == 'manage') {
		$operation = in_array($_GPC['operation'],array('list','add','del')) ? $_GPC['operation'] : 'list';
		if ($operation == 'add') {
			//报修分类
			$categories = pdo_getall('xcommunity_category', array('weid' => $_W['uniacid'], 'type' => 1), array('id', 'name'));
			$id = intval($_GPC['id']);
			if ($id) {
				$item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_notice') . "WHERE uniacid=:uniacid AND id=:id", array(":uniacid" => $_W['uniacid'], ":id" => $id));
				if (empty($item)) {
					message('该信息不存在或已删除', referer(), 'error');
				}
				$condition = " weid=:weid ";
				$params[':weid'] = $_W['uniacid'];
				$regs = iunserializer($item['regionid']);
                $cids = explode(',',$item['cid']);
			}
			if ($_W['ispost']) {
				$birth = $_GPC['birth'];
                $regionid = explode(',', $_GPC['regionid']);
				$data = array(
					'uniacid'    => $_W['uniacid'],
					'fansopenid' => $_GPC['fansopenid'],
					'enable'     => 3,
					'type'       => intval($_GPC['type']),
					'province'   => $birth['province'],
					'city'       => $birth['city'],
					'dist'       => $birth['district'],
                    'regionid'   => serialize($regionid)
				);
                $cid = implode(',',$_GPC['cid']);
                $data['cid'] = $cid;
				if ($user[type] == 2 || $user[type] == 3) {
					$data['uid'] = $_W['uid'];
				}
				if ($id) {
					if (pdo_update('xcommunity_notice', $data, array('id' => $id))) {
						message('提交成功', referer(), 'success');
					}
				}
				else {
					if (pdo_insert('xcommunity_notice', $data)) {
						message('提交成功', referer(), 'success');
					}
				}
			}
			include $this->template('web/homemaking/manage_add');
		}
		elseif ($operation == 'list') {
			$condition = "n.uniacid='{$_W['uniacid']}' AND n.enable = 3";
			if ($user[type] == 2 || $user[type] == 3) {
				$condition .= " AND n.uid='{$_W['uid']}'";
			}
			$list = pdo_fetchall("SELECT n.*,c.name FROM" . tablename('xcommunity_notice') . "as n left join" . tablename('xcommunity_category') . "as c on n.cid = c.id WHERE $condition");
			foreach ($list as $key => $val) {
				load()->model('mc');
				$userinfo = mc_fansinfo($val['fansopenid']);
				$list[$key]['nickname'] = $userinfo['nickname'];
				if($val['cid']){
                    $condition = " weid ={$_W['uniacid']} and id in({$val['cid']})";
                    $category = pdo_getall("xcommunity_category",$condition,array('name'));
                    $category_name ='';
                    foreach ($category as $k => $item){
                        $category_name .= $item['name'].',';
                    }
                    $list[$key][category_name] = trim($category_name,',');
                }
			}
			include $this->template('web/homemaking/manage_list');
		}
		elseif ($operation == 'del') {
			$id = intval($_GPC['id']);
			if ($id) {
				$r = pdo_delete('xcommunity_notice', array('id' => $id));
				if ($r) {
					$result = array(
						'status' => 1,
					);
					echo json_encode($result);
					exit();
				}

			}
		}
	}
