<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');

load()->model('material');
load()->model('mc');

$dos = array('display', 'sync', 'del_material', 'send');
$do = in_array($do, $dos) ? $do : 'display';

uni_user_permission_check('platform_material');

$_W['page']['title'] = '永久素材-微信素材';

if ($do == 'send') {
	$group = intval($_GPC['group']);
	$type = trim($_GPC['type']);
	$id = intval($_GPC['id']);
	$media = pdo_get('wechat_attachment', array('uniacid' => $_W['uniacid'], 'id' => $id));
	if (empty($media)) {
		iajax(1, '素材不存在', '');
	}
	$media_id = trim($media['media_id']);
	$account_api = WeAccount::create();
	$result = $account_api->fansSendAll($group, $type, $media['media_id']);
	if (is_error($result)) {
		iajax(1, $result['message'], '');
	}
	$groups = pdo_get('mc_fans_groups', array('uniacid' => $_W['uniacid'], 'acid' => $_W['acid']));
	if (!empty($groups)) {
		$groups = iunserializer($groups['groups']);
	}
	$record = array(
		'uniacid' => $_W['uniacid'],
		'acid' => $_W['acid'],
		'groupname' => $groups[$group]['name'],
		'fansnum' => $groups[$group]['count'],
		'msgtype' => $type,
		'group' => $group,
		'attach_id' => $id,
		'status' => 0,
		'type' => 0,
		'sendtime' => TIMESTAMP,
		'createtime' => TIMESTAMP,
	);
	pdo_insert('mc_mass_record', $record);
	iajax(0, '发送成功！', '');
}

if ($do == 'display') {
	$type = trim($_GPC['type']) ? trim($_GPC['type']) : 'news';
	$group = mc_fans_groups(true);
	if ($type == 'news') {
		$condition = " as a RIGHT JOIN " . tablename('wechat_news') . " as b ON a.id = b.attach_id WHERE a.uniacid = :uniacid AND a.type = :type AND (a.model = :model || a.model = :modela)";
		$params = array(':uniacid' => $_W['uniacid'], ':type' => $type, ':model' => 'perm', ':modela' => 'local');
		$id = intval($_GPC['id']);
		$title = addslashes($_GPC['title']);
		if (!empty($title)) {
			$condition .= ' AND (b.title LIKE :title OR b.author = :title OR b.digest LIKE :title)';
			$params[':title'] = '%' . $title . "%";
		}
		$pageindex = max(1, intval($_GPC['page']));
		$pagesize = 21;
		$limit = " ORDER BY a.createtime DESC, b.id ASC LIMIT " . ($pageindex - 1) * $pagesize . ", {$pagesize}";
		$total = pdo_fetchall("SELECT a.* FROM " . tablename('wechat_attachment') . $condition, $params);
		$total = count($total);
		$material_list = pdo_fetchall("SELECT a.* FROM " . tablename('wechat_attachment') . $condition . $limit, $params, 'id');

		if (!empty($material_list)) {
			foreach ($material_list as &$material) {
				$material['items'] = pdo_fetchall("SELECT * FROM " . tablename('wechat_news') . " WHERE uniacid = :uniacid AND attach_id = :attach_id ORDER BY displayorder ASC", array(':uniacid' => $_W['uniacid'], ':attach_id' => $material['id']));
				if (!empty($material['items'])) {
					$material['prompt_msg'] = false;
					foreach ($material['items'] as $material_row) {
						if (empty($material_row['title']) || empty($material_row['thumb_url']) || empty($material_row['content'])) {
							$material['prompt_msg'] = true;
							break;
						}
					}
				}
			}
			unset($material);
		}
		$pager = pagination($total, $pageindex, $pagesize);
	}

	if ($type == 'image') {
		$pageindex = max(1, intval($_GPC['page']));
		$pagesize = 12;
		$image_list = pdo_getslice('wechat_attachment', array('uniacid' => $_W['uniacid'], 'type' => 'image', 'model' => 'perm'), array($pageindex, $pagesize), $total, array(),'', 'createtime DESC');
		$pager = pagination($total, $pageindex, $pagesize);
	}

	if ($type == 'voice') {
		$pageindex = max(1, intval($_GPC['page']));
		$pagesize = 12;
		$voice_list = pdo_getslice('wechat_attachment', array('uniacid' => $_W['uniacid'], 'type' => 'voice', 'model' => 'perm'), array($pageindex, $pagesize), $total, array(),'', 'createtime DESC');
		$pager = pagination($total, $pageindex, $pagesize);
	}

	if ($type == 'video') {
		$pageindex = max(1, intval($_GPC['page']));
		$pagesize = 12;
		$video_list = pdo_getslice('wechat_attachment', array('uniacid' => $_W['uniacid'], 'type' => 'video', 'model' => 'perm'), array($pageindex, $pagesize), $total, array(),'', 'createtime DESC');
		foreach($video_list as &$row) {
			$row['tag'] = $row['tag'] == '' ? array() : iunserializer($row['tag']);
		}
		unset($row);
		$pager = pagination($total, $pageindex, $pagesize);
	}
}

if ($do == 'del_material') {
	$account_api = WeAccount::create($_W['acid']);
	$material_id = intval($_GPC['material_id']);
	$material = pdo_get('wechat_attachment', array('uniacid' => $_W['uniacid'], 'id' => $material_id));
	$result = $account_api->delMaterial($material['media_id']);
	if ($result['errcode'] == 0) {
		$result = error(0, $material['type']);
		if ($material['type'] == 'news') {
			pdo_delete('wechat_news', array('uniacid' => $_W['uniacid'], 'attach_id' => $material['id']));
		}
		pdo_delete('wechat_attachment', array('uniacid' => $_W['uniacid'], 'id' => $material_id));
	}
	iajax(0, $result);
}

if ($do == 'sync') {
	$account_api = WeAccount::create($_W['acid']);
	$pageindex = max(1, $_GPC['pageindex']);
	$type = empty($_GPC['type']) ? 'news' : $_GPC['type'];
	$news_list = $account_api->batchGetMaterial($type, ($pageindex-1)*20);
	$wechat_existid = empty($_GPC['wechat_existid']) ? array() : $_GPC['wechat_existid'];
	if ($pageindex == 1) {
		$original_newsid = pdo_getall('wechat_attachment', array('uniacid' => $_W['uniacid'], 'type' => $type, 'model' => 'perm'), array('id'), 'id');
		$original_newsid = array_keys($original_newsid);
		$wechat_existid = material_sync($news_list['item'], array(), $type);
		if ($news_list['total_count'] > 20) {
			$total = ceil($news_list['total_count']/20);
			iajax('1', array('type' => $type,'total' => $total, 'pageindex' => $pageindex+1, 'wechat_existid' => $wechat_existid, 'original_newsid' => $original_newsid), '');
		}
	} else {
		$wechat_existid = material_sync($news_list['item'], $wechat_existid, $type);
		$total = intval($_GPC['total']);
		$original_newsid = $_GPC['original_newsid'];
		if ($total != $pageindex) {
			iajax('1', array('type' => $type, 'total' => $total, 'pageindex' => $pageindex+1, 'wechat_existid' => $wechat_existid, 'original_newsid' => $original_newsid), '');
		}
		if (empty($original_newsid)) {
			$original_newsid = array();
		}
	}
	$delete_id = array_diff($original_newsid, $wechat_existid);
	if (!empty($delete_id) && is_array($delete_id)) {
		foreach ($delete_id as $id) {
			pdo_delete('wechat_attachment', array('uniacid' => $_W['uniacid'], 'id' => $id));
			pdo_delete('wechat_news', array('uniacid' => $_W['uniacid'], 'attach_id' => $id));
		}
	}
	iajax(0, '更新成功！', '');
}

template('platform/material');