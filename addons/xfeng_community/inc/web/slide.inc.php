<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台幻灯
 */
	global $_W,$_GPC;
    $op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
    $do = $_GPC['do'];
    $method = $_GPC['method'] ? $_GPC['method'] : 'manage';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op'])?$_GPC['op']:'list';
	$user = $this->user();
	if ($op == 'list') {
		$pindex = max(1, intval($_GPC['page']));
		$psize = 20;
		$condition = '';
		$params = array();
		if (!empty($_GPC['keyword'])) {
			$condition .= " AND title LIKE :keyword";
			$params[':keyword'] = "%{$_GPC['keyword']}%";
		}
		if($user[type] == 2 || $user[type] == 3){
		    $condition .= " and uid = {$_W['uid']}";
        }

		//显示所有小区
		$regions = $this->regions();	
		$row = pdo_fetchall("SELECT * FROM ".tablename("xcommunity_slide")." WHERE weid = '{$_W['weid']}' $condition ORDER BY displayorder DESC, id DESC LIMIT ".($pindex - 1) * $psize.','.$psize, $params);
		$regionid = intval($_GPC['_regionid']);
		$list = '';
		if ($regionid) {
			foreach ($row as $key => $value) {
				if ($value['regionid'] != 'N;') {
					$rregions = unserialize($value['regionid']);
					if (@in_array($regionid, $rregions)) {
						$list[$key]['id'] = $value['id'];
						$list[$key]['displayorder'] = $value['displayorder'];
						$list[$key]['thumb'] = $value['thumb'];
						$list[$key]['url'] = $value['url'];
						$list[$key]['title'] = $value['title'];
					}
				}
				
			}
		}else{
			$list = $row;
		}
		
		$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename("xcommunity_slide") . " WHERE weid = '{$_W['weid']}' $condition");
		$pager = pagination($total, $pindex, $psize);
		if (!empty($_GPC['displayorder'])) {
			foreach ($_GPC['displayorder'] as $id => $displayorder) {
				pdo_update('xcommunity_slide', array('displayorder' => $displayorder), array('id' => $id));
			}
			message('排序更新成功！', 'refresh', 'success');
		}

		include $this->template('web/slide/list');
	} elseif ($op == 'add') {
		$id = intval($_GPC['id']);
		//查所有小区信息
        $regions = $this->regions();
		if (!empty($id)) {
			$item = pdo_fetch("SELECT * FROM ".tablename("xcommunity_slide")." WHERE id = :id" , array(':id' => $id));
			$condition = " weid=:weid ";
			$params[':weid'] = $_W['uniacid'];
			$regs = iunserializer($item['regionid']);
			if (empty($item)) {
				message('抱歉，幻灯片不存在或是已经删除！', '', 'error');
			}
		}
		if ($_W['ispost']) {
			if (empty($_GPC['title'])) {
				message('标题不能为空，请输入标题！');
			}
			$birth = $_GPC['birth'];
			$regionid = explode(',',$_GPC['regionid']);
			$data = array(
				'weid'         => $_W['weid'],
				'title'        => $_GPC['title'],
				'url'          => $_GPC['url'],
				'displayorder' => intval($_GPC['displayorder']),
				'regionid'   => serialize($regionid),
				'type' => 1,
				'province' => $birth['province'],
				'city' => $birth['city'],
				'dist' => $birth['district']
			);
			if($user[type] == 2 || $user[type] == 3){
			    $data['uid'] = $_W['uid'];
            }
			if (!empty($_GPC['thumb'])) {
				$data['thumb'] = $_GPC['thumb'];
				load()->func('file');
				file_delete($_GPC['thumb-old']);
			}
			if (empty($id)) {
				pdo_insert("xcommunity_slide", $data);
			} else {
				pdo_update("xcommunity_slide", $data, array('id' => $id));
			}
			message('幻灯片更新成功！', $this->createWebUrl('slide',array('op' => 'list')), 'success');
		}
		load()->func('tpl');
		include $this->template('web/slide/add');
	} elseif ($op == 'delete') {
		$id = intval($_GPC['id']);
		$row = pdo_fetch("SELECT id, thumb FROM ".tablename("xcommunity_slide")." WHERE id = :id", array(':id' => $id));
		if (empty($row)) {
			message('抱歉，幻灯片不存在或是已经被删除！');
		}
		if (!empty($row['thumb'])) {
			load()->func('file');
			file_delete($row['thumb']);
		}
		pdo_delete("xcommunity_slide", array('id' => $id));
		message('删除成功！', referer(), 'success');
	}
	