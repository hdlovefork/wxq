<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端小区拼车
 */


	global $_W,$_GPC;
	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
	$member = $this->changemember();
	$region = $this->mreg();
	$id = intval($_GPC['id']);
	if($op == 'list'){
		$type = !empty($_GPC['type']) ? $_GPC['type'] : 1;
		$set = $this->set();
		if ($_W['isajax']) {
			$pindex = max(1, intval($_GPC['page']));
			$psize = 10;
			$condition = '';
			if(empty($set['car_status'])){
				$condition .=" AND regionid='{$member['regionid']}'";
			}
			$list = pdo_fetchall('SELECT * FROM'.tablename('xcommunity_carpool')."WHERE enable =0 and weid='{$_W['weid']}' AND black = 0 AND type ='{$type}' $condition order by id desc LIMIT ".($pindex - 1) * $psize.','.$psize);
			foreach ($list as $key => $value) {
				load()->model('mc');
				 $m = mc_fetch($value['openid']);
				$list[$key]['avatar'] = $m['avatar'];
				$url = $this->createMobileUrl('car',array('op' => 'detail','id' => $value['id']));
				$datetime = date('Y-m-d H:i',$value['createtime']);
				$reg = $this->region($value['regionid']);
				$list[$key]['url'] = $url;
				$list[$key]['datetime'] = $datetime;
				$list[$key]['regionname'] = $reg['title'];
			}
			$data = array();
			$data['list'] = $list;
			die(json_encode($data));
		}
		include $this->template($this->xqtpl('car/list'));
	}elseif($op == 'add'){
		$m = mc_fetch($_W['member']['uid'],array('realname','mobile','address'));
		if (!empty($id)) {
			$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_carpool')."WHERE id=:id",array(':id' => $id));
		}
		if ($_W['isajax']) {
			$data = array(
				'weid'           => $_W['weid'],
				'regionid'       => $member['regionid'],
				'openid' => $_W['fans']['from_user'],
				'title' => $_GPC['title'],
				'seat' => $_GPC['seat'],
				'sprice' => $_GPC['sprice'],
				'contact' => $_GPC['contact'],
				'mobile' => $_GPC['mobile'],
				'start_position' => $_GPC['start_position'],
				'end_position' => $_GPC['end_position'],
				'gotime' => $_GPC['gotime'],
				'backtime' => $_GPC['backtime'],
				'type' => intval($_GPC['type']),
				'createtime' => TIMESTAMP,
			);
			$set = $this->set();
			$data['enable'] = $set['cars_status'] ? 1 : 0; //0审核通过
			if (empty($id)) {
				$r = pdo_insert('xcommunity_carpool',$data);
			}else{
				$r = pdo_update('xcommunity_carpool',$data,array('id' => $id));
			}
			if ($r) {
				$result = array(
							'status' => 1,
						);
					echo json_encode($result);exit();
			}
		}
		include $this->template($this->xqtpl('car/add'));
	}elseif ($op == 'detail') {
		if ($id) {
			$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_carpool')."WHERE id=:id",array(':id' => $id));
			load()->model('mc');
			$userinfo = mc_fetch($item['openid'],array('avatar'));
		}
		include $this->template($this->xqtpl('car/detail'));
	}elseif ($op == 'my') {
		if ($_W['isajax']) {
			$pindex = max(1, intval($_GPC['page']));
			$psize = 15;
			$list = pdo_fetchall('SELECT * FROM'.tablename('xcommunity_carpool')."WHERE weid='{$_W['weid']}' AND regionid='{$member['regionid']}' AND black = 0 AND openid='{$_W['fans']['from_user']}' order by id desc LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
			foreach ($list as $key => $value) {
				load()->model('mc');
				$m = mc_fetch($value['openid'],array('address'));
				$list[$key]['address'] = $m['address'];
				$url = $this->createMobileUrl('car',array('op' => 'detail','id' => $value['id']));
				$datetime = date('Y-m-d H:i',$value['createtime']);
				$reg = $this->region($value['regionid']);
				$list[$key]['url'] = $url;
				$list[$key]['datetime'] = $datetime;
				$list[$key]['regionname'] = $reg['title'];
			}
			$data = array();
			$data['list'] = $list;
			die(json_encode($data));
		}
		include $this->template($this->xqtpl('car/my'));
	}elseif ($op == 'delete') {
		if ($id) {
			if (pdo_delete('xcommunity_carpool',array('id' => $_GPC['id']))) {
				$result['state'] = 0;
				message($result, '', 'ajax');
			}
		}
	}















