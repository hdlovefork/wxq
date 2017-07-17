<?php
/**
 * 微小区模块
 *
 * [晓锋] Copyright (c) 2013 qfinfo.cn
 */
/**
 * 微信端我的小区
 */
global $_W,$_GPC;
$member = $this->changemember();
$region = $this->mreg();
$region = pdo_fetch("SELECT r.* ,p.title as ptitle,p.content as pcontent FROM".tablename('xcommunity_region')."as r left join ".tablename('xcommunity_property')."as p on r.pid = p.id WHERE r.id=:id",array(':id' => $member['regionid']));
include $this->template($this->xqtpl('member/myregion'));
