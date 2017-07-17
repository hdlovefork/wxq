<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区活动
 */
	global $_W,$_GPC;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
	$id = intval($_GPC['id']);
    $user = $this->user();
	if($op == 'add'){
        if (!empty($id)) {
            $regions = $this->regions();
            $item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_activity') . "WHERE id=:id", array(':id' => $id));
            $condition = " weid=:weid ";
            $params[':weid'] = $_W['uniacid'];
            $regs = iunserializer($item['regionid']);
            $starttime = !empty($item['starttime']) ? date('Y-m-d', $item['starttime']) : date('Y-m-d', timestamp);
            $endtime = !empty($item['endtime']) ? date('Y-m-d', $item['endtime']) : date('Y-m-d', timestamp);
        }
		if ($_W['ispost']) {
			$starttime = strtotime($_GPC['birth']['start']);
			$endtime   = strtotime($_GPC['birth']['end']);
			if (!empty($starttime) && $starttime==$endtime) {
				$endtime = $endtime+86400-1;
			}
			$birth = $_GPC['birth'];
			$regionid = explode(',',$_GPC['regionid']);
			$data = array(
				'weid'       => $_W['weid'],
				'title'      => $_GPC['title'],
				'starttime'  => $starttime,
				'endtime'    => $endtime,
				'enddate'    => $_GPC['enddate'],
				'picurl'     => $_GPC['picurl'],
				'number'     => !empty($_GPC['number'])?$_GPC['number']:'1',
				'content'    => htmlspecialchars_decode($_GPC['content']),
				'status'     => $_GPC['status'],
				'createtime' => TIMESTAMP,
				'price'		 => $_GPC['price'],
				'province' => $birth['province'],
				'city' => $birth['city'],
				'dist' => $birth['district'],
                'regionid' => serialize($regionid)
			);
            if ($user[type]==2 || $user[type] == 3) {
                //普通管理员
                $data['uid'] = $_W['uid'];
            }
			if (empty($_GPC['id'])) {
				pdo_insert('xcommunity_activity',$data);
			}else{
				pdo_update('xcommunity_activity',$data,array('id' => $id));
			}
			message('更新成功',referer(),'success');
		}
		load()->func('tpl');
		include $this->template('web/activity/add');
	}elseif($op == 'list'){
        $pindex = max(1, intval($_GPC['page']));
        $psize = 20;
        $condition = '';
        if (!empty($_GPC['keyword'])) {
            $condition .= " AND title LIKE '%{$_GPC['keyword']}%'";
        }
        if ($user[type] == 2 || $user[type] == 3) {
            //普通管理员
            $condition .= " AND uid='{$_W['uid']}'";
        }
		$sql = "SELECT * FROM".tablename('xcommunity_activity')."WHERE weid='{$_W['weid']}' $condition LIMIT ".($pindex - 1) * $psize.','.$psize;
		$list   = pdo_fetchall($sql);
		$total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_activity')."WHERE weid='{$_W['weid']}'");
		$pager  = pagination($total, $pindex, $psize);
		//批量删除
		if (checksubmit('delete')) {
			$ids=$_GPC['id'];
			if (!empty($ids)) {
				foreach ($ids as $key => $id) {
					pdo_delete('xcommunity_activity',array('id' => $id));
				}
				message('删除成功',referer(),'success');
			}
		}
		// AJAX是否置顶
		if($_W['isajax'] && $_GPC['id']){
			$data = array();
			$data['status'] = intval($_GPC['status']);
			if(pdo_update('xcommunity_activity', $data, array('id' => $id)) !== false) {
					exit('success');
			}
			
		}
		include $this->template('web/activity/list');
	}elseif($op == 'delete'){
		pdo_delete('xcommunity_activity',array('id' => $id));
		message('删除成功',referer(),'success');
	}elseif ($op == 'order') {
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 20;
		$condition = '';
		$params = array();
		if (!empty($_GPC['keyword'])) {
			$condition .= " AND r.truename LIKE :keyword";
			$params[':keyword'] = "%{$_GPC['keyword']}%";
		}
		$aid = intval($_GPC['id']);
		if ($aid) {
			$condition .=" AND r.aid = :aid";
			$params[':aid'] = $aid;
		}
		$list = pdo_fetchall("SELECT r.*,a.title as title,a.price as price FROM".tablename('xcommunity_res')."as r left join ".tablename('xcommunity_activity')."as a on r.aid = a.id WHERE r.weid='{$_W['weid']}' $condition LIMIT ".($pindex - 1) * $psize.','.$psize,$params);
		$total = pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_res')."as r left join ".tablename('xcommunity_activity')."as a on r.aid = a.id WHERE r.weid='{$_W['weid']}' $condition",$params);
		$pager  = pagination($total, $pindex, $psize);
		if (checksubmit('delete')) {
			pdo_delete('xcommunity_res', " id  IN  ('".implode("','", $_GPC['select'])."')");
			message('删除成功！',referer(),'success');
		}
		//导出用户
		if (checksubmit('export')) {
			$li = pdo_fetchall("SELECT r.*,a.title as title,a.price as price FROM".tablename('xcommunity_res')."as r left join ".tablename('xcommunity_activity')."as a on r.aid = a.id WHERE r.weid='{$_W['weid']}' AND r.aid =:aid ",array(':aid' => $aid));
			foreach ($list as $key => $value) {
				$li[$key]['cctime'] = date('Y-m-d H:i',$value['createtime']);
				if ($value['price'] != '0.00') {
					$li[$key]['s'] = empty($value['status']) ? '未支付' : '已支付';
				}else{
					$li[$key]['s'] = '无定金';
				}
				
			}
			$this->export($li,array(
			            "title" => "用户数据-" . date('Y-m-d-H-i', time()),
			            "columns" => array(
			                array(
			                    'title' => '活动标题',
			                    'field' => 'title',
			                    'width' => 16
			                ),
			                array(
			                    'title' => '姓名',
			                    'field' => 'truename',
			                    'width' => 14
			                ),
			                array(
			                    'title' => '电话',
			                    'field' => 'mobile',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '人数',
			                    'field' => 'num',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '报名时间',
			                    'field' => 'num',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '支付状态',
			                    'field' => 's',
			                    'width' => 12
			                ),
			              
			            )
					));

		}
		include $this->template('web/activity/order');
	}
	







