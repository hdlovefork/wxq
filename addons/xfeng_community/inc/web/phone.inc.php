<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区电话信息
 */
	global $_GPC,$_W;
$do = $_GPC['do'];
$method = 'fun';
$GLOBALS['frames'] = $this->NavMenu($do, $method);
$xqmenu = $this->xqmenu();
$id = intval($_GPC['id']);
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
$user = $this->user();

if ($op == 'list') {
        //批量删除
        if ($_W['ispost']) {
            $ids=$_GPC['ids'];
            if (!empty($ids)) {
                foreach ($ids as $key => $id) {
                    pdo_delete('xcommunity_phone',array('id' => $id));
                }
                message('删除成功',referer(),'success');
            }
        }
        //排序
        if (!empty($_GPC['displayorder'])) {
            foreach ($_GPC['displayorder'] as $id => $displayorder) {
                pdo_update('xcommunity_phone', array('displayorder' => $displayorder), array('id' => $id));
            }
            message('排序更新成功！', 'refresh', 'success');
        }
		//常用号码显示
		$pindex = max(1, intval($_GPC['page']));
		$psize  = 10;
		$condition = '';
		if ($user[type] == 3 || $user[type] == 2) {
			$condition .=" AND uid='{$_W['uid']}'";
		}
		if (!empty($_GPC['keyword'])) {
			$condition .= " AND phone LIKE :keyword";
			$params[':keyword'] = "%{$_GPC['keyword']}%";
		}
		$regions = $this->regions();
		$sql    = "select * from ".tablename("xcommunity_phone")."where weid = '{$_W['weid']}' $condition order by displayorder asc LIMIT ".($pindex - 1) * $psize.','.$psize;
		$row   = pdo_fetchall($sql,$params);
		$regionid = intval($_GPC['_regionid']);
		$list = '';
		if ($regionid) {
			foreach ($row as $key => $value) {
				if ($value['regionid'] != 'N;') {
					$rregions = unserialize($value['regionid']);
					if (@in_array($regionid, $rregions)) {
						$list[$key]['id'] = $value['id'];
						$list[$key]['thumb'] = $value['thumb'];
						$list[$key]['phone'] = $value['phone'];
						$list[$key]['content'] = $value['content'];
						$list[$key]['displayorder'] = $value['displayorder'];
					}
				}
				
			}
		}else{
			$list = $row;
		}
		$total  = pdo_fetchcolumn('select count(*) from'.tablename("xcommunity_phone")."where  weid = '{$_W['weid']}' $condition ",$params);
		$pager  = pagination($total, $pindex, $psize);


		include $this->template('web/phone/list');
	}elseif ($op == 'delete') {
		//常用号码删除
		$r = pdo_delete("xcommunity_phone",array('id'=>$id));
		if ($r) {
			message('删除成功',referer(),'success');
		}
	}elseif ($op == 'add') {
		if ($id) {
            $item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_phone') . "WHERE id=:id", array(':id' => $id));
            $condition = " weid=:weid ";
            $params[':weid'] = $_W['uniacid'];
            $regs = iunserializer($item['regionid']);
		}
		if (checksubmit('submit')) {
			$birth = $_GPC['birth'];
            $regionid = explode(',',$_GPC['regionid']);
			$data = array(
					'weid' => $_W['uniacid'],
					'phone' => $_GPC['phone'],
					'content' => $_GPC['content'],
					'displayorder' => intval($_GPC['displayorder']),
					'thumb' => $_GPC['thumb'],
					'province' => $birth['province'],
					'city' => $birth['city'],
					'dist' => $birth['district'],
                    'regionid' => serialize($regionid)
				);
            if ($user[type]==2 || $user[type] == 3) {
                //普通管理员
                $data['uid'] = $_W['uid'];
            }
			if ($id) {
				pdo_update('xcommunity_phone',$data,array('id' => $id));
			}else{
				pdo_insert('xcommunity_phone',$data);
			}
			message('提交成功',referer(),'success');
		}
		load()->func('tpl');
		include $this->template('web/phone/add');
	}elseif($op == 'post'){
		if ($_W['ispost']) {

			$costtime = $_GPC['costtime'];
			if (!empty($_FILES['uploadExcel']['name'])) {
				$tmp_file   = $_FILES['uploadExcel']['tmp_name'];
				$file_types = explode(".",$_FILES['uploadExcel']['name']);
				$file_type  = $file_types[count($file_types)-1];
				/*判别是不是.xls文件，判别是不是excel文件*/
				if (strtolower ( $file_type ) !="xls" && strtolower ( $file_type ) !="xlsx")
				{
					message('类型不正确，请重新上传',referer(),'error');
				}
				/*设置上传路径*/
				$savePath = IA_ROOT.'/addons/xfeng_community/template/upFile/';
				/*以时间来命名上传的文件*/
				$str = date('Ymdhis');
				$file_name = $str.".".$file_type;
				/*是否上传成功*/
				if (!copy($tmp_file,$savePath.$file_name)) {
					message('上传失败');

				}
				$regionid = explode(',',$_GPC['regionid']);

				$dat = $this->read($savePath.$file_name);
				$data = array();
				/*对生成的数组进行数据库的写入*/
				 foreach ($dat as $k => $v ) {
				     if($k >0){
                         $data['weid']      		 = $_W['uniacid'];
                         $data['displayorder']    = $v[0];
                         $data['phone']           = $v[1];
                         $data['thumb']           = $v[2];
                         $data['content']         = $v[3];
                         $data['regionid']        = serialize($regionid);
                         if ($user[type]==2 || $user[type] == 3) {
                             //普通管理员
                             $data['uid'] = $_W['uid'];
                         }
                         $r = pdo_get('xcommunity_phone',array('phone' => $v[1]),array('id'));
                         if (empty($r)){
                             $result  = pdo_insert('xcommunity_phone',$data);
                         }
                     }
                 }
				 }
				if($result){
					message('导入成功',referer(),'success');
				}
			}
		include $this->template('web/phone/post');
	}




	












