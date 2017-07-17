<?php

/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 后台小区公告信息
 */
global $_GPC, $_W;
$do = $_GPC['do'];
$method = 'fun';
$GLOBALS['frames'] = $this->NavMenu($do, $method);
$xqmenu = $this->xqmenu();
$op = !empty($_GPC['op']) ? $_GPC['op'] : 'list';
$id = intval($_GPC['id']);
$user = $this->user();
if ($op == 'list')
{
    //公告搜索
    $condition = '';
    if (!empty($_GPC['title']))
    {
        $condition .= " AND title LIKE '%{$_GPC['title']}%'";
    }
    if ($user[type] == 2 || $user[type] == 3)
    {
        //普通管理员
        $condition .= " AND uid='{$_W['uid']}'";
    }
    //管理公告reason
    $pindex = max(1, intval($_GPC['page']));
    $psize = 10;
    $sql = "select * from " . tablename("xcommunity_announcement") . "where  weid = {$_W['weid']} $condition order by createtime desc LIMIT " . ($pindex - 1) * $psize . ',' . $psize;
    $list = pdo_fetchall($sql);
    $total = pdo_fetchcolumn('select count(*) from' . tablename("xcommunity_announcement") . "where  weid = {$_W['weid']} $condition");
    $pager = pagination($total, $pindex, $psize);
    //删除
    if ($_W['ispost'])
    {
        $ids = $_GPC['ids'];
        if (!empty($ids))
        {
            foreach ($ids as $key => $id)
            {
                pdo_delete('xcommunity_announcement', array('id' => $id));
            }
            message('删除成功', referer(), 'success');
        }
    }
    include $this->template('web/announcement/list');
}
elseif ($op == 'add')
{

    if (!empty($id))
    {
        $regions = $this->regions();
        $item = pdo_fetch("SELECT * FROM" . tablename('xcommunity_announcement') . "WHERE id=:id", array(':id' => $id));
        $condition = " weid=:weid ";
        $params[':weid'] = $_W['uniacid'];
        $regs = iunserializer($item['regionid']);
    }
    //添加公告
    if ($_W['ispost'])
    {
            if (empty($_GPC['regionid']))
            {
                message('请选择省市-->小区', referer(),'error');
            }
        $birth = $_GPC['birth'];
        $regionid = explode(',', $_GPC['regionid']);
        $data = array(
            'weid' => $_W['uniacid'],
            'title' => $_GPC['title'],
            'createtime' => $_W['timestamp'],
            'status' => $_GPC['status'],
            'datetime' => $_GPC['datetime'],
            'location' => $_GPC['location'],
            'reason' => htmlspecialchars_decode($_GPC['reason']),
            'remark' => $_GPC['remark'],
            'province' => $birth['province'],
            'city' => $birth['city'],
            'dist' => $birth['district'],
            'regionid' => serialize($regionid)
        );
        if ($user[type] == 2 || $type[type] == 3)
        {
            //普通管理员
            $data['uid'] = $_W['uid'];
        }
        if (empty($id))
        {
            pdo_insert("xcommunity_announcement", $data);
            $id = pdo_insertid();
        }
        else
        {
            pdo_update("xcommunity_announcement", $data, array('id' => $id));
        }
        //是否启用模板消息
        if ($_GPC['status'] == 2)
        {
            $tpl = pdo_fetch("SELECT * FROM" . tablename('xcommunity_wechat_tplid') . "WHERE uniacid=:uniacid", array(':uniacid' => $_W['uniacid']));

            $template_id = $tpl['other_tplid'];
        
            $members = pdo_fetchall("SELECT openid FROM" . tablename('xcommunity_member') . "WHERE weid=:weid AND enable = 1 and regionid in({$_GPC['regionid']})", array(':weid' => $_W['weid']));
            foreach ($members as $key => $value)
            {
                $url = $_W['siteroot'] . "app/index.php?i={$_W['uniacid']}&c=entry&id={$id}&op=detail&do=announcement&m=xfeng_community";
                $openid = trim($value['openid']);
                $reason = htmlspecialchars_decode($_GPC['reason']);
                $content = str_replace(array('<br>', '&nbsp;'), array("\n", ' '), $reason);
                $content = strip_tags($content, '<a>');
                $data = array(
                    'first' => array(
                        'value' => '',
                    ),
                    'keyword1' => array(
                        'value' => $_GPC['title'],
                    ),
                    'keyword2' => array(
                        'value' => date('Y-m-d H:i', TIMESTAMP),
                    ),
                    'keyword3' => array(
                        'value' => $content,
                    ),
                    'remark' => array(
                        'value' => $_GPC['remark'],
                    )
                );
                $content = $this->sendtpl($openid, $url, $template_id, $data);
            }
        }
        message('提交成功', referer(), 'success');
    }
    include $this->template('web/announcement/add');
}
elseif ($op == 'delete')
{
    //删除公告
    pdo_delete("xcommunity_announcement", array('id' => $id));
    message('删除成功', referer(), 'success');
}
	
