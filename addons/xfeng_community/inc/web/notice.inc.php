<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区通知设置
 */

	global $_GPC,$_W;
    $do = $_GPC['do'];
    $method = $_GPC['method'] ? $_GPC['method'] : 'manage';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
    $user = $this->user();
	if ($op == 'list') {
		$condition = "uniacid='{$_W['uniacid']}'";
		if ($user['type'] == 2 || $user[type] == 3) {
			$condition .=" AND uid='{$_W['uid']}'";
		}
		//$list = pdo_fetchall("SELECT n.*,m.realname as realname FROM".tablename('xcommunity_wechat_notice')."as n left join".tablename('xcommunity_member')."as m on n.fansopenid = m.openid WHERE n.uniacid = '{$_W['uniacid']}' $condition");
		$list = pdo_getall('xcommunity_wechat_notice',$condition,array('fansopenid','type','repair_status','report_status','shopping_status','homemaking_status','cost_status','id','business_status'));
		foreach($list as $key => $val){
			load()->model('mc');
			$userinfo = mc_fetch($val['fansopenid']);
			$list[$key]['nickname'] = $userinfo['nickname'];
            $member = $this->member($val['fansopenid']);
            $list[$key]['realname'] = $member['realname'];
		}
		include $this->template('web/notice/list');
	}elseif ($op == 'add') {
//		if ($user) {
//			//物业管理员
//			if (!$user['regionid']) {
//				$regions = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_region') . "WHERE weid='{$_W['weid']}' AND pid=:pid", array(':pid' => $user['companyid']));
//			}
//			else {
//				$regions = $this->regions();
//			}
//		}
		$id = intval($_GPC['id']);
		if ($id) {
			$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_wechat_notice')."WHERE uniacid=:uniacid AND id=:id",array(":uniacid" => $_W['uniacid'],":id" => $id));
			if (empty($item)) {
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
					'uniacid' => $_W['uniacid'],
					'fansopenid' => $_GPC['fansopenid'],
					'repair_status' => $_GPC['repair_status'],
					'report_status' => $_GPC['report_status'],
					'shopping_status' => $_GPC['shopping_status'],
					'business_status' => $_GPC['business_status'],
					'homemaking_status' => $_GPC['homemaking_status'],
					'cost_status' => $_GPC['cost_status'],
					'change_status' => $_GPC['change_status'],
					'type' => intval($_GPC['type']),
					'province' => $birth['province'],
					'city' => $birth['city'],
					'dist' => $birth['district'],
                    'regionid' => serialize($regionid)
				);
            if ($user[type]==2 || $user[type]==3) {
                //普通管理员
                $data['uid'] = $_W['uid'];
            }
			if ($id) {
				if(pdo_update('xcommunity_wechat_notice',$data,array('id' => $id))){
					message('提交成功',referer(),'success');
				}
			}else{
				if(pdo_insert('xcommunity_wechat_notice',$data)){
					message('提交成功',referer(),'success');
				}
			}
		}
		include $this->template('web/notice/add');
	}elseif($op == 'delete'){
		$id = intval($_GPC['id']);
		if ($id) {
			$r = pdo_delete('xcommunity_wechat_notice',array('id' => $id));
			if ($r) {
				$result = array(
					'status' => 1,
				);
				echo json_encode($result);exit();
			}
			
		}
	}elseif($op == 'verify'){
		$id = intval($_GPC['id']);
		$type = $_GPC['type'];
		$data = intval($_GPC['data']);
		if (in_array($type, array('repair_status','report_status','shopping_status','homemaking_status'))) {
			$data = ($data==2?'1':'2');
			pdo_update("xcommunity_wechat_notice", array($type => $data), array("id" => $id, "uniacid" => $_W['uniacid']));
			die(json_encode(array("result" => 1, "data" => $data)));
		}
	}

