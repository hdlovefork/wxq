<?php
/**
 * Created by 微小区.
 * User: 晓锋
 * Date: 2016/11/14
 * Time: 下午7:33
 * Function:
 */
defined('IN_IA') or exit('Access Denied');
global $_GPC,$_W;
$type = in_array($_GPC['op'],array('wechat','alipay')) ? $_GPC['op'] : '';
//type 1 物业费缴费 2 超市或者商家
$paytype = intval($_GPC['type']);
$moduels = uni_modules();
$params = @json_decode(base64_decode($_GPC['params']), true);
if(empty($params) || !array_key_exists($params['module'], $moduels)) {
    message('访问错误.');
}
if(empty($type)) {
    message('支付方式错误,请联系商家', '', 'error');
}
if(!empty($type)) {
    $sql = 'SELECT * FROM ' . tablename('core_paylog') . ' WHERE `uniacid`=:uniacid AND `module`=:module AND `tid`=:tid';
    $pars  = array();
    $pars[':uniacid'] = $_W['uniacid'];
    $pars[':module'] = $params['module'];
    $pars[':tid'] = $params['tid'];
    $log = pdo_fetch($sql, $pars);
    if(!empty($log) && ($type != 'credit' && !empty($_GPC['notify'])) && $log['status'] != '0') {
        message('这个订单已经支付成功, 不需要重复支付.');
    }
    $update_card_log = array(
        'is_usecard' => '0',
        'card_type' => '0',
        'card_id' => '0',
        'card_fee' => $log['fee'],
        'type' => $type,
    );
    pdo_update('core_paylog', $update_card_log, array('plid' => $log['plid']));
    $log['is_usecard'] = '0';
    $log['card_type'] = '0';
    $log['card_id'] = '0';
    $log['card_fee'] = $log['fee'];

    $moduleid = pdo_fetchcolumn("SELECT mid FROM ".tablename('modules')." WHERE name = :name", array(':name' => $params['module']));
    $moduleid = empty($moduleid) ? '000000' : sprintf("%06d", $moduleid);

    $record = array();
    $record['type'] = $type;
    if (empty($log['uniontid'])) {
        $record['uniontid'] = $log['uniontid'] = date('YmdHis').$moduleid.random(8,1);
    }
    if($type != 'delivery') {
        $coupon_id = intval($_GPC['coupon_id']);
        $coupon_info = pdo_get('coupon', array('uniacid' => $_W['uniacid'], 'id' => $coupon_id));
        $coupon_info['fee'] = $log['card_fee'];
        if (!empty($coupon_info)) {
            $extra = iunserializer($coupon_info['extra']);
            if($coupon_info['type'] == COUPON_TYPE_DISCOUNT) {
                $coupon_info['fee'] = sprintf("%.2f", ($log['fee'] * ($extra['discount'] / 100)));
            } elseif ($coupon_info['type'] == COUPON_TYPE_CASH) {
                if($log['fee'] >= $extra['least_cost'] * 0.01) {
                    $coupon_info['fee'] =  sprintf("%.2f", ($log['fee'] - $extra['reduce_cost'] / 100));
                }
            }
            if (!empty($_GPC['code']) && !empty($_GPC['coupon_id'])) {
                $record['is_usecard'] = 1;
                $record['card_fee'] = $coupon_info['fee'];
                $record['encrypt_code'] = trim($_GPC['code']);
                if (COUPON_TYPE == WECHAT_COUPON) {
                    $record['card_type'] = 1;
                    $record['card_id'] = $coupon_info['id'];
                } else {
                    $record['card_type'] = 2;
                    $record['card_id'] = $coupon_info['id'];
                }
            }
        }
    }
    if (empty($log)) {
        message('系统支付错误, 请稍后重试.');
    } else {
        pdo_update('core_paylog', $record, array('plid' => $log['plid']));
        if (!empty($log['uniontid']) && $record['card_fee']) {
            $log['card_fee'] = $record['card_fee'];
            $log['card_id'] = $record['card_id'];
            $log['card_type'] = $record['card_type'];
            $log['is_usecard'] = $record['is_usecard'];
        }
    }
    $ps = array();
    $ps['tid'] = $log['plid'];
    $ps['uniontid'] = $log['uniontid'];
    $ps['user'] = $_W['fans']['from_user'];
    $ps['fee'] = $log['card_fee'];
    $ps['title'] = $params['title'];
    if($paytype == 1){
        $ps['cid'] = $params['cid'];
    }else{
        $ps['uid'] = $params['uid'];
    }
    $ps['payopenid'] = $params['payopenid'];
    if($type == 'alipay') {
        if(!empty($plid)) {
            pdo_update('core_paylog', array('openid' => $_W['member']['uid']), array('plid' => $plid));
        }
        load()->model('payment');
        load()->func('communication');
        //支付接口
        if($paytype == 1){
            $api = pdo_get('xcommunity_pay_api',array('cid' => $params['cid'],'paytype' => 1),array('pay'));
        }elseif ($paytype == 2){
            $api = pdo_get('xcommunity_pay_api',array('uid' => $params['uid'],'paytype' => 1),array('pay'));
        }

        $pay = unserialize($api['pay']);
        $alipay = array(
                'switch'  => 1,
                'account' => $pay[alipay][account],
                'partner' => $pay[alipay][partner],
                'secret'  => $pay[alipay][secret],
            );
        $ret = alipay_build($ps, $alipay);
        if($ret['url']) {
            echo '<script type="text/javascript" src="../payment/alipay/ap.js"></script><script type="text/javascript">_AP.pay("'.$ret['url'].'")</script>';
            exit();
        }
    }
    if($type == 'wechat') {
        if(!empty($plid)) {
            $tag = array();
            $tag['acid'] = $_W['acid'];
            $tag['uid'] = $_W['member']['uid'];
            pdo_update('core_paylog', array('openid' => $_W['openid'], 'tag' => iserializer($tag)), array('plid' => $plid));
        }
        $ps['title'] = urlencode($params['title']);
        load()->model('payment');
        load()->func('communication');
        $sl = base64_encode(json_encode($ps));
        $auth = sha1($sl . $_W['uniacid'] . $_W['config']['setting']['authkey']);
        $url = $this->createMobileUrl('pay',array('i' => $_W['uniacid'],'auth' => $auth,'ps' => $sl));
        header("location:".$url);
        //header("location: ../addons/xfeng_community/payment/wechat/pay.php?i={$_W['uniacid']}&auth={$auth}&ps={$sl}");
        exit();
    }
}
