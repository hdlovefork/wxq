<?php
defined('IN_IA') or exit('Access Denied');


function material_sync($material, $exist_material, $type) {
	global $_W;
	$material = empty($material) ? array() : $material;
	foreach ($material as $news) {
		$attachid = '';
		$material_exist = pdo_get('wechat_attachment', array('uniacid' => $_W['uniacid'], 'media_id' => $news['media_id']));
		if (empty($material_exist)) {
			$material_data = array(
				'uniacid' => $_W['uniacid'],
				'acid' => $_W['acid'],
				'media_id' => $news['media_id'],
				'type' => $type,
				'model' => 'perm',
				'createtime' => $news['update_time']
			);
			if ($type == 'image') {
				$material_data['filename'] = $news['name'];
				$material_data['attachment'] = $news['url'];
			}
			if ($type == 'voice') {
				$material_data['filename'] = $news['name'];
			}
			if ($type == 'video') {
				$material_data['tag'] = iserializer(array('title' => $news['name']));
			}
			pdo_insert('wechat_attachment', $material_data);
			$attachid = pdo_insertid();
		} else {
			if ($type == 'image') {
				$material_data = array(
					'createtime' => $news['update_time'],
					'attachment' => $news['url'],
					'filename' => $news['name']
				);
				pdo_update('wechat_attachment', $material_data, array('uniacid' => $_W['uniacid'], 'media_id' => $news['media_id']));
			}
			if ($type == 'voice') {
				$material_data = array(
					'createtime' => $news['update_time'],
					'filename' => $news['name']
				);
				pdo_update('wechat_attachment', $material_data, array('uniacid' => $_W['uniacid'], 'media_id' => $news['media_id']));
			}
			if ($type == 'video') {
				$tag = empty($material_exist['tag']) ? array() : iunserializer($material_exist['tag']);
				$material_data = array(
					'createtime' => $news['update_time'],
					'tag' => iserializer(array('title' => $news['name'], 'url' => $tag['url']))
				);
				pdo_update('wechat_attachment', $material_data, array('uniacid' => $_W['uniacid'], 'media_id' => $news['media_id']));
			}
			$exist_material[] = $material_exist['id'];
		}
		if ($type == 'news') {
			$attachid = empty($attachid) ? $material_exist['id'] : $attachid;
			pdo_delete('wechat_news', array('uniacid' =>$_W['uniacid'], 'attach_id' => $attachid));
			foreach ($news['content']['news_item'] as $key => $new) {
				$new_data = array(
					'uniacid' => $_W['uniacid'],
					'attach_id' => $attachid,
					'thumb_media_id' => $new['thumb_media_id'],
					'thumb_url' => $new['thumb_url'],
					'title' => $new['title'],
					'author' => $new['author'],
					'digest' => $new['digest'],
					'content' => $new['content'],
					'content_source_url' => $new['content_source_url'],
					'show_cover_pic' => $new['show_cover_pic'],
					'url' => $new['url'],
					'displayorder' => $key,
				);
				pdo_insert('wechat_news', $new_data);
			}
		}
	}
	return $exist_material;
}


function material_get($attach_id) {
	if (empty($attach_id)) {
		return error(1, "素材id参数不能为空");
	}
	if (is_numeric($attach_id)) {
		$material = pdo_get('wechat_attachment', array('id' => $attach_id));
	} else {
		$media_id = trim($attach_id);
		$material = pdo_get('wechat_attachment', array('media_id' => $media_id)); 
	}
	if (!empty($material)) {
		if ($material['type'] == 'news') {
			$news = pdo_getall('wechat_news', array('attach_id' => $material['id']), array(), '', ' displayorder ASC');
			if (!empty($news)) {
				foreach ($news as &$news_row) {
					$news_row['content_source_url'] = preg_replace('/(http|https):\/\/.\/index.php/', './index.php', $news_row['content_source_url']);
					$news_row['thumb_url'] = tomedia($news_row['thumb_url']);
					preg_match_all('/src=[\'\"]?([^\'\"]*)[\'\"]?/i', $news_row['content'], $match);
					if (!empty($match[1])) {
						foreach ($match[1] as $val) {
							if ((strexists($val, 'http://') || strexists($val, 'https://')) && (strexists($val, 'mmbiz.qlogo.cn') || strexists($val, 'mmbiz.qpic.cn'))) {
								$news_row['content'] = str_replace($val, tomedia($val), $news_row['content']);
							}
						}
					}
					$news_row['content'] = str_replace('data-src', 'src', $news_row['content']);
				}
				unset($news_row);
			} else {
				return error('1', '素材不存在');
			}
			$material['news'] = $news;
		} elseif ($material['type'] == 'image') {
			$material['attachment'] = tomedia($material['attachment']);
		}
		return $material;
	} else {
		return error('1', "素材不存在");
	}
}


function material_build_reply($attach_id) {
	if (empty($attach_id)) {
		return error(1, "素材id参数不能为空");
	}
	$cachekey = cache_system_key('material_reply:' . $attach_id);
	$reply = cache_load($cachekey);
	if (!empty($reply)) {
		return $reply;
	}
	$reply_material = material_get($attach_id);
	$reply = array();
	if ($reply_material['type'] == 'news') {
		if (!empty($reply_material['news'])) {
			foreach ($reply_material['news'] as $material) {
				$reply[] = array(
					'title' => $material['title'],
					'description' => $material['description'],
					'picurl' => $material['thumb_url'],
					'url' => !empty($material['content_source_url']) ? $material['content_source_url'] : $material['url'],
				);
			}
		}
	}
	cache_write($cachekey, $reply, CACHE_EXPIRE_MIDDLE);
	return $reply;
}


function material_strip_wechat_image_proxy($content) {
	global $_W;
	$match_wechat = array();
	$content = htmlspecialchars_decode($content);
	preg_match_all ('/<img.*src=[\'"](.*)[\'"].*\/?>/iU', $content, $match_wechat);
	if (!empty($match_wechat[1])) {
		foreach ($match_wechat[1] as $val) {
			$wechat_thumb_url = urldecode(str_replace($_W['siteroot'] . 'web/index.php?c=utility&a=wxcode&do=image&attach=', '', $val));
			$content = str_replace($val, $wechat_thumb_url, $content);
		}
	}
	return $content;
}


function material_get_image_url($content) {
	global $_W;
	$content = htmlspecialchars_decode ($content);
	$match = array ();
	$images = array ();
	preg_match_all ('/<img.*src=[\'"](.*\.(?:png|jpg|jpeg|jpe|gif))[\'"].*\/?>/iU', $content, $match);
	if (!empty($match[1])) {
		foreach ($match[1] as $val) {
			if ((strexists ($val, 'http://') || strexists ($val, 'https://')) && !strexists ($val, 'mmbiz.qlogo.cn') && !strexists ($val, 'mmbiz.qpic.cn')) {
				$images[] = $val;
			} else {
				if (strexists ($val, './attachment/images/')) {
					$images[] = tomedia ($val);
				}
			}
		}
	}
	return $images;
}




function material_parse_content($content) {
	global $_W;
	$content = material_strip_wechat_image_proxy($content);
	$images = material_get_image_url($content);
	if (!empty($images)) {
		foreach ($images as $image) {
			$thumb = file_fetch(tomedia($image), 1024, 'material/images');
			if(is_error($thumb)) {
				return $thumb;
			}
			$thumb = ATTACHMENT_ROOT . $thumb;
			$account_api = WeAccount::create($_W['acid']);
			$result = $account_api->uploadNewsThumb($thumb);
			if (is_error($result)) {
				return $result;
			} else {
				$content = str_replace($image, $result, $content);
			}
		}
	}
	return $content;
}
