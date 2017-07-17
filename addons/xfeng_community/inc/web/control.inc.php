<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区控制
 */
	global $_GPC,$_W;
    $op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
    $do = $_GPC['do'].$op;
    $method = $_GPC['method'] ? $_GPC['method'] : 'perm';
    $GLOBALS['frames'] = $this->NavMenu($do,$method);
    $xqmenu = $this->xqmenu();
	if ($op == 'list') {

        $pindex = max(1, intval($_GPC['page']));
        $psize = 20;
        $where = ' WHERE 1 ';
        $params = array();
        if ($_GPC['status'] > 0) {
            $where .= " AND status = :status";
            $params[':status'] = intval($_GPC['status']);
        }
        if (!empty($_GPC['username'])) {
            $where .= " AND username LIKE :username";
            $params[':username'] = "%{$_GPC['username']}%";
        }
        $sql = 'SELECT * FROM ' . tablename('users') .$where . " LIMIT " . ($pindex - 1) * $psize .',' .$psize;
        $users = pdo_fetchall($sql, $params);
        foreach ($users as $key => $value) {
            $u = pdo_fetch("SELECT groupid FROM".tablename('xcommunity_users')."WHERE uid=:uid",array(':uid' => $value['uid']));
            $group = pdo_fetch("SELECT title FROM".tablename('xcommunity_users_group')."WHERE id=:id",array(":id" => $u['groupid']));
            $users[$key]['title'] = $group['title'];
        }
		$total = pdo_fetchcolumn('SELECT COUNT(*) FROM ' . tablename('users') .'as u left join'.tablename('xcommunity_users').'as x on u.uid = x.uid '. $where, $params);
		$pager = pagination($total, $pindex, $psize);

		include $this->template('web/control/list');
	}elseif ($op == 'group') {
		$operation = !empty($_GPC['operation']) ? $_GPC['operation'] : 'list';
		if ($operation == 'list') {
			if (checksubmit('submit')) {
				if (!empty($_GPC['delete'])) {
					pdo_query("DELETE FROM ".tablename('xcommunity_users_group')." WHERE id IN ('".implode("','", $_GPC['delete'])."')");
				}
				message('用户组更新成功！', referer(), 'success');
			}
			$list = pdo_fetchall("SELECT * FROM ".tablename('xcommunity_users_group'));

			include $this->template('web/control/group/list');
		}elseif ($operation == 'add') {
			$id = intval($_GPC['id']);
			if (!empty($id)) {
				$group = pdo_fetch("SELECT * FROM ".tablename('xcommunity_users_group') . " WHERE id = :id", array(':id' => $id));
			}
			if (checksubmit('submit')) {
				if (empty($_GPC['title'])) {
					message('请输入用户组名称！');
				}
				$data = array(
					'title' => $_GPC['title'],
					'maxaccount' => intval($_GPC['maxaccount']),
				);
				if (empty($id)) {
					pdo_insert('xcommunity_users_group', $data);
				} else {
					pdo_update('xcommunity_users_group', $data, array('id' => $id));
				}
				message('用户组更新成功！', referer(), 'success');
			}


			include $this->template('web/control/group/add');
		}

	}elseif ($op == 'edit') {
		$uid = intval($_GPC['uid']);
		$user = user_single($uid);
		$groups = pdo_fetchall("SELECT id, title FROM ".tablename('xcommunity_users_group')." ORDER BY id ASC");
		if ($uid) {
			$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_users')."WHERE uid=:uid",array(':uid' => $uid));
		}
		$id = intval($_GPC['id']);
		if (checksubmit('submit')) {
			$data = array(
					'uid' => $uid,
					'groupid' => intval($_GPC['groupid']),
				);
			if ($id) {
				pdo_update('xcommunity_users',$data,array('id' => $id));
			}else{
				pdo_insert('xcommunity_users',$data);
			}
			message('确定提交',referer(),'success');
		}
		include $this->template('web/control/edit');
	}


	