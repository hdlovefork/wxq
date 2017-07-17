<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端投诉页面
 */


global $_GPC, $_W;
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
$region = $this->mreg();
load()->model('mc');
$m = mc_fetch($_W['fans']['uid'], array('mobile', 'address', 'realname'));
if ($op == 'add') {
    //查投诉子类 投诉主类ID=4
    $categories = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_category') . "WHERE weid='{$_W['weid']}' AND type=3");
    $data = json_encode($categories);
    $m = mc_fetch($_W['member']['uid'], array('realname', 'mobile', 'address'));
    //查小区编号
    $member = $this->changemember();
    if ($_W['isajax']) {
        $cat = pdo_get('xcommunity_category',array('id' => $_GPC['cid']),array('name'));
        $data = array(
            'openid'     => $_W['fans']['from_user'],
            'weid'       => $_W['weid'],
            'regionid'   => $member['regionid'],
            'type'       => 2,
            'cid'        => intval($_GPC['cid']),
            'category'   => $cat['name'],
            'content'    => $_GPC['content'],
            'createtime' => $_W['timestamp'],
            'images'     => substr($_GPC['picIds'], 0, strlen($_GPC['picIds']) - 1),
            'status'     => 2,
            'address'    => $_GPC['address'],
        );
        $set = $this->set();
        $data['enable'] = $set['report_status'] ? 1 : 0; //0审核通过
        $r = pdo_insert("xcommunity_report", $data);
        $id = pdo_insertid();
        // 客服消息通知
        load()->func('communication');
        $access_token = WeAccount::token();
        $url = "https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token={$access_token}";
        $text = array(
            "touser"  => $_W['fans']['from_user'],
            "msgtype" => "text",
            "text"    => array(
                "content" => '尊敬的业主及住户，您的建议信息已收到,非常感谢您的提醒，我们会尽快安排相关工作人员处理。',
            )
        );
        $data = json_encode($text, JSON_UNESCAPED_UNICODE);
        ihttp_post($url, $data);
        //微信通知
        $notice = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_wechat_notice') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
        foreach ($notice as $key => $value) {
            // if ($value['type'] == 1 || $value['type'] == 3) {
            $regions = unserialize($value['regionid']);
            if (@in_array($member['regionid'], $regions)) {
                if ($value['report_status'] == 2) {
                    if ($value['type'] == 2 || $value['type'] == 3) {
                        //短信提醒
                        $mmember = $this->member($value['fansopenid']);
                        $content = $_GPC['content'];
                        $sms = pdo_fetch("SELECT * FROM" . tablename('xcommunity_wechat_smsid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
                        if ($sms['report_type']) {
                            $tpl_id = $sms['reportid'];
                            $appkey = $sms['sms_account'];
                            $this->Resms($content, $tpl_id, $appkey, $mmember['mobile'], $member['mobile']);
                        }
                    }
                    if ($value['type'] == 1 || $value['type'] == 3) {
                        //模板消息通知
                        $openid = $value['fansopenid'];
                        $url = $_W['siteroot'] . "app/index.php?i={$_W['uniacid']}&c=entry&op=c&id={$id}&do=report&m=xfeng_community";
                        $tpl = pdo_fetch("SELECT * FROM" . tablename('xcommunity_wechat_tplid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
                        $template_id = $tpl['report_tplid'];
                        $createtime = date('Y-m-d H:i:s', $_W['timestamp']);
                        $content = array(
                            'first'    => array(
                                'value' => '新意见建议通知',
                            ),
                            'keyword1' => array(
                                'value' => $member['realname'],
                            ),
                            'keyword2' => array(
                                'value' => $member['mobile'],
                            ),
                            'keyword3' => array(
                                'value' => $region['title'].$member['address'],
                            ),
                            'keyword4' => array(
                                'value' => $_GPC['content'],
                            ),
                            'keyword5' => array(
                                'value' => $createtime,
                            ),
                            'remark'   => array(
                                'value' => '请尽快联系客户。',
                            ),
                        );
                        $this->sendtpl($openid, $url, $template_id, $content);
                    }
                }
            }
            // }
        }
        //微信通知
        $notices = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_notice') . "WHERE uniacid=:uniacid AND enable = 2 ", array(':uniacid' => $_W['uniacid']));
        foreach ($notices as $key => $value) {
            // if ($value['type'] == 1 || $value['type'] == 3) {
            $regions = unserialize($value['regionid']);
            $cids = explode(',',$value['cid']);
            if (@in_array($member['regionid'], $regions) && @in_array(intval($_GPC['cid']), $cids)) {

                    if ($value['type'] == 2 || $value['type'] == 3) {
                        //短信提醒
                        $mmember = $this->member($value['fansopenid']);
                        $content = $_GPC['content'];
                        $sms = pdo_fetch("SELECT * FROM" . tablename('xcommunity_wechat_smsid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
                        if ($sms['report_type']) {
                            $tpl_id = $sms['reportid'];
                            $appkey = $sms['sms_account'];
                            $this->Resms($content, $tpl_id, $appkey, $mmember['mobile'], $member['mobile']);
                        }
                    }
                    if ($value['type'] == 1 || $value['type'] == 3) {
                        //模板消息通知
                        $openid = $value['fansopenid'];
                        $url = $_W['siteroot'] . "app/index.php?i={$_W['uniacid']}&c=entry&op=c&id={$id}&do=report&m=xfeng_community";
                        $tpl = pdo_fetch("SELECT * FROM" . tablename('xcommunity_wechat_tplid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
                        $template_id = $tpl['report_tplid'];
                        $createtime = date('Y-m-d H:i:s', $_W['timestamp']);
                        $content = array(
                            'first'    => array(
                                'value' => '新意见建议通知',
                            ),
                            'keyword1' => array(
                                'value' => $member['realname'],
                            ),
                            'keyword2' => array(
                                'value' => $member['mobile'],
                            ),
                            'keyword3' => array(
                                'value' => $region['title'].$member['address'],
                            ),
                            'keyword4' => array(
                                'value' => $_GPC['content'],
                            ),
                            'keyword5' => array(
                                'value' => $createtime,
                            ),
                            'remark'   => array(
                                'value' => '请尽快联系客户。',
                            ),
                        );
                        $this->sendtpl($openid, $url, $template_id, $content);
                    }

            }
            // }
        }
        //判断打印机
        $prints = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_print') . "WHERE uniacid = :uniacid", array(':uniacid' => $_W['uniacid']));
        $row = array();
        foreach ($prints as $key => $value) {
            $regions = unserialize($value['regionid']);
            if (@in_array($member['regionid'], $regions)) {
                $row = $prints;
            }
        }
        foreach ($row as $key => $value) {

            if ($value['print_status']) {

                if (empty($value['print_type']) || $value['print_type'] == '2') {
                    $key = $value['api_key'];
                    $createtime = date('Y-m-d H:i:s', $_W['timestamp']);
                    $msgNo = time() + 1;
                    $deviceNo = $value['deviceNo'];
                    if ($value['member_code']) {
                        $freeMessage = array(
                            'memberCode' => $value['member_code'],
                            'msgDetail'  =>
                                '
												    物业公司欢迎您建议

												内容：' . $_GPC['content'] . '
												-------------------------

												地址：' . $member['address'] . '
												业主：' . $member['realname'] . '
												电话：' . $member['mobile'] . '
												时间：' . $createtime . '
												',
                            'deviceNo'   => $deviceNo,
                            'msgNo'      => $msgNo,
                        );
                        echo $this->sendFreeMessage($freeMessage, $key);
                    }
                    else {
                        //普通打印机

                        $createtime = date('Y-m-d H:i:s', $_W['timestamp']);
                        $content = "^N1^F1\n";
                        $content .= "^B2 新意见建议订单\n";
                        $content .= "内容：" . $_GPC['content'] . "\n";
                        $content .= "地址：" . $member['address'] . "\n";
                        $content .= "业主：" . $member['realname'] . "\n";
                        $content .= "电话：" . $member['mobile'] . "\n";
                        $content .= "时间：" . $createtime;
                        $content .= "\n";
                        $content .= "\n";
                        $content .= "\n";
                        $content .= "\n";
                        $content .= "\n";

                        $c = $this->sendSelfFormatOrderInfo($deviceNo, $key, 1, $content);

                    }

                }
            }

        }
        unset($result);
        if ($r) {
            $result = array(
                'status' => 1,
            );
            echo json_encode($result);
            exit();
        }
    }
    include $this->template($this->xqtpl('report/add'));
}
elseif ($op == 'list') {
    //投诉列表
    //查小区编号
    $member = $this->changemember();
    if ($_W['isajax']) {
        $pindex = max(1, intval($_GPC['page']));
        $psize = 10;
        $condition = " ";
        $status = intval($_GPC['status']);
        if ($status) {
            $condition .= " AND status=:status";
            $parmas[':status'] = $status;
        }
        $set = $this->set();//个人和当前小区
        if ($set['r_status']) {
            $condition .= " AND regionid='{$member['regionid']}'";
        }
        else {
            $condition .= " AND openid='{$_W['fans']['from_user']}'";
        }
        $sql = "select * from " . tablename("xcommunity_report") . "where weid='{$_W['weid']}' and type=2 AND enable=0 $condition order by createtime desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize;
        $list = pdo_fetchall($sql, $parmas);
        foreach($list as $key => $item){
            $list[$key][url] = $this->createMobileUrl('report', array('op' => 'detail', 'id' => $item['id']));
            $list[$key][datetime] = date('Y-m-d H:i', $item['createtime']);
            if($item['status'] == 1){
                $list[$key][s] = '已处理';
                $list[$key][css] = 'p1';
            }elseif($item['status'] == 2){
                $list[$key][s] = '未处理';
                $list[$key][css] = 'p2';
            }else{
                $list[$key][s] = '处理中';
                $list[$key][css] = 'p3';
            }
        }
        $data = array();
        $data['list'] = $list;
        die(json_encode($data));
    }
    include $this->template($this->xqtpl('report/list'));
}
elseif ($op == 'my') {
    if ($_W['isajax']) {
        $pindex = max(1, intval($_GPC['page']));
        $psize = 10;
        $condition = " ";
        $status = intval($_GPC['status']);
        if ($status) {
            $condition .= " AND status=:status";
            $parmas[':status'] = $status;
        }
        //查小区编号
        $member = $this->changemember();
        $list = pdo_fetchall("select * from " . tablename("xcommunity_report") . "where weid='{$_W['weid']}' and type=2  AND regionid='{$member['regionid']}' AND openid='{$_W['fans']['from_user']}' $condition order by createtime desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize, $parmas);
        foreach($list as $key => $item){
            $list[$key][url] = $this->createMobileUrl('report', array('op' => 'detail', 'id' => $item['id']));
            $list[$key][link] = $this->createMobileUrl('report', array('op' => 'rank', 'id' => $item['id']));
            $list[$key][datetime] = date('Y-m-d H:i', $item['createtime']);
            if($item['status'] == 1){
                $list[$key][s] = '已处理';
                $list[$key][css] = 'p1';
            }elseif($item['status'] == 2){
                $list[$key][s] = '未处理';
                $list[$key][css] = 'p2';
            }else{
                $list[$key][s] = '处理中';
                $list[$key][css] = 'p3';
            }
        }
        $data = array();
        $data['list'] = $list;
        die(json_encode($data));
    }
    include $this->template($this->xqtpl('report/my'));
}
elseif ($op == 'rank') {
    //业主评论
    if ($_W['isajax']) {
        $id = intval($_GPC['id']);
        $data = array(
            'rank'    => $_GPC['rank'],
            'comment' => $_GPC['comment'],
        );
        $r = pdo_update("xcommunity_report", $data, array('id' => $id));
        if ($r) {
            $result = array(
                'status' => 1,
            );
            echo json_encode($result);
            exit();
        }
    }
    include $this->template($this->xqtpl('report/rank'));
}
elseif ($op == 'detail') {
    $id = intval($_GPC['id']);
    if (empty($id)) {
        message('缺少参数', referer(), 'error');
    }
    $item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_report') . "WHERE id=:id", array(':id' => $id));
    if ($item['images'] && $item['images'] != 'N;') {
        $imgs = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_images') . "WHERE id in({$item['images']})");
    }
    $user = $this->member($item['resolver']);
    $member = $this->member($item['openid']);
    include $this->template($this->xqtpl('report/detail'));
}
elseif ($op == 'delete') {
    $id = intval($_GPC['id']);
    if ($_W['isajax']) {
        if (empty($id)) {
            exit('缺少参数');
        }
        $r = pdo_delete('xcommunity_report', array('id' => $id));
        if ($r) {
            $result = array(
                'status' => 1,
            );
            echo json_encode($result);
            exit();
        }
    }
}
elseif ($op == 'grab') {
    $id = intval($_GPC['id']);
//    if (empty($id)) {
//        message('缺少参数', referer(), 'error');
//    }

    $item = pdo_fetch("SELECT r.*,m.realname as realname,m.mobile as mobile FROM" . tablename('xcommunity_report') . "as r left join " . tablename('xcommunity_member') . "as m on r.openid = m.openid WHERE r.id=:id", array(':id' => $id));

    if ($item['images'] && $item['images'] != 'N;') {
        $imgs = pdo_fetchall("SELECT * FROM" . tablename('xcommunity_images') . "WHERE id in({$item['images']})");
    }

    if ($_W['isajax']) {
        $status = intval($_GPC['status']);
        $data = array(
            'status' => $status,
            'resolve' => $_GPC['resolve'],
            'resolvetime' => TIMESTAMP,
            'grabimages'     => substr($_GPC['picIds'], 0, strlen($_GPC['picIds']) - 1),
        );
        pdo_update('xcommunity_report', $data, array('id' => $id));
        if ($status == 1) {
            $openid = $item['openid'];
            $mem = pdo_fetch("SELECT realname FROM" . tablename('xcommunity_member') . "WHERE openid=:openid", array(':openid' => $openid));
            $tpl = pdo_fetch("SELECT * FROM" . tablename('xcommunity_wechat_tplid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));
            $template_id = $tpl['report_wc_tplid'];
            $url = $_W['siteroot'] . "app/index.php?i={$_W['uniacid']}&c=entry&id={$item['id']}&op=detail&do=report&m=xfeng_community";
            $userinfo = mc_fansinfo($_W['fans']['from_user']);
            $content = array(
                'first'    => array(
                    'value' => '您的意见建议已处理',
                ),
                'keyword1' => array(
                    'value' => $mem['realname'],
                ),
                'keyword2' => array(
                    'value' => $item['category'],
                ),
                'keyword3' => array(
                    'value' => $item['content'],
                ),
                'keyword4' => array(
                    'value' => $_GPC['resolve'],
                ),
                'keyword5' => array(
                    'value' => $userinfo['nickname']
                ,
                ),
                'remark'   => array(
                    'value' => '请到微信我的意见建议给我们评价，谢谢使用！',
                ),
            );
            $result = $this->sendtpl($openid, $url, $template_id, $content);
        }
//        message('处理完成', referer(), 'success');
        echo json_encode(array('result' => 1));exit();

    }
    include $this->template($this->xqtpl('report/grab'));
}
elseif ($op == 'ajax') {
    if ($_W['isajax']) {
        $id = intval($_GPC['id']);
        $member = $this->member($_W['fans']['from_user']);
        $item = pdo_get('xcommunity_report', array('id' => $id), array('resolver'));
        if (empty($item['resolver'])) {
            $r = pdo_update('xcommunity_report', array('resolver' => $_W['fans']['from_user'], 'status' => 3, 'resolvetime' => TIMESTAMP), array('id' => $id));
            if ($r) {
                echo json_encode(array('result' => 3, 'id' => $id));
                exit();
                //					message('抢单成功',$this->createMobileUrl('repair',array('op' => 'grab','id' => $id)),'success');
            }
        }
        else {
            if ($_W['fans']['from_user'] != $item['resolver']) {
                //					message('该订单已被其他人抢购',referer(),'error');exit();
                echo json_encode(array('result' => 1));
                exit();
            }
            else {
                echo json_encode(array('result' => 2, 'id' => $id));
                exit();
                //					message('抢单成功',$this->createMobileUrl('repair',array('op' => 'grab','id' => $id)),'success');
            }
        }

    }
}
elseif ($op == 'c') {
    $id = intval($_GPC['id']);
    $item = pdo_get('xcommunity_report', array('id' => $id), array('status'));
    if($item['resolver']){
        message('订单已经在处理中或者处理完成',referer(),'sucdess');exit();
    }
    include $this->template($this->xqtpl('report/success'));
}
