<?php
/**
 * [WeEngine System] Copyright (c) 2014 WE7.CC
 * WeEngine is NOT a free software, it under the license terms, visited http://www.we7.cc/ for more details.
 */
defined('IN_IA') or exit('Access Denied');
load()->func('file');
load()->model('material');
load()->model('account');
$dos = array('news', 'tomedia', 'addnews');
$do = in_array($do, $dos) ? $do : 'news';

uni_user_permission_check('platform_material');

$_W['page']['title'] = '新增素材-微信素材';

if ($do == 'tomedia') {
	iajax('0', tomedia($_GPC['url']), '');
}

if ($do == 'news') {
	$type = trim($_GPC['type']);
	$newsid = intval($_GPC['newsid']);
	if (empty($newsid)) {
		if ($type == 'reply') {
			$reply_news_id = intval($_GPC['reply_news_id']);
			$news = pdo_get('news_reply', array('id' => $reply_news_id));
			$news_list = pdo_getall('news_reply', array('parent_id' => $news['id']), array(), '', ' displayorder ASC');
			$news_list = array_merge(array($news), $news_list);
			if (!empty($news_list)) {
				foreach ($news_list as $key => &$row_news) {
					$row_news = array(
						'uniacid' => $_W['uniacid'],
						'thumb_url' => $row_news['thumb'],
						'title' => $row_news['title'],
						'author' => $row_news['author'],
						'digest' => $row_news['description'],
						'content_source_url' => preg_replace('/(http|https):\/\/.\/index.php/', './index.php', $row_news['url']),
						'content' => $row_news['content'],
						'show_cover_pic' => intval($row_news['incontent']),
						'displayorder' => $key
					);
				}
			}
		}
	} else {
		$attachment = material_get($newsid);
		$news_list = $attachment['news'];
	}
	template('platform/material-post');
}

if ($do == 'addnews') {
	$account_api = WeAccount::create($_W['acid']);
	$operate = $_GPC['operate'] == 'add' ? 'add' : 'edit';
	$type =  trim($_GPC['type']);
	$is_save_location = trim($_GPC['target']) == 'wechat' ? false : true;
	$news_rid = intval($_GPC['news_rid']);
	$articles = array();
	$post_news = array();
	$local_upload_to_wechat = '';

		if (!empty($_GPC['news'])) {
		foreach ($_GPC['news'] as $key => $news) {
						$news_info = array(
				'title' => $news['title'],
				'author' => $news['author'],
				'digest' => $news['description'],
				'content' => htmlspecialchars_decode($news['content']),
				'content_source_url' => $news['content_source_url'],
				'show_cover_pic' => $news['show_cover_pic'],
				'thumb_media_id' => $news['media_id'],
			);
			if (!$is_save_location) {
				$news_info['content'] = material_parse_content($news_info['content']);
				if (is_error($news_info['content'])) {
					iajax(0, $news_info['content']);
				}
				if (empty($news_info['thumb_media_id'])) {
					iajax(1, '请将封面图片换成微信图片素材后再上传。');
				}
			}
			$post_data = array(
				'uniacid' => $_W['uniacid'],
				'thumb_media_id' => $news['media_id'],
				'thumb_url' => $news['thumb'],
				'title' => $news['title'],
				'author' => $news['author'],
				'digest' => $news['digest'],
				'content' => htmlspecialchars_decode($news['content']),
				'content_source_url' => $news['content_source_url'],
				'show_cover_pic' => $news['show_cover_pic'],
				'url' => '',
				'displayorder' => $key
			);
			$attach_mediaid =  pdo_getcolumn('wechat_attachment', array('id' => intval($_GPC['attach_id']), 'uniacid' => $_W['uniacid']), 'media_id');
						if (empty($attach_mediaid) && $operate == 'edit' && $is_save_location == false) {
				$operate = 'add';
				$local_attach_id = pdo_getcolumn('wechat_news', array('id' => $news['id']), 'attach_id');
			}
			if ($operate == 'add') {
				$post_news[] = $post_data;
				$articles['articles'][] = $news_info;
			} else {
				$articles[] = array(
					'media_id' => $attach_mediaid,
					'index' => $key,
					'articles' => $news_info
				);
				$post_news[$news['id']] = $post_data;
			}
		}
	}

	if ($operate == 'add') {
		if (!$is_save_location) {
			$media_id = $account_api->addMatrialNews($articles);
			if (is_error($media_id)) {
				iajax(1, $media_id, '');
			}
			$wechat_new = $account_api->getMaterial($media_id);
		}
		$wechat_attachment = array(
			'uniacid' => $_W['uniacid'],
			'acid' => $_W['acid'],
			'media_id' => !$is_save_location ? $media_id : '',
			'type' => 'news',
			'model' => !$is_save_location ? 'perm' : 'local',
			'createtime' => time()
		);
		pdo_insert('wechat_attachment', $wechat_attachment);
		$attach_id = pdo_insertid();
				if ($is_save_location && $news_rid) {
			pdo_update('news_reply', array('media_id' => $attach_id), array('id' => $news_rid));
		}
		foreach ($post_news as $key => $news) {
			$news['attach_id'] = $attach_id;
			if (!$is_save_location) {
				$news['url'] = $wechat_new['news_item'][$key]['url'];
			}
			pdo_insert('wechat_news', $news);
		}
				if (!empty($local_attach_id)) {
			pdo_delete('wechat_attachment', array('id' => $local_attach_id));
			pdo_delete('wechat_news', array('attach_id' => $local_attach_id));
		}
		iajax(0, '创建图文素材成功', '');
	} else {
		if (!$is_save_location) {
			foreach ($articles as $edit_news) {
				$result = $account_api->editMaterialNews($edit_news);
				if (is_error($result)) {
					iajax(0, $result, '');
				}
			}
		}
		foreach ($post_news as $id => $news) {
			pdo_update('wechat_news', $news, array('uniacid' => $_W['uniacid'], 'id' => $id));
		}
		iajax(0, '更新图文素材成功', '');
	}
}