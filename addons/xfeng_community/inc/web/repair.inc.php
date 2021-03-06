<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区报修信息
 */

	global $_GPC,$_W;
    $do = $_GPC['do'];
    $method = 'fun';
    $GLOBALS['frames'] = $this->NavMenu($do, $method);
    $xqmenu = $this->xqmenu();
	$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
	$id = intval($_GPC['id']);
	if($op == 'list'){
	    $regions = $this->regions();
		//查投诉子类 投诉主类ID=4
		$categories = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid='{$_W['weid']}' AND type=2");
		//搜索
		$condition = ' weid =:weid';
		$params[':weid'] = $_W['uniacid'];
		if (!empty($_GPC['category'])) {
			$condition .= " AND category = :category";
			$params[':category'] = $_GPC['category'];
		}
		$status = intval($_GPC['status']);
		if (!empty($status)) {
			$condition .=" AND status = :status";
			$params[':status'] = $status;
		}
		$starttime = strtotime($_GPC['birth']['start']) ;
		$endtime   = strtotime($_GPC['birth']['end']) ;
		if (!empty($starttime) && $starttime==$endtime) {
			$endtime = $endtime+86400-1;
		}
		if ($starttime && $endtime) {
			$condition .=" AND createtime between '{$starttime}' and '{$endtime}'";
		}
        if (!empty($_GPC['keyword1'])) {
		    $m = pdo_fetch("select openid from".tablename('xcommunity_member')."where realname LIKE '%{$_GPC['keyword1']}%' or mobile LIKE '%{$_GPC['keyword1']}%' or address LIKE '%{$_GPC['keyword1']}%' ");
		    $condition .=" and openid =:openid";
            $params[':openid'] =  $m['openid'];
        }
        if (!empty($_GPC['keyword2'])) {
            $condition .= " AND (resolver LIKE '%{$_GPC['keyword2']}%' or dealing LIKE '%{$_GPC['keyword2']}%' or content LIKE '%{$_GPC['keyword2']}%')";
        }
        if ($user[type] == 3) {
            //普通管理员
            $condition .=" and regionid in({$user['regionid']})";
        }
		//显示报修记录
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 10;
		$sql = "select id,address,content,rank,category,createtime,status,resolver,dealing,openid from".tablename('xcommunity_report')."where $condition and type =1 order by id desc limit ".($pindex - 1) * $psize.','.$psize;
        $list = pdo_fetchall($sql,$params);
        foreach ($list as $key => $value) {
            $list[$key]['cctime'] = date('Y-m-d H:i',$value['createtime']);
            $user = $this->member($value['resolver']);
            $list[$key]['resolvers'] = $value['resolver'] ? $user['realname'] : $value['dealing'];
        }
        foreach ($list as $key => $val){
            $member = $this->member($val['openid']);
            $list[$key]['realname'] = $member['realname'];
            $list[$key]['mobile'] = $member['mobile'];
        }
		$tsql = "select count(*) from".tablename('xcommunity_report')."where $condition and type =1";
		$total = pdo_fetchcolumn($tsql,$params);
		if ($_GPC['export'] == 1) {
            $sql = "select id,address,content,rank,category,createtime,status,resolver,dealing,openid,comment,resolve,resolvetime from".tablename('xcommunity_report')."where $condtion and type =1 order by id desc ";
            $li = pdo_fetchall($sql,$params);
            foreach ($li as $key => $value) {
                $li[$key]['cctime'] = date('Y-m-d H:i',$value['createtime']);
                $li[$key]['rtime'] =  $value['resolvetime'] ? date('Y-m-d H:i',$value['resolvetime']) : '';
                $user = $this->member($value['resolver']);
                $list[$key]['resolvers'] = $value['resolver'] ? $user['realname'] : $value['dealing'];
            }
            foreach ($li as $key => $val){
                $member = $this->member($val['openid']);
                $li[$key]['realname'] = $member['realname'];
                $li[$key]['mobile'] = $member['mobile'];
            }

				$this->export($li,array(
			            "title" => "意见报修数据-" . date('Y-m-d-H-i', time()),
			            "columns" => array(
			                array(
			                    'title' => '姓名',
			                    'field' => 'realname',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '手机号',
			                    'field' => 'mobile',
			                    'width' => 12
			                ),
			                array(
			                    'title' => '地址',
			                    'field' => 'address',
			                    'width' => 18
			                ),
			                array(
			                    'title' => '报修内容',
			                    'field' => 'content',
			                    'width' => 20
			                ),
			                array(
			                    'title' => '评价',
			                    'field' => 'comment',
			                    'width' => 20
			                ),
							array(
								'title' => '处理结果',
								'field' => 'resolve',
								'width' => 25
							),
							array(
								'title' => '处理人',
								'field' => 'resolver',
								'width' => 12
							),
			                array(
			                    'title' => '时间',
			                    'field' => 'cctime',
			                    'width' => 16
			                ),
                            array(
                                'title' => '接单时间',
                                'field' => 'rtime',
                                'width' => 16
                            ),
			            )
			        ));
		}

		$pager  = pagination($total, $pindex, $psize);
		//删除
		if ($_W['ispost']) {
			$ids=$_GPC['ids'];
			if (!empty($ids)) {
				foreach ($ids as $key => $id) {
					pdo_delete('xcommunity_report',array('id' => $id));
				}
				message('删除成功',referer(),'success');
			}
		}
		load()->func('tpl');
		include $this->template('web/repair/list');
		
	}
	elseif ($op == 'add') {
		//报修详情
		$sql    = "select a.*,b.memberid from".tablename("xcommunity_report")."as a left join".tablename("xcommunity_member")."as b on a.openid=b.openid where a.weid='{$_W['weid']}' and a.id='{$id}'";
		$item  = pdo_fetch($sql);
		$user = $this->member($item['resolver']);
		//load()->model('mc');
		//$member = mc_fetch($value['memberid'],array('realname','mobile','address'));
		$member = $this->member($item['openid']);
		$images = $item['images'];
		if ($images&&$item['images'] !='N;') {
		    $imgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$images})");
		}
        $grabimages = $item['grabimages'];
        if ($grabimages&&$item['grabimages'] !='N;') {
            $grabimgs   = pdo_fetchall("SELECT * FROM".tablename('xcommunity_images')."WHERE id in({$grabimages})");
        }
		if (checksubmit('submit')) {
			//获取报修表单提交的数据
			$data =array(
				'status'      => $_GPC['status'],
				'dealing'    => $_GPC['dealing'] ? $_GPC['dealing'] : $_W['username'],
				'resolvetime' => $_W['timestamp'],
				'resolve'     => $_GPC['resolve'],
                'resolver'    => '',
				);
			pdo_update("xcommunity_report",$data,array('id'=>$id));
			if ($data['status'] == 1) {
				//模板消息通知
				$tpl = pdo_fetch("SELECT * FROM".tablename('xcommunity_wechat_tplid')."WHERE uniacid=:uniacid",array(':uniacid' => $_W['uniacid']));
				$template_id = $tpl['grab_wc_tplid'];
				$url = $_W['siteroot']."app/index.php?i={$_W['uniacid']}&c=entry&id={$id}&op=detail&do=repair&m=xfeng_community";
				$content = array(
							'first' => array(
									'value' => '尊敬的业主，您的报修已经完成',
								),
							'keyword1' => array(
									'value' => $member['address'],
								),
							'keyword2' => array(
									'value' =>$item['content'],
								),
							'keyword3' => array(
									'value' => $_GPC['dealing'],
								),
							'keyword4'	=> array(
									'value' => date('Y-m-d H:i',TIMESTAMP),
								),
							'remark'    => array(
								'value' => '请到微信我的报修给我们评价，谢谢使用！',
							),	
						);
					$result = $this->sendtpl($item['openid'],$url,$template_id,$content);
			}
			
			message('更新成功!',referer(),'success');
		}

		include $this->template('web/repair/add');
	}
	elseif ($op == 'delete') {
		pdo_delete("xcommunity_report",array('id'=>$id));
		message('删除成功！',referer(),'success');
	}
	elseif ($op == 'category') {
		$list = pdo_fetchall("SELECT * FROM".tablename('xcommunity_category')."WHERE weid=:weid AND type =2",array(':weid' => $_W['weid']));
		if (checksubmit('submit')) {
			$count = count($_GPC['names']);
			// print_r($count);exit();
			for ($i=0; $i < $count; $i++) { 
				$ids = $_GPC['ids'];
				$id  = trim(implode(',', $ids),',');
				$data = array(
									'name'   =>  $_GPC['names'][$i] ,
									'weid'    =>  $_W['weid'],
									'type' => 2,
				 			);
				if($ids[$i]){
					$r = pdo_update("xcommunity_category",$data,array('id'=>$ids[$i]));
				}else{
					$r = pdo_insert("xcommunity_category",$data);
				}
			}
			message('提交成功',$this->createWebUrl('repair',array('op' => 'list')));

		}

		include $this->template('web/repair/category');
	}
	elseif ($op == 'del') {
		if ($id) {
			pdo_delete("xcommunity_category",array('id' => $id));
			message('删除成功。',referer(),'success');
		}
		
	}
	elseif($op == 'manage'){
		$operation = in_array($_GPC['operation'],array('list','add','del')) ? $_GPC['operation'] : 'list';
		if($operation == 'add'){
			//报修分类
			$categories = pdo_getall('xcommunity_category',array('weid' => $_W['uniacid'],'type' => 2),array('id','name'));
			$id = intval($_GPC['id']);
			if ($id) {
				$item = pdo_fetch("SELECT * FROM".tablename('xcommunity_notice')."WHERE uniacid=:uniacid AND id=:id",array(":uniacid" => $_W['uniacid'],":id" => $id));
				if (empty($item)) {
					message('该信息不存在或已删除',referer(),'error');
				}
				$condition = " weid=:weid ";
				$params[':weid'] = $_W['uniacid'];
				$regs = iunserializer($item['regionid']);
				$cids = explode(',',$item['cid']);
			}
			if ($_W['ispost']) {
				$birth = $_GPC['birth'];
                $regionid = explode(',',$_GPC['regionid']);
				$data = array(
					'uniacid' => $_W['uniacid'],
					'fansopenid' => $_GPC['fansopenid'],
					'enable' => 1,
					'type' => intval($_GPC['type']),
					'province' => $birth['province'],
					'city' => $birth['city'],
					'dist' => $birth['district'],
                    'regionid' => serialize($regionid)
				);
                $cid = implode(',',$_GPC['cid']);
                $data['cid'] = $cid;
                if ($user[type]==2 || $user[type] == 3) {
                    //普通管理员
                    $data['uid'] = $_W['uid'];
                }
				if ($id) {
					if(pdo_update('xcommunity_notice',$data,array('id' => $id))){
						message('提交成功',referer(),'success');
					}
				}else{
					if(pdo_insert('xcommunity_notice',$data)){
						message('提交成功',referer(),'success');
					}
				}
			}
			include $this->template('web/repair/manage_add');
		}elseif($operation == 'list'){
			$condition = "n.uniacid='{$_W['uniacid']}' AND n.enable = 1";
			if ($user['type'] == 2 || $user['type'] == 3) {
				$condition .=" AND n.uid='{$_W['uid']}'";
			}
			$list = pdo_fetchall("SELECT n.*,c.name FROM".tablename('xcommunity_notice')."as n left join".tablename('xcommunity_category')."as c on n.cid = c.id WHERE $condition");
			foreach($list as $key => $val){
				load()->model('mc');
				$userinfo = mc_fansinfo($val['fansopenid']);
				$list[$key]['nickname'] = $userinfo['nickname'];
                $member = $this->member($val['fansopenid']);
                $list[$key]['realname'] = $member['realname'];
				if($val['cid']){
                    $condition = " weid ={$_W['uniacid']} and id in({$val['cid']})";
                }

				$category = pdo_getall("xcommunity_category",$condition,array('name'));
                $category_name ='';
				foreach ($category as $k => $item){
				    $category_name .= $item['name'].',';
                }
                $list[$key][category_name] = trim($category_name,',');
			}
			include $this->template('web/repair/manage_list');
		}elseif($operation == 'del'){
			$id = intval($_GPC['id']);
			if ($id) {
				$r = pdo_delete('xcommunity_notice',array('id' => $id));
				if ($r) {
					$result = array(
						'status' => 1,
					);
					echo json_encode($result);exit();
				}

			}
		}
	}
	elseif($op == 'verify'){
		//审核用户
		$id = intval($_GPC['id']);
		$type = $_GPC['type'];
		$data = intval($_GPC['data']);
		if (in_array($type, array('enable'))) {
			$data = ($data==0?'1':'0');
			pdo_update("xcommunity_report", array($type => $data), array("id" => $id, "weid" => $_W['uniacid']));
			die(json_encode(array("result" => 1, "data" => $data)));
		}
	}
	elseif($op == 'send'){
        $id = intval($_GPC['id']);
        $report = pdo_get('xcommunity_report',array('id'=> $id),array('cid','regionid','openid','content'));
        $notices = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_notice') . "WHERE uniacid=:uniacid AND enable = 1 ", array(':uniacid' => $_W['uniacid']));
        foreach ($notices as $key => $notice ){
            $regionids = unserialize($notice['regionid']);
            if(in_array($report['regionid'],$regionids)){
                $member = $this->member($notice['fansopenid']);
                $notices[$key]['realname'] = $member['realname'];
            }
        }
        if(checksubmit('submit')){
            $nid = intval($_GPC['nid']);
            $item = pdo_get('xcommunity_notice',array('id' => $nid),array('fansopenid'));
            $openid=$item['fansopenid'];
            if(strlen($openid)===11){
                $openid = $this->member($openid)['openid'];
            }
            $region = $this->region($_GPC['regionid']);
            $fromuser = $_GPC['fromuser'];
            sendmessage($openid,$fromuser,$region['title'],$_GPC['rid'],$_GPC['content'],'1');
            message('推送成功',referer(),'success');
        }
        include $this->template('web/repair/send');
    }
