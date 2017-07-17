<?php
/**
 * Created by 微小区.
 * User: 晓锋
 * Date: 2016/11/10
 * Time: 下午10:01
 * Function:
 */
global $_W,$_GPC;
$do = $_GPC['do'];
$method = $_GPC['method'] ? $_GPC['method'] : 'manage';
$GLOBALS['frames'] = $this->NavMenu($do,$method);
$xqmenu = $this->xqmenu();
$op = in_array($_GPC['op'],array('list','alipay','wechat','sub','del','service')) ? $_GPC['op'] : 'list';
$operation = in_array($_GPC['operation'],array('add','list')) ? $_GPC['operation'] : 'add';
$companies = pdo_getall('xcommunity_property',array('weid' => $_W['uniacid']),array('id','title'));
$user = $this->user();
if ($op == 'list'){
    $settings = $this->module['config'];
    if(checksubmit('submit')){
        $dat = array(
            'thumb' => $settings['thumb'],
            'url' => $settings['url'],
            'service_thumb'  => $settings['service_thumb'],
            'xq_pay' => intval($_GPC['xq_pay']),
            'xq_alipay' => intval($_GPC['xq_alipay']),
            'xq_wechat' => intval($_GPC['xq_wechat']),
            'xq_wechat_sub' => intval($_GPC['xq_wechat_sub']),
            'leftstext' => $settings['leftstext'],
            'leftsthumb' => $settings['leftsthumb'],
            'leftsurl' => $settings['leftsurl'],
            'leftxtext' => $settings['leftxtext'],
            'leftxthumb' => $settings['leftxthumb'],
            'leftxurl' => $settings['leftxurl'],
            'rightstext' => $settings['rightstext'],
            'rightsthumb' => $settings['rightsthumb'],
            'rightsurl' => $settings['rightsurl'],
            'rightxtext' => $settings['rightxtext'],
            'rightxthumb' => $settings['rightxthumb'],
            'rightxurl' => $settings['rightxurl'],
        );
        $this->saveSettings($dat);
        message('提交成功',referer(),'success');
    }
    include $this->template('web/payapi/list');
}elseif($op == 'wechat'){
    if($operation == 'add'){
        $id =intval($_GPC['id']);
        if($id){
            $set = pdo_get('xcommunity_pay_api',array('id'=>$id),array('type','pay','cid','id'));
            $pay = unserialize($set['pay']);
        }
        if(checksubmit('submit')){
            $set['wechat'] = is_array($_GPC['wechat']) ? $_GPC['wechat'] : array();
            $data = array(
                'uniacid' => $_W['uniacid'],
                'pay' => iserializer($set),
                'type' => intval($_GPC['type']),
                'cid' => intval($_GPC['cid']),
                'paytype' => 2,
            );
            if($user[type] == 2 || $user[type] == 3){
                $data['uid'] = $_W['user'];
            }
            if($id){
                pdo_update('xcommunity_pay_api',$data,array('id' => $id));
            }else{
                pdo_insert('xcommunity_pay_api',$data);
            }
            message('提交成功',referer(),'success');
        }
        include $this->template('web/payapi/wechat/add');
    }elseif($operation == 'list'){
        $pindex = max(1, intval($_GPC['page']));
        $psize  = 20;
        $condition ='';
        if($user[type] == 2 || $user[type] == 3){
            $condition .=" and a.uid = {$_W['uid']}";
        }
        $sql = "SELECT a.* FROM".tablename('xcommunity_pay_api')."as a left join ".tablename('xcommunity_property')."as p on a.cid = p.id WHERE a.uniacid='{$_W['uniacid']}' AND paytype = 2 LIMIT ".($pindex - 1) * $psize.','.$psize;
        $list   = pdo_fetchall($sql);
        foreach ($list as $key=>$val){
            $pay = unserialize($val['pay']);
            $list[$key]['set'] = $pay;
        }
        $total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_pay_api')."as a left join ".tablename('xcommunity_property')."as p on a.cid = p.id WHERE a.uniacid='{$_W['uniacid']}' AND paytype = 2");
        $pager  = pagination($total, $pindex, $psize);

        include $this->template('web/payapi/wechat/list');
    }
}elseif($op == 'alipay'){
    if($operation == 'add'){

        if($id){
            $set = pdo_get('xcommunity_pay_api',array('id'=>$id),array('type','pay','cid','id'));
            $pay = unserialize($set['pay']);
        }
        if(checksubmit('submit')){
            $set['alipay'] = is_array($_GPC['alipay']) ? $_GPC['alipay'] : array();
            $data = array(
                'uniacid' => $_W['uniacid'],
                'pay' => iserializer($set),
                'type' => intval($_GPC['type']),
                'cid' => intval($_GPC['cid']),
                'paytype' => 1,
            );
            if($user[type] == 2 || $user[type] == 3){
                $data['uid'] = $_W['user'];
            }
            if($id){
                pdo_update('xcommunity_pay_api',$data,array('id' => $id));
            }else{
                pdo_insert('xcommunity_pay_api',$data);
            }
            message('提交成功',referer(),'success');
        }
        include $this->template('web/payapi/alipay/add');
    }elseif($operation == 'list'){
        $pindex = max(1, intval($_GPC['page']));
        $psize  = 20;
        $condition ='';
        if($user[type] == 2 || $user[type] == 3){
            $condition .=" and a.uid = {$_W['uid']}";
        }
        $sql = "SELECT a.* FROM".tablename('xcommunity_pay_api')."as a left join ".tablename('xcommunity_property')."as p on a.cid = p.id WHERE a.uniacid='{$_W['uniacid']}' AND paytype = 1 LIMIT ".($pindex - 1) * $psize.','.$psize;
        $list   = pdo_fetchall($sql);
        foreach ($list as $key=>$val){
            $pay = unserialize($val['pay']);
            $list[$key]['set'] = $pay;
        }
        $total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_pay_api')."as a left join ".tablename('xcommunity_property')."as p on a.cid = p.id WHERE a.uniacid='{$_W['uniacid']}' AND paytype = 1  ");
        $pager  = pagination($total, $pindex, $psize);
        include $this->template('web/payapi/alipay/list');
    }
}elseif($op == 'sub'){
    if($operation == 'add'){

        $id =intval($_GPC['id']);
        if($id){
            $set = pdo_get('xcommunity_pay_api',array('id'=>$id),array('type','pay','cid','id'));
            $pay = unserialize($set['pay']);
        }
        if(checksubmit('submit')){
            $set['sub'] = is_array($_GPC['sub']) ? $_GPC['sub'] : array();
            $data = array(
                'uniacid' => $_W['uniacid'],
                'pay' => iserializer($set),
                'type' => intval($_GPC['type']),
                'cid' => intval($_GPC['cid']),
                'paytype' => 3,
            );
            if($user[type] == 2 || $user[type] == 3){
                $data['uid'] = $_W['user'];
            }
            if($id){
                pdo_update('xcommunity_pay_api',$data,array('id' => $id));
            }else{
                pdo_insert('xcommunity_pay_api',$data);
            }
            message('提交成功',referer(),'success');
        }
        include $this->template('web/payapi/sub/add');
    }elseif($operation == 'list'){
        $pindex = max(1, intval($_GPC['page']));
        $psize  = 20;
        $condition ='';
        if($user[type] == 2 || $user[type] == 3){
            $condition .=" and a.uid = {$_W['uid']}";
        }
        $sql = "SELECT a.*,p.title as title FROM".tablename('xcommunity_pay_api')."as a left join ".tablename('xcommunity_property')."as p on a.cid = p.id WHERE a.uniacid='{$_W['uniacid']}' AND paytype = 3 LIMIT ".($pindex - 1) * $psize.','.$psize;
        $list   = pdo_fetchall($sql);
        foreach ($list as $key=>$val){
            $pay = unserialize($val['pay']);
            $list[$key]['set'] = $pay;
        }
        $total =pdo_fetchcolumn("SELECT COUNT(*) FROM".tablename('xcommunity_pay_api')."as a left join ".tablename('xcommunity_property')."as p on a.cid = p.id WHERE a.uniacid='{$_W['uniacid']}' AND paytype = 3  ");
        $pager  = pagination($total, $pindex, $psize);
        include $this->template('web/payapi/sub/list');
    }
}elseif($op == 'del'){
    $id = intval($_GPC['id']);
    if(empty($id)){
        message('缺少参数',referer(),'error');exit();
    }
    $item = pdo_get('xcommunity_pay_api',array('id'=> $id),array('id'));
    if(empty($item)){
        message('数据不存在或者已删除',referer(),'error');exit();
    }
    if(pdo_delete('xcommunity_pay_api',array('id' => $id))){
        message('删除成功',referer(),'success');
    }
}elseif($op == 'service'){
    $set = pdo_get('xcommunity_pay_api',array('uniacid'=>$_W['uniacid'],'paytype' => 4),array('type','pay','id'));
    $pay = unserialize($set['pay']);
    if(checksubmit('submit')){
        $id = intval($_GPC['id']);
        $set['service'] = is_array($_GPC['service']) ? $_GPC['service'] : array();
        $data = array(
            'uniacid' => $_W['uniacid'],
            'pay' => iserializer($set),
            'paytype' => 4
        );
        if(pdo_update('uni_settings', array('payment' => $dat), array('uniacid' => $_W['uniacid'])) !== false) {
            if($id){
                pdo_update('xcommunity_pay_api',$data,array('id' => $id));
            }else{
                pdo_insert('xcommunity_pay_api',$data);
            }
        }

        message('提交成功',referer(),'success');
    }
    include $this->template('web/payapi/sub/service');
}