<?php
/**
 * Created by 微小区.
 * User: 晓锋
 * Date: 16/6/11
 * Time: 下午8:13
 */
if(!pdo_fieldexists('xcommunity_region', 'uid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_region')." ADD `uid` int(11) ;");
}
if(!pdo_fieldexists('xcommunity_member_address', 'build')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_member_address')." ADD `build` varchar(50) ;");
}
if(!pdo_fieldexists('xcommunity_member_address', 'unit')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_member_address')." ADD `unit` int(10) ;");
}
if(!pdo_fieldexists('xcommunity_member_address', 'room')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_member_address')." ADD `room` varchar(50) ;");
}
if(!pdo_fieldexists('xcommunity_property', 'uid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_property')." ADD `uid` int(10) ;");
}
if(!pdo_fieldexists('xcommunity_users', 'uuid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." ADD `uuid` int(10) ;");
}
if(!pdo_fieldexists('xcommunity_users', 'uuid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." ADD `uuid` int(10) ;");
}
if(!pdo_fieldexists('xcommunity_report', 'dealing')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_report')." ADD `dealing` varchar(100) ;");
}
if(!pdo_fieldexists('xcommunity_cost', 'status')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_cost')." ADD `status` int(1) ;");
}
if(!pdo_fieldexists('xcommunity_order', 'companyid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_order')." ADD `companyid` int(11) ;");
}
if(!pdo_fieldexists('xcommunity_notice', 'cid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_notice')." modify column `cid` varchar(200) ;");
}
if(!pdo_fieldexists('xcommunity_building_device', 'device_code')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_building_device')." modify column `device_code` varchar(100) ;");
}
if(!pdo_fieldexists('xcommunity_report', 'grabimages')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_report')." ADD `grabimages` varchar(1000) ;");
}
if(!pdo_fieldexists('xcommunity_building_device', 'openurl')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_building_device')." ADD `openurl` varchar(1000) ;");
}
if(!pdo_fieldexists('xcommunity_pay_api', 'uid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_pay_api')." ADD `uid` int(11) ;");
}
if(!pdo_fieldexists('xcommunity_set', 'door_status')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_set')." ADD `door_status` int(11) ;");
}
if(!pdo_fieldexists('xcommunity_users', 'type')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." ADD `type` int(11) ;");
}
if(!pdo_fieldexists('xcommunity_users', 'regionid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." modify column `regionid` text ;");
}
if(!pdo_fieldexists('xcommunity_member', 'regionid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_member')." ADD `open_status` int(11)  ;");
}
if(!pdo_fieldexists('xcommunity_users', 'type')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." ADD `type` int(11)  ;");
}
if(!pdo_fieldexists('xcommunity_slide', 'uid')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_slide')." ADD `uid` int(11)  ;");
}
if(!pdo_fieldexists('xcommunity_users', 'province')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." ADD `province` varchar(100)  ;");
}
if(!pdo_fieldexists('xcommunity_users', 'city')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." ADD `city` varchar(100)  ;");
}
if(!pdo_fieldexists('xcommunity_users', 'dist')) {
    pdo_query("ALTER TABLE ".tablename('xcommunity_users')." ADD `dist` varchar(100)  ;");
}
$sql ="
    CREATE TABLE IF NOT EXISTS `ims_xcommunity_pay_api` (
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `uniacid` int(10) unsigned NOT NULL,
      `cid` int(10) unsigned NOT NULL,
      `pay` text NOT NULL,
      `type` int(1) NOT NULL COMMENT '',
      `paytype` int(1) NOT NULL COMMENT '',
      PRIMARY KEY (`id`)
    ) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 COMMENT='';
     CREATE TABLE IF NOT EXISTS `ims_xcommunity_setting` (
      `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
      `uniacid` int(11) NOT NULL,
      `regionid` int(11) NOT NULL,
      `value` text NOT NULL,
      `key` varchar(100) NOT NULL,
      PRIMARY KEY (`id`)
    ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT ='';
    
    ";
pdo_run($sql);