# Host: localhost  (Version: 5.5.53)
# Date: 2017-07-17 10:42:02
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "ims_account"
#

DROP TABLE IF EXISTS `ims_account`;
CREATE TABLE `ims_account` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_account"
#

/*!40000 ALTER TABLE `ims_account` DISABLE KEYS */;
INSERT INTO `ims_account` VALUES (1,1,'uRr8qvQV',1,0,0),(2,2,'AFPG5FCz',1,1,1),(3,3,'AkAaONGO',1,1,0);
/*!40000 ALTER TABLE `ims_account` ENABLE KEYS */;

#
# Structure for table "ims_account_wechats"
#

DROP TABLE IF EXISTS `ims_account_wechats`;
CREATE TABLE `ims_account_wechats` (
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL,
  `access_token` varchar(1000) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `idx_key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_account_wechats"
#

/*!40000 ALTER TABLE `ims_account_wechats` DISABLE KEYS */;
INSERT INTO `ims_account_wechats` VALUES (1,1,'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP','',1,'we7team','','','','','','','','',0,'','',1,'','',''),(2,2,'L6KwP0E3f300l36Ekkd0eI39380zzdZl','Q87Q8LTtT9wK9N1xLLN4QQwbBlL3LbKNl5l4l7795k8',1,'智慧小区','','gh_ccb57526abba','','','','','','',0,'wx8704bda5641b6b3e','7c717337895fb9abb9259134237a5b1d',0,'','',''),(3,3,'DzFjgo1NNf1xun2sHbFuU1Uflffo11kF','d8OfXQFDVCWfDwqfqDcvccCiDYdfDOXsOwm8DCvix0y',4,'港龙科技','','','','','','','','',0,'wx3e3e8ef075a107fc','8b8a18720ad19270a245866d56fa22b7',0,'','','');
/*!40000 ALTER TABLE `ims_account_wechats` ENABLE KEYS */;

#
# Structure for table "ims_account_wxapp"
#

DROP TABLE IF EXISTS `ims_account_wxapp`;
CREATE TABLE `ims_account_wxapp` (
  `acid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(43) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`acid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_account_wxapp"
#

/*!40000 ALTER TABLE `ims_account_wxapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_account_wxapp` ENABLE KEYS */;

#
# Structure for table "ims_article_category"
#

DROP TABLE IF EXISTS `ims_article_category`;
CREATE TABLE `ims_article_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_article_category"
#

/*!40000 ALTER TABLE `ims_article_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_category` ENABLE KEYS */;

#
# Structure for table "ims_article_news"
#

DROP TABLE IF EXISTS `ims_article_news`;
CREATE TABLE `ims_article_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_article_news"
#

/*!40000 ALTER TABLE `ims_article_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_news` ENABLE KEYS */;

#
# Structure for table "ims_article_notice"
#

DROP TABLE IF EXISTS `ims_article_notice`;
CREATE TABLE `ims_article_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cateid` int(10) unsigned NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_show_home` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `cateid` (`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_article_notice"
#

/*!40000 ALTER TABLE `ims_article_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_notice` ENABLE KEYS */;

#
# Structure for table "ims_article_unread_notice"
#

DROP TABLE IF EXISTS `ims_article_unread_notice`;
CREATE TABLE `ims_article_unread_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `notice_id` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `is_new` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `notice_id` (`notice_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_article_unread_notice"
#

/*!40000 ALTER TABLE `ims_article_unread_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_article_unread_notice` ENABLE KEYS */;

#
# Structure for table "ims_basic_reply"
#

DROP TABLE IF EXISTS `ims_basic_reply`;
CREATE TABLE `ims_basic_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `content` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "ims_basic_reply"
#

/*!40000 ALTER TABLE `ims_basic_reply` DISABLE KEYS */;
INSERT INTO `ims_basic_reply` VALUES (2,11,'http://43721.com/app/./index.php?i=2&c=entry&eid=1');
/*!40000 ALTER TABLE `ims_basic_reply` ENABLE KEYS */;

#
# Structure for table "ims_business"
#

DROP TABLE IF EXISTS `ims_business`;
CREATE TABLE `ims_business` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lat_lng` (`lng`,`lat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_business"
#

/*!40000 ALTER TABLE `ims_business` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_business` ENABLE KEYS */;

#
# Structure for table "ims_core_attachment"
#

DROP TABLE IF EXISTS `ims_core_attachment`;
CREATE TABLE `ims_core_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_attachment"
#

/*!40000 ALTER TABLE `ims_core_attachment` DISABLE KEYS */;
INSERT INTO `ims_core_attachment` VALUES (1,3,1,'20140919_110541_509.jpg','images/3/2017/07/zoSo77di07O7O1MXkoLzW0YoH4Zo4l.jpg',1,1500017377),(2,3,1,'20100930094302_43977.jpg','images/3/2017/07/yfH2Ot7hrnr2ooOOnqHQOCYTCYCYtH.jpg',1,1500019263),(3,3,1,'d3ac858e0193702224209cae28d4584b.jpg','images/3/2017/07/ru72ffXjPQ17xF9io7fxxe19rTte9R.jpg',1,1500080234),(4,3,1,'d3ac858e0193702224209cae28d4584b.jpg','images/3/2017/07/lS7rZwXahBwpAlWllxABxTnbhPLnvt.jpg',1,1500080255),(5,3,1,'1.jpg','images/3/2017/07/ud3S077j972Usb97BUmpB89777p1oO.jpg',1,1500255917);
/*!40000 ALTER TABLE `ims_core_attachment` ENABLE KEYS */;

#
# Structure for table "ims_core_cache"
#

DROP TABLE IF EXISTS `ims_core_cache`;
CREATE TABLE `ims_core_cache` (
  `key` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_cache"
#

/*!40000 ALTER TABLE `ims_core_cache` DISABLE KEYS */;
INSERT INTO `ims_core_cache` VALUES ('accesstoken:3','a:2:{s:5:\"token\";s:138:\"vWx8Dsyh8PCRC7Yfc8y5MU9mgvAGL3WTOJc0GtP148K42NWFoo8a2pPqy4XsXSYFzJPpEHxhETZ1WOwI7sg2sgmdcGseC1tvcerZDQS9yjkiREl1qBtitBwl5ZDV3pc9EODfAJAZJY\";s:6:\"expire\";i:1500261153;}'),('defaultgroupid:3','s:1:\"3\";'),('jsticket:3','a:2:{s:6:\"ticket\";s:86:\"sM4AOVdWfPE4DxkXGEs8VCE0_POgOr6dslg9LM4aJ6HmNvajrht0MYRDhExFopRaJtcJGLtoeXQRfC4-euWOnQ\";s:6:\"expire\";i:1500262533;}'),('module_receive_enable','a:0:{}'),('setting','a:7:{s:9:\"copyright\";a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}s:8:\"authmode\";i:1;s:5:\"close\";a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}s:8:\"register\";a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}s:4:\"site\";s:0:\"\";s:7:\"cloudip\";a:2:{s:2:\"ip\";s:12:\"125.39.6.139\";s:6:\"expire\";i:1493207703;}s:10:\"community3\";a:1:{s:7:\"styleid\";s:6:\"style1\";}}'),('stat:todaylock:3','a:1:{s:6:\"expire\";i:1500261357;}'),('system_frame','a:4:{s:7:\"account\";a:5:{s:5:\"title\";s:9:\"公众号\";s:3:\"url\";s:29:\"./index.php?c=home&a=welcome&\";s:7:\"section\";a:4:{s:13:\"platform_plus\";a:2:{s:5:\"title\";s:12:\"增强功能\";s:4:\"menu\";a:6:{s:14:\"platform_reply\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"自动回复\";s:3:\"url\";s:31:\"./index.php?c=platform&a=reply&\";s:15:\"permission_name\";s:14:\"platform_reply\";s:4:\"icon\";s:11:\"wi wi-reply\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";a:3:{i:0;a:2:{s:5:\"title\";s:22:\"关键字自动回复 \";s:15:\"permission_name\";s:14:\"platform_reply\";}i:1;a:2:{s:5:\"title\";s:25:\"非关键字自动回复 \";s:15:\"permission_name\";s:22:\"platform_reply_special\";}i:2;a:2:{s:5:\"title\";s:19:\"欢迎/默认回复\";s:15:\"permission_name\";s:21:\"platform_reply_system\";}}}s:13:\"platform_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"自定义菜单\";s:3:\"url\";s:30:\"./index.php?c=platform&a=menu&\";s:15:\"permission_name\";s:13:\"platform_menu\";s:4:\"icon\";s:16:\"wi wi-custommenu\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"platform_qr\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:22:\"二维码/转化链接\";s:3:\"url\";s:28:\"./index.php?c=platform&a=qr&\";s:15:\"permission_name\";s:11:\"platform_qr\";s:4:\"icon\";s:12:\"wi wi-qrcode\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:9:\"二维码\";s:15:\"permission_name\";s:11:\"platform_qr\";}i:1;a:2:{s:5:\"title\";s:12:\"转化链接\";s:15:\"permission_name\";s:15:\"platform_url2qr\";}}}s:18:\"platform_mass_task\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"定时群发\";s:3:\"url\";s:30:\"./index.php?c=platform&a=mass&\";s:15:\"permission_name\";s:18:\"platform_mass_task\";s:4:\"icon\";s:13:\"wi wi-crontab\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"platform_material\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:16:\"素材/编辑器\";s:3:\"url\";s:34:\"./index.php?c=platform&a=material&\";s:15:\"permission_name\";s:17:\"platform_material\";s:4:\"icon\";s:12:\"wi wi-redact\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:13:\"platform_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"微官网\";s:3:\"url\";s:38:\"./index.php?c=site&a=multi&do=display&\";s:15:\"permission_name\";s:13:\"platform_site\";s:4:\"icon\";s:10:\"wi wi-home\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:13:\"添加/编辑\";s:15:\"permission_name\";s:18:\"platform_site_post\";}i:1;a:2:{s:5:\"title\";s:6:\"删除\";s:15:\"permission_name\";s:20:\"platform_site_delete\";}}}}}s:15:\"platform_module\";a:3:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:0:{}s:10:\"is_display\";b:1;}s:2:\"mc\";a:2:{s:5:\"title\";s:6:\"粉丝\";s:4:\"menu\";a:2:{s:7:\"mc_fans\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"粉丝管理\";s:3:\"url\";s:24:\"./index.php?c=mc&a=fans&\";s:15:\"permission_name\";s:7:\"mc_fans\";s:4:\"icon\";s:16:\"wi wi-fansmanage\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:9:\"mc_member\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"会员管理\";s:3:\"url\";s:26:\"./index.php?c=mc&a=member&\";s:15:\"permission_name\";s:9:\"mc_member\";s:4:\"icon\";s:10:\"wi wi-fans\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"profile\";a:2:{s:5:\"title\";s:6:\"配置\";s:4:\"menu\";a:1:{s:7:\"profile\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"参数配置\";s:3:\"url\";s:33:\"./index.php?c=profile&a=passport&\";s:15:\"permission_name\";s:15:\"profile_setting\";s:4:\"icon\";s:22:\"wi wi-parameter-stting\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;}s:5:\"wxapp\";a:5:{s:5:\"title\";s:9:\"小程序\";s:3:\"url\";s:38:\"./index.php?c=wxapp&a=display&do=home&\";s:7:\"section\";a:0:{}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;}s:6:\"system\";a:5:{s:5:\"title\";s:12:\"系统管理\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=1\";s:7:\"section\";a:8:{s:10:\"wxplatform\";a:2:{s:5:\"title\";s:6:\"微信\";s:4:\"menu\";a:3:{s:14:\"system_account\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:22:\" 微信公众号管理\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=1\";s:15:\"permission_name\";s:14:\"system_account\";s:4:\"icon\";s:12:\"wi wi-wechat\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:21:\"公众号管理设置\";s:15:\"permission_name\";s:21:\"system_account_manage\";}i:1;a:2:{s:5:\"title\";s:15:\"添加公众号\";s:15:\"permission_name\";s:19:\"system_account_post\";}i:2;a:2:{s:5:\"title\";s:15:\"公众号停用\";s:15:\"permission_name\";s:19:\"system_account_stop\";}i:3;a:2:{s:5:\"title\";s:18:\"公众号回收站\";s:15:\"permission_name\";s:22:\"system_account_recycle\";}i:4;a:2:{s:5:\"title\";s:15:\"公众号删除\";s:15:\"permission_name\";s:21:\"system_account_delete\";}i:5;a:2:{s:5:\"title\";s:15:\"公众号恢复\";s:15:\"permission_name\";s:22:\"system_account_recover\";}}}s:15:\"system_platform\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:25:\" 微信开放平台设置\";s:3:\"url\";s:32:\"./index.php?c=system&a=platform&\";s:15:\"permission_name\";s:15:\"system_platform\";s:4:\"icon\";s:20:\"wi wi-exploitsetting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:12:\"system_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:21:\"微信小程序管理\";s:3:\"url\";s:45:\"./index.php?c=account&a=manage&account_type=4\";s:15:\"permission_name\";s:12:\"system_wxapp\";s:4:\"icon\";s:19:\"wi wi-small-routine\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:6:\"module\";a:2:{s:5:\"title\";s:12:\"应用模块\";s:4:\"menu\";a:3:{s:13:\"system_module\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"我的应用管理\";s:3:\"url\";s:44:\"./index.php?c=system&a=module&account_type=1\";s:15:\"permission_name\";s:13:\"system_module\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_module_wxapp\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:21:\"小程序功能管理\";s:3:\"url\";s:44:\"./index.php?c=system&a=module&account_type=4\";s:15:\"permission_name\";s:19:\"system_module_wxapp\";s:4:\"icon\";s:16:\"wi wi-appsetting\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:15:\"system_template\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"我的模板管理\";s:3:\"url\";s:32:\"./index.php?c=system&a=template&\";s:15:\"permission_name\";s:15:\"system_template\";s:4:\"icon\";s:14:\"wi wi-template\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:4:\"user\";a:2:{s:5:\"title\";s:13:\"帐户/用户\";s:4:\"menu\";a:2:{s:9:\"system_my\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"我的帐户\";s:3:\"url\";s:29:\"./index.php?c=user&a=profile&\";s:15:\"permission_name\";s:9:\"system_my\";s:4:\"icon\";s:13:\"wi wi-account\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:11:\"system_user\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"用户管理\";s:3:\"url\";s:29:\"./index.php?c=user&a=display&\";s:15:\"permission_name\";s:11:\"system_user\";s:4:\"icon\";s:10:\"wi wi-user\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:6:{i:0;a:2:{s:5:\"title\";s:12:\"编辑用户\";s:15:\"permission_name\";s:16:\"system_user_post\";}i:1;a:2:{s:5:\"title\";s:12:\"审核用户\";s:15:\"permission_name\";s:17:\"system_user_check\";}i:2;a:2:{s:5:\"title\";s:15:\"用户回收站\";s:15:\"permission_name\";s:19:\"system_user_recycle\";}i:3;a:2:{s:5:\"title\";s:18:\"用户属性设置\";s:15:\"permission_name\";s:18:\"system_user_fields\";}i:4;a:2:{s:5:\"title\";s:31:\"用户属性设置-编辑字段\";s:15:\"permission_name\";s:23:\"system_user_fields_post\";}i:5;a:2:{s:5:\"title\";s:18:\"用户注册设置\";s:15:\"permission_name\";s:23:\"system_user_registerset\";}}}}}s:10:\"permission\";a:2:{s:5:\"title\";s:12:\"权限管理\";s:4:\"menu\";a:2:{s:19:\"system_module_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"功能权限组\";s:3:\"url\";s:36:\"./index.php?c=system&a=module-group&\";s:15:\"permission_name\";s:19:\"system_module_group\";s:4:\"icon\";s:21:\"wi wi-appjurisdiction\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:17:\"system_user_group\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"用户权限组\";s:3:\"url\";s:27:\"./index.php?c=user&a=group&\";s:15:\"permission_name\";s:17:\"system_user_group\";s:4:\"icon\";s:22:\"wi wi-userjurisdiction\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";a:2:{i:0;a:2:{s:5:\"title\";s:15:\"编辑用户组\";s:15:\"permission_name\";s:22:\"system_user_group_post\";}i:1;a:2:{s:5:\"title\";s:15:\"删除用户组\";s:15:\"permission_name\";s:21:\"system_user_group_del\";}}}}}s:5:\"cloud\";a:2:{s:5:\"title\";s:9:\"云服务\";s:4:\"menu\";a:4:{s:14:\"system_profile\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统更新\";s:3:\"url\";s:30:\"./index.php?c=cloud&a=upgrade&\";s:15:\"permission_name\";s:20:\"system_cloud_upgrade\";s:4:\"icon\";s:12:\"wi wi-update\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_cloud_register\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"注册站点\";s:3:\"url\";s:30:\"./index.php?c=cloud&a=profile&\";s:15:\"permission_name\";s:21:\"system_cloud_register\";s:4:\"icon\";s:18:\"wi wi-registersite\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_cloud_diagnose\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"云服务诊断\";s:3:\"url\";s:31:\"./index.php?c=cloud&a=diagnose&\";s:15:\"permission_name\";s:21:\"system_cloud_diagnose\";s:4:\"icon\";s:14:\"wi wi-diagnose\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:16:\"system_cloud_sms\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"短信管理\";s:3:\"url\";s:26:\"./index.php?c=cloud&a=sms&\";s:15:\"permission_name\";s:16:\"system_cloud_sms\";s:4:\"icon\";s:13:\"wi wi-message\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"acticle\";a:2:{s:5:\"title\";s:13:\"文章/公告\";s:4:\"menu\";a:2:{s:14:\"system_article\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"文章管理\";s:3:\"url\";s:29:\"./index.php?c=article&a=news&\";s:15:\"permission_name\";s:19:\"system_article_news\";s:4:\"icon\";s:13:\"wi wi-article\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:21:\"system_article_notice\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"公告管理\";s:3:\"url\";s:31:\"./index.php?c=article&a=notice&\";s:15:\"permission_name\";s:21:\"system_article_notice\";s:4:\"icon\";s:12:\"wi wi-notice\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"setting\";a:2:{s:5:\"title\";s:6:\"设置\";s:4:\"menu\";a:6:{s:26:\"system_setting_updatecache\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"更新缓存\";s:3:\"url\";s:35:\"./index.php?c=system&a=updatecache&\";s:15:\"permission_name\";s:26:\"system_setting_updatecache\";s:4:\"icon\";s:11:\"wi wi-cache\";s:12:\"displayorder\";i:6;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_site\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"站点设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=site&\";s:15:\"permission_name\";s:19:\"system_setting_site\";s:4:\"icon\";s:18:\"wi wi-site-setting\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_menu\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"菜单设置\";s:3:\"url\";s:28:\"./index.php?c=system&a=menu&\";s:15:\"permission_name\";s:19:\"system_setting_menu\";s:4:\"icon\";s:18:\"wi wi-menu-setting\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_attachment\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"附件设置\";s:3:\"url\";s:34:\"./index.php?c=system&a=attachment&\";s:15:\"permission_name\";s:25:\"system_setting_attachment\";s:4:\"icon\";s:16:\"wi wi-attachment\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:25:\"system_setting_systeminfo\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"系统信息\";s:3:\"url\";s:34:\"./index.php?c=system&a=systeminfo&\";s:15:\"permission_name\";s:25:\"system_setting_systeminfo\";s:4:\"icon\";s:17:\"wi wi-system-info\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_setting_logs\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"查看日志\";s:3:\"url\";s:28:\"./index.php?c=system&a=logs&\";s:15:\"permission_name\";s:19:\"system_setting_logs\";s:4:\"icon\";s:9:\"wi wi-log\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}s:7:\"utility\";a:2:{s:5:\"title\";s:18:\"常用系统工具\";s:4:\"menu\";a:5:{s:24:\"system_utility_filecheck\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:18:\"系统文件校验\";s:3:\"url\";s:33:\"./index.php?c=system&a=filecheck&\";s:15:\"permission_name\";s:24:\"system_utility_filecheck\";s:4:\"icon\";s:10:\"wi wi-file\";s:12:\"displayorder\";i:5;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_optimize\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"性能优化\";s:3:\"url\";s:32:\"./index.php?c=system&a=optimize&\";s:15:\"permission_name\";s:23:\"system_utility_optimize\";s:4:\"icon\";s:14:\"wi wi-optimize\";s:12:\"displayorder\";i:4;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:23:\"system_utility_database\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:9:\"数据库\";s:3:\"url\";s:32:\"./index.php?c=system&a=database&\";s:15:\"permission_name\";s:23:\"system_utility_database\";s:4:\"icon\";s:9:\"wi wi-sql\";s:12:\"displayorder\";i:3;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:19:\"system_utility_scan\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:12:\"木马查杀\";s:3:\"url\";s:28:\"./index.php?c=system&a=scan&\";s:15:\"permission_name\";s:19:\"system_utility_scan\";s:4:\"icon\";s:12:\"wi wi-safety\";s:12:\"displayorder\";i:2;s:2:\"id\";N;s:14:\"sub_permission\";N;}s:18:\"system_utility_bom\";a:9:{s:9:\"is_system\";i:1;s:10:\"is_display\";i:1;s:5:\"title\";s:15:\"检测文件BOM\";s:3:\"url\";s:27:\"./index.php?c=system&a=bom&\";s:15:\"permission_name\";s:18:\"system_utility_bom\";s:4:\"icon\";s:9:\"wi wi-bom\";s:12:\"displayorder\";i:1;s:2:\"id\";N;s:14:\"sub_permission\";N;}}}}s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;}s:9:\"appmarket\";a:7:{s:5:\"title\";s:12:\"应用市场\";s:3:\"url\";s:19:\"http://bbs.rocrm.cn\";s:7:\"section\";a:0:{}s:5:\"blank\";b:1;s:7:\"founder\";b:1;s:9:\"is_system\";b:1;s:10:\"is_display\";b:1;}}'),('uniaccount:','a:6:{s:3:\"uid\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:6:\"groups\";a:0:{}s:10:\"grouplevel\";b:0;s:9:\"isconnect\";b:0;}'),('uniaccount:0','a:6:{s:3:\"uid\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:6:\"groups\";a:0:{}s:10:\"grouplevel\";b:0;s:9:\"isconnect\";b:0;}'),('uniaccount:3','a:28:{s:4:\"acid\";s:1:\"3\";s:7:\"uniacid\";s:1:\"3\";s:5:\"token\";s:32:\"DzFjgo1NNf1xun2sHbFuU1Uflffo11kF\";s:14:\"encodingaeskey\";s:43:\"d8OfXQFDVCWfDwqfqDcvccCiDYdfDOXsOwm8DCvix0y\";s:5:\"level\";s:1:\"4\";s:4:\"name\";s:12:\"港龙科技\";s:7:\"account\";s:0:\"\";s:8:\"original\";s:0:\"\";s:9:\"signature\";s:0:\"\";s:7:\"country\";s:0:\"\";s:8:\"province\";s:0:\"\";s:4:\"city\";s:0:\"\";s:8:\"username\";s:0:\"\";s:8:\"password\";s:0:\"\";s:10:\"lastupdate\";s:1:\"0\";s:3:\"key\";s:18:\"wx3e3e8ef075a107fc\";s:6:\"secret\";s:32:\"8b8a18720ad19270a245866d56fa22b7\";s:7:\"styleid\";s:1:\"0\";s:12:\"subscribeurl\";s:0:\"\";s:18:\"auth_refresh_token\";s:0:\"\";s:12:\"access_token\";s:0:\"\";s:4:\"type\";s:1:\"1\";s:9:\"isconnect\";s:1:\"1\";s:3:\"uid\";N;s:9:\"starttime\";N;s:7:\"endtime\";N;s:6:\"groups\";a:1:{i:3;a:5:{s:7:\"groupid\";s:1:\"3\";s:7:\"uniacid\";s:1:\"3\";s:5:\"title\";s:15:\"默认会员组\";s:6:\"credit\";s:1:\"0\";s:9:\"isdefault\";s:1:\"1\";}}s:10:\"grouplevel\";s:1:\"0\";}'),('unicount:3','s:1:\"1\";'),('unimodules:3:','a:13:{s:6:\"wxcard\";a:24:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/wxcard/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"chats\";a:24:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/chats/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"voice\";a:24:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/voice/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"video\";a:24:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/video/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:6:\"images\";a:24:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/images/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:6:\"custom\";a:24:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/custom/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:8:\"recharge\";a:24:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:54:\"http://43721.com/addons/recharge/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:7:\"userapi\";a:24:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:53:\"http://43721.com/addons/userapi/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"music\";a:24:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/music/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:4:\"news\";a:24:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:50:\"http://43721.com/addons/news/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"basic\";a:24:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/basic/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:15:\"xfeng_community\";a:24:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:15:\"xfeng_community\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:9:\"微小区\";s:7:\"version\";s:3:\"2.0\";s:7:\"ability\";s:9:\"微小区\";s:6:\"author\";s:6:\"晓锋\";s:3:\"url\";s:12:\"njxiaoqu.com\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:1:\"W\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:61:\"http://43721.com/addons/xfeng_community/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('unimodules:3:1','a:13:{s:6:\"wxcard\";a:24:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/wxcard/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"chats\";a:24:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/chats/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"voice\";a:24:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/voice/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"video\";a:24:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/video/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:6:\"images\";a:24:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/images/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:6:\"custom\";a:24:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/custom/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:8:\"recharge\";a:24:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:54:\"http://43721.com/addons/recharge/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:7:\"userapi\";a:24:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:53:\"http://43721.com/addons/userapi/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"music\";a:24:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/music/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:4:\"news\";a:24:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:50:\"http://43721.com/addons/news/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"basic\";a:24:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/basic/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:15:\"xfeng_community\";a:24:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:15:\"xfeng_community\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:9:\"微小区\";s:7:\"version\";s:3:\"2.0\";s:7:\"ability\";s:9:\"微小区\";s:6:\"author\";s:6:\"晓锋\";s:3:\"url\";s:12:\"njxiaoqu.com\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:1:\"W\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";s:1:\"1\";s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:61:\"http://43721.com/addons/xfeng_community/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('unimodules::','a:13:{s:6:\"wxcard\";a:24:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/wxcard/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:5:\"chats\";a:24:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/chats/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:5:\"voice\";a:24:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/voice/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:5:\"video\";a:24:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/video/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:6:\"images\";a:24:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/images/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:6:\"custom\";a:24:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/custom/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:8:\"recharge\";a:24:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:54:\"http://43721.com/addons/recharge/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:7:\"userapi\";a:24:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:53:\"http://43721.com/addons/userapi/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:5:\"music\";a:24:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/music/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:4:\"news\";a:24:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:50:\"http://43721.com/addons/news/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:5:\"basic\";a:24:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/basic/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:15:\"xfeng_community\";a:24:{s:3:\"mid\";s:2:\"12\";s:4:\"name\";s:15:\"xfeng_community\";s:4:\"type\";s:8:\"business\";s:5:\"title\";s:9:\"微小区\";s:7:\"version\";s:3:\"2.0\";s:7:\"ability\";s:9:\"微小区\";s:6:\"author\";s:6:\"晓锋\";s:3:\"url\";s:12:\"njxiaoqu.com\";s:8:\"settings\";s:1:\"1\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:1:{i:0;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"0\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:2:\"N;\";s:13:\"title_initial\";s:1:\"W\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:61:\"http://43721.com/addons/xfeng_community/icon.jpg?v=1500088444\";s:11:\"main_module\";s:0:\"\";}s:4:\"core\";a:5:{s:5:\"title\";s:24:\"系统事件处理模块\";s:4:\"name\";s:4:\"core\";s:8:\"issystem\";i:1;s:7:\"enabled\";i:1;s:9:\"isdisplay\";i:0;}}'),('unisetting:0','b:0;'),('unisetting:1','a:23:{s:7:\"uniacid\";s:1:\"1\";s:8:\"passport\";a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}s:5:\"oauth\";a:2:{s:6:\"status\";s:1:\"0\";s:7:\"account\";s:1:\"0\";}s:11:\"jsauth_acid\";s:1:\"0\";s:2:\"uc\";a:1:{s:6:\"status\";i:0;}s:6:\"notify\";a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}s:11:\"creditnames\";a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";s:0:\"\";s:7:\"payment\";a:4:{s:6:\"credit\";a:1:{s:6:\"switch\";b:0;}s:6:\"alipay\";a:4:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";}s:6:\"wechat\";a:5:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";}s:8:\"delivery\";a:1:{s:6:\"switch\";b:0;}}s:4:\"stat\";s:0:\"\";s:12:\"default_site\";s:1:\"1\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";s:9:\"shortcuts\";s:0:\"\";}'),('unisetting:3','a:23:{s:7:\"uniacid\";s:1:\"3\";s:8:\"passport\";s:0:\"\";s:5:\"oauth\";s:0:\"\";s:11:\"jsauth_acid\";s:1:\"0\";s:2:\"uc\";s:0:\"\";s:6:\"notify\";s:0:\"\";s:11:\"creditnames\";a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}s:15:\"creditbehaviors\";a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}s:7:\"welcome\";s:0:\"\";s:7:\"default\";s:0:\"\";s:15:\"default_message\";s:0:\"\";s:7:\"payment\";s:0:\"\";s:4:\"stat\";s:0:\"\";s:12:\"default_site\";s:1:\"3\";s:4:\"sync\";s:1:\"0\";s:8:\"recharge\";s:0:\"\";s:9:\"tplnotice\";s:0:\"\";s:10:\"grouplevel\";s:1:\"0\";s:8:\"mcplugin\";s:0:\"\";s:15:\"exchange_enable\";s:1:\"0\";s:11:\"coupon_type\";s:1:\"0\";s:7:\"menuset\";s:0:\"\";s:9:\"shortcuts\";s:0:\"\";}'),('userbasefields','a:44:{s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";s:6:\"mobile\";s:12:\"手机号码\";s:5:\"email\";s:12:\"电子邮箱\";s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"gender\";s:6:\"性别\";s:5:\"birth\";s:6:\"生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:6:\"地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:6:\"reside\";s:9:\"居住地\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";}'),('usersfields','a:45:{s:8:\"realname\";s:12:\"真实姓名\";s:8:\"nickname\";s:6:\"昵称\";s:6:\"avatar\";s:6:\"头像\";s:2:\"qq\";s:5:\"QQ号\";s:6:\"mobile\";s:12:\"手机号码\";s:3:\"vip\";s:9:\"VIP级别\";s:6:\"gender\";s:6:\"性别\";s:9:\"birthyear\";s:12:\"出生生日\";s:13:\"constellation\";s:6:\"星座\";s:6:\"zodiac\";s:6:\"生肖\";s:9:\"telephone\";s:12:\"固定电话\";s:6:\"idcard\";s:12:\"证件号码\";s:9:\"studentid\";s:6:\"学号\";s:5:\"grade\";s:6:\"班级\";s:7:\"address\";s:12:\"邮寄地址\";s:7:\"zipcode\";s:6:\"邮编\";s:11:\"nationality\";s:6:\"国籍\";s:14:\"resideprovince\";s:12:\"居住地址\";s:14:\"graduateschool\";s:12:\"毕业学校\";s:7:\"company\";s:6:\"公司\";s:9:\"education\";s:6:\"学历\";s:10:\"occupation\";s:6:\"职业\";s:8:\"position\";s:6:\"职位\";s:7:\"revenue\";s:9:\"年收入\";s:15:\"affectivestatus\";s:12:\"情感状态\";s:10:\"lookingfor\";s:13:\" 交友目的\";s:9:\"bloodtype\";s:6:\"血型\";s:6:\"height\";s:6:\"身高\";s:6:\"weight\";s:6:\"体重\";s:6:\"alipay\";s:15:\"支付宝帐号\";s:3:\"msn\";s:3:\"MSN\";s:5:\"email\";s:12:\"电子邮箱\";s:6:\"taobao\";s:12:\"阿里旺旺\";s:4:\"site\";s:6:\"主页\";s:3:\"bio\";s:12:\"自我介绍\";s:8:\"interest\";s:12:\"兴趣爱好\";s:7:\"uniacid\";s:17:\"同一公众号id\";s:7:\"groupid\";s:8:\"分组id\";s:7:\"credit1\";s:6:\"积分\";s:7:\"credit2\";s:6:\"余额\";s:7:\"credit3\";s:19:\"预留积分类型3\";s:7:\"credit4\";s:19:\"预留积分类型4\";s:7:\"credit5\";s:19:\"预留积分类型5\";s:7:\"credit6\";s:19:\"预留积分类型6\";s:10:\"createtime\";s:12:\"加入时间\";}'),('we7:admin:lastaccount','a:1:{s:7:\"account\";i:3;}'),('we7:hyhy:lastaccount','a:1:{s:7:\"account\";i:3;}'),('we7:memberinfo:1','a:6:{s:3:\"uid\";s:1:\"1\";s:6:\"mobile\";s:11:\"13807324757\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:8:\"realname\";s:6:\"李浪\";s:7:\"address\";s:17:\"1栋1单元101室\";}'),('we7:memberinfo:15273279515','b:0;'),('we7:memberinfo:2','a:52:{s:3:\"uid\";s:1:\"2\";s:7:\"uniacid\";s:1:\"3\";s:6:\"mobile\";s:11:\"15273279515\";s:5:\"email\";s:39:\"f45c2527c48e316999cbf70f9f734fd7@we7.cc\";s:8:\"password\";s:32:\"ce1405d0ded6102cbc457d14b0b9a8bb\";s:4:\"salt\";s:8:\"mJmCHhCc\";s:7:\"groupid\";s:1:\"3\";s:7:\"credit1\";d:0;s:7:\"credit2\";d:0;s:7:\"credit3\";d:0;s:7:\"credit4\";d:0;s:7:\"credit5\";d:0;s:7:\"credit6\";d:0;s:10:\"createtime\";s:10:\"1499910887\";s:8:\"realname\";s:6:\"黄鼎\";s:8:\"nickname\";s:0:\"\";s:6:\"avatar\";s:0:\"\";s:2:\"qq\";s:0:\"\";s:3:\"vip\";s:1:\"0\";s:6:\"gender\";s:1:\"0\";s:9:\"birthyear\";s:1:\"0\";s:10:\"birthmonth\";s:1:\"0\";s:8:\"birthday\";s:1:\"0\";s:13:\"constellation\";s:0:\"\";s:6:\"zodiac\";s:0:\"\";s:9:\"telephone\";s:0:\"\";s:6:\"idcard\";s:0:\"\";s:9:\"studentid\";s:0:\"\";s:5:\"grade\";s:0:\"\";s:7:\"address\";s:17:\"1栋1单元101室\";s:7:\"zipcode\";s:0:\"\";s:11:\"nationality\";s:0:\"\";s:14:\"resideprovince\";s:0:\"\";s:10:\"residecity\";s:0:\"\";s:10:\"residedist\";s:0:\"\";s:14:\"graduateschool\";s:0:\"\";s:7:\"company\";s:0:\"\";s:9:\"education\";s:0:\"\";s:10:\"occupation\";s:0:\"\";s:8:\"position\";s:0:\"\";s:7:\"revenue\";s:0:\"\";s:15:\"affectivestatus\";s:0:\"\";s:10:\"lookingfor\";s:0:\"\";s:9:\"bloodtype\";s:0:\"\";s:6:\"height\";s:0:\"\";s:6:\"weight\";s:0:\"\";s:6:\"alipay\";s:0:\"\";s:3:\"msn\";s:0:\"\";s:6:\"taobao\";s:0:\"\";s:4:\"site\";s:0:\"\";s:3:\"bio\";s:0:\"\";s:8:\"interest\";s:0:\"\";}'),('we7:memberinfo:4','a:6:{s:3:\"uid\";s:1:\"4\";s:8:\"realname\";s:0:\"\";s:8:\"nickname\";s:10:\"&范志锋\";s:6:\"mobile\";s:0:\"\";s:5:\"email\";s:39:\"3c10039cd60fb5951049a9f820574ce2@we7.cc\";s:6:\"avatar\";s:132:\"http://wx.qlogo.cn/mmopen/Vzot98z4hUYY6PVB8jD1saicG0ibFVWZEJFukDEPb4ibbKs9yuN9oZ4CcGuAx97yOiaMWHbcQib3rj3aczPaKQJjybM6Jcu2ib1CJb/132\";}'),('we7:memberinfo:5','a:4:{s:3:\"uid\";s:1:\"5\";s:6:\"mobile\";s:11:\"18670203555\";s:7:\"address\";s:17:\"1栋1单元101室\";s:8:\"realname\";s:9:\"倪能武\";}'),('we7:uid:oNWF5uACpuRWOwWuw3a3MJhQl5K0','s:1:\"2\";'),('we7:uid:oNWF5uCX8zNzKmmBJ6RE_l29Anxo','s:1:\"5\";'),('we7:uid:oNWF5uEH9p47bi_X1sLpv7H9beQo','s:1:\"4\";'),('we7:uid:oNWF5uLKdsg4sJUZof5EYsKPsC2U','s:1:\"1\";'),('we7:user_modules:','a:11:{s:5:\"basic\";a:24:{s:3:\"mid\";s:1:\"1\";s:4:\"name\";s:5:\"basic\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本文字回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"和您进行简单对话\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/basic/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:4:\"news\";a:24:{s:3:\"mid\";s:1:\"2\";s:4:\"name\";s:4:\"news\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"基本混合图文回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:33:\"为你提供生动的图文资讯\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:50:\"http://43721.com/addons/news/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"music\";a:24:{s:3:\"mid\";s:1:\"3\";s:4:\"name\";s:5:\"music\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本音乐回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:39:\"提供语音、音乐等音频类回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/music/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:7:\"userapi\";a:24:{s:3:\"mid\";s:1:\"4\";s:4:\"name\";s:7:\"userapi\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:21:\"自定义接口回复\";s:7:\"version\";s:3:\"1.1\";s:7:\"ability\";s:33:\"更方便的第三方接口设置\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:53:\"http://43721.com/addons/userapi/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:8:\"recharge\";a:24:{s:3:\"mid\";s:1:\"5\";s:4:\"name\";s:8:\"recharge\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:24:\"会员中心充值模块\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:24:\"提供会员充值功能\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:54:\"http://43721.com/addons/recharge/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:6:\"custom\";a:24:{s:3:\"mid\";s:1:\"6\";s:4:\"name\";s:6:\"custom\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:15:\"多客服转接\";s:7:\"version\";s:5:\"1.0.0\";s:7:\"ability\";s:36:\"用来接入腾讯的多客服系统\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:17:\"http://bbs.we7.cc\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";a:0:{}s:7:\"handles\";a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/custom/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:6:\"images\";a:24:{s:3:\"mid\";s:1:\"7\";s:4:\"name\";s:6:\"images\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本图片回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/images/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"video\";a:24:{s:3:\"mid\";s:1:\"8\";s:4:\"name\";s:5:\"video\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本视频回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供图片回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/video/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"voice\";a:24:{s:3:\"mid\";s:1:\"9\";s:4:\"name\";s:5:\"voice\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"基本语音回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"提供语音回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/voice/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:5:\"chats\";a:24:{s:3:\"mid\";s:2:\"10\";s:4:\"name\";s:5:\"chats\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"发送客服消息\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:77:\"公众号可以在粉丝最后发送消息的48小时内无限制发送消息\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"0\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:51:\"http://43721.com/addons/chats/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}s:6:\"wxcard\";a:24:{s:3:\"mid\";s:2:\"11\";s:4:\"name\";s:6:\"wxcard\";s:4:\"type\";s:6:\"system\";s:5:\"title\";s:18:\"微信卡券回复\";s:7:\"version\";s:3:\"1.0\";s:7:\"ability\";s:18:\"微信卡券回复\";s:6:\"author\";s:13:\"WeEngine Team\";s:3:\"url\";s:18:\"http://www.we7.cc/\";s:8:\"settings\";s:1:\"0\";s:10:\"subscribes\";s:0:\"\";s:7:\"handles\";s:0:\"\";s:12:\"isrulefields\";s:1:\"1\";s:8:\"issystem\";s:1:\"1\";s:6:\"target\";s:1:\"0\";s:6:\"iscard\";s:1:\"0\";s:11:\"permissions\";s:0:\"\";s:13:\"title_initial\";s:0:\"\";s:13:\"wxapp_support\";s:1:\"1\";s:11:\"app_support\";s:1:\"2\";s:7:\"enabled\";i:1;s:6:\"config\";a:0:{}s:9:\"isdisplay\";i:1;s:4:\"logo\";s:52:\"http://43721.com/addons/wxcard/icon.jpg?v=1500088394\";s:11:\"main_module\";s:0:\"\";}}');
/*!40000 ALTER TABLE `ims_core_cache` ENABLE KEYS */;

#
# Structure for table "ims_core_cron"
#

DROP TABLE IF EXISTS `ims_core_cron`;
CREATE TABLE `ims_core_cron` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cloudid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) unsigned NOT NULL,
  `nextruntime` int(10) unsigned NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `createtime` (`createtime`),
  KEY `nextruntime` (`nextruntime`),
  KEY `uniacid` (`uniacid`),
  KEY `cloudid` (`cloudid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_cron"
#

/*!40000 ALTER TABLE `ims_core_cron` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_cron` ENABLE KEYS */;

#
# Structure for table "ims_core_cron_record"
#

DROP TABLE IF EXISTS `ims_core_cron_record`;
CREATE TABLE `ims_core_cron_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) unsigned NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `tid` (`tid`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_cron_record"
#

/*!40000 ALTER TABLE `ims_core_cron_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_cron_record` ENABLE KEYS */;

#
# Structure for table "ims_core_menu"
#

DROP TABLE IF EXISTS `ims_core_menu`;
CREATE TABLE `ims_core_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) unsigned NOT NULL,
  `is_system` tinyint(3) unsigned NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_menu"
#

/*!40000 ALTER TABLE `ims_core_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_menu` ENABLE KEYS */;

#
# Structure for table "ims_core_paylog"
#

DROP TABLE IF EXISTS `ims_core_paylog`;
CREATE TABLE `ims_core_paylog` (
  `plid` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) unsigned NOT NULL,
  `card_type` tinyint(3) unsigned NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) unsigned NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  PRIMARY KEY (`plid`),
  KEY `idx_openid` (`openid`),
  KEY `idx_tid` (`tid`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `uniontid` (`uniontid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_paylog"
#

/*!40000 ALTER TABLE `ims_core_paylog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_paylog` ENABLE KEYS */;

#
# Structure for table "ims_core_performance"
#

DROP TABLE IF EXISTS `ims_core_performance`;
CREATE TABLE `ims_core_performance` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_performance"
#

/*!40000 ALTER TABLE `ims_core_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_performance` ENABLE KEYS */;

#
# Structure for table "ims_core_queue"
#

DROP TABLE IF EXISTS `ims_core_queue`;
CREATE TABLE `ims_core_queue` (
  `qid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`qid`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `module` (`module`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_queue"
#

/*!40000 ALTER TABLE `ims_core_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_queue` ENABLE KEYS */;

#
# Structure for table "ims_core_resource"
#

DROP TABLE IF EXISTS `ims_core_resource`;
CREATE TABLE `ims_core_resource` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `acid` (`uniacid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_resource"
#

/*!40000 ALTER TABLE `ims_core_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_resource` ENABLE KEYS */;

#
# Structure for table "ims_core_sendsms_log"
#

DROP TABLE IF EXISTS `ims_core_sendsms_log`;
CREATE TABLE `ims_core_sendsms_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_sendsms_log"
#

/*!40000 ALTER TABLE `ims_core_sendsms_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_core_sendsms_log` ENABLE KEYS */;

#
# Structure for table "ims_core_sessions"
#

DROP TABLE IF EXISTS `ims_core_sessions`;
CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_sessions"
#

/*!40000 ALTER TABLE `ims_core_sessions` DISABLE KEYS */;
INSERT INTO `ims_core_sessions` VALUES ('03fd679a9c667ff58cd3c3e6c41783e2',3,'101.226.65.108','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"ul6H\";i:1500180768;s:4:\"HCS5\";i:1500180768;}',1500184368),('05f63fc4a48ebc8fe0b6a14a810d2f66',3,'101.226.66.174','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"DerS\";i:1500180820;}dest_url|s:106:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dmy%26do%3Drepair%26m%3Dxfeng_community\";',1500184420),('09fba0b0130291fbd531fcabf045dadc',3,'61.151.226.16','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"Cah1\";i:1500180752;s:4:\"uD0m\";i:1500180753;}',1500184353),('0cb3a807e236c68abec1999bd71a8775',3,'101.226.66.181','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"H544\";i:1500180795;s:4:\"NWcO\";i:1500180799;}',1500184399),('0e2a85833ef84ce9f5f93abb22262499',3,'101.226.33.237','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"KF20\";i:1500180748;}dest_url|s:96:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Drepair%26m%3Dxfeng_community\";',1500184348),('11a117355960f5f4f85b3edc233a3dd5',3,'61.151.218.118','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"QvPK\";i:1500180831;}dest_url|s:94:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dhome%26m%3Dxfeng_community\";',1500184431),('121ff303793ec3c48b748f0e15a09fc4',3,'101.226.33.200','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"w37D\";i:1500257433;}dest_url|s:108:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dlist%26do%3Drepair%26m%3Dxfeng_community\";',1500261033),('170f6ee8db2e6d44728ba5c124db6a3c',3,'101.226.66.172','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"q3U7\";i:1500180793;}dest_url|s:96:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dmember%26m%3Dxfeng_community\";',1500184393),('1d28da69a4a2a3aa2020681d16d4d0a0',3,'101.226.33.204','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"qHf1\";i:1500256402;s:4:\"E90B\";i:1500256403;}',1500260003),('2036c40da38c43c2130dd5c1d71f5160',3,'101.226.33.240','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"GyxT\";i:1500105243;}dest_url|s:116:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dg%26id%3D274%26do%3Drepair%26m%3Dxfeng_community\";',1500108843),('2c495b30b2bcc4a1c210288994fe13b5',3,'110.53.132.231','acid|s:1:\"3\";uniacid|i:3;token|a:3:{s:4:\"XXY8\";i:1500256428;s:4:\"e3f3\";i:1500256429;s:4:\"KBCb\";i:1500256430;}dest_url|s:130:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1%26code%3D051ykL372mraHL00hYZ62nC6472ykL3j%26state%3Dwe7sid-\";oauth_openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";oauth_acid|s:1:\"3\";openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";uid|s:1:\"1\";',1500260030),('2e8fc2bfc24de9dd96c967ebadc45669',3,'110.53.132.231','acid|s:1:\"3\";uniacid|i:3;token|a:6:{s:4:\"k7v1\";i:1500103191;s:4:\"vB3j\";i:1500103191;s:4:\"dFVQ\";i:1500103193;s:4:\"b34j\";i:1500103224;s:4:\"UF4f\";i:1500103276;s:4:\"bpnE\";i:1500103276;}dest_url|s:108:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dlist%26do%3Drepair%26m%3Dxfeng_community\";oauth_openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";oauth_acid|s:1:\"3\";openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";uid|s:1:\"1\";',1500106876),('38cf13cba3f9e85808cd30075c55dddd',3,'101.226.125.16','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"SR08\";i:1500103993;}dest_url|s:116:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dg%26id%3D274%26do%3Drepair%26m%3Dxfeng_community\";',1500107593),('3c77d33b33f1bde74886093d1d2ac7d6',3,'110.53.132.231','acid|s:1:\"3\";uniacid|i:3;token|a:6:{s:4:\"o65q\";i:1500258818;s:4:\"Qt9T\";i:1500258823;s:4:\"SJ80\";i:1500258859;s:4:\"TWnX\";i:1500258862;s:4:\"di13\";i:1500258929;s:4:\"Wafe\";i:1500258935;}dest_url|s:101:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1%26XDEBUG_SESSION_START%3D16459\";oauth_openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";oauth_acid|s:1:\"3\";openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";uid|s:1:\"1\";',1500262535),('3cb948ef262b4f56d51432475c3e8a6d',3,'101.226.33.240','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"s0lS\";i:1500257492;}dest_url|s:70:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1\";',1500261092),('4ceb0f2afb8d31be8f45bcb3d01ef812',3,'180.163.2.117','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"SXi2\";i:1500256095;}dest_url|s:116:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dg%26id%3D274%26do%3Drepair%26m%3Dxfeng_community\";',1500259695),('511f4b4c57310c8e3edcce94b2d94653',3,'101.226.68.161','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"mSf0\";i:1500256681;}dest_url|s:107:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dadd%26do%3Drepair%26m%3Dxfeng_community\";',1500260281),('54fe1542cdc7560944cb27bc947648a1',3,'61.151.226.16','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"lGEs\";i:1500103330;}dest_url|s:119:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dgrab%26do%3Drepair%26m%3Dxfeng_community%26id%3D274\";',1500106930),('551c3a4366e97283f7be7a780419168c',3,'101.226.33.228','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"RLpD\";i:1500180749;}dest_url|s:96:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Drepair%26m%3Dxfeng_community\";',1500184349),('56dfb104579a0555130b7f90c50ca565',3,'101.226.33.203','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"q9Bz\";i:1500103337;}',1500106937),('56e5b4c939c30530b9361c949e6b05ef',3,'101.226.66.191','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"TQ10\";i:1500257514;}dest_url|s:114:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dlist%26do%3Dannouncement%26m%3Dxfeng_community\";',1500261114),('575ae304699a6f2632e555278c4088e2',3,'101.226.33.206','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"fUor\";i:1500103325;}dest_url|s:116:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dg%26id%3D274%26do%3Drepair%26m%3Dxfeng_community\";',1500106925),('57d4cdeeb7870e9c57c9d7e3c51dd4de',3,'117.185.27.115','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"z2oB\";i:1500107489;}dest_url|s:119:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dgrab%26id%3D272%26do%3Drepair%26m%3Dxfeng_community\";',1500111089),('5ae34b87dead5d4c4ee9aca80fc25aad',3,'110.53.132.231','acid|s:1:\"3\";uniacid|i:3;token|a:3:{s:4:\"dAcg\";i:1500089169;s:4:\"dMGu\";i:1500089170;s:4:\"GGJg\";i:1500089174;}',1500092774),('5b7864484663df8af583b5a2471fb57b',3,'140.207.124.105','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"Iw9I\";i:1500088572;}dest_url|s:126:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Ddetail%26id%3D17%26do%3Dannouncement%26m%3Dxfeng_community\";',1500092172),('6021741c1b0b73ef1d54e0608a6b2eda',3,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";',1500260028),('685211bea85100028803f098313b61b6',3,'61.151.218.119','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"Dz78\";i:1500256924;s:4:\"jDph\";i:1500256924;}',1500260524),('68cef2784f4fd458a736ddb8330e1f53',3,'101.226.65.108','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"WL4r\";i:1500256916;}dest_url|s:121:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Ddetail%26id%3D275%26do%3Drepair%26m%3Dxfeng_community\";',1500260516),('6e571daf501a15ba9016a818c034e8ed',3,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','openid|s:28:\"oNWF5uCX8zNzKmmBJ6RE_l29Anxo\";',1500261010),('6f56cdaf239eea3dc10aa3ac9ab65c7e',3,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','openid|s:28:\"oNWF5uACpuRWOwWuw3a3MJhQl5K0\";',1500260401),('7183ab9285ca700f4fd357c5ccd79172',3,'101.226.66.193','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"HwpP\";i:1500256883;s:4:\"M90c\";i:1500256883;}',1500260483),('759db1a531a4316290b6e530b2bcea4c',3,'101.226.66.192','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"RwOt\";i:1500107492;s:4:\"Zo88\";i:1500107492;}',1500111092),('787aa81dd74af8fb89aa2496e12be7ef',3,'101.226.33.217','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"oBIT\";i:1500180806;s:4:\"hj42\";i:1500180806;}',1500184406),('7e39a202f4d45de72c800a05f44a5a10',3,'180.163.2.116','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"Oxgc\";i:1500256396;}dest_url|s:119:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dgrab%26id%3D273%26do%3Drepair%26m%3Dxfeng_community\";',1500259996),('84a1de21a986543530830004698c707a',3,'61.151.228.22','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"UOZ7\";i:1500180801;}dest_url|s:98:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dmyregion%26m%3Dxfeng_community\";',1500184401),('85b20f9e26885d2738615ef90204fc5c',0,'61.151.218.118','acid|N;uniacid|i:0;token|a:1:{s:4:\"FKQ5\";i:1500166182;}',1500169782),('8c8e32e2196b1427a43c6597ff409c5d',3,'101.226.33.227','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"NQho\";i:1500255542;}',1500259142),('96bcc73def1df7ba93df981c18c45be1',3,'61.151.228.22','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"SW5e\";i:1500256687;s:4:\"p538\";i:1500256687;}',1500260287),('97dfc02440db3a24b5f6346bca48700b',3,'101.226.33.227','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"d7w8\";i:1500257521;s:4:\"E74g\";i:1500257522;}',1500261122),('980acd8fdd8c388a286f4c39e2736c0f',3,'110.53.132.231','acid|s:1:\"3\";uniacid|i:3;token|a:4:{s:4:\"ck5f\";i:1500256848;s:4:\"c8av\";i:1500256849;s:4:\"GLgc\";i:1500256852;s:4:\"oeje\";i:1500256895;}dest_url|s:119:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dgrab%26id%3D272%26do%3Drepair%26m%3Dxfeng_community\";oauth_openid|s:28:\"oNWF5uACpuRWOwWuw3a3MJhQl5K0\";oauth_acid|s:1:\"3\";openid|s:28:\"oNWF5uACpuRWOwWuw3a3MJhQl5K0\";uid|s:1:\"2\";',1500260495),('9922b76dc96ec4f0d455cd0c7c6767f2',3,'101.226.33.227','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"s2G8\";i:1500104531;}dest_url|s:116:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dg%26id%3D274%26do%3Drepair%26m%3Dxfeng_community\";',1500108131),('9a5b6c5f5b9b8edcd42a301cc82b976f',3,'101.226.33.227','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"gbtW\";i:1500257124;}',1500260724),('9ce6a5d6777efb3d3516f32610ebe75e',3,'101.226.89.121','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"naO9\";i:1500180772;s:4:\"zTs5\";i:1500180773;}',1500184373),('a0bc815154861fe235d60fe914148240',3,'180.163.2.116','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"fp3R\";i:1500255541;}dest_url|s:119:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dgrab%26id%3D272%26do%3Drepair%26m%3Dxfeng_community\";',1500259141),('a26a28bbf674836fc05c07660efd3986',3,'101.226.33.227','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"J5M4\";i:1500088409;}dest_url|s:98:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dregister%26m%3Dxfeng_community\";',1500092009),('a515b51df7b74512f9a9af072450a683',3,'140.207.128.193','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"P0eW\";i:1500256880;}dest_url|s:96:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Drepair%26m%3Dxfeng_community\";',1500260480),('a6a86f08e5d1eb224f0f1ab7dc818d47',3,'101.226.125.104','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"I9tg\";i:1500257850;}dest_url|s:94:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dcost%26m%3Dxfeng_community\";',1500261450),('aa4d75d70e39f1553900bfc067061bdf',3,'61.151.226.199','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"r6W0\";i:1500255547;s:4:\"pz66\";i:1500255547;}',1500259147),('b157e81a55e84916905f15e753cd3abe',3,'101.226.65.107','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"Pu63\";i:1500180748;}dest_url|s:96:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Drepair%26m%3Dxfeng_community\";',1500184348),('bb0503c34f8097eb0cc2be8c14f8080a',3,'110.53.132.231','acid|s:1:\"3\";uniacid|i:3;token|a:4:{s:4:\"afo4\";i:1500099794;s:4:\"npCd\";i:1500099795;s:4:\"l2P6\";i:1500099796;s:4:\"kMTi\";i:1500099800;}dest_url|s:130:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1%26code%3D001nItcw0gO5Ag1a2Lcw0OSCcw0nItc9%26state%3Dwe7sid-\";oauth_openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";oauth_acid|s:1:\"3\";openid|s:28:\"oNWF5uLKdsg4sJUZof5EYsKPsC2U\";uid|s:1:\"1\";',1500103400),('c373bcf1198f1af1ddaed87e8ba3d845',3,'61.151.226.202','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"rvel\";i:1500088576;s:4:\"L6c5\";i:1500088576;}',1500092176),('c52a3c7333fdc40701c34f50f9ba7095',3,'61.151.228.22','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"x6K7\";i:1500256004;}dest_url|s:70:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1\";',1500259604),('c9f037deb9e5c8a9947a5d1bb2029394',0,'58.20.232.247','acid|N;uniacid|i:0;token|a:6:{s:4:\"p63G\";i:1500166212;s:4:\"C371\";i:1500166235;s:4:\"fN5Y\";i:1500166260;s:4:\"fzu5\";i:1500166274;s:4:\"XalV\";i:1500166315;s:4:\"v6SQ\";i:1500166431;}',1500170031),('d1f0c74cd1d8f72b449f4365e127752f',3,'101.226.65.102','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"D956\";i:1500256318;}dest_url|s:70:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1\";',1500259918),('d32087cf613c6b8c3f60ecbe4daa658e',3,'101.226.66.187','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"yw77\";i:1500104716;}dest_url|s:116:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dg%26id%3D274%26do%3Drepair%26m%3Dxfeng_community\";',1500108316),('d4a5f7c6455bb5fc2fbcf0c44adf915c',3,'61.151.226.191','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"Oagz\";i:1500257511;}dest_url|s:94:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Dfled%26m%3Dxfeng_community\";',1500261111),('d8c1c01c476ad7b5a04166738457941d',3,'101.226.66.178','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"xJpn\";i:1500257855;}dest_url|s:114:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dlist%26do%3Dannouncement%26m%3Dxfeng_community\";',1500261455),('e0d553370795c928eb3307dab2765d42',3,'101.226.99.197','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"Lz91\";i:1500255560;}dest_url|s:119:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dgrab%26do%3Drepair%26m%3Dxfeng_community%26id%3D274\";',1500259160),('e1a7ad83f70660d324ba6683bbd8ca60',3,'140.207.185.107','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"p33M\";i:1500256864;}dest_url|s:119:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dgrab%26do%3Drepair%26m%3Dxfeng_community%26id%3D275\";',1500260464),('e40b57bffcb8b8a93a82adcac1035126',3,'101.226.66.191','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"A0Vr\";i:1500257102;}dest_url|s:128:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dmember%26regionid%3D20%26do%3Dregister%26m%3Dxfeng_community\";',1500260702),('e60f30650fc7bcc008c1d160f214edd2',3,'101.226.33.237','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"UYwW\";i:1500180756;}dest_url|s:121:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dlist%26status%3D1%26do%3Drepair%26m%3Dxfeng_community\";',1500184356),('e81df5f8f389d8abb0a4e90d38c2a092',3,'101.226.66.174','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"Mk5K\";i:1500180760;s:4:\"Jx2k\";i:1500180761;}',1500184361),('e9843f2040712b6ba62acf62e3495ed8',3,'101.226.89.119','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"uOkx\";i:1500180763;}dest_url|s:121:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Dlist%26status%3D2%26do%3Drepair%26m%3Dxfeng_community\";',1500184363),('eda0896a792c67d9507139992630fe3a',3,'220.202.152.112','acid|s:1:\"3\";uniacid|i:3;token|a:6:{s:4:\"l88q\";i:1500257507;s:4:\"Uw83\";i:1500257509;s:4:\"weEO\";i:1500257519;s:4:\"B55z\";i:1500257520;s:4:\"vuHz\";i:1500257520;s:4:\"OM70\";i:1500257520;}dest_url|s:130:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26eid%3D1%26code%3D021WqE8r14AAar0qPp9r15jY8r1WqE8U%26state%3Dwe7sid-\";oauth_openid|s:28:\"oNWF5uCX8zNzKmmBJ6RE_l29Anxo\";oauth_acid|s:1:\"3\";userinfo|s:852:\"YToxNDp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib05XRjV1Q1g4ek56S21tQko2UkVfbDI5QW54byI7czo4OiJuaWNrbmFtZSI7czo5OiLlgKrog73mraYiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czoxNToi6Zi/5bCU5Y+K5Yip5LqaIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9SdjdqeGljT2JYUzFRVkZCQmt6dk9xZnNBOHlHWEJPMlR2NDU1OU96WVFUVzFITXlBYlZ4Q21YNVlzOVE5eXF2U2liT1FlVzN5MmpqTGtHSWlhcUNaaWFuaWFmTWliajRiYmljT2gxLzEzMiI7czoxNDoic3Vic2NyaWJlX3RpbWUiO2k6MTQ1MTU0MTQ0MDtzOjY6InJlbWFyayI7czowOiIiO3M6NzoiZ3JvdXBpZCI7aTowO3M6MTA6InRhZ2lkX2xpc3QiO2E6MDp7fXM6NjoiYXZhdGFyIjtzOjEzMzoiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9SdjdqeGljT2JYUzFRVkZCQmt6dk9xZnNBOHlHWEJPMlR2NDU1OU96WVFUVzFITXlBYlZ4Q21YNVlzOVE5eXF2U2liT1FlVzN5MmpqTGtHSWlhcUNaaWFuaWFmTWliajRiYmljT2gxLzEzMiI7fQ==\";uid|s:1:\"5\";openid|s:28:\"oNWF5uCX8zNzKmmBJ6RE_l29Anxo\";',1500261120),('ee5df823feb329f1f1becac9f40456fc',3,'101.226.33.238','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"yct8\";i:1500256010;s:4:\"i0u7\";i:1500256011;}',1500259611),('efabfe0db6c53b262a0f618c172ccd89',3,'oNWF5uEH9p47bi_X1sLpv7H9beQo','openid|s:28:\"oNWF5uEH9p47bi_X1sLpv7H9beQo\";',1500197439),('f077fd1555d92ad2903ef17df82bfd60',3,'61.151.226.199','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"WTrM\";i:1500180769;}dest_url|s:121:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26op%3Ddetail%26id%3D272%26do%3Drepair%26m%3Dxfeng_community\";',1500184369),('f147f9e116f2ff4af9a8573917cd95e2',3,'101.226.66.181','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"Y5Hf\";i:1500257515;s:4:\"BONo\";i:1500257515;}',1500261115),('f29216b945e1dfc40f58fe2f103c7283',3,'101.226.125.103','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"Wn8e\";i:1500180825;s:4:\"v448\";i:1500180826;}',1500184426),('fa214243755d8d9cdf39e1b6834fc50e',3,'61.151.228.22','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"G2bL\";i:1500256975;}',1500260575),('fb5027f7344ef6b357dc9e60104d05d0',3,'101.226.33.218','acid|s:1:\"3\";uniacid|i:3;token|a:2:{s:4:\"cBKf\";i:1500257454;s:4:\"YNeg\";i:1500257455;}',1500261055),('fe68598ea595146d787e2667c9c158b2',3,'61.151.218.119','acid|s:1:\"3\";uniacid|i:3;token|a:1:{s:4:\"OXt6\";i:1500180749;}dest_url|s:96:\"http%3A%2F%2F43721.com%2Fapp%2Findex.php%3Fi%3D3%26c%3Dentry%26do%3Drepair%26m%3Dxfeng_community\";',1500184349);
/*!40000 ALTER TABLE `ims_core_sessions` ENABLE KEYS */;

#
# Structure for table "ims_core_settings"
#

DROP TABLE IF EXISTS `ims_core_settings`;
CREATE TABLE `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_core_settings"
#

/*!40000 ALTER TABLE `ims_core_settings` DISABLE KEYS */;
INSERT INTO `ims_core_settings` VALUES ('authmode','i:1;'),('close','a:2:{s:6:\"status\";s:1:\"0\";s:6:\"reason\";s:0:\"\";}'),('cloudip','a:2:{s:2:\"ip\";s:12:\"125.39.6.139\";s:6:\"expire\";i:1493207703;}'),('community3','a:1:{s:7:\"styleid\";s:6:\"style1\";}'),('copyright','a:1:{s:6:\"slides\";a:3:{i:0;s:58:\"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg\";i:1;s:58:\"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg\";i:2;s:58:\"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg\";}}'),('register','a:4:{s:4:\"open\";i:1;s:6:\"verify\";i:0;s:4:\"code\";i:1;s:7:\"groupid\";i:1;}'),('site','s:0:\"\";');
/*!40000 ALTER TABLE `ims_core_settings` ENABLE KEYS */;

#
# Structure for table "ims_coupon_location"
#

DROP TABLE IF EXISTS `ims_coupon_location`;
CREATE TABLE `ims_coupon_location` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `sid` int(10) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) unsigned NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_coupon_location"
#

/*!40000 ALTER TABLE `ims_coupon_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_coupon_location` ENABLE KEYS */;

#
# Structure for table "ims_cover_reply"
#

DROP TABLE IF EXISTS `ims_cover_reply`;
CREATE TABLE `ims_cover_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "ims_cover_reply"
#

/*!40000 ALTER TABLE `ims_cover_reply` DISABLE KEYS */;
INSERT INTO `ims_cover_reply` VALUES (1,1,0,7,'mc','','进入个人中心','','','./index.php?c=mc&a=home&i=1'),(2,1,1,8,'site','','进入首页','','','./index.php?c=home&i=1&t=1'),(3,3,0,9,'xfeng_community','register','东方名苑','','http://43721.com/attachment/images/3/2017/07/ud3S077j972Usb97BUmpB89777p1oO.jpg','./index.php?i=3&c=entry&op=member&regionid=19&type=1&do=register&m=xfeng_community'),(4,2,0,10,'xfeng_community','register','春满江南','','','./index.php?i=2&c=entry&op=member&regionid=18&type=1&do=register&m=xfeng_community'),(5,3,0,12,'xfeng_community','register','华雅花园','','http://43721.com/attachment/images/3/2017/07/zoSo77di07O7O1MXkoLzW0YoH4Zo4l.jpg','./index.php?i=3&c=entry&op=member&regionid=20&type=1&do=register&m=xfeng_community');
/*!40000 ALTER TABLE `ims_cover_reply` ENABLE KEYS */;

#
# Structure for table "ims_custom_reply"
#

DROP TABLE IF EXISTS `ims_custom_reply`;
CREATE TABLE `ims_custom_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_custom_reply"
#

/*!40000 ALTER TABLE `ims_custom_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_custom_reply` ENABLE KEYS */;

#
# Structure for table "ims_images_reply"
#

DROP TABLE IF EXISTS `ims_images_reply`;
CREATE TABLE `ims_images_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_images_reply"
#

/*!40000 ALTER TABLE `ims_images_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_images_reply` ENABLE KEYS */;

#
# Structure for table "ims_mc_cash_record"
#

DROP TABLE IF EXISTS `ims_mc_cash_record`;
CREATE TABLE `ims_mc_cash_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `fee` decimal(10,2) unsigned NOT NULL,
  `final_fee` decimal(10,2) unsigned NOT NULL,
  `credit1` int(10) unsigned NOT NULL,
  `credit1_fee` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `cash` decimal(10,2) unsigned NOT NULL,
  `return_cash` decimal(10,2) unsigned NOT NULL,
  `final_cash` decimal(10,2) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `trade_type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_cash_record"
#

/*!40000 ALTER TABLE `ims_mc_cash_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_cash_record` ENABLE KEYS */;

#
# Structure for table "ims_mc_chats_record"
#

DROP TABLE IF EXISTS `ims_mc_chats_record`;
CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `flag` tinyint(3) unsigned NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`),
  KEY `openid` (`openid`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_chats_record"
#

/*!40000 ALTER TABLE `ims_mc_chats_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_chats_record` ENABLE KEYS */;

#
# Structure for table "ims_mc_credits_recharge"
#

DROP TABLE IF EXISTS `ims_mc_credits_recharge`;
CREATE TABLE `ims_mc_credits_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `backtype` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  KEY `idx_tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_credits_recharge"
#

/*!40000 ALTER TABLE `ims_mc_credits_recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_credits_recharge` ENABLE KEYS */;

#
# Structure for table "ims_mc_credits_record"
#

DROP TABLE IF EXISTS `ims_mc_credits_record`;
CREATE TABLE `ims_mc_credits_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) unsigned NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) unsigned NOT NULL,
  `store_id` int(10) unsigned NOT NULL,
  `clerk_type` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `remark` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_credits_record"
#

/*!40000 ALTER TABLE `ims_mc_credits_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_credits_record` ENABLE KEYS */;

#
# Structure for table "ims_mc_fans_groups"
#

DROP TABLE IF EXISTS `ims_mc_fans_groups`;
CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groups` varchar(10000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_fans_groups"
#

/*!40000 ALTER TABLE `ims_mc_fans_groups` DISABLE KEYS */;
INSERT INTO `ims_mc_fans_groups` VALUES (1,3,3,'a:17:{i:2;a:3:{s:2:\"id\";i:2;s:4:\"name\";s:9:\"星标组\";s:5:\"count\";i:2;}i:100;a:3:{s:2:\"id\";i:100;s:4:\"name\";s:6:\"戴安\";s:5:\"count\";i:10;}i:101;a:3:{s:2:\"id\";i:101;s:4:\"name\";s:6:\"唐慧\";s:5:\"count\";i:0;}i:102;a:3:{s:2:\"id\";i:102;s:4:\"name\";s:6:\"黄灿\";s:5:\"count\";i:3;}i:103;a:3:{s:2:\"id\";i:103;s:4:\"name\";s:6:\"肖玲\";s:5:\"count\";i:0;}i:104;a:3:{s:2:\"id\";i:104;s:4:\"name\";s:9:\"王晓敏\";s:5:\"count\";i:0;}i:105;a:3:{s:2:\"id\";i:105;s:4:\"name\";s:6:\"彭炎\";s:5:\"count\";i:0;}i:106;a:3:{s:2:\"id\";i:106;s:4:\"name\";s:9:\"戴仁君\";s:5:\"count\";i:0;}i:107;a:3:{s:2:\"id\";i:107;s:4:\"name\";s:9:\"易顺武\";s:5:\"count\";i:0;}i:108;a:3:{s:2:\"id\";i:108;s:4:\"name\";s:9:\"张伟兴\";s:5:\"count\";i:0;}i:109;a:3:{s:2:\"id\";i:109;s:4:\"name\";s:6:\"刘慧\";s:5:\"count\";i:0;}i:110;a:3:{s:2:\"id\";i:110;s:4:\"name\";s:9:\"唐嘉璘\";s:5:\"count\";i:3;}i:111;a:3:{s:2:\"id\";i:111;s:4:\"name\";s:6:\"陈微\";s:5:\"count\";i:0;}i:112;a:3:{s:2:\"id\";i:112;s:4:\"name\";s:6:\"张雨\";s:5:\"count\";i:0;}i:113;a:3:{s:2:\"id\";i:113;s:4:\"name\";s:6:\"刘青\";s:5:\"count\";i:1;}i:114;a:3:{s:2:\"id\";i:114;s:4:\"name\";s:9:\"倪能武\";s:5:\"count\";i:8;}i:115;a:3:{s:2:\"id\";i:115;s:4:\"name\";s:6:\"彭浩\";s:5:\"count\";i:1;}}');
/*!40000 ALTER TABLE `ims_mc_fans_groups` ENABLE KEYS */;

#
# Structure for table "ims_mc_fans_tag_mapping"
#

DROP TABLE IF EXISTS `ims_mc_fans_tag_mapping`;
CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fanid` int(11) unsigned NOT NULL,
  `tagid` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mapping` (`fanid`,`tagid`),
  KEY `fanid_index` (`fanid`),
  KEY `tagid_index` (`tagid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_fans_tag_mapping"
#

/*!40000 ALTER TABLE `ims_mc_fans_tag_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_fans_tag_mapping` ENABLE KEYS */;

#
# Structure for table "ims_mc_groups"
#

DROP TABLE IF EXISTS `ims_mc_groups`;
CREATE TABLE `ims_mc_groups` (
  `groupid` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) unsigned NOT NULL,
  `isdefault` tinyint(4) NOT NULL,
  PRIMARY KEY (`groupid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_groups"
#

/*!40000 ALTER TABLE `ims_mc_groups` DISABLE KEYS */;
INSERT INTO `ims_mc_groups` VALUES (1,1,'默认会员组',0,1),(2,2,'默认会员组',0,1),(3,3,'默认会员组',0,1);
/*!40000 ALTER TABLE `ims_mc_groups` ENABLE KEYS */;

#
# Structure for table "ims_mc_handsel"
#

DROP TABLE IF EXISTS `ims_mc_handsel`;
CREATE TABLE `ims_mc_handsel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) unsigned NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`touid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_handsel"
#

/*!40000 ALTER TABLE `ims_mc_handsel` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_handsel` ENABLE KEYS */;

#
# Structure for table "ims_mc_mapping_fans"
#

DROP TABLE IF EXISTS `ims_mc_mapping_fans`;
CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `acid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(30) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) unsigned NOT NULL,
  `followtime` int(10) unsigned NOT NULL,
  `unfollowtime` int(10) unsigned NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) unsigned DEFAULT NULL,
  `unionid` varchar(64) NOT NULL,
  PRIMARY KEY (`fanid`),
  UNIQUE KEY `openid_2` (`openid`),
  KEY `acid` (`acid`),
  KEY `uniacid` (`uniacid`),
  KEY `nickname` (`nickname`),
  KEY `updatetime` (`updatetime`),
  KEY `uid` (`uid`),
  KEY `openid` (`openid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_mapping_fans"
#

/*!40000 ALTER TABLE `ims_mc_mapping_fans` DISABLE KEYS */;
INSERT INTO `ims_mc_mapping_fans` VALUES (1,3,3,1,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','Dean','','PiF0Fpeo',1,1499925007,0,'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib05XRjV1TEtkc2c0c0pVWm9mNUVZc0tQc0MyVSI7czo4OiJuaWNrbmFtZSI7czo0OiJEZWFuIjtzOjM6InNleCI7aToxO3M6ODoibGFuZ3VhZ2UiO3M6NToiemhfQ04iO3M6NDoiY2l0eSI7czo2OiLmuZjmva0iO3M6ODoicHJvdmluY2UiO3M6Njoi5rmW5Y2XIjtzOjc6ImNvdW50cnkiO3M6Njoi5Lit5Zu9IjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEyOToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9SdjdqeGljT2JYUzFLY1V0WHhOU2liU2pjQnc0UzlQTVBCSnA5YVd6OE92SVlVcGFpYTNHa0dyVHhCNVVNMTF3aWNJVm1RNmxrT0UwMEZxRnowWkxaWTMxand2dHowRmhpYnhyYy8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDk5OTI1MDA3O3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==',1500259296,''),(2,3,3,2,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','瑞','','bB3obeMB',1,1499955841,0,'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib05XRjV1QUNwdVJXT3dXdXczYTNNSmhRbDVLMCI7czo4OiJuaWNrbmFtZSI7czozOiLnkZ4iO3M6Mzoic2V4IjtpOjA7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czowOiIiO3M6MTA6ImhlYWRpbWd1cmwiO3M6MTMwOiJodHRwOi8vd3gucWxvZ28uY24vbW1vcGVuL1Z6b3Q5OHo0aFVaNEt1VDIyWEF0OFFqUE1Zamo1YjR0a204ek9pY29LMGp2Rm93VGNYdmliOGFpY1UxaWFMRjkxaWF2UFFGeUZQdUFHUkVNNWw1TllVdnhkU1RBQ3p2NWJpYVVteC8wIjtzOjE0OiJzdWJzY3JpYmVfdGltZSI7aToxNDk5OTU1ODQxO3M6NjoicmVtYXJrIjtzOjA6IiI7czo3OiJncm91cGlkIjtpOjA7czoxMDoidGFnaWRfbGlzdCI7YTowOnt9fQ==',1500259296,''),(3,3,3,4,'oNWF5uEH9p47bi_X1sLpv7H9beQo','&范志锋','','O63U6Mgp',1,1500193840,0,'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib05XRjV1RUg5cDQ3YmlfWDFzTHB2N0g5YmVRbyI7czo4OiJuaWNrbmFtZSI7czoxMDoiJuiMg+W/l+mUiyI7czozOiJzZXgiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjU6InpoX0NOIjtzOjQ6ImNpdHkiO3M6Njoi5rex5ZyzIjtzOjg6InByb3ZpbmNlIjtzOjY6IuW5v+S4nCI7czo3OiJjb3VudHJ5IjtzOjY6IuS4reWbvSI7czoxMDoiaGVhZGltZ3VybCI7czoxMzA6Imh0dHA6Ly93eC5xbG9nby5jbi9tbW9wZW4vVnpvdDk4ejRoVVlZNlBWQjhqRDFzYWljRzBpYkZWV1pFSkZ1a0RFUGI0aWJiS3M5eXVOOW9aNENjR3VBeDk3eU9pYU1XSGJjUWliM3JqM2FjelBhS1FKanliTTZKY3UyaWIxQ0piLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE1MDAxOTM4NDA7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319',1500259296,''),(4,3,3,5,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','倪能武','','yiuxumIi',1,1451541440,0,'YToxMzp7czo5OiJzdWJzY3JpYmUiO2k6MTtzOjY6Im9wZW5pZCI7czoyODoib05XRjV1Q1g4ek56S21tQko2UkVfbDI5QW54byI7czo4OiJuaWNrbmFtZSI7czo5OiLlgKrog73mraYiO3M6Mzoic2V4IjtpOjE7czo4OiJsYW5ndWFnZSI7czo1OiJ6aF9DTiI7czo0OiJjaXR5IjtzOjA6IiI7czo4OiJwcm92aW5jZSI7czowOiIiO3M6NzoiY291bnRyeSI7czoxNToi6Zi/5bCU5Y+K5Yip5LqaIjtzOjEwOiJoZWFkaW1ndXJsIjtzOjEzMToiaHR0cDovL3d4LnFsb2dvLmNuL21tb3Blbi9SdjdqeGljT2JYUzFRVkZCQmt6dk9xZnNBOHlHWEJPMlR2NDU1OU96WVFUVzFITXlBYlZ4Q21YNVlzOVE5eXF2U2liT1FlVzN5MmpqTGtHSWlhcUNaaWFuaWFmTWliajRiYmljT2gxLzAiO3M6MTQ6InN1YnNjcmliZV90aW1lIjtpOjE0NTE1NDE0NDA7czo2OiJyZW1hcmsiO3M6MDoiIjtzOjc6Imdyb3VwaWQiO2k6MDtzOjEwOiJ0YWdpZF9saXN0IjthOjA6e319',1500259296,'');
/*!40000 ALTER TABLE `ims_mc_mapping_fans` ENABLE KEYS */;

#
# Structure for table "ims_mc_mapping_ucenter"
#

DROP TABLE IF EXISTS `ims_mc_mapping_ucenter`;
CREATE TABLE `ims_mc_mapping_ucenter` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `centeruid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_mapping_ucenter"
#

/*!40000 ALTER TABLE `ims_mc_mapping_ucenter` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_mapping_ucenter` ENABLE KEYS */;

#
# Structure for table "ims_mc_mass_record"
#

DROP TABLE IF EXISTS `ims_mc_mass_record`;
CREATE TABLE `ims_mc_mass_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) unsigned NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `cron_id` int(10) unsigned NOT NULL,
  `sendtime` int(10) unsigned NOT NULL,
  `finalsendtime` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_mass_record"
#

/*!40000 ALTER TABLE `ims_mc_mass_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_mass_record` ENABLE KEYS */;

#
# Structure for table "ims_mc_member_address"
#

DROP TABLE IF EXISTS `ims_mc_member_address`;
CREATE TABLE `ims_mc_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(50) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uinacid` (`uniacid`),
  KEY `idx_uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_member_address"
#

/*!40000 ALTER TABLE `ims_mc_member_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_member_address` ENABLE KEYS */;

#
# Structure for table "ims_mc_member_fields"
#

DROP TABLE IF EXISTS `ims_mc_member_fields`;
CREATE TABLE `ims_mc_member_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uniacid` (`uniacid`),
  KEY `idx_fieldid` (`fieldid`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_member_fields"
#

/*!40000 ALTER TABLE `ims_mc_member_fields` DISABLE KEYS */;
INSERT INTO `ims_mc_member_fields` VALUES (1,2,1,'真实姓名',1,0),(2,2,2,'昵称',1,1),(3,2,3,'头像',1,1),(4,2,4,'QQ号',1,0),(5,2,5,'手机号码',1,0),(6,2,6,'VIP级别',1,0),(7,2,7,'性别',1,0),(8,2,8,'出生生日',1,0),(9,2,9,'星座',1,0),(10,2,10,'生肖',1,0),(11,2,11,'固定电话',1,0),(12,2,12,'证件号码',1,0),(13,2,13,'学号',1,0),(14,2,14,'班级',1,0),(15,2,15,'邮寄地址',1,0),(16,2,16,'邮编',1,0),(17,2,17,'国籍',1,0),(18,2,18,'居住地址',1,0),(19,2,19,'毕业学校',1,0),(20,2,20,'公司',1,0),(21,2,21,'学历',1,0),(22,2,22,'职业',1,0),(23,2,23,'职位',1,0),(24,2,24,'年收入',1,0),(25,2,25,'情感状态',1,0),(26,2,26,' 交友目的',1,0),(27,2,27,'血型',1,0),(28,2,28,'身高',1,0),(29,2,29,'体重',1,0),(30,2,30,'支付宝帐号',1,0),(31,2,31,'MSN',1,0),(32,2,32,'电子邮箱',1,0),(33,2,33,'阿里旺旺',1,0),(34,2,34,'主页',1,0),(35,2,35,'自我介绍',1,0),(36,2,36,'兴趣爱好',1,0),(37,3,1,'真实姓名',1,0),(38,3,2,'昵称',1,1),(39,3,3,'头像',1,1),(40,3,4,'QQ号',1,0),(41,3,5,'手机号码',1,0),(42,3,6,'VIP级别',1,0),(43,3,7,'性别',1,0),(44,3,8,'出生生日',1,0),(45,3,9,'星座',1,0),(46,3,10,'生肖',1,0),(47,3,11,'固定电话',1,0),(48,3,12,'证件号码',1,0),(49,3,13,'学号',1,0),(50,3,14,'班级',1,0),(51,3,15,'邮寄地址',1,0),(52,3,16,'邮编',1,0),(53,3,17,'国籍',1,0),(54,3,18,'居住地址',1,0),(55,3,19,'毕业学校',1,0),(56,3,20,'公司',1,0),(57,3,21,'学历',1,0),(58,3,22,'职业',1,0),(59,3,23,'职位',1,0),(60,3,24,'年收入',1,0),(61,3,25,'情感状态',1,0),(62,3,26,' 交友目的',1,0),(63,3,27,'血型',1,0),(64,3,28,'身高',1,0),(65,3,29,'体重',1,0),(66,3,30,'支付宝帐号',1,0),(67,3,31,'MSN',1,0),(68,3,32,'电子邮箱',1,0),(69,3,33,'阿里旺旺',1,0),(70,3,34,'主页',1,0),(71,3,35,'自我介绍',1,0),(72,3,36,'兴趣爱好',1,0);
/*!40000 ALTER TABLE `ims_mc_member_fields` ENABLE KEYS */;

#
# Structure for table "ims_mc_member_property"
#

DROP TABLE IF EXISTS `ims_mc_member_property`;
CREATE TABLE `ims_mc_member_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `property` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_member_property"
#

/*!40000 ALTER TABLE `ims_mc_member_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_member_property` ENABLE KEYS */;

#
# Structure for table "ims_mc_members"
#

DROP TABLE IF EXISTS `ims_mc_members`;
CREATE TABLE `ims_mc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) unsigned NOT NULL,
  `credit2` decimal(10,2) unsigned NOT NULL,
  `credit3` decimal(10,2) unsigned NOT NULL,
  `credit4` decimal(10,2) unsigned NOT NULL,
  `credit5` decimal(10,2) unsigned NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  PRIMARY KEY (`uid`),
  KEY `groupid` (`groupid`),
  KEY `uniacid` (`uniacid`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_members"
#

/*!40000 ALTER TABLE `ims_mc_members` DISABLE KEYS */;
INSERT INTO `ims_mc_members` VALUES (1,3,'13807324757','ac292a46edcdae2b3d3ad4b45a5fa4f1@we7.cc','c54881f74587b1b24b571379ebf7bb66','czcCfKFz',3,0.00,0.00,0.00,0.00,0.00,0.00,1499851406,'李浪','Dean','http://wx.qlogo.cn/mmopen/Rv7jxicObXS1KcUtXxNSibSjcBw4S9PMPBJp9aWz8OvIYUpaia3GkGrTxB5UM11wicIVmQ6lkOE00FqFz0ZLZY31jwvtz0Fhibxrc/132','',0,1,0,0,0,'','','','','','','1栋1单元101室','','中国','湖南省','湘潭市','','','','','','','','','','','','','','','','','',''),(2,3,'15273279515','f45c2527c48e316999cbf70f9f734fd7@we7.cc','ce1405d0ded6102cbc457d14b0b9a8bb','mJmCHhCc',3,0.00,0.00,0.00,0.00,0.00,0.00,1499910887,'黄鼎','','','',0,0,0,0,0,'','','','','','','1栋1单元101室','','','','','','','','','','','','','','','','','','','','','',''),(3,3,'','020baa2e8beedfc09892191daef92782@we7.cc','1d1f23c4cf4f7d4fae3b131f8909eb6d','etkE7OKn',3,0.00,0.00,0.00,0.00,0.00,0.00,1499998059,'','龙在天涯','http://wx.qlogo.cn/mmhead/Q3auHgzwzM7Sa4fqZibzDAxKscJ0YKBic8JBAxsMjIFuJwrnYbNQux4w/132','',0,1,0,0,0,'','','','','','','','','中国','湖南省','湘潭市','','','','','','','','','','','','','','','','','',''),(4,3,'','3c10039cd60fb5951049a9f820574ce2@we7.cc','e48339b7b3ae64b7387b7e6271566d7e','yncMxPW3',3,0.00,0.00,0.00,0.00,0.00,0.00,1500193839,'','&范志锋','http://wx.qlogo.cn/mmopen/Vzot98z4hUYY6PVB8jD1saicG0ibFVWZEJFukDEPb4ibbKs9yuN9oZ4CcGuAx97yOiaMWHbcQib3rj3aczPaKQJjybM6Jcu2ib1CJb/132','',0,0,0,0,0,'','','','','','','','','','','','','','','','','','','','','','','','','','','','',''),(5,3,'18670203555','168ecbdfdcac704b70c748fdac52b31a@we7.cc','1d1f23c4cf4f7d4fae3b131f8909eb6d','i1zf3vi8',3,0.00,0.00,0.00,0.00,0.00,0.00,1500256473,'倪能武','倪能武','http://wx.qlogo.cn/mmopen/Rv7jxicObXS1QVFBBkzvOqfsA8yGXBO2Tv4559OzYQTW1HMyAbVxCmX5Ys9Q9yqvSibOQeW3y2jjLkGIiaqCZianiafMibj4bbicOh1/132','',0,1,0,0,0,'','','','','','','1栋1单元101室','','阿尔及利亚','省','市','','','','','','','','','','','','','','','','','','');
/*!40000 ALTER TABLE `ims_mc_members` ENABLE KEYS */;

#
# Structure for table "ims_mc_oauth_fans"
#

DROP TABLE IF EXISTS `ims_mc_oauth_fans`;
CREATE TABLE `ims_mc_oauth_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mc_oauth_fans"
#

/*!40000 ALTER TABLE `ims_mc_oauth_fans` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mc_oauth_fans` ENABLE KEYS */;

#
# Structure for table "ims_menu_event"
#

DROP TABLE IF EXISTS `ims_menu_event`;
CREATE TABLE `ims_menu_event` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `picmd5` (`picmd5`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_menu_event"
#

/*!40000 ALTER TABLE `ims_menu_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_menu_event` ENABLE KEYS */;

#
# Structure for table "ims_mobilenumber"
#

DROP TABLE IF EXISTS `ims_mobilenumber`;
CREATE TABLE `ims_mobilenumber` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `dateline` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_mobilenumber"
#

/*!40000 ALTER TABLE `ims_mobilenumber` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_mobilenumber` ENABLE KEYS */;

#
# Structure for table "ims_modules"
#

DROP TABLE IF EXISTS `ims_modules`;
CREATE TABLE `ims_modules` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL,
  `target` int(10) unsigned NOT NULL,
  `iscard` tinyint(3) unsigned NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL DEFAULT '1',
  `app_support` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mid`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "ims_modules"
#

/*!40000 ALTER TABLE `ims_modules` DISABLE KEYS */;
INSERT INTO `ims_modules` VALUES (1,'basic','system','基本文字回复','1.0','和您进行简单对话','一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(2,'news','system','基本混合图文回复','1.0','为你提供生动的图文资讯','一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(3,'music','system','基本音乐回复','1.0','提供语音、音乐等音频类回复','在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(4,'userapi','system','自定义接口回复','1.1','更方便的第三方接口设置','自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(5,'recharge','system','会员中心充值模块','1.0','提供会员充值功能','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,'','',1,2),(6,'custom','system','多客服转接','1.0.0','用来接入腾讯的多客服系统','','WeEngine Team','http://bbs.we7.cc',0,'a:0:{}','a:6:{i:0;s:5:\"image\";i:1;s:5:\"voice\";i:2;s:5:\"video\";i:3;s:8:\"location\";i:4;s:4:\"link\";i:5;s:4:\"text\";}',1,1,0,0,'','',1,2),(7,'images','system','基本图片回复','1.0','提供图片回复','在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(8,'video','system','基本视频回复','1.0','提供图片回复','在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(9,'voice','system','基本语音回复','1.0','提供语音回复','在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(10,'chats','system','发送客服消息','1.0','公众号可以在粉丝最后发送消息的48小时内无限制发送消息','','WeEngine Team','http://www.we7.cc/',0,'','',0,1,0,0,'','',1,2),(11,'wxcard','system','微信卡券回复','1.0','微信卡券回复','微信卡券回复','WeEngine Team','http://www.we7.cc/',0,'','',1,1,0,0,'','',1,2),(12,'xfeng_community','business','微小区','2.0','微小区','微小区','晓锋','njxiaoqu.com',1,'a:0:{}','a:1:{i:0;s:4:\"text\";}',0,0,0,0,'N;','W',1,2);
/*!40000 ALTER TABLE `ims_modules` ENABLE KEYS */;

#
# Structure for table "ims_modules_bindings"
#

DROP TABLE IF EXISTS `ims_modules_bindings`;
CREATE TABLE `ims_modules_bindings` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(30) NOT NULL,
  `entry` varchar(10) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(30) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) unsigned NOT NULL,
  PRIMARY KEY (`eid`),
  KEY `idx_module` (`module`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "ims_modules_bindings"
#

/*!40000 ALTER TABLE `ims_modules_bindings` DISABLE KEYS */;
INSERT INTO `ims_modules_bindings` VALUES (1,'xfeng_community','cover','','主页入口','home','',0,'','',0),(2,'xfeng_community','menu','','管理中心','manage','',0,'','',0);
/*!40000 ALTER TABLE `ims_modules_bindings` ENABLE KEYS */;

#
# Structure for table "ims_modules_plugin"
#

DROP TABLE IF EXISTS `ims_modules_plugin`;
CREATE TABLE `ims_modules_plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `main_module` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `main_module` (`main_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_modules_plugin"
#

/*!40000 ALTER TABLE `ims_modules_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_modules_plugin` ENABLE KEYS */;

#
# Structure for table "ims_modules_recycle"
#

DROP TABLE IF EXISTS `ims_modules_recycle`;
CREATE TABLE `ims_modules_recycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `modulename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modulename` (`modulename`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_modules_recycle"
#

/*!40000 ALTER TABLE `ims_modules_recycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_modules_recycle` ENABLE KEYS */;

#
# Structure for table "ims_music_reply"
#

DROP TABLE IF EXISTS `ims_music_reply`;
CREATE TABLE `ims_music_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_music_reply"
#

/*!40000 ALTER TABLE `ims_music_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_music_reply` ENABLE KEYS */;

#
# Structure for table "ims_news_reply"
#

DROP TABLE IF EXISTS `ims_news_reply`;
CREATE TABLE `ims_news_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `media_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_news_reply"
#

/*!40000 ALTER TABLE `ims_news_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_news_reply` ENABLE KEYS */;

#
# Structure for table "ims_profile_fields"
#

DROP TABLE IF EXISTS `ims_profile_fields`;
CREATE TABLE `ims_profile_fields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

#
# Data for table "ims_profile_fields"
#

/*!40000 ALTER TABLE `ims_profile_fields` DISABLE KEYS */;
INSERT INTO `ims_profile_fields` VALUES (1,'realname',1,'真实姓名','',0,1,1,1,0),(2,'nickname',1,'昵称','',1,1,0,1,0),(3,'avatar',1,'头像','',1,0,0,0,0),(4,'qq',1,'QQ号','',0,0,0,1,0),(5,'mobile',1,'手机号码','',0,0,0,0,0),(6,'vip',1,'VIP级别','',0,0,0,0,0),(7,'gender',1,'性别','',0,0,0,0,0),(8,'birthyear',1,'出生生日','',0,0,0,0,0),(9,'constellation',1,'星座','',0,0,0,0,0),(10,'zodiac',1,'生肖','',0,0,0,0,0),(11,'telephone',1,'固定电话','',0,0,0,0,0),(12,'idcard',1,'证件号码','',0,0,0,0,0),(13,'studentid',1,'学号','',0,0,0,0,0),(14,'grade',1,'班级','',0,0,0,0,0),(15,'address',1,'邮寄地址','',0,0,0,0,0),(16,'zipcode',1,'邮编','',0,0,0,0,0),(17,'nationality',1,'国籍','',0,0,0,0,0),(18,'resideprovince',1,'居住地址','',0,0,0,0,0),(19,'graduateschool',1,'毕业学校','',0,0,0,0,0),(20,'company',1,'公司','',0,0,0,0,0),(21,'education',1,'学历','',0,0,0,0,0),(22,'occupation',1,'职业','',0,0,0,0,0),(23,'position',1,'职位','',0,0,0,0,0),(24,'revenue',1,'年收入','',0,0,0,0,0),(25,'affectivestatus',1,'情感状态','',0,0,0,0,0),(26,'lookingfor',1,' 交友目的','',0,0,0,0,0),(27,'bloodtype',1,'血型','',0,0,0,0,0),(28,'height',1,'身高','',0,0,0,0,0),(29,'weight',1,'体重','',0,0,0,0,0),(30,'alipay',1,'支付宝帐号','',0,0,0,0,0),(31,'msn',1,'MSN','',0,0,0,0,0),(32,'email',1,'电子邮箱','',0,0,0,0,0),(33,'taobao',1,'阿里旺旺','',0,0,0,0,0),(34,'site',1,'主页','',0,0,0,0,0),(35,'bio',1,'自我介绍','',0,0,0,0,0),(36,'interest',1,'兴趣爱好','',0,0,0,0,0);
/*!40000 ALTER TABLE `ims_profile_fields` ENABLE KEYS */;

#
# Structure for table "ims_qrcode"
#

DROP TABLE IF EXISTS `ims_qrcode`;
CREATE TABLE `ims_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) unsigned NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) unsigned NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) unsigned NOT NULL,
  `subnum` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qrcid` (`qrcid`),
  KEY `uniacid` (`uniacid`),
  KEY `ticket` (`ticket`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_qrcode"
#

/*!40000 ALTER TABLE `ims_qrcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_qrcode` ENABLE KEYS */;

#
# Structure for table "ims_qrcode_stat"
#

DROP TABLE IF EXISTS `ims_qrcode_stat`;
CREATE TABLE `ims_qrcode_stat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `qid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `qrcid` bigint(20) unsigned NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_qrcode_stat"
#

/*!40000 ALTER TABLE `ims_qrcode_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_qrcode_stat` ENABLE KEYS */;

#
# Structure for table "ims_rule"
#

DROP TABLE IF EXISTS `ims_rule`;
CREATE TABLE `ims_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `containtype` varchar(100) NOT NULL,
  `reply_type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

#
# Data for table "ims_rule"
#

/*!40000 ALTER TABLE `ims_rule` DISABLE KEYS */;
INSERT INTO `ims_rule` VALUES (1,0,'城市天气','userapi',255,1,'',0),(2,0,'百度百科','userapi',255,1,'',0),(3,0,'即时翻译','userapi',255,1,'',0),(4,0,'今日老黄历','userapi',255,1,'',0),(5,0,'看新闻','userapi',255,1,'',0),(6,0,'快递查询','userapi',255,1,'',0),(7,1,'个人中心入口设置','cover',0,1,'',0),(8,1,'微擎团队入口设置','cover',0,1,'',0),(9,2,'东方名苑','cover',0,1,'',0),(10,2,'春满江南','cover',0,1,'',0),(11,2,'123','reply',0,1,'basic,',1),(12,3,'华雅花园','cover',0,1,'',0);
/*!40000 ALTER TABLE `ims_rule` ENABLE KEYS */;

#
# Structure for table "ims_rule_keyword"
#

DROP TABLE IF EXISTS `ims_rule_keyword`;
CREATE TABLE `ims_rule_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_content` (`content`),
  KEY `rid` (`rid`),
  KEY `idx_rid` (`rid`),
  KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

#
# Data for table "ims_rule_keyword"
#

/*!40000 ALTER TABLE `ims_rule_keyword` DISABLE KEYS */;
INSERT INTO `ims_rule_keyword` VALUES (1,1,0,'userapi','^.+天气$',3,255,1),(2,2,0,'userapi','^百科.+$',3,255,1),(3,2,0,'userapi','^定义.+$',3,255,1),(4,3,0,'userapi','^@.+$',3,255,1),(5,4,0,'userapi','日历',1,255,1),(6,4,0,'userapi','万年历',1,255,1),(7,4,0,'userapi','黄历',1,255,1),(8,4,0,'userapi','几号',1,255,1),(9,5,0,'userapi','新闻',1,255,1),(10,6,0,'userapi','^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$',3,255,1),(11,7,1,'cover','个人中心',1,0,1),(12,8,1,'cover','首页',1,0,1),(13,9,2,'cover','r17',1,0,1),(14,10,2,'cover','r18',1,0,1),(16,11,2,'reply','春满江南',1,0,1),(17,11,2,'reply','江南',2,0,1),(18,12,3,'cover','r20',1,0,1);
/*!40000 ALTER TABLE `ims_rule_keyword` ENABLE KEYS */;

#
# Structure for table "ims_site_article"
#

DROP TABLE IF EXISTS `ims_site_article`;
CREATE TABLE `ims_site_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL,
  `ccate` int(10) unsigned NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `click` int(10) unsigned NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL,
  `edittime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_iscommend` (`iscommend`),
  KEY `idx_ishot` (`ishot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_article"
#

/*!40000 ALTER TABLE `ims_site_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_article` ENABLE KEYS */;

#
# Structure for table "ims_site_category"
#

DROP TABLE IF EXISTS `ims_site_category`;
CREATE TABLE `ims_site_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `nid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) unsigned NOT NULL,
  `displayorder` tinyint(3) unsigned NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) unsigned NOT NULL,
  `css` varchar(500) NOT NULL,
  `multiid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_category"
#

/*!40000 ALTER TABLE `ims_site_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_category` ENABLE KEYS */;

#
# Structure for table "ims_site_multi"
#

DROP TABLE IF EXISTS `ims_site_multi`;
CREATE TABLE `ims_site_multi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `bindhost` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `bindhost` (`bindhost`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_multi"
#

/*!40000 ALTER TABLE `ims_site_multi` DISABLE KEYS */;
INSERT INTO `ims_site_multi` VALUES (1,1,'微擎团队',1,'',1,''),(2,2,'智慧小区',2,'',0,''),(3,3,'港龙科技',3,'',0,'');
/*!40000 ALTER TABLE `ims_site_multi` ENABLE KEYS */;

#
# Structure for table "ims_site_nav"
#

DROP TABLE IF EXISTS `ims_site_nav`;
CREATE TABLE `ims_site_nav` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `categoryid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_nav"
#

/*!40000 ALTER TABLE `ims_site_nav` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_nav` ENABLE KEYS */;

#
# Structure for table "ims_site_page"
#

DROP TABLE IF EXISTS `ims_site_page`;
CREATE TABLE `ims_site_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `multipage` longtext NOT NULL,
  `type` tinyint(1) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `goodnum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_page"
#

/*!40000 ALTER TABLE `ims_site_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_page` ENABLE KEYS */;

#
# Structure for table "ims_site_slide"
#

DROP TABLE IF EXISTS `ims_site_slide`;
CREATE TABLE `ims_site_slide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `multiid` (`multiid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_slide"
#

/*!40000 ALTER TABLE `ims_site_slide` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_slide` ENABLE KEYS */;

#
# Structure for table "ims_site_styles"
#

DROP TABLE IF EXISTS `ims_site_styles`;
CREATE TABLE `ims_site_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_styles"
#

/*!40000 ALTER TABLE `ims_site_styles` DISABLE KEYS */;
INSERT INTO `ims_site_styles` VALUES (1,1,1,'微站默认模板_gC5C'),(2,2,1,'微站默认模板_czp5'),(3,3,1,'微站默认模板_U8ki');
/*!40000 ALTER TABLE `ims_site_styles` ENABLE KEYS */;

#
# Structure for table "ims_site_styles_vars"
#

DROP TABLE IF EXISTS `ims_site_styles_vars`;
CREATE TABLE `ims_site_styles_vars` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `templateid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_styles_vars"
#

/*!40000 ALTER TABLE `ims_site_styles_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_site_styles_vars` ENABLE KEYS */;

#
# Structure for table "ims_site_templates"
#

DROP TABLE IF EXISTS `ims_site_templates`;
CREATE TABLE `ims_site_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ims_site_templates"
#

/*!40000 ALTER TABLE `ims_site_templates` DISABLE KEYS */;
INSERT INTO `ims_site_templates` VALUES (1,'default','微站默认模板','','由微擎提供默认微站模板套系','微擎团队','http://we7.cc','1',0);
/*!40000 ALTER TABLE `ims_site_templates` ENABLE KEYS */;

#
# Structure for table "ims_stat_fans"
#

DROP TABLE IF EXISTS `ims_stat_fans`;
CREATE TABLE `ims_stat_fans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `new` int(10) unsigned NOT NULL,
  `cancel` int(10) unsigned NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`,`date`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

#
# Data for table "ims_stat_fans"
#

/*!40000 ALTER TABLE `ims_stat_fans` DISABLE KEYS */;
INSERT INTO `ims_stat_fans` VALUES (1,1,0,0,0,'20170425'),(2,1,0,0,0,'20170424'),(3,1,0,0,0,'20170423'),(4,1,0,0,0,'20170422'),(5,1,0,0,0,'20170421'),(6,1,0,0,0,'20170420'),(7,1,0,0,0,'20170419'),(8,2,0,0,3,'20170707'),(9,2,0,0,3,'20170706'),(10,2,0,0,3,'20170705'),(11,2,0,0,3,'20170704'),(12,2,0,0,3,'20170703'),(13,2,0,0,3,'20170702'),(14,2,0,0,3,'20170701'),(15,2,1,1,1,'20170708'),(16,2,0,0,1,'20170710'),(17,2,0,0,1,'20170709'),(18,2,0,0,1,'20170711'),(19,3,0,0,83,'20170711'),(20,3,0,0,83,'20170710'),(21,3,0,0,83,'20170709'),(22,3,0,0,83,'20170708'),(23,3,0,0,83,'20170707'),(24,3,0,0,0,'20170706'),(25,3,0,0,0,'20170705'),(26,3,0,1,82,'20170712'),(27,3,2,0,84,'20170713'),(28,1,0,0,0,'20170712'),(29,1,0,0,0,'20170711'),(30,1,0,0,0,'20170710'),(31,1,0,0,0,'20170709'),(32,1,0,0,0,'20170708'),(33,1,0,0,0,'20170707'),(34,1,0,0,0,'20170706'),(35,3,1,0,85,'20170714'),(36,3,0,0,85,'20170715'),(37,3,1,0,86,'20170716');
/*!40000 ALTER TABLE `ims_stat_fans` ENABLE KEYS */;

#
# Structure for table "ims_stat_keyword"
#

DROP TABLE IF EXISTS `ims_stat_keyword`;
CREATE TABLE `ims_stat_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ims_stat_keyword"
#

/*!40000 ALTER TABLE `ims_stat_keyword` DISABLE KEYS */;
INSERT INTO `ims_stat_keyword` VALUES (1,2,'11',16,2,1499839934,1499788800);
/*!40000 ALTER TABLE `ims_stat_keyword` ENABLE KEYS */;

#
# Structure for table "ims_stat_msg_history"
#

DROP TABLE IF EXISTS `ims_stat_msg_history`;
CREATE TABLE `ims_stat_msg_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `kid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

#
# Data for table "ims_stat_msg_history"
#

/*!40000 ALTER TABLE `ims_stat_msg_history` DISABLE KEYS */;
INSERT INTO `ims_stat_msg_history` VALUES (1,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:50:\"http://43721.com/app/./index.php?i=2&c=entry&eid=1\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499480804),(2,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(3,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(4,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(5,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(6,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(7,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(8,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(9,2,0,0,'2','','a:4:{s:7:\"content\";s:9:\"123123123\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1213123123),(10,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(11,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(12,2,0,0,'1','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(13,2,0,0,'1111','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(14,2,0,0,'1111','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(15,2,0,0,'1111','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(16,2,0,0,'1111','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(17,2,0,0,'1111','','a:4:{s:7:\"content\";s:14:\"this is a test\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1348831860),(18,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','','unsubscrib',1499505506),(19,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:2:{s:5:\"scene\";N;s:6:\"ticket\";N;}','subscribe',1499505597),(20,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:6:\"首页\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499838910),(21,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:12:\"春满江南\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499838932),(22,2,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839003),(23,1,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839021),(24,1,0,0,'fromUser','','a:4:{s:7:\"content\";s:12:\"测试内容\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839024),(25,1,0,0,'fromUser','','a:4:{s:7:\"content\";s:18:\"测试内容345345\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839034),(26,2,11,16,'osJ2LuBfa5lZpraUbUAKvacGEqOo','reply','a:4:{s:7:\"content\";s:12:\"春满江南\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839154),(27,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:77:\"http://43721.com/app/./index.php?i=2&c=entry&eid=1&XDEBUG_session_START=15873\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839280),(28,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:77:\"http://43721.com/app/./index.php?i=2&c=entry&eid=1&XDEBUG_SESSION_START=14446\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839405),(29,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:6:\"124ASD\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839786),(30,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:6:\"124ASD\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839856),(31,2,0,0,'osJ2LuBfa5lZpraUbUAKvacGEqOo','','a:4:{s:7:\"content\";s:6:\"wfvcgg\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839911),(32,2,11,16,'osJ2LuBfa5lZpraUbUAKvacGEqOo','reply','a:4:{s:7:\"content\";s:12:\"春满江南\";s:8:\"original\";N;s:11:\"redirection\";b:0;s:6:\"source\";N;}','text',1499839933),(33,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','unsubscrib',1499851375),(34,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','a:2:{s:5:\"scene\";N;s:6:\"ticket\";N;}','subscribe',1499851405),(35,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1499851409),(36,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1499851614),(37,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','unsubscrib',1499862758),(38,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','a:2:{s:5:\"scene\";N;s:6:\"ticket\";N;}','subscribe',1499909272),(39,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1499910850),(40,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1499910860),(41,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','a:2:{s:5:\"scene\";N;s:6:\"ticket\";N;}','subscribe',1499910887),(42,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499910912),(43,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499911211),(44,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499912110),(45,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499912686),(46,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499912695),(47,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499912728),(48,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499912847),(49,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499913084),(50,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','unsubscrib',1499924995),(51,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','a:2:{s:5:\"scene\";N;s:6:\"ticket\";N;}','subscribe',1499925007),(52,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1499931524),(53,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1499931540),(54,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1499931547),(55,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','unsubscrib',1499931627),(56,3,0,0,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','','','event',1499997595),(57,3,0,0,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','','','event',1499997705),(58,3,0,0,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','','','event',1499997720),(59,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500083538),(60,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500084077),(61,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500084104),(62,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500084315),(63,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500084355),(64,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500087142),(65,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500088267),(66,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500088394),(67,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500088499),(68,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500099794),(69,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500102190),(70,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500103264),(71,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500107464),(72,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500180718),(73,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500180769),(74,3,0,0,'oNWF5uEH9p47bi_X1sLpv7H9beQo','','a:2:{s:5:\"scene\";N;s:6:\"ticket\";N;}','subscribe',1500193840),(75,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500255997),(76,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500256370),(77,3,0,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','','','event',1500256430),(78,3,0,0,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','','','event',1500256474),(79,3,0,0,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','','','event',1500256802),(80,3,0,0,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','','','event',1500256870),(81,3,0,0,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','','','event',1500257412);
/*!40000 ALTER TABLE `ims_stat_msg_history` ENABLE KEYS */;

#
# Structure for table "ims_stat_rule"
#

DROP TABLE IF EXISTS `ims_stat_rule`;
CREATE TABLE `ims_stat_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  `hit` int(10) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_createtime` (`createtime`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

#
# Data for table "ims_stat_rule"
#

/*!40000 ALTER TABLE `ims_stat_rule` DISABLE KEYS */;
INSERT INTO `ims_stat_rule` VALUES (1,2,0,1,1499480804,1499443200),(2,2,0,1,1348831860,1499443200),(3,2,0,1,1348831860,1499443200),(4,2,0,1,1348831860,1499443200),(5,2,0,1,1348831860,1499443200),(6,2,0,1,1348831860,1499443200),(7,2,0,1,1348831860,1499443200),(8,2,0,1,1348831860,1499443200),(9,2,0,1,1213123123,1499443200),(10,2,0,1,1348831860,1499443200),(11,2,0,1,1348831860,1499443200),(12,2,0,1,1348831860,1499443200),(13,2,0,1,1348831860,1499443200),(14,2,0,1,1348831860,1499443200),(15,2,0,1,1348831860,1499443200),(16,2,0,1,1348831860,1499443200),(17,2,0,1,1348831860,1499443200),(18,2,0,1,1499505597,1499443200),(19,2,0,1,1499838910,1499788800),(20,2,0,1,1499838932,1499788800),(21,2,0,1,1499839003,1499788800),(22,1,0,1,1499839021,1499788800),(23,1,0,1,1499839024,1499788800),(24,1,0,1,1499839034,1499788800),(25,2,11,2,1499839934,1499788800),(26,2,0,1,1499839280,1499788800),(27,2,0,1,1499839405,1499788800),(28,2,0,1,1499839786,1499788800),(29,2,0,1,1499839856,1499788800),(30,2,0,1,1499839911,1499788800),(31,3,0,1,1499851405,1499788800),(32,3,0,1,1499851409,1499788800),(33,3,0,1,1499851614,1499788800),(34,3,0,1,1499909272,1499875200),(35,3,0,1,1499910850,1499875200),(36,3,0,1,1499910860,1499875200),(37,3,0,1,1499910887,1499875200),(38,3,0,1,1499910912,1499875200),(39,3,0,1,1499911211,1499875200),(40,3,0,1,1499912110,1499875200),(41,3,0,1,1499912686,1499875200),(42,3,0,1,1499912695,1499875200),(43,3,0,1,1499912728,1499875200),(44,3,0,1,1499912847,1499875200),(45,3,0,1,1499913084,1499875200),(46,3,0,1,1499925007,1499875200),(47,3,0,1,1499931524,1499875200),(48,3,0,1,1499931540,1499875200),(49,3,0,1,1499931547,1499875200),(50,3,0,1,1499997595,1499961600),(51,3,0,1,1499997705,1499961600),(52,3,0,1,1499997720,1499961600),(53,3,0,1,1500083538,1500048000),(54,3,0,1,1500084077,1500048000),(55,3,0,1,1500084104,1500048000),(56,3,0,1,1500084315,1500048000),(57,3,0,1,1500084355,1500048000),(58,3,0,1,1500087142,1500048000),(59,3,0,1,1500088267,1500048000),(60,3,0,1,1500088394,1500048000),(61,3,0,1,1500088499,1500048000),(62,3,0,1,1500099794,1500048000),(63,3,0,1,1500102190,1500048000),(64,3,0,1,1500103264,1500048000),(65,3,0,1,1500107464,1500048000),(66,3,0,1,1500180718,1500134400),(67,3,0,1,1500180769,1500134400),(68,3,0,1,1500193840,1500134400),(69,3,0,1,1500255997,1500220800),(70,3,0,1,1500256370,1500220800),(71,3,0,1,1500256430,1500220800),(72,3,0,1,1500256474,1500220800),(73,3,0,1,1500256802,1500220800),(74,3,0,1,1500256870,1500220800),(75,3,0,1,1500257412,1500220800);
/*!40000 ALTER TABLE `ims_stat_rule` ENABLE KEYS */;

#
# Structure for table "ims_uni_account"
#

DROP TABLE IF EXISTS `ims_uni_account`;
CREATE TABLE `ims_uni_account` (
  `uniacid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) unsigned NOT NULL,
  `rank` int(10) DEFAULT NULL,
  `title_initial` varchar(1) NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_account"
#

/*!40000 ALTER TABLE `ims_uni_account` DISABLE KEYS */;
INSERT INTO `ims_uni_account` VALUES (1,-1,'微擎团队','一个朝气蓬勃的团队',1,NULL,'W'),(2,0,'智慧小区','智慧小区物业',2,NULL,''),(3,0,'港龙科技','港龙科技',3,NULL,'');
/*!40000 ALTER TABLE `ims_uni_account` ENABLE KEYS */;

#
# Structure for table "ims_uni_account_group"
#

DROP TABLE IF EXISTS `ims_uni_account_group`;
CREATE TABLE `ims_uni_account_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `groupid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_account_group"
#

/*!40000 ALTER TABLE `ims_uni_account_group` DISABLE KEYS */;
INSERT INTO `ims_uni_account_group` VALUES (1,3,-1),(2,3,1);
/*!40000 ALTER TABLE `ims_uni_account_group` ENABLE KEYS */;

#
# Structure for table "ims_uni_account_menus"
#

DROP TABLE IF EXISTS `ims_uni_account_menus`;
CREATE TABLE `ims_uni_account_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `menuid` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) unsigned NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `isdeleted` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `menuid` (`menuid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_account_menus"
#

/*!40000 ALTER TABLE `ims_uni_account_menus` DISABLE KEYS */;
INSERT INTO `ims_uni_account_menus` VALUES (1,2,0,1,'默认菜单_1',0,-1,0,'','YToyOntzOjk6Im1hdGNocnVsZSI7YTowOnt9czo0OiJ0eXBlIjtpOjE7fQ==',1,0,0),(2,3,0,1,'产品中心',0,-1,0,'','YToyOntzOjY6ImJ1dHRvbiI7YToyOntpOjA7YTozOntzOjQ6Im5hbWUiO3M6MTI6IuaIkeeahOWwj+WMuiI7czo0OiJ0eXBlIjtzOjQ6InZpZXciO3M6MzoidXJsIjtzOjIzMToiaHR0cHM6Ly9vcGVuLndlaXhpbi5xcS5jb20vY29ubmVjdC9vYXV0aDIvYXV0aG9yaXplP2FwcGlkPXd4M2UzZThlZjA3NWExMDdmYyZyZWRpcmVjdF91cmk9aHR0cCUzQSUyRiUyRjQzNzIxLmNvbSUyRmFwcCUyRi4lMkZpbmRleC5waHAlM0ZpJTNEMyUyNmMlM0RlbnRyeSUyNmVpZCUzRDEmcmVzcG9uc2VfdHlwZT1jb2RlJnNjb3BlPXNuc2FwaV9iYXNlJnN0YXRlPXdlN3NpZC0jd2VjaGF0X3JlZGlyZWN0Ijt9aToxO2E6Mzp7czo0OiJuYW1lIjtzOjEyOiLlhbPkuo7miJHku6wiO3M6NDoidHlwZSI7czo0OiJ2aWV3IjtzOjM6InVybCI7czoyMToiaHR0cDovL3poankuNDM3MjEuY29tIjt9fXM6OToibWF0Y2hydWxlIjthOjA6e319',1,1499903379,0);
/*!40000 ALTER TABLE `ims_uni_account_menus` ENABLE KEYS */;

#
# Structure for table "ims_uni_account_modules"
#

DROP TABLE IF EXISTS `ims_uni_account_modules`;
CREATE TABLE `ims_uni_account_modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL,
  `settings` text NOT NULL,
  `shortcut` tinyint(1) unsigned NOT NULL,
  `displayorder` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_module` (`module`),
  KEY `idx_uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_account_modules"
#

/*!40000 ALTER TABLE `ims_uni_account_modules` DISABLE KEYS */;
INSERT INTO `ims_uni_account_modules` VALUES (1,1,'xfeng_community',1,'',0,0),(2,2,'xfeng_community',1,'',0,0),(3,3,'xfeng_community',1,'',0,0);
/*!40000 ALTER TABLE `ims_uni_account_modules` ENABLE KEYS */;

#
# Structure for table "ims_uni_account_users"
#

DROP TABLE IF EXISTS `ims_uni_account_users`;
CREATE TABLE `ims_uni_account_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_memberid` (`uid`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_account_users"
#

/*!40000 ALTER TABLE `ims_uni_account_users` DISABLE KEYS */;
INSERT INTO `ims_uni_account_users` VALUES (1,2,2,'operator',0),(2,3,3,'operator',0),(3,3,4,'operator',0);
/*!40000 ALTER TABLE `ims_uni_account_users` ENABLE KEYS */;

#
# Structure for table "ims_uni_group"
#

DROP TABLE IF EXISTS `ims_uni_group`;
CREATE TABLE `ims_uni_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `modules` varchar(15000) NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_group"
#

/*!40000 ALTER TABLE `ims_uni_group` DISABLE KEYS */;
INSERT INTO `ims_uni_group` VALUES (1,'体验套餐服务','a:1:{i:0;s:15:\"xfeng_community\";}','N;',0);
/*!40000 ALTER TABLE `ims_uni_group` ENABLE KEYS */;

#
# Structure for table "ims_uni_settings"
#

DROP TABLE IF EXISTS `ims_uni_settings`;
CREATE TABLE `ims_uni_settings` (
  `uniacid` int(10) unsigned NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) unsigned NOT NULL,
  `uc` varchar(500) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `payment` varchar(2000) NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) unsigned DEFAULT NULL,
  `sync` tinyint(3) unsigned NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(1000) NOT NULL,
  `grouplevel` tinyint(3) unsigned NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) unsigned NOT NULL,
  `coupon_type` tinyint(3) unsigned NOT NULL,
  `menuset` text NOT NULL,
  `shortcuts` text NOT NULL,
  PRIMARY KEY (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_settings"
#

/*!40000 ALTER TABLE `ims_uni_settings` DISABLE KEYS */;
INSERT INTO `ims_uni_settings` VALUES (1,'a:3:{s:8:\"focusreg\";i:0;s:4:\"item\";s:5:\"email\";s:4:\"type\";s:8:\"password\";}','a:2:{s:6:\"status\";s:1:\"0\";s:7:\"account\";s:1:\"0\";}',0,'a:1:{s:6:\"status\";i:0;}','a:1:{s:3:\"sms\";a:2:{s:7:\"balance\";i:0;s:9:\"signature\";s:0:\"\";}}','a:5:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}s:7:\"credit3\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit4\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}s:7:\"credit5\";a:2:{s:5:\"title\";s:0:\"\";s:7:\"enabled\";i:0;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','a:4:{s:6:\"credit\";a:1:{s:6:\"switch\";b:0;}s:6:\"alipay\";a:4:{s:6:\"switch\";b:0;s:7:\"account\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:6:\"secret\";s:0:\"\";}s:6:\"wechat\";a:5:{s:6:\"switch\";b:0;s:7:\"account\";b:0;s:7:\"signkey\";s:0:\"\";s:7:\"partner\";s:0:\"\";s:3:\"key\";s:0:\"\";}s:8:\"delivery\";a:1:{s:6:\"switch\";b:0;}}','',1,0,'','',0,'',0,0,'',''),(2,'','',0,'','','a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','','',2,0,'','',0,'',0,0,'',''),(3,'','',0,'','','a:2:{s:7:\"credit1\";a:2:{s:5:\"title\";s:6:\"积分\";s:7:\"enabled\";i:1;}s:7:\"credit2\";a:2:{s:5:\"title\";s:6:\"余额\";s:7:\"enabled\";i:1;}}','a:2:{s:8:\"activity\";s:7:\"credit1\";s:8:\"currency\";s:7:\"credit2\";}','','','','','',3,0,'','',0,'',0,0,'','');
/*!40000 ALTER TABLE `ims_uni_settings` ENABLE KEYS */;

#
# Structure for table "ims_uni_verifycode"
#

DROP TABLE IF EXISTS `ims_uni_verifycode`;
CREATE TABLE `ims_uni_verifycode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_uni_verifycode"
#

/*!40000 ALTER TABLE `ims_uni_verifycode` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_uni_verifycode` ENABLE KEYS */;

#
# Structure for table "ims_userapi_cache"
#

DROP TABLE IF EXISTS `ims_userapi_cache`;
CREATE TABLE `ims_userapi_cache` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_userapi_cache"
#

/*!40000 ALTER TABLE `ims_userapi_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_userapi_cache` ENABLE KEYS */;

#
# Structure for table "ims_userapi_reply"
#

DROP TABLE IF EXISTS `ims_userapi_reply`;
CREATE TABLE `ims_userapi_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

#
# Data for table "ims_userapi_reply"
#

/*!40000 ALTER TABLE `ims_userapi_reply` DISABLE KEYS */;
INSERT INTO `ims_userapi_reply` VALUES (1,1,'\"城市名+天气\", 如: \"北京天气\"','weather.php','','',0),(2,2,'\"百科+查询内容\" 或 \"定义+查询内容\", 如: \"百科姚明\", \"定义自行车\"','baike.php','','',0),(3,3,'\"@查询内容(中文或英文)\"','translate.php','','',0),(4,4,'\"日历\", \"万年历\", \"黄历\"或\"几号\"','calendar.php','','',0),(5,5,'\"新闻\"','news.php','','',0),(6,6,'\"快递+单号\", 如: \"申通1200041125\"','express.php','','',0);
/*!40000 ALTER TABLE `ims_userapi_reply` ENABLE KEYS */;

#
# Structure for table "ims_users"
#

DROP TABLE IF EXISTS `ims_users`;
CREATE TABLE `ims_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `groupid` int(10) unsigned NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) unsigned NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "ims_users"
#

/*!40000 ALTER TABLE `ims_users` DISABLE KEYS */;
INSERT INTO `ims_users` VALUES (1,0,'admin','cc40fc2f43c9e97d1157c1237823501ce0b50c41','9d3b041d',0,0,1493006087,'',1500256190,'110.53.132.231','',0,0),(2,1,'asdf','6499e33304fe64891e7c66e47cacabcd6047f811','lLb3Ey2J',0,2,1499842117,'42.49.99.214',1499842117,'42.49.99.214','',0,0),(4,1,'hyhy','11249b49ae820a8039f208b64bee140d599c8099','vgYHeRAR',0,2,1500088849,'110.53.132.231',1500259171,'127.0.0.1','',0,0);
/*!40000 ALTER TABLE `ims_users` ENABLE KEYS */;

#
# Structure for table "ims_users_failed_login"
#

DROP TABLE IF EXISTS `ims_users_failed_login`;
CREATE TABLE `ims_users_failed_login` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) unsigned NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ip_username` (`ip`,`username`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

#
# Data for table "ims_users_failed_login"
#

/*!40000 ALTER TABLE `ims_users_failed_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_failed_login` ENABLE KEYS */;

#
# Structure for table "ims_users_group"
#

DROP TABLE IF EXISTS `ims_users_group`;
CREATE TABLE `ims_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) unsigned NOT NULL,
  `maxsubaccount` int(10) unsigned NOT NULL,
  `timelimit` int(10) unsigned NOT NULL,
  `maxwxapp` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_users_group"
#

/*!40000 ALTER TABLE `ims_users_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_group` ENABLE KEYS */;

#
# Structure for table "ims_users_invitation"
#

DROP TABLE IF EXISTS `ims_users_invitation`;
CREATE TABLE `ims_users_invitation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) unsigned NOT NULL,
  `inviteuid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_users_invitation"
#

/*!40000 ALTER TABLE `ims_users_invitation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_invitation` ENABLE KEYS */;

#
# Structure for table "ims_users_permission"
#

DROP TABLE IF EXISTS `ims_users_permission`;
CREATE TABLE `ims_users_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(30) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "ims_users_permission"
#

/*!40000 ALTER TABLE `ims_users_permission` DISABLE KEYS */;
INSERT INTO `ims_users_permission` VALUES (1,2,2,'xfeng_community','xfeng_community_menu_manage',''),(2,3,3,'xfeng_community','xfeng_community_menu_manage',''),(3,3,4,'xfeng_community','xfeng_community_menu_manage','');
/*!40000 ALTER TABLE `ims_users_permission` ENABLE KEYS */;

#
# Structure for table "ims_users_profile"
#

DROP TABLE IF EXISTS `ims_users_profile`;
CREATE TABLE `ims_users_profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `edittime` int(10) NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) unsigned NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) unsigned NOT NULL,
  `birthmonth` tinyint(3) unsigned NOT NULL,
  `birthday` tinyint(3) unsigned NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_users_profile"
#

/*!40000 ALTER TABLE `ims_users_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_users_profile` ENABLE KEYS */;

#
# Structure for table "ims_video_reply"
#

DROP TABLE IF EXISTS `ims_video_reply`;
CREATE TABLE `ims_video_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_video_reply"
#

/*!40000 ALTER TABLE `ims_video_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_video_reply` ENABLE KEYS */;

#
# Structure for table "ims_voice_reply"
#

DROP TABLE IF EXISTS `ims_voice_reply`;
CREATE TABLE `ims_voice_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_voice_reply"
#

/*!40000 ALTER TABLE `ims_voice_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_voice_reply` ENABLE KEYS */;

#
# Structure for table "ims_wechat_attachment"
#

DROP TABLE IF EXISTS `ims_wechat_attachment`;
CREATE TABLE `ims_wechat_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `acid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `media_id` (`media_id`),
  KEY `acid` (`acid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_wechat_attachment"
#

/*!40000 ALTER TABLE `ims_wechat_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wechat_attachment` ENABLE KEYS */;

#
# Structure for table "ims_wechat_news"
#

DROP TABLE IF EXISTS `ims_wechat_news`;
CREATE TABLE `ims_wechat_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned DEFAULT NULL,
  `attach_id` int(10) unsigned NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) unsigned NOT NULL,
  `url` varchar(200) NOT NULL,
  `displayorder` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uniacid` (`uniacid`),
  KEY `attach_id` (`attach_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_wechat_news"
#

/*!40000 ALTER TABLE `ims_wechat_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wechat_news` ENABLE KEYS */;

#
# Structure for table "ims_wxapp_versions"
#

DROP TABLE IF EXISTS `ims_wxapp_versions`;
CREATE TABLE `ims_wxapp_versions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `multiid` int(10) unsigned NOT NULL,
  `version` varchar(10) NOT NULL,
  `modules` varchar(1000) NOT NULL,
  `design_method` tinyint(1) NOT NULL,
  `template` int(10) NOT NULL,
  `redirect` varchar(300) NOT NULL,
  `quickmenu` varchar(2500) NOT NULL,
  `createtime` int(10) NOT NULL,
  `connection` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `version` (`version`),
  KEY `uniacid` (`uniacid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_wxapp_versions"
#

/*!40000 ALTER TABLE `ims_wxapp_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxapp_versions` ENABLE KEYS */;

#
# Structure for table "ims_wxcard_reply"
#

DROP TABLE IF EXISTS `ims_wxcard_reply`;
CREATE TABLE `ims_wxcard_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rid` int(10) unsigned NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_wxcard_reply"
#

/*!40000 ALTER TABLE `ims_wxcard_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_wxcard_reply` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_activity"
#

DROP TABLE IF EXISTS `ims_xcommunity_activity`;
CREATE TABLE `ims_xcommunity_activity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `regionid` text NOT NULL,
  `starttime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `enddate` varchar(30) NOT NULL,
  `picurl` varchar(1000) NOT NULL,
  `number` int(11) NOT NULL DEFAULT '1',
  `content` varchar(2000) NOT NULL,
  `status` int(1) NOT NULL COMMENT '1置顶',
  `price` decimal(12,2) NOT NULL,
  `createtime` int(11) unsigned NOT NULL,
  `resnumber` int(11) unsigned NOT NULL COMMENT '报名人数',
  `uid` int(10) unsigned NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小区活动表';

#
# Data for table "ims_xcommunity_activity"
#

/*!40000 ALTER TABLE `ims_xcommunity_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_activity` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_alipayment"
#

DROP TABLE IF EXISTS `ims_xcommunity_alipayment`;
CREATE TABLE `ims_xcommunity_alipayment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL COMMENT '公众号ID',
  `pid` int(11) NOT NULL,
  `account` varchar(50) NOT NULL COMMENT '支付宝账号',
  `partner` varchar(50) NOT NULL COMMENT '合作者身份',
  `secret` varchar(50) NOT NULL COMMENT '校验密钥',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='独立支付宝配置';

#
# Data for table "ims_xcommunity_alipayment"
#

/*!40000 ALTER TABLE `ims_xcommunity_alipayment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_alipayment` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_announcement"
#

DROP TABLE IF EXISTS `ims_xcommunity_announcement`;
CREATE TABLE `ims_xcommunity_announcement` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `regionid` text,
  `pid` int(10) unsigned NOT NULL COMMENT '物业ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `createtime` int(10) unsigned NOT NULL,
  `starttime` int(11) unsigned NOT NULL COMMENT '开始时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '结束时间',
  `status` tinyint(1) NOT NULL COMMENT '状态 1禁用，2启用',
  `enable` tinyint(1) NOT NULL COMMENT '模板类型',
  `datetime` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL COMMENT '通知范围',
  `reason` text,
  `remark` varchar(100) NOT NULL COMMENT '通知备注',
  `uid` int(11) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='公告管理';

#
# Data for table "ims_xcommunity_announcement"
#

/*!40000 ALTER TABLE `ims_xcommunity_announcement` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_announcement` VALUES (17,3,'a:1:{i:0;s:2:\"20\";}',0,'楼盘全部售罄','','',1500080587,0,0,2,0,'','','<h3 style=\"outline: none; padding: 0px; margin: 0px; list-style: none; font-size: 16px; height: 26px; line-height: 26px; color: rgb(51, 51, 51); font-family: 微软雅黑, 微软雅黑, \"Microsoft Yahei\", \"雅黑\\9 \", Arial; white-space: normal;\"><a href=\"http://news.xt.fang.com/house/2713053378_2756622.htm\" title=\"天元华雅花园目前已全部售馨\" target=\"_blank\" style=\"outline: none; padding: 0px; margin: 0px; list-style: none; text-decoration-line: none; color: rgb(51, 51, 51);\">天元华雅花园目前已全部售馨</a></h3>','',0,'湖南省','湘潭市','岳塘区');
/*!40000 ALTER TABLE `ims_xcommunity_announcement` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_building_device"
#

DROP TABLE IF EXISTS `ims_xcommunity_building_device`;
CREATE TABLE `ims_xcommunity_building_device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0',
  `regionid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `unit` varchar(30) NOT NULL,
  `api_key` varchar(100) NOT NULL,
  `device_code` varchar(100) NOT NULL,
  `lock_code` varchar(11) NOT NULL,
  `type` int(1) NOT NULL,
  `openurl` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ims_xcommunity_building_device"
#

/*!40000 ALTER TABLE `ims_xcommunity_building_device` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_building_device` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_carpool"
#

DROP TABLE IF EXISTS `ims_xcommunity_carpool`;
CREATE TABLE `ims_xcommunity_carpool` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `seat` int(2) unsigned NOT NULL COMMENT '座位',
  `sprice` int(10) unsigned NOT NULL COMMENT '价格',
  `contact` varchar(50) NOT NULL COMMENT '联系人',
  `mobile` varchar(13) NOT NULL COMMENT '电话',
  `openid` varchar(50) NOT NULL,
  `start_position` varchar(100) NOT NULL COMMENT '出发地',
  `end_position` varchar(100) NOT NULL COMMENT '目的地',
  `gotime` varchar(10) NOT NULL COMMENT '出发时间',
  `backtime` varchar(10) NOT NULL COMMENT '返回时间',
  `createtime` int(10) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL COMMENT '所属小区',
  `type` int(11) NOT NULL COMMENT '类型1司机，2乘客',
  `thumb` varchar(2000) NOT NULL COMMENT '图片',
  `black` int(1) NOT NULL COMMENT '1设置黑名单',
  `enable` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='拼车表';

#
# Data for table "ims_xcommunity_carpool"
#

/*!40000 ALTER TABLE `ims_xcommunity_carpool` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_carpool` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_cart"
#

DROP TABLE IF EXISTS `ims_xcommunity_cart`;
CREATE TABLE `ims_xcommunity_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `goodsid` int(11) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `marketprice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='购物车表';

#
# Data for table "ims_xcommunity_cart"
#

/*!40000 ALTER TABLE `ims_xcommunity_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_cart` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_category"
#

DROP TABLE IF EXISTS `ims_xcommunity_category`;
CREATE TABLE `ims_xcommunity_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned DEFAULT NULL,
  `parentid` int(10) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL COMMENT '服务项目',
  `price` decimal(12,2) NOT NULL COMMENT '服务价格',
  `description` text NOT NULL COMMENT '分类描述',
  `gtime` varchar(50) NOT NULL COMMENT '服务工时',
  `thumb` varchar(100) NOT NULL COMMENT '分类图片',
  `displayorder` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否开启',
  `type` int(10) unsigned NOT NULL COMMENT '1家政，2报修，3投诉，4二手，5超市，6商家',
  `regionid` int(11) DEFAULT NULL,
  `isshow` int(1) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='类型表';

#
# Data for table "ims_xcommunity_category"
#

/*!40000 ALTER TABLE `ims_xcommunity_category` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_category` VALUES (24,2,0,'灯损坏',0.00,'灯损坏','','',1,1,2,NULL,NULL,''),(25,3,0,'物业服务',0.00,'针对服务的建议','','',1,1,3,NULL,1,''),(26,3,0,'小区环境',0.00,'小区环境','','',2,1,3,NULL,1,''),(27,3,0,'公共设施',0.00,'公共设施','','',3,1,3,NULL,NULL,''),(28,3,0,'其它建议',0.00,'其它建议','','',4,1,3,NULL,NULL,''),(29,3,0,'照明',0.00,'照明','','',1,1,2,NULL,NULL,''),(30,3,0,'门锁',0.00,'门锁','','',2,1,2,NULL,NULL,''),(31,3,0,'器材',0.00,'器材','','',3,1,2,NULL,NULL,'');
/*!40000 ALTER TABLE `ims_xcommunity_category` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_cost"
#

DROP TABLE IF EXISTS `ims_xcommunity_cost`;
CREATE TABLE `ims_xcommunity_cost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `costtime` varchar(30) NOT NULL COMMENT '费用时间',
  `enable` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=237 DEFAULT CHARSET=utf8 COMMENT='物业费用时间表';

#
# Data for table "ims_xcommunity_cost"
#

/*!40000 ALTER TABLE `ims_xcommunity_cost` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_cost` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_cost_list"
#

DROP TABLE IF EXISTS `ims_xcommunity_cost_list`;
CREATE TABLE `ims_xcommunity_cost_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '费用时间id',
  `mobile` varchar(13) NOT NULL,
  `username` varchar(30) NOT NULL,
  `homenumber` varchar(30) NOT NULL,
  `costtime` varchar(30) NOT NULL,
  `propertyfee` varchar(50) NOT NULL,
  `otherfee` varchar(1000) NOT NULL,
  `total` varchar(10) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `status` varchar(3) NOT NULL COMMENT '是代表缴费，否代表未缴费',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `fee` varchar(500) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6708 DEFAULT CHARSET=utf8 COMMENT='物业费表';

#
# Data for table "ims_xcommunity_cost_list"
#

/*!40000 ALTER TABLE `ims_xcommunity_cost_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_cost_list` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_dp"
#

DROP TABLE IF EXISTS `ims_xcommunity_dp`;
CREATE TABLE `ims_xcommunity_dp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL,
  `regionid` text NOT NULL,
  `sjname` varchar(30) NOT NULL,
  `picurl` varchar(1000) NOT NULL,
  `contactname` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(150) NOT NULL,
  `shopdesc` varchar(500) NOT NULL,
  `businesstime` varchar(50) NOT NULL,
  `businessurl` varchar(100) NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `lat` varchar(20) NOT NULL,
  `lng` varchar(20) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `displayorder` int(11) DEFAULT NULL,
  `price` int(10) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `instruction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商家店铺表';

#
# Data for table "ims_xcommunity_dp"
#

/*!40000 ALTER TABLE `ims_xcommunity_dp` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_dp` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_fled"
#

DROP TABLE IF EXISTS `ims_xcommunity_fled`;
CREATE TABLE `ims_xcommunity_fled` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `title` varchar(20) NOT NULL,
  `rolex` varchar(30) NOT NULL,
  `category` int(11) NOT NULL,
  `zprice` int(10) NOT NULL,
  `realname` varchar(18) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `description` varchar(100) NOT NULL,
  `regionid` int(10) NOT NULL,
  `createtime` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `images` text,
  `black` int(1) NOT NULL COMMENT '1设置黑名单',
  `enable` int(1) DEFAULT NULL,
  `yprice` int(10) DEFAULT NULL,
  `cate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='二手管理';

#
# Data for table "ims_xcommunity_fled"
#

/*!40000 ALTER TABLE `ims_xcommunity_fled` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_fled` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_goods"
#

DROP TABLE IF EXISTS `ims_xcommunity_goods`;
CREATE TABLE `ims_xcommunity_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `pcate` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `displayorder` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `thumb` varchar(255) DEFAULT '',
  `thumb_url` text,
  `unit` varchar(5) NOT NULL DEFAULT '',
  `content` text NOT NULL COMMENT '抢购详情',
  `description` text NOT NULL COMMENT '购买须知',
  `marketprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '销售价',
  `productprice` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `total` int(10) NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL,
  `credit` int(11) DEFAULT '0',
  `isrecommand` int(11) DEFAULT '0',
  `type` int(11) DEFAULT '0' COMMENT '1超市2商家',
  `dpid` int(11) DEFAULT '0' COMMENT '商家店铺id',
  `sold` int(11) DEFAULT '0' COMMENT '已售多少份',
  `uid` int(11) NOT NULL,
  `regionid` text,
  `starttime` int(11) DEFAULT NULL,
  `endtime` int(11) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  `child` int(11) DEFAULT NULL,
  `instruction` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='商品表';

#
# Data for table "ims_xcommunity_goods"
#

/*!40000 ALTER TABLE `ims_xcommunity_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_goods` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_homemaking"
#

DROP TABLE IF EXISTS `ims_xcommunity_homemaking`;
CREATE TABLE `ims_xcommunity_homemaking` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `category` int(11) NOT NULL COMMENT '服务类型',
  `servicetime` varchar(30) NOT NULL COMMENT '服务时间',
  `realname` varchar(30) NOT NULL COMMENT '姓名',
  `mobile` varchar(15) NOT NULL COMMENT '电话',
  `address` varchar(100) DEFAULT NULL,
  `content` varchar(500) NOT NULL COMMENT '说明',
  `status` int(10) unsigned NOT NULL COMMENT '0未完成,1已完成',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='家政服务表';

#
# Data for table "ims_xcommunity_homemaking"
#


#
# Structure for table "ims_xcommunity_houselease"
#

DROP TABLE IF EXISTS `ims_xcommunity_houselease`;
CREATE TABLE `ims_xcommunity_houselease` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(50) NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `category` int(11) NOT NULL COMMENT '1出租，2求租，3出售，4求购',
  `way` varchar(20) NOT NULL COMMENT '出租方式',
  `model_room` int(11) NOT NULL,
  `model_hall` int(11) NOT NULL,
  `model_toilet` int(11) NOT NULL,
  `model_area` varchar(15) NOT NULL COMMENT '房屋面积',
  `floor_layer` int(11) NOT NULL,
  `floor_number` int(11) NOT NULL,
  `fitment` varchar(40) NOT NULL COMMENT '装修情况',
  `house` varchar(40) NOT NULL COMMENT '住宅类别',
  `allocation` varchar(500) NOT NULL COMMENT '房屋配置',
  `price_way` varchar(30) NOT NULL COMMENT '押金方式',
  `price` int(10) unsigned NOT NULL COMMENT '租金',
  `checktime` varchar(30) NOT NULL COMMENT '入住时间',
  `title` varchar(30) NOT NULL COMMENT '标题',
  `realname` varchar(30) NOT NULL COMMENT '姓名',
  `mobile` varchar(15) NOT NULL COMMENT '电话',
  `content` varchar(500) NOT NULL COMMENT '说明',
  `status` int(10) unsigned NOT NULL COMMENT '0未成交,1已成交',
  `createtime` int(10) unsigned NOT NULL,
  `images` text,
  `enable` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='房屋租赁表';

#
# Data for table "ims_xcommunity_houselease"
#


#
# Structure for table "ims_xcommunity_images"
#

DROP TABLE IF EXISTS `ims_xcommunity_images`;
CREATE TABLE `ims_xcommunity_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) DEFAULT NULL,
  `file` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=120 DEFAULT CHARSET=utf8 COMMENT='图片表';

#
# Data for table "ims_xcommunity_images"
#

/*!40000 ALTER TABLE `ims_xcommunity_images` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_images` VALUES (115,'http://43721.com/attachment/images/bl149984087296206.jpg',NULL),(116,'http://43721.com/attachment/images/bl149984088733799.jpg',NULL),(117,'http://43721.com/attachment/images/bl150008373722384.jpg',NULL),(118,'http://43721.com/attachment/images/bl150008429062121.jpg',NULL),(119,'http://43721.com/attachment/images/bl150025680165538.jpg',NULL);
/*!40000 ALTER TABLE `ims_xcommunity_images` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_member"
#

DROP TABLE IF EXISTS `ims_xcommunity_member`;
CREATE TABLE `ims_xcommunity_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL COMMENT '小区编号',
  `memberid` int(10) NOT NULL,
  `openid` varchar(50) DEFAULT NULL,
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `mobile` varchar(15) NOT NULL COMMENT '手机号',
  `regionname` varchar(50) NOT NULL COMMENT '小区名称',
  `address` varchar(100) NOT NULL COMMENT '楼栋门牌',
  `remark` varchar(1000) NOT NULL COMMENT '备注',
  `status` tinyint(1) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '业主身份',
  `createtime` int(10) unsigned NOT NULL,
  `build` varchar(10) DEFAULT NULL,
  `unit` int(5) DEFAULT NULL,
  `room` varchar(10) DEFAULT NULL,
  `enable` int(1) DEFAULT NULL,
  `open_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户管理';

#
# Data for table "ims_xcommunity_member"
#

/*!40000 ALTER TABLE `ims_xcommunity_member` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_member` VALUES (1,3,20,0,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','李浪','13807324757','','1栋1单元101室','',1,0,1500088476,'1',1,'',1,0),(2,3,20,2,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','黄鼎','15273279515','','1栋1单元101室','',1,0,1500088532,'1',1,'',1,0),(3,3,20,5,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','倪能武','18670203555','','1栋1单元101室','',1,0,1500256603,'1',1,'',1,0);
/*!40000 ALTER TABLE `ims_xcommunity_member` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_member_address"
#

DROP TABLE IF EXISTS `ims_xcommunity_member_address`;
CREATE TABLE `ims_xcommunity_member_address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) unsigned NOT NULL DEFAULT '0',
  `regionid` int(10) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `realname` varchar(15) NOT NULL,
  `build` varchar(50) DEFAULT NULL,
  `unit` int(10) DEFAULT NULL,
  `room` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ims_xcommunity_member_address"
#

/*!40000 ALTER TABLE `ims_xcommunity_member_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_member_address` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_menu"
#

DROP TABLE IF EXISTS `ims_xcommunity_menu`;
CREATE TABLE `ims_xcommunity_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `pcate` int(10) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '菜单标题',
  `url` varchar(1000) NOT NULL COMMENT '菜单链接',
  `do` varchar(20) NOT NULL COMMENT '动作',
  `method` varchar(20) DEFAULT NULL,
  `xcommunity_menu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15791 DEFAULT CHARSET=utf8 COMMENT='后台菜单管理';

#
# Data for table "ims_xcommunity_menu"
#

INSERT INTO `ims_xcommunity_menu` VALUES (1,0,0,'基础设置','./index.php?c=site&a=entry&do=manage&method=manage&m=xfeng_community','manage','manage',NULL),(2,0,0,'物业服务','./index.php?c=site&a=entry&do=fun&method=fun&m=xfeng_community','fun','fun',NULL),(3,0,0,'小区超市','./index.php?c=site&a=entry&do=shop&method=shop&m=xfeng_community','shop','shop',NULL),(4,0,0,'小区商家','./index.php?c=site&a=entry&do=seller&method=seller&m=xfeng_community','seller','seller',NULL),(5,0,0,'分权系统','./index.php?c=site&a=entry&do=perm&method=perm&m=xfeng_community','perm','perm',NULL),(6,0,0,'云服务','./index.php?c=site&a=entry&do=system&method=system&m=xfeng_community','system','system',NULL),(15750,0,1,'小区设置','./index.php?c=site&a=entry&do=set&m=xfeng_community','set','manage',NULL),(15751,0,1,'通知管理','./index.php?c=site&a=entry&op=list&do=notice&m=xfeng_community','notice','manage',NULL),(15752,0,1,'短信设置','./index.php?c=site&a=entry&do=sms&m=xfeng_community','sms','manage',NULL),(15753,0,1,'菜单设置','./index.php?c=site&a=entry&op=list&do=nav&m=xfeng_community','nav','manage',NULL),(15754,0,1,'模板设置','./index.php?c=site&a=entry&op=list&do=style&m=xfeng_community','style','manage',NULL),(15755,0,1,'幻灯管理','./index.php?c=site&a=entry&op=list&do=slide&m=xfeng_community','slide','manage',NULL),(15756,0,1,'二维码管理','./index.php?c=site&a=entry&op=list&do=qr&m=xfeng_community','qr','manage',NULL),(15757,0,1,'打印机设置','./index.php?c=site&a=entry&op=list&do=print&m=xfeng_community','print','manage',NULL),(15758,0,1,'模板消息设置','./index.php?c=site&a=entry&do=tpl&m=xfeng_community','tpl','manage',NULL),(15759,0,1,'支付方式设置','./index.php?c=site&a=entry&do=pay&m=xfeng_community','pay','manage',NULL),(15760,0,1,'独立支付接口','./index.php?c=site&a=entry&do=payapi&m=xfeng_community','payapi','manage',NULL),(15761,0,2,'小区管理','./index.php?c=site&a=entry&op=list&do=region&m=xfeng_community','region','fun',NULL),(15762,0,2,'房号管理','./index.php?c=site&a=entry&op=list&do=room&m=xfeng_community','room','fun',NULL),(15763,0,2,'物业管理','./index.php?c=site&a=entry&op=list&do=property&m=xfeng_community','property','fun',NULL),(15764,0,2,'业主管理','./index.php?c=site&a=entry&op=list&do=member&m=xfeng_community','member','fun',NULL),(15765,0,2,'智能门禁','./index.php?c=site&a=entry&op=list&do=building&m=xfeng_community','guard','fun',NULL),(15766,0,2,'小区公告','./index.php?c=site&a=entry&op=list&do=announcement&m=xfeng_community','announcement','fun',NULL),(15767,0,2,'小区报修','./index.php?c=site&a=entry&op=list&do=repair&m=xfeng_community','repair','fun',NULL),(15768,0,2,'意见建议','./index.php?c=site&a=entry&op=list&do=report&m=xfeng_community','report','fun',NULL),(15769,0,2,'家政服务','./index.php?c=site&a=entry&op=list&do=homemaking&m=xfeng_community','homemaking','fun',NULL),(15770,0,2,'租赁服务','./index.php?c=site&a=entry&op=list&do=houselease&m=xfeng_community','houselease','fun',NULL),(15771,0,2,'缴物业费','./index.php?c=site&a=entry&op=list&do=cost&m=xfeng_community','cost','fun',NULL),(15772,0,2,'小区活动','./index.php?c=site&a=entry&op=list&do=activity&m=xfeng_community','activity','fun',NULL),(15773,0,2,'便民查询','./index.php?c=site&a=entry&op=list&do=search&m=xfeng_community','search','fun',NULL),(15774,0,2,'便民号码','./index.php?c=site&a=entry&op=list&do=phone&m=xfeng_community','phone','fun',NULL),(15775,0,2,'二手市场','./index.php?c=site&a=entry&op=list&do=fled&m=xfeng_community','fled','fun',NULL),(15776,0,2,'小区拼车','./index.php?c=site&a=entry&op=list&do=car&m=xfeng_community','car','fun',NULL),(15777,0,2,'黑名单管理','./index.php?c=site&a=entry&op=list&do=black&m=xfeng_community','black','fun',NULL),(15778,0,3,'订单管理','./index.php?c=site&a=entry&op=order&do=shopping&m=xfeng_community','shoppingorder','shop',NULL),(15779,0,3,'商品管理','./index.php?c=site&a=entry&op=goods&do=shopping&m=xfeng_community','shoppinggoods','shop',NULL),(15780,0,3,'商品分类','./index.php?c=site&a=entry&op=list&do=category&type=5&m=xfeng_community','category','shop',NULL),(15781,0,3,'提现审核','./index.php?c=site&a=entry&op=cash&do=shopping&m=xfeng_community','shoppingcash','shop',NULL),(15782,0,4,'店铺分类','./index.php?c=site&a=entry&op=list&type=6&do=category&m=xfeng_community','category','seller',NULL),(15783,0,4,'店铺管理','./index.php?c=site&a=entry&op=dp&do=business&m=xfeng_community','businessdp','seller',NULL),(15784,0,4,'卡券核销','./index.php?c=site&a=entry&op=coupon&do=business&m=xfeng_community','businesscoupon','seller',NULL),(15785,0,4,'提现审核','./index.php?c=site&a=entry&op=cash&do=business&m=xfeng_community','businesscash','seller',NULL),(15786,0,4,'订单管理','./index.php?c=site&a=entry&op=order&do=business&m=xfeng_community','businessorder','seller',NULL),(15787,0,5,'用户管理','./index.php?c=site&a=entry&op=list&do=users&m=xfeng_community','userslist','perm',NULL),(15788,0,5,'小区套餐','./index.php?c=site&a=entry&op=list&do=control&m=xfeng_community','controllist','perm',NULL),(15789,0,6,'系统授权','./index.php?c=site&a=entry&op=display&do=system&m=xfeng_community','systemdisplay','system',NULL),(15790,0,6,'系统更新','./index.php?c=site&a=entry&op=upgrade&do=system&m=xfeng_community','systemupgrade','system',NULL);

#
# Structure for table "ims_xcommunity_nav"
#

DROP TABLE IF EXISTS `ims_xcommunity_nav`;
CREATE TABLE `ims_xcommunity_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `enable` int(11) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `pcate` int(10) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '菜单标题',
  `url` varchar(1000) NOT NULL COMMENT '菜单链接',
  `styleid` int(10) NOT NULL COMMENT '风格id',
  `status` int(1) NOT NULL COMMENT '是否显示状态',
  `isshow` int(1) NOT NULL COMMENT '1首页推荐',
  `icon` varchar(50) NOT NULL COMMENT '系统图标',
  `bgcolor` varchar(20) NOT NULL COMMENT '背景颜色',
  `regionid` text NOT NULL COMMENT '小区id',
  `do` varchar(20) NOT NULL COMMENT '动作',
  `thumb` varchar(500) NOT NULL COMMENT '菜单图片',
  `view` int(1) DEFAULT '1',
  `add` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='微信端菜单管理';

#
# Data for table "ims_xcommunity_nav"
#

INSERT INTO `ims_xcommunity_nav` VALUES (1,2,1,0,0,'物业服务','',0,1,0,'','','','','',1,1),(2,2,1,0,1,'社区公告','http://43721.com/app/index.php?i=2&c=entry&do=announcement&m=xfeng_community',0,1,1,'glyphicon glyphicon-bullhorn','#95bd38','','announcement','http://43721.com/addons/xfeng_community/template/static/image/icon/notice.png',1,1),(3,2,1,0,1,'小区报修','http://43721.com/app/index.php?i=2&c=entry&do=repair&m=xfeng_community',0,1,1,'glyphicon glyphicon-wrench','#3c87c8','','repair','http://43721.com/addons/xfeng_community/template/static/image/icon/repair.png',1,1),(4,2,1,0,1,'意见建议','http://43721.com/app/index.php?i=2&c=entry&do=report&m=xfeng_community',0,1,1,'fa fa-legal','#dd4b2b','','report','http://43721.com/addons/xfeng_community/template/static/image/icon/report.png',1,1),(5,2,1,0,1,'缴物业费','http://43721.com/app/index.php?i=2&c=entry&do=cost&m=xfeng_community',0,1,1,'glyphicon glyphicon-send','#3c87c8','','cost','http://43721.com/addons/xfeng_community/template/static/image/icon/cost.png',1,1),(6,2,1,0,1,'便民号码','http://43721.com/app/index.php?i=2&c=entry&do=phone&m=xfeng_community',0,1,0,'glyphicon glyphicon-earphone','#ab5e90','','phone','http://43721.com/addons/xfeng_community/template/static/image/icon/phone.png',1,1),(7,2,1,0,1,'常用查询','http://43721.com/app/index.php?i=2&c=entry&do=search&m=xfeng_community',0,1,0,'glyphicon glyphicon-search','#ec9510','','search','http://43721.com/addons/xfeng_community/template/static/image/icon/chaxun.png',1,1),(8,2,1,0,1,'手机开门','http://43721.com/app/index.php?i=2&c=entry&do=opendoor&m=xfeng_community',0,1,1,'glyphicon glyphicon-search','#ec9510','','opendoor','http://43721.com/addons/xfeng_community/template/static/image/icon/open.png',1,1),(9,2,1,0,0,'小区互动','',0,1,1,'','','','','',1,1),(10,2,1,0,9,'小区活动','http://43721.com/app/index.php?i=2&c=entry&do=activity&m=xfeng_community',0,1,1,'glyphicon glyphicon-tasks','#65944e','','activity','http://43721.com/addons/xfeng_community/template/static/image/icon/huodong.png',1,1),(11,2,1,0,9,'二手市场','http://43721.com/app/index.php?i=2&c=entry&do=fled&m=xfeng_community',0,1,1,'fa fa-exchange','#666699','','fled','http://43721.com/addons/xfeng_community/template/static/image/icon/ershou.png',1,1),(12,2,1,0,9,'小区家政','http://43721.com/app/index.php?i=2&c=entry&do=homemaking&m=xfeng_community',0,1,1,'glyphicon glyphicon-leaf','#95bd38','','homemaking','http://43721.com/addons/xfeng_community/template/static/image/icon/jiazheng.png',1,1),(13,2,1,0,9,'房屋租赁','http://43721.com/app/index.php?i=2&c=entry&do=houselease&m=xfeng_community',0,1,0,'fa fa-info','#38bfc8','','houselease','http://43721.com/addons/xfeng_community/template/static/image/icon/zuning.png',1,1),(14,2,1,0,9,'小区拼车','http://43721.com/app/index.php?i=2&c=entry&do=car&m=xfeng_community',0,1,0,'fa fa-truck','#7f6000','','car','http://43721.com/addons/xfeng_community/template/static/image/icon/pingche.png',1,1),(15,2,1,0,0,'生活服务','',0,1,0,'','','','','',1,1),(16,2,1,0,15,'周边商家','http://43721.com/app/index.php?i=2&c=entry&do=business&op=list&m=xfeng_community',0,1,0,'glyphicon glyphicon-shopping-cart','#65944e','','business','http://43721.com/addons/xfeng_community/template/static/image/icon/zhoubian.png',1,1),(17,2,1,0,15,'生活超市','http://43721.com/app/index.php?i=2&c=entry&do=shopping&op=list&m=xfeng_community',0,1,0,'glyphicon glyphicon-shopping-cart','#65944e','','shopping','http://43721.com/addons/xfeng_community/template/static/image/icon/chaoshi.png',1,1),(18,3,1,0,0,'物业服务','',0,1,0,'','','','','',1,1),(19,3,1,0,18,'社区公告','http://43721.com/app/index.php?i=3&c=entry&do=announcement&m=xfeng_community',0,1,1,'glyphicon glyphicon-bullhorn','#95bd38','','announcement','http://43721.com/addons/xfeng_community/template/static/image/icon/notice.png',1,1),(20,3,1,0,18,'小区报修','http://43721.com/app/index.php?i=3&c=entry&do=repair&m=xfeng_community',0,1,1,'glyphicon glyphicon-wrench','#3c87c8','','repair','http://43721.com/addons/xfeng_community/template/static/image/icon/repair.png',1,1),(21,3,1,0,18,'意见建议','http://43721.com/app/index.php?i=3&c=entry&do=report&m=xfeng_community',0,1,1,'fa fa-legal','#dd4b2b','','report','http://43721.com/addons/xfeng_community/template/static/image/icon/report.png',1,1),(22,3,1,0,18,'缴物业费','http://43721.com/app/index.php?i=3&c=entry&do=cost&m=xfeng_community',0,1,1,'glyphicon glyphicon-send','#3c87c8','','cost','http://43721.com/addons/xfeng_community/template/static/image/icon/cost.png',1,1),(23,3,1,0,18,'便民号码','http://43721.com/app/index.php?i=3&c=entry&do=phone&m=xfeng_community',0,1,0,'glyphicon glyphicon-earphone','#ab5e90','','phone','http://43721.com/addons/xfeng_community/template/static/image/icon/phone.png',1,1),(24,3,1,0,18,'常用查询','http://43721.com/app/index.php?i=3&c=entry&do=search&m=xfeng_community',0,1,0,'glyphicon glyphicon-search','#ec9510','','search','http://43721.com/addons/xfeng_community/template/static/image/icon/chaxun.png',1,1),(25,3,1,0,18,'手机开门','http://43721.com/app/index.php?i=3&c=entry&do=opendoor&m=xfeng_community',0,1,0,'glyphicon glyphicon-search','#ec9510','','opendoor','http://43721.com/addons/xfeng_community/template/static/image/icon/open.png',1,1),(26,3,1,0,0,'小区互动','',0,1,1,'','','','','',1,1),(27,3,1,0,26,'小区活动','http://43721.com/app/index.php?i=3&c=entry&do=activity&m=xfeng_community',0,1,1,'glyphicon glyphicon-tasks','#65944e','','activity','http://43721.com/addons/xfeng_community/template/static/image/icon/huodong.png',1,1),(28,3,1,0,26,'二手市场','http://43721.com/app/index.php?i=3&c=entry&do=fled&m=xfeng_community',0,1,1,'fa fa-exchange','#666699','','fled','http://43721.com/addons/xfeng_community/template/static/image/icon/ershou.png',1,1),(29,3,1,0,26,'小区家政','http://43721.com/app/index.php?i=3&c=entry&do=homemaking&m=xfeng_community',0,1,1,'glyphicon glyphicon-leaf','#95bd38','','homemaking','http://43721.com/addons/xfeng_community/template/static/image/icon/jiazheng.png',1,1),(30,3,1,0,26,'房屋租赁','http://43721.com/app/index.php?i=3&c=entry&do=houselease&m=xfeng_community',0,1,1,'fa fa-info','#38bfc8','','houselease','http://43721.com/addons/xfeng_community/template/static/image/icon/zuning.png',1,1),(31,3,1,0,26,'小区拼车','http://43721.com/app/index.php?i=3&c=entry&do=car&m=xfeng_community',0,1,0,'fa fa-truck','#7f6000','','car','http://43721.com/addons/xfeng_community/template/static/image/icon/pingche.png',1,1),(32,3,1,0,0,'生活服务','',0,1,0,'','','','','',1,1),(33,3,1,0,32,'周边商家','http://43721.com/app/index.php?i=3&c=entry&do=business&op=list&m=xfeng_community',0,1,0,'glyphicon glyphicon-shopping-cart','#65944e','','business','http://43721.com/addons/xfeng_community/template/static/image/icon/zhoubian.png',1,1),(34,3,1,0,32,'生活超市','http://43721.com/app/index.php?i=3&c=entry&do=shopping&op=list&m=xfeng_community',0,1,1,'glyphicon glyphicon-shopping-cart','#65944e','','shopping','http://43721.com/addons/xfeng_community/template/static/image/icon/chaoshi.png',1,1);

#
# Structure for table "ims_xcommunity_notice"
#

DROP TABLE IF EXISTS `ims_xcommunity_notice`;
CREATE TABLE `ims_xcommunity_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `regionid` text NOT NULL,
  `fansopenid` varchar(50) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1模板消息通知,2短信通知，3全部通知',
  `enable` int(1) NOT NULL COMMENT '1报修,2建议，3家政',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `uid` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='通知设置';

#
# Data for table "ims_xcommunity_notice"
#

/*!40000 ALTER TABLE `ims_xcommunity_notice` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_notice` VALUES (5,3,'a:1:{i:0;s:2:\"20\";}','15273279515',1,1,29,0,'湖南省','湘潭市','岳塘区');
/*!40000 ALTER TABLE `ims_xcommunity_notice` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_open_log"
#

DROP TABLE IF EXISTS `ims_xcommunity_open_log`;
CREATE TABLE `ims_xcommunity_open_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `regionid` int(11) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '门类型',
  `openid` varchar(50) NOT NULL COMMENT '业主openid',
  `realname` varchar(50) NOT NULL COMMENT '业主姓名',
  `createtime` int(11) NOT NULL COMMENT '开门时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='开门记录';

#
# Data for table "ims_xcommunity_open_log"
#

/*!40000 ALTER TABLE `ims_xcommunity_open_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_open_log` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_opendoor_data"
#

DROP TABLE IF EXISTS `ims_xcommunity_opendoor_data`;
CREATE TABLE `ims_xcommunity_opendoor_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `regionid` int(11) NOT NULL,
  `build` varchar(50) NOT NULL COMMENT '楼宇名称',
  `unit` varchar(30) NOT NULL COMMENT '单元号',
  `room` varchar(100) NOT NULL COMMENT '房号',
  `createtime` int(11) NOT NULL COMMENT '生成时间',
  `opentime` int(11) NOT NULL COMMENT '开门时间',
  `type` int(1) NOT NULL COMMENT '1单元门，2大门',
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='访客码数据';

#
# Data for table "ims_xcommunity_opendoor_data"
#

/*!40000 ALTER TABLE `ims_xcommunity_opendoor_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_opendoor_data` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_order"
#

DROP TABLE IF EXISTS `ims_xcommunity_order`;
CREATE TABLE `ims_xcommunity_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `ordersn` varchar(20) NOT NULL COMMENT '订单编号',
  `couponsn` varchar(20) NOT NULL COMMENT '团购券号',
  `price` decimal(10,2) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '-1关闭状态，0普通状态，1为已付款，2为已发货，3已成功',
  `enable` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0不限，1为未使用，2已核销',
  `paytype` tinyint(1) unsigned NOT NULL COMMENT '1为余额，2为在线，3为到付，4后台支付',
  `transid` varchar(30) NOT NULL DEFAULT '0' COMMENT '微信支付单号',
  `goodstype` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `remark` varchar(1000) NOT NULL DEFAULT '',
  `goodsprice` decimal(10,2) DEFAULT '0.00' COMMENT '商品总价',
  `createtime` int(10) unsigned NOT NULL,
  `usetime` int(10) unsigned NOT NULL,
  `regionid` int(11) unsigned NOT NULL COMMENT '当前小区ID',
  `gid` int(11) unsigned NOT NULL COMMENT '优惠券id',
  `type` varchar(10) NOT NULL COMMENT '订单来源类型',
  `uid` int(11) unsigned NOT NULL COMMENT '操作员用户id',
  `pid` int(11) unsigned NOT NULL COMMENT '物业费id',
  `aid` int(11) unsigned NOT NULL COMMENT '活动预约id',
  `num` int(11) unsigned NOT NULL COMMENT '购买数量',
  `companyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1199 DEFAULT CHARSET=utf8 COMMENT='订单表';

#
# Data for table "ims_xcommunity_order"
#

/*!40000 ALTER TABLE `ims_xcommunity_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_order` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_order_goods"
#

DROP TABLE IF EXISTS `ims_xcommunity_order_goods`;
CREATE TABLE `ims_xcommunity_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `goodsid` int(10) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='订单商品附表';

#
# Data for table "ims_xcommunity_order_goods"
#

/*!40000 ALTER TABLE `ims_xcommunity_order_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_order_goods` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_pay"
#

DROP TABLE IF EXISTS `ims_xcommunity_pay`;
CREATE TABLE `ims_xcommunity_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `pay` varchar(200) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1超市2物业费3商家4小区活动',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='支付方式配置表';

#
# Data for table "ims_xcommunity_pay"
#

/*!40000 ALTER TABLE `ims_xcommunity_pay` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_pay` VALUES (32,2,'a:4:{s:6:\"weixin\";s:1:\"1\";s:6:\"alipay\";s:1:\"0\";s:6:\"credit\";s:1:\"0\";s:4:\"cash\";s:1:\"0\";}',2);
/*!40000 ALTER TABLE `ims_xcommunity_pay` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_pay_api"
#

DROP TABLE IF EXISTS `ims_xcommunity_pay_api`;
CREATE TABLE `ims_xcommunity_pay_api` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `pay` text NOT NULL,
  `type` int(1) NOT NULL,
  `paytype` int(1) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

#
# Data for table "ims_xcommunity_pay_api"
#

/*!40000 ALTER TABLE `ims_xcommunity_pay_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_pay_api` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_phone"
#

DROP TABLE IF EXISTS `ims_xcommunity_phone`;
CREATE TABLE `ims_xcommunity_phone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(11) unsigned NOT NULL COMMENT '公众号',
  `phone` varchar(50) NOT NULL COMMENT '号码',
  `content` varchar(50) NOT NULL COMMENT '描述',
  `regionid` text NOT NULL COMMENT '小区编号',
  `thumb` varchar(1000) NOT NULL COMMENT '图片',
  `displayorder` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用电话';

#
# Data for table "ims_xcommunity_phone"
#


#
# Structure for table "ims_xcommunity_print"
#

DROP TABLE IF EXISTS `ims_xcommunity_print`;
CREATE TABLE `ims_xcommunity_print` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `print_status` int(10) unsigned NOT NULL,
  `print_type` int(10) unsigned NOT NULL COMMENT '1报修,2投诉，3超市订单，0全部打印',
  `member_code` varchar(80) NOT NULL,
  `api_key` varchar(50) NOT NULL,
  `deviceNo` varchar(50) NOT NULL,
  `regionid` text NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='打印机表';

#
# Data for table "ims_xcommunity_print"
#

/*!40000 ALTER TABLE `ims_xcommunity_print` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_print` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_property"
#

DROP TABLE IF EXISTS `ims_xcommunity_property`;
CREATE TABLE `ims_xcommunity_property` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `topPicture` varchar(255) NOT NULL COMMENT '照片',
  `content` varchar(2000) NOT NULL COMMENT '内容',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `regionid` text NOT NULL COMMENT '小区id',
  `telphone` varchar(13) NOT NULL COMMENT '物业电话',
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  `uid` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='物业管理';

#
# Data for table "ims_xcommunity_property"
#

INSERT INTO `ims_xcommunity_property` VALUES (1,2,'东方物业','','<p>东方物业公司</p>',1499480353,'a:1:{i:0;s:2:\"18\";}','13011112222','湖南省','湘潭市','岳塘区',NULL),(2,3,'金华物业','','<p>金华物业是国内最有实力的物业</p>',1499863483,'a:2:{i:0;s:2:\"19\";i:1;s:2:\"20\";}','13768982020','湖南省','湘潭市','岳塘区',NULL);

#
# Structure for table "ims_xcommunity_pstyle"
#

DROP TABLE IF EXISTS `ims_xcommunity_pstyle`;
CREATE TABLE `ims_xcommunity_pstyle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `regionid` text NOT NULL COMMENT '小区编号',
  `pid` int(10) unsigned NOT NULL COMMENT '物业ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '封面图',
  `content` text NOT NULL COMMENT '内容',
  `createtime` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='物业风采';

#
# Data for table "ims_xcommunity_pstyle"
#

/*!40000 ALTER TABLE `ims_xcommunity_pstyle` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_pstyle` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_pstyle_content"
#

DROP TABLE IF EXISTS `ims_xcommunity_pstyle_content`;
CREATE TABLE `ims_xcommunity_pstyle_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `sid` int(10) unsigned NOT NULL,
  `wid` int(10) unsigned NOT NULL,
  `regionid` text NOT NULL COMMENT '小区编号',
  `pid` int(10) unsigned NOT NULL COMMENT '物业ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '封面图',
  `content` text NOT NULL COMMENT '内容',
  `createtime` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='物业风采';

#
# Data for table "ims_xcommunity_pstyle_content"
#

/*!40000 ALTER TABLE `ims_xcommunity_pstyle_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_pstyle_content` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_rank"
#

DROP TABLE IF EXISTS `ims_xcommunity_rank`;
CREATE TABLE `ims_xcommunity_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `type` int(1) unsigned NOT NULL COMMENT '1商家,2超市',
  `content` varchar(2000) NOT NULL COMMENT '评价内容',
  `dpid` int(11) DEFAULT '0' COMMENT '商家店铺id',
  `openid` varchar(100) NOT NULL COMMENT '粉丝openid',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评价表';

#
# Data for table "ims_xcommunity_rank"
#

/*!40000 ALTER TABLE `ims_xcommunity_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_rank` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_reading_member"
#

DROP TABLE IF EXISTS `ims_xcommunity_reading_member`;
CREATE TABLE `ims_xcommunity_reading_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `aid` int(10) unsigned NOT NULL COMMENT '公告id',
  `openid` varchar(50) NOT NULL,
  `status` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=889 DEFAULT CHARSET=utf8 COMMENT='公告阅读记录表';

#
# Data for table "ims_xcommunity_reading_member"
#

/*!40000 ALTER TABLE `ims_xcommunity_reading_member` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_reading_member` VALUES (886,3,17,'oNWF5uLKdsg4sJUZof5EYsKPsC2U','1'),(887,3,17,'oNWF5uACpuRWOwWuw3a3MJhQl5K0','1'),(888,3,17,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo','1');
/*!40000 ALTER TABLE `ims_xcommunity_reading_member` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_region"
#

DROP TABLE IF EXISTS `ims_xcommunity_region`;
CREATE TABLE `ims_xcommunity_region` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `linkmen` varchar(50) NOT NULL COMMENT '联系人',
  `linkway` varchar(50) NOT NULL COMMENT '联系电话',
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `address` varchar(50) NOT NULL,
  `pid` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `thumb` varchar(1000) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `qq` varchar(15) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  `pic` varchar(1000) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `keyword` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='小区管理';

#
# Data for table "ims_xcommunity_region"
#

/*!40000 ALTER TABLE `ims_xcommunity_region` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_region` VALUES (17,2,'东方名苑','张三','13012345678','','','双拥中路6号',0,'','','湖南省','湘潭市','岳塘区','',9,'',NULL,NULL),(18,2,'春满江南','王五','13088888888','','','电工北路10号',1,'','','湖南省','湘潭市','岳塘区','',10,'',NULL,NULL),(19,3,'东方名苑','小东','13010101010','112.952329','27.842822','双拥中路6号',2,'','images/3/2017/07/ud3S077j972Usb97BUmpB89777p1oO.jpg','湖南省','湘潭市','岳塘区','',9,'images/3/2017/07/ud3S077j972Usb97BUmpB89777p1oO.jpg',NULL,NULL),(20,3,'华雅花园','小华','13811112222','112.941692','27.820108','电工北路11号',2,'','images/3/2017/07/zoSo77di07O7O1MXkoLzW0YoH4Zo4l.jpg','湖南省','湘潭市','岳塘区','',12,'images/3/2017/07/zoSo77di07O7O1MXkoLzW0YoH4Zo4l.jpg',NULL,NULL);
/*!40000 ALTER TABLE `ims_xcommunity_region` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_report"
#

DROP TABLE IF EXISTS `ims_xcommunity_report`;
CREATE TABLE `ims_xcommunity_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL COMMENT '用户身份',
  `weid` int(11) unsigned NOT NULL COMMENT '公众号ID',
  `regionid` int(10) unsigned NOT NULL COMMENT '小区编号',
  `type` tinyint(1) NOT NULL COMMENT '1为报修，2为投诉',
  `category` varchar(50) NOT NULL DEFAULT '' COMMENT '类目',
  `content` varchar(255) NOT NULL COMMENT '投诉内容',
  `requirement` varchar(1000) NOT NULL,
  `createtime` int(11) unsigned NOT NULL COMMENT '投诉日期',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态,1已处理,2未处理,3受理中',
  `newmsg` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有新信息',
  `rank` tinyint(3) unsigned NOT NULL COMMENT '评级 1满意，2一般，3不满意',
  `comment` varchar(1000) NOT NULL,
  `resolve` varchar(1000) NOT NULL COMMENT '处理结果',
  `resolver` varchar(50) NOT NULL COMMENT '处理人',
  `resolvetime` int(10) NOT NULL COMMENT '处理时间',
  `address` varchar(80) NOT NULL COMMENT '地址',
  `images` text,
  `cid` int(11) DEFAULT NULL,
  `enable` int(1) DEFAULT NULL,
  `dealing` varchar(100) DEFAULT NULL,
  `grabimages` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COMMENT='报修投诉管理';

#
# Data for table "ims_xcommunity_report"
#

/*!40000 ALTER TABLE `ims_xcommunity_report` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_report` VALUES (262,'',2,18,1,'灯损坏','廊灯损坏  ','',1499840894,3,0,2,'来人了，还行了','','',1499840927,'春满江南1栋1单元101室','115,116',24,0,'龙蛟',NULL),(263,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','C4栋4单元大门灯坏了，请尽快派人来修理。','',1500084289,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(264,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯坏了尸体解剖课啊','',1500089001,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(265,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','23432423423423434','',1500089428,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(266,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','单元门的灯坏了','',1500099864,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(267,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯坏了，请尽快来修理','',1500099965,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(268,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','单元楼照明灯不亮，请尽快来修理！','',1500100153,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(269,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯坏了，请速度来修改','',1500100750,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(270,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯不亮，请速度来人','',1500100878,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(271,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯不亮，请速度来人\n','',1500101205,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(272,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯不亮，请速度来人\n','',1500102164,1,0,0,'','灯已修好','',1500255582,'华雅花园1栋1单元101室','',29,0,NULL,''),(273,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯不亮，请速度来人','',1500102423,2,0,0,'','','',0,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(274,'oNWF5uLKdsg4sJUZof5EYsKPsC2U',3,20,1,'照明','灯不亮，请速度来人\n','',1500103224,3,0,0,'','','oNWF5uACpuRWOwWuw3a3MJhQl5K0',1500103319,'华雅花园1栋1单元101室','',29,0,NULL,NULL),(275,'oNWF5uCX8zNzKmmBJ6RE_l29Anxo',3,20,1,'照明','我的小女孩和女人一样在','',1500256798,1,0,0,'','好了','oNWF5uACpuRWOwWuw3a3MJhQl5K0',1500256895,'华雅花园1栋1单元101室','',29,0,NULL,'');
/*!40000 ALTER TABLE `ims_xcommunity_report` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_res"
#

DROP TABLE IF EXISTS `ims_xcommunity_res`;
CREATE TABLE `ims_xcommunity_res` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `openid` varchar(100) NOT NULL,
  `truename` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `num` int(2) unsigned NOT NULL COMMENT '报名人数',
  `aid` int(11) unsigned NOT NULL COMMENT '活动id',
  `createtime` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报名表';

#
# Data for table "ims_xcommunity_res"
#

/*!40000 ALTER TABLE `ims_xcommunity_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_res` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_room"
#

DROP TABLE IF EXISTS `ims_xcommunity_room`;
CREATE TABLE `ims_xcommunity_room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `mobile` varchar(13) NOT NULL,
  `room` varchar(50) DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `realname` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `build` varchar(50) DEFAULT NULL,
  `unit` int(5) DEFAULT NULL,
  `house` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='房号表';

#
# Data for table "ims_xcommunity_room"
#

/*!40000 ALTER TABLE `ims_xcommunity_room` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_room` VALUES (1,3,'13807324757','1栋1单元101室','NkbD',20,'李浪',1,2,'1',1,NULL),(2,3,'15273279515','1栋1单元101室','95he',20,'黄鼎',1,2,'1',1,NULL),(3,3,'18670203555','1栋1单元101室','vKxx',20,'倪能武',1,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ims_xcommunity_room` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_search"
#

DROP TABLE IF EXISTS `ims_xcommunity_search`;
CREATE TABLE `ims_xcommunity_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `sname` varchar(30) NOT NULL,
  `surl` varchar(100) NOT NULL,
  `status` int(1) NOT NULL,
  `icon` varchar(1000) NOT NULL,
  `regionid` text NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='便民查询';

#
# Data for table "ims_xcommunity_search"
#

/*!40000 ALTER TABLE `ims_xcommunity_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_search` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_service"
#

DROP TABLE IF EXISTS `ims_xcommunity_service`;
CREATE TABLE `ims_xcommunity_service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `regionid` text NOT NULL COMMENT '小区编号',
  `pid` int(10) unsigned NOT NULL COMMENT '物业ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `createtime` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='社区服务';

#
# Data for table "ims_xcommunity_service"
#

/*!40000 ALTER TABLE `ims_xcommunity_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_service` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_service_data"
#

DROP TABLE IF EXISTS `ims_xcommunity_service_data`;
CREATE TABLE `ims_xcommunity_service_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `type` int(1) NOT NULL COMMENT '物业费1，超市2，商家3',
  `sub_mch_id` varchar(50) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='子商户关联数据';

#
# Data for table "ims_xcommunity_service_data"
#

/*!40000 ALTER TABLE `ims_xcommunity_service_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_service_data` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_service_set"
#

DROP TABLE IF EXISTS `ims_xcommunity_service_set`;
CREATE TABLE `ims_xcommunity_service_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `switch` int(1) NOT NULL,
  `mchid` varchar(50) NOT NULL,
  `signkey` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='服务商设置';

#
# Data for table "ims_xcommunity_service_set"
#

/*!40000 ALTER TABLE `ims_xcommunity_service_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_service_set` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_set"
#

DROP TABLE IF EXISTS `ims_xcommunity_set`;
CREATE TABLE `ims_xcommunity_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `code_status` int(10) unsigned NOT NULL COMMENT '验证码开启',
  `room_status` int(10) unsigned NOT NULL COMMENT '验证码开启',
  `room_enable` int(10) unsigned NOT NULL COMMENT '验证码开启',
  `h_status` int(10) unsigned NOT NULL COMMENT '房屋租赁托管',
  `s_status` int(10) unsigned NOT NULL COMMENT '商家提成',
  `range` int(10) unsigned NOT NULL COMMENT 'lbs范围',
  `c_status` int(1) NOT NULL,
  `r_status` int(10) DEFAULT NULL,
  `r_enable` int(10) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `region_status` int(1) DEFAULT NULL,
  `business_status` int(1) DEFAULT NULL,
  `visitor_status` int(1) DEFAULT NULL,
  `shop_credit` float DEFAULT NULL,
  `business_credit` float DEFAULT NULL,
  `cost_credit` float DEFAULT NULL,
  `fled_status` int(1) DEFAULT NULL,
  `house_status` int(1) DEFAULT NULL,
  `car_status` int(1) DEFAULT NULL,
  `open_status` int(1) DEFAULT NULL,
  `repair_status` int(1) DEFAULT NULL,
  `report_status` int(1) DEFAULT NULL,
  `fleds_status` int(1) DEFAULT NULL,
  `houselease_status` int(1) DEFAULT NULL,
  `cars_status` int(1) DEFAULT NULL,
  `door_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='小区设置';

#
# Data for table "ims_xcommunity_set"
#

/*!40000 ALTER TABLE `ims_xcommunity_set` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_set` VALUES (2,3,0,0,1,0,0,0,0,0,0,NULL,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `ims_xcommunity_set` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_setting"
#

DROP TABLE IF EXISTS `ims_xcommunity_setting`;
CREATE TABLE `ims_xcommunity_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `regionid` int(11) NOT NULL,
  `value` text NOT NULL,
  `key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "ims_xcommunity_setting"
#

/*!40000 ALTER TABLE `ims_xcommunity_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_setting` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_slide"
#

DROP TABLE IF EXISTS `ims_xcommunity_slide`;
CREATE TABLE `ims_xcommunity_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `weid` int(11) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(200) NOT NULL,
  `url` varchar(100) NOT NULL,
  `regionid` text NOT NULL,
  `type` int(11) NOT NULL COMMENT '1小区首页,2超市',
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='幻灯管理';

#
# Data for table "ims_xcommunity_slide"
#

INSERT INTO `ims_xcommunity_slide` VALUES (1,3,1,' 华雅花园','images/3/2017/07/yfH2Ot7hrnr2ooOOnqHQOCYTCYCYtH.jpg','','a:1:{i:0;s:2:\"20\";}',1,'湖南省','湘潭市','',NULL),(2,3,1,'东方名苑','images/3/2017/07/lS7rZwXahBwpAlWllxABxTnbhPLnvt.jpg','','a:1:{i:0;s:2:\"19\";}',1,'湖南省','湘潭市','岳塘区',NULL);

#
# Structure for table "ims_xcommunity_template"
#

DROP TABLE IF EXISTS `ims_xcommunity_template`;
CREATE TABLE `ims_xcommunity_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2386 DEFAULT CHARSET=utf8 COMMENT='模板设置';

#
# Data for table "ims_xcommunity_template"
#

/*!40000 ALTER TABLE `ims_xcommunity_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_template` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_users"
#

DROP TABLE IF EXISTS `ims_xcommunity_users`;
CREATE TABLE `ims_xcommunity_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `uid` int(10) unsigned NOT NULL,
  `companyid` int(11) NOT NULL,
  `regionid` int(11) NOT NULL,
  `menus` varchar(500) NOT NULL,
  `balance` decimal(10,2) NOT NULL COMMENT '商家余额',
  `commission` float NOT NULL COMMENT '分成，0-1之间',
  `groupid` int(11) DEFAULT NULL,
  `uuid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `dist` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

#
# Data for table "ims_xcommunity_users"
#

/*!40000 ALTER TABLE `ims_xcommunity_users` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_users` VALUES (1,3,4,0,20,'1,15750,15751,15752,15753,15754,15755,15756,15757,15758,15759,15760,2,15761,15762,15763,15764,15765,15766,15767,15768,15769,15770,15771,15772,15773,15774,15775,15776,15777,3,15778,15779,15780,15781,4,15782,15783,15784,15785,15786,5,15787,15788,6,15789,15790',0.00,0,NULL,1,2,'湖南省','湘潭市','岳塘区');
/*!40000 ALTER TABLE `ims_xcommunity_users` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_users_group"
#

DROP TABLE IF EXISTS `ims_xcommunity_users_group`;
CREATE TABLE `ims_xcommunity_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `title` varchar(50) NOT NULL,
  `maxaccount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "ims_xcommunity_users_group"
#

/*!40000 ALTER TABLE `ims_xcommunity_users_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_users_group` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_wechat_notice"
#

DROP TABLE IF EXISTS `ims_xcommunity_wechat_notice`;
CREATE TABLE `ims_xcommunity_wechat_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `regionid` text NOT NULL,
  `fansopenid` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员openid',
  `repair_status` int(1) NOT NULL,
  `report_status` int(1) NOT NULL,
  `shopping_status` int(1) NOT NULL,
  `homemaking_status` int(1) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1模板消息通知,2短信通知，3全部通知',
  `uid` int(11) NOT NULL,
  `change_status` int(1) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL,
  `cost_status` int(1) DEFAULT NULL,
  `business_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='通知设置';

#
# Data for table "ims_xcommunity_wechat_notice"
#

/*!40000 ALTER TABLE `ims_xcommunity_wechat_notice` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_wechat_notice` VALUES (44,3,'a:1:{i:0;s:0:\"\";}','123123',2,2,2,2,1,4,0,'','','',2,2);
/*!40000 ALTER TABLE `ims_xcommunity_wechat_notice` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_wechat_smsid"
#

DROP TABLE IF EXISTS `ims_xcommunity_wechat_smsid`;
CREATE TABLE `ims_xcommunity_wechat_smsid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `shopping_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `sms_account` varchar(80) NOT NULL,
  `verify` int(1) NOT NULL,
  `businesscode` int(1) NOT NULL,
  `verifycode` int(1) NOT NULL,
  `report_type` int(1) NOT NULL,
  `shopping_status` int(1) NOT NULL,
  `property_status` int(1) NOT NULL,
  `reportid` int(11) NOT NULL,
  `resgisterid` int(11) NOT NULL,
  `room_status` int(1) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='短信设置';

#
# Data for table "ims_xcommunity_wechat_smsid"
#

/*!40000 ALTER TABLE `ims_xcommunity_wechat_smsid` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_wechat_smsid` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_wechat_tplid"
#

DROP TABLE IF EXISTS `ims_xcommunity_wechat_tplid`;
CREATE TABLE `ims_xcommunity_wechat_tplid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `property_tplid` varchar(80) NOT NULL,
  `water_tplid` varchar(80) NOT NULL,
  `gas_tplid` varchar(80) NOT NULL,
  `power_tplid` varchar(80) NOT NULL,
  `guard_tplid` varchar(80) NOT NULL,
  `lift_tplid` varchar(80) NOT NULL,
  `car_tplid` varchar(80) NOT NULL,
  `shopping_tplid` varchar(80) NOT NULL,
  `repair_tplid` varchar(80) NOT NULL,
  `report_tplid` varchar(80) NOT NULL,
  `other_tplid` varchar(80) NOT NULL,
  `good_tplid` varchar(80) NOT NULL,
  `grab_wc_tplid` varchar(80) NOT NULL,
  `homemaking_tplid` varchar(80) NOT NULL,
  `report_wc_tplid` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='模板消息设置';

#
# Data for table "ims_xcommunity_wechat_tplid"
#

/*!40000 ALTER TABLE `ims_xcommunity_wechat_tplid` DISABLE KEYS */;
INSERT INTO `ims_xcommunity_wechat_tplid` VALUES (4,3,'','','','','','','','','8jtR84cpS_ypcqvltU1mhwo2BqVa_zzfPvZPziW8_4I','','','','','','');
/*!40000 ALTER TABLE `ims_xcommunity_wechat_tplid` ENABLE KEYS */;

#
# Structure for table "ims_xcommunity_wnotice"
#

DROP TABLE IF EXISTS `ims_xcommunity_wnotice`;
CREATE TABLE `ims_xcommunity_wnotice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `regionid` text NOT NULL COMMENT '小区编号',
  `pid` int(10) unsigned NOT NULL COMMENT '物业ID',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '封面图',
  `content` text NOT NULL COMMENT '内容',
  `createtime` int(10) unsigned NOT NULL,
  `uid` int(11) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='业主须知';

#
# Data for table "ims_xcommunity_wnotice"
#

/*!40000 ALTER TABLE `ims_xcommunity_wnotice` DISABLE KEYS */;
/*!40000 ALTER TABLE `ims_xcommunity_wnotice` ENABLE KEYS */;
