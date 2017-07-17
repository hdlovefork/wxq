<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端二手交易
 */
	global $_W,$_GPC;

	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
	$member = $this->changemember();
	$region = $this->mreg();
    $userinfo = mc_oauth_userinfo();
	//查二手子类 二手主类ID=5
	$categories = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid='{$_W['weid']}' AND type=4");
    $arr = array();
	foreach ($categories as $key => $item){
        $arr[] = array(
            'title' => $item['name'],
            'value' => $item['id']
        );
    }
	$data = json_encode($arr);
	if ($op == 'list') {
		$set = $this->set();
		if ($_W['isajax']) {
			$pindex = max(1, intval($_GPC['page']));
			$psize = 10;
			$condition = '';
			if (!empty($_GPC['keyword'])) {
				$keyword = "%{$_GPC['keyword']}%";
				$condition .= " AND f.title LIKE '{$keyword}'";
			}
			$category = intval($_GPC['category']);
			if ($category) {
				$condition .=" AND f.category =:category";
				$params[':category'] = $category; 
			}
			if(empty($set['fled_status'])){
				$condition .=" AND f.regionid='{$member['regionid']}'";
			}
			$price = intval($_GPC['price']);
			if ($price == 1000) {
				$condition .=" AND f.zprice between 0 and 1000";
			}elseif ($price == 2000) {
				$condition .=" AND f.zprice between 1000 and 2000";
			}elseif ($price == 4000) {
				$condition .=" AND f.zprice between 2000 and 4000";
			}elseif ($price == 6000) {
				$condition .=" AND f.zprice between 4000 and 6000";
			}
            if($_GPC['cate']){
                $condition .= " AND f.cate = '{$_GPC['cate']}'";
            }
			$list = pdo_fetchall('SELECT f.*,s.name as name FROM'.tablename('xcommunity_fled')."as f left join".tablename('xcommunity_category')."as s on f.category = s.id WHERE f.weid='{$_W['weid']}' AND black = 0 AND f.enable =0  $condition order by f.id desc LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
			foreach ($list as $key => $value) {
				$images = $value['images'];
				if ($images) {
					$imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$images})");
					$list[$key]['img'] = $imgs[0][src];
				}else{
					$thumb = MODULE_URL."template/mobile/style1/static/image/fled.jpg";
					$list[$key]['img'] = $thumb;
				}
				

				if ($value['regionid']) {
					$region = pdo_fetch("SELECT * FROM".tablename('xcommunity_region')."WHERE id='{$value['regionid']}'");
					$list[$key]['regionname'] = $region['title'];
				}
				$url = $this->createMobileUrl('fled',array('op' => 'detail','id' => $value['id']));
				$list[$key]['url'] = $url;
				$datetime = date('Y-m-d H:i:s',$value['createtime']);
				$list[$key]['datetime'] = $datetime;
			}
			$data = array();
			$data['list'] = $list;
			die(json_encode($data));
		}
		include $this->template($this->xqtpl('fled/list'));
	}elseif ($op == 'add') {

		$m = mc_fetch($_W['member']['uid'],array('realname','mobile','address'));
		$id = intval($_GPC['id']);
		if (!empty($id)) {
			$good = pdo_fetch("SELECT * FROM".tablename('xcommunity_fled')."WHERE id=:id",array(':id' => $id));
			$category = pdo_get('xcommunity_category',array('id' => $good['category']),array('name'));
            $images = $good['images'];
            if ($images&&$good['images'] !='N;') {
                $imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$images})");
            }
		}
		
		if ($_W['isajax']) {
			$data = array(
				'weid'        => $_W['weid'],
				'openid'      => $_W['fans']['from_user'],
				'rolex'       => $_GPC['rolex'],
				'title'       => $_GPC['title'],
				'category'    => $_GPC['category'],
				'zprice'      => $_GPC['zprice'],
				'description' => $_GPC['description'],
				'realname'    => $_GPC['realname'],
				'mobile'      => $_GPC['mobile'],
				'createtime'  => TIMESTAMP,
				'regionid'    => $member['regionid'],
				'images' => substr($_GPC['picIds'],0,strlen($_GPC['picIds'])-1),
                'yprice'        => $_GPC['yprice'],
                'cate'          => $_GPC['cate']
			);
			$set = $this->set();
			$data['enable'] = $set['fleds_status'] ? 1 : 0; //0审核通过
			if (empty($_GPC['id'])) {
				$r = pdo_insert('xcommunity_fled',$data);
			}else{

				$r = pdo_update('xcommunity_fled',$data,array('id' => $_GPC['id']));
			}
			if ($r) {
				$result = array(
							'status' => 1,
						);
					echo json_encode($result);exit();
			}
		}
		include $this->template($this->xqtpl('fled/add'));
	}elseif ($op == 'detail') {
		$id = intval($_GPC['id']);
		if ($id) {
			$item = pdo_fetch("SELECT f.*,s.name as name FROM".tablename('xcommunity_fled')."as f left join".tablename('xcommunity_category')."as s on f.category = s.id WHERE f.id=:id",array(':id' => $id));
			if ($item['images']&&$item['images']!='N;') {
				$imgs = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$item['images']})");
			}
            $region = $this->region($item['regionid']);
		}
		include $this->template($this->xqtpl('fled/detail'));
	}elseif($op == 'my'){
		if ($_W['isajax']) {
			$pindex = max(1, intval($_GPC['page']));
			$psize = 15;
			$condition = '';
			if (!empty($_GPC['keyword'])) {
				$keyword = "%{$_GPC['keyword']}%";
				$condition = " AND f.title LIKE '{$keyword}'";
			}
			$category = intval($_GPC['category']);
			if ($category) {
				$condition .=" AND f.category =:category";
				$params[':category'] = $category; 
			}
			$list = pdo_fetchall('SELECT f.*,s.name as name FROM'.tablename('xcommunity_fled')."as f left join".tablename('xcommunity_category')."as s on f.category = s.id WHERE f.weid='{$_W['weid']}' AND f.regionid='{$member['regionid']}' AND f.openid='{$_W['fans']['from_user']}' AND black = 0 $condition order by f.id desc LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
			foreach ($list as $key => $value) {
//				if ($value['images']) {
//					$images = unserialize($value['images']);
//					if ($images) {
//						$picid  = implode(',', $images);
//						$imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$picid})");
//					}
//					$list[$key]['img'] = $imgs;
//				}
                $images = $value['images'];
                if ($images) {
                    $imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$images})");
                    $list[$key]['img'] = $imgs[0][src];
                }else{
                    $thumb = MODULE_URL."template/mobile/style1/static/image/fled.jpg";
                    $list[$key]['img'] = $thumb;
                }
				if ($value['regionid']) {
					$region = pdo_fetch("SELECT * FROM".tablename('xcommunity_region')."WHERE id='{$value['regionid']}'");
					$list[$key]['regionname'] = $region['title'];
				}
				$url = $this->createMobileUrl('fled',array('op' => 'add','id' => $value['id']));
				$datetime = date('Y-m-d H:i:s',$value['createtime']);
				$list[$key]['url'] = $url;
				$list[$key]['datetime'] = $datetime;
			}
			$data = array();
			$data['list'] = $list;
			die(json_encode($data));
		}
		include $this->template($this->xqtpl('fled/my'));
	}elseif ($op == 'delete') {
		$id = intval($_GPC['id']);
		if (pdo_delete('xcommunity_fled',array('id'=>$id))) {
			$result['state'] = 0;
			message($result, '', 'ajax');
		}
	}elseif ($op == 'finish') {
		$id = intval($_GPC['id']);
		if ($id) {
			$r = pdo_update('xcommunity_fled',array('status' => 1),array('id' => $id));
			if ($r) {
				echo json_encode(array('result' => 1));
			}
		}
	}elseif($op == 'del'){
	    $id = intval($_GPC['id']);
	    pdo_delte('xcommunity_images',array('id' => $id));
    }