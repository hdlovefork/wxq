<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端更多菜单
 */
global $_W,$_GPC;
$region = $this->mreg();
$member = $this->changemember();
//菜单
	$list1 = pdo_fetchall("SELECT * FROM".tablename('xcommunity_nav')."WHERE  uniacid='{$_W['uniacid']}' AND pcate = 0 AND status = 1 order by displayorder asc ");
	
		$list = array();
		foreach ($list1 as $key => $value) {
			$regions = unserialize($value['regionid']);
			if ($value['enable'] == 1) {
				$list[$key]['title'] = $value['title'];
			    $list[$key]['id'] = $value['id'];
			}else{
				if (@in_array($member['regionid'], $regions)) {
					$list[$key]['title'] = $value['title'];
			    	$list[$key]['id'] = $value['id'];
				}
				
			}
				
		}

	
	$pcate = !empty($_GPC['pcate']) ? $_GPC['pcate'] : $list[0][id];
	$children = array();
	foreach ($list as $k => $value) {
		$sql  = "select *from".tablename("xcommunity_nav")."where uniacid='{$_W['uniacid']}' and  pcate='{$value['id']}' AND status = 1 order by displayorder asc";
		$li1 = pdo_fetchall($sql);

			$li = array();
			foreach ($li1 as $key => $val) {
				$regions = unserialize($val['regionid']);
				if ($val['enable'] == 1) {
					$li[]=array(
						'title' =>$val['title'],
						'id' => $val['id'],
						'thumb' => tomedia($val['thumb']),
						'url' => $val['url'],
						'icon' => $val['icon'],
						'bgcolor' => $val['bgcolor'],
						'view' => $val['view']
					);
				}else{
					if (@in_array($member['regionid'], $regions)) {
						$li[]=array(
							'title' =>$val['title'],
							'id' => $val['id'],
							'thumb' => tomedia($val['thumb']),
							'url' => $val['url'],
							'icon' => $val['icon'],
							'bgcolor' => $val['bgcolor'],
							'view' => $val['view']
						);
					}
					
				}
				
			}

		$children[$value['id']] = $li;		
	}
include $this->template($this->xqtpl('nav/list'));
