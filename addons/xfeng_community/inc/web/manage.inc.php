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
xqmenu();
//导入后台菜单数据
$do = $_GPC['do'] ;
$method = $_GPC['method'] ;
$this->xqdo($do,$method);