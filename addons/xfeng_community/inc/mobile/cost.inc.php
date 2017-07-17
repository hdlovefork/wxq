<?php
/**
 * Created by 微小区.
 * User: 晓锋
 * Date: 2016/11/14
 * Time: 下午5:30
 * Function:
 */
global $_GPC, $_W;

$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
//判断是否注册，只有注册后，才能进入
$member = $this->changemember();
//获得该用户所在小区
$region = $this->mreg();
//$m = mc_fetch($_W['fans']['uid'], array('mobile', 'address', 'realname'));
$user = mc_fetch($_W['fans']['uid'], array('mobile', 'credit1','credit2', 'realname', 'address'));
$id = intval($_GPC['id']);
//是否开启独立支付
if(!$this->module['config']['xq_pay']){
    //查物业费支持的支付方式
    $setdata = $this->syspay(2);
    $set = unserialize($setdata['pay']);
}
if ($op == 'list') {
    if ($_W['isajax']) {
        if(empty($member['address'])){
            $u = $this->createMobileUrl('home');
            message('暂无缴费信息',$u,'success');exit();
        }
        $pindex = max(1, intval($_GPC['page']));
        $psize = 10;
        $condition = '';
        $sql= "SELECT l.*,c.enable,c.status as cstatus FROM" . tablename('xcommunity_cost_list') . "as l left join " . tablename('xcommunity_cost') . "as c on l.cid = c.id WHERE l.weid='{$_W['weid']}' AND l.homenumber ='{$member['address']}' AND l.regionid ='{$member['regionid']}' order by l.createtime desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize;
        $row = pdo_fetchall($sql);
        $list ='';
        foreach($row as $key=>$value){
            $url = $this->createMobileUrl('cost', array('op' => 'detail', 'id' => $value['id'], 'cid' => $value['cid']));
            if($value['enable'] == 1){

//                $list[$key][url] = $url;
//                $list[$key][region_title] = $region['title'];
//                $list[$key][address] = $member['address'];
//                $list[$key][mobile] = $member['mobile'];
//                $list[$key][realname] = $member['realname'];
                $list[] = array(
                    'url' => $url,
                    'region_title' => $region['title'],
                    'address' => $member['address'],
                    'mobile' => $member['mobile'],
                    'realname' => $member['realname'],
                    'status' => $value['status'],
                    'costtime' => $value['costtime'],
                    'total' => $value['total']
                );
            }else{
                if($value['cstatus']){
                    if($value['status'] =='是'){
                        $list[] = array(
                            'url' => $url,
                            'region_title' => $region['title'],
                            'address' => $member['address'],
                            'mobile' => $member['mobile'],
                            'realname' => $member['realname'],
                            'status' => $value['status'],
                            'costtime' => $value['costtime'],
                            'total' => $value['total']
                        );
                    }

                }
            }

        }
        $data = array();
        $data['list'] = $list;
        die(json_encode($data));
    }
    include $this->template($this->xqtpl('cost/list'));
}
elseif ($op == 'detail') {
    $cid = intval($_GPC['cid']);
    if (empty($id)) {
        message('缺少参数', referer(), 'error');
    }
    $category = pdo_fetch("SELECT name FROM" . tablename('xcommunity_category') . "WHERE regionid=:regionid", array(':regionid' => $member['regionid']));
    $c = explode('|', $category['name']);
    $item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_cost_list') . "WHERE weid=:weid AND id=:id", array(':weid' => $_W['weid'], ':id' => $id));
    $fee = explode('|', $item['fee']);
    if (empty($item)) {
        message('费用不存在或已被删除', referer(), 'error');
    }
    if (checksubmit('submit')) {
        $region = $this->region($member['regionid']);
        $data = array(
            'weid'       => $_W['uniacid'],
            'from_user'  => $_W['fans']['from_user'],
            'ordersn'    => date('YmdHi') . random(10, 1),
            'createtime' => TIMESTAMP,
            'price'      => $item['total'],
            'pid'        => $id,
            'type'       => 'pfree',
            'regionid'   => $member['regionid'],
            'companyid'  => $region['pid']
        );

        $order = pdo_fetch("SELECT * FROM" . tablename('xcommunity_order') . "WHERE pid=:pid", array(':pid' => $id));
        if (empty($order)) {
            pdo_insert('xcommunity_order', $data);
            $orderid = pdo_insertid();
        }
        else {
            pdo_update('xcommunity_order', array('createtime' => TIMESTAMP), array('id' => $order['id']));
            $orderid = $order['id'];
        }
        if ($orderid) {
            header("location: " . $this->createMobileUrl('cost', array('op' => 'pay', 'orderid' => $orderid)));
        }
    }

    include $this->template($this->xqtpl('cost/detail'));
}
elseif ($op == 'pay') {
    //查当前订单信息
    $orderid = intval($_GPC['orderid']);
    $order = pdo_fetch("SELECT * FROM " . tablename('xcommunity_order') . " WHERE id = :id", array(':id' => $orderid));
    if ($order['status'] != '0') {
        message('抱歉，您的订单已经付款或是被关闭，请重新进入付款！', referer(), 'error');
    }
    if($this->module['config']['xq_pay']&&$this->module['config']['xq_wechat']){
        //借用微信支付
        $api = pdo_get('xcommunity_pay_api',array('cid' => $region['pid'],'paytype' => 2),array('pay'));
        $setting = unserialize($api['pay']);
        $wechat['appid'] = trim($setting['wechat']['appid']);
        $wechat['appsecret'] = trim($setting['wechat']['appsecret']);
        if(!empty($_GPC['code'])){
            load()->func('communication');
            $url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid={$wechat['appid']}&secret={$wechat['appsecret']}&code={$_GPC['code']}&grant_type=authorization_code ";
            $res = ihttp_get($url);
            $res = @json_decode($res['content'],true);
            $payopenid = $res['openid'];
        }else{
            $url = $_W['siteroot'].'app'.str_replace('./', '/', $this->createMobileUrl('cost',array('op'=> 'pay','orderid' => $_GPC['orderid'])));
            $callback = urlencode($url);
            $url1= "https://open.weixin.qq.com/connect/oauth2/authorize?appid={$wechat['appid']}&redirect_uri={$callback}&response_type=code&scope=snsapi_base&state=1#wechat_redirect ";
            header('Location: ' . $url1);exit();
        }
    }

    $params['tid'] = $order['ordersn'];
    $params['user'] = $_W['fans']['from_user'];
    $params['fee'] = $order['price'];
    $params['ordersn'] = $order['ordersn'];
    $params['virtual'] = $order['goodstype'] == 2 ? true : false;
    $params['module'] = 'xfeng_community';
    $params['title'] = '物业费支付';
    $params['cid'] = $region['pid'];
    $params['payopenid'] = $payopenid;
    $log = pdo_get('core_paylog', array('uniacid' => $_W['uniacid'], 'module' => $params['module'], 'tid' => $params['tid']));
    if (empty($log)) {
        $log = array(
            'uniacid'    => $_W['uniacid'],
            'acid'       => $_W['acid'],
            'openid'     => $_W['member']['uid'],
            'module'     => $this->module['name'], //模块名称，请保证$this可用
            'tid'        => $params['tid'],
            'fee'        => $params['fee'],
            'card_fee'   => $params['fee'],
            'status'     => '0',
            'is_usecard' => '0',
        );
        pdo_insert('core_paylog', $log);
    }
    $setting = uni_setting($_W['uniacid'], array('creditbehaviors'));
    $credtis = mc_credit_fetch($_W['member']['uid']);
    include $this->template($this->xqtpl('cost/pay'));
}