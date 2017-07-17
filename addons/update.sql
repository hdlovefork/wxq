SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `ims_xcommunity_building_device`;
CREATE TABLE `ims_xcommunity_building_device` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`uniacid`  int(10) UNSIGNED NOT NULL DEFAULT 0 ,
`regionid`  int(11) NOT NULL ,
`title`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`unit`  varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`api_key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`device_code`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`lock_code`  varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`type`  int(1) NOT NULL ,
`openurl`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
ALTER TABLE `ims_xcommunity_pay_api` ADD COLUMN `uid`  int(11) NULL DEFAULT NULL AFTER `paytype`;
ALTER TABLE `ims_xcommunity_region` ADD COLUMN `keyword`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `uid`;
ALTER TABLE `ims_xcommunity_report` ADD COLUMN `grabimages`  varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `dealing`;
ALTER TABLE `ims_xcommunity_set` ADD COLUMN `door_status`  int(11) NULL DEFAULT NULL AFTER `cars_status`;
CREATE TABLE `ims_xcommunity_setting` (
`id`  int(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
`uniacid`  int(11) NOT NULL ,
`regionid`  int(11) NOT NULL ,
`value`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
`key`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL ,
PRIMARY KEY (`id`)
)
ENGINE=MyISAM
DEFAULT CHARACTER SET=utf8 COLLATE=utf8_general_ci
CHECKSUM=0
ROW_FORMAT=Dynamic
DELAY_KEY_WRITE=0
;
ALTER TABLE `ims_xcommunity_slide` ADD COLUMN `uid`  int(11) NULL DEFAULT NULL AFTER `dist`;
ALTER TABLE `ims_xcommunity_users` ADD COLUMN `type`  int(11) NULL DEFAULT NULL AFTER `uuid`;
ALTER TABLE `ims_xcommunity_users` ADD COLUMN `province`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `type`;
ALTER TABLE `ims_xcommunity_users` ADD COLUMN `city`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `province`;
ALTER TABLE `ims_xcommunity_users` ADD COLUMN `dist`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `city`;
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
) ENGINE=MyISAM AUTO_INCREMENT=15791 DEFAULT CHARSET=utf8 COMMENT='后台菜单管理';

-- ----------------------------
-- Records of ims_xcommunity_menu
-- ----------------------------
INSERT INTO `ims_xcommunity_menu` VALUES ('1', '0', '0', '基础设置', './index.php?c=site&a=entry&do=manage&method=manage&m=xfeng_community', 'manage', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15750', '0', '1', '小区设置', './index.php?c=site&a=entry&do=set&m=xfeng_community', 'set', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15751', '0', '1', '通知管理', './index.php?c=site&a=entry&op=list&do=notice&m=xfeng_community', 'notice', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15752', '0', '1', '短信设置', './index.php?c=site&a=entry&do=sms&m=xfeng_community', 'sms', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15753', '0', '1', '菜单设置', './index.php?c=site&a=entry&op=list&do=nav&m=xfeng_community', 'nav', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15754', '0', '1', '模板设置', './index.php?c=site&a=entry&op=list&do=style&m=xfeng_community', 'style', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15755', '0', '1', '幻灯管理', './index.php?c=site&a=entry&op=list&do=slide&m=xfeng_community', 'slide', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15756', '0', '1', '二维码管理', './index.php?c=site&a=entry&op=list&do=qr&m=xfeng_community', 'qr', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15757', '0', '1', '打印机设置', './index.php?c=site&a=entry&op=list&do=print&m=xfeng_community', 'print', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15758', '0', '1', '模板消息设置', './index.php?c=site&a=entry&do=tpl&m=xfeng_community', 'tpl', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15759', '0', '1', '支付方式设置', './index.php?c=site&a=entry&do=pay&m=xfeng_community', 'pay', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15760', '0', '1', '独立支付接口', './index.php?c=site&a=entry&do=payapi&m=xfeng_community', 'payapi', 'manage', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('2', '0', '0', '物业服务', './index.php?c=site&a=entry&do=fun&method=fun&m=xfeng_community', 'fun', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15761', '0', '2', '小区管理', './index.php?c=site&a=entry&op=list&do=region&m=xfeng_community', 'region', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15762', '0', '2', '房号管理', './index.php?c=site&a=entry&op=list&do=room&m=xfeng_community', 'room', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15763', '0', '2', '物业管理', './index.php?c=site&a=entry&op=list&do=property&m=xfeng_community', 'property', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15764', '0', '2', '业主管理', './index.php?c=site&a=entry&op=list&do=member&m=xfeng_community', 'member', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15765', '0', '2', '智能门禁', './index.php?c=site&a=entry&op=list&do=building&m=xfeng_community', 'guard', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15766', '0', '2', '小区公告', './index.php?c=site&a=entry&op=list&do=announcement&m=xfeng_community', 'announcement', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15767', '0', '2', '小区报修', './index.php?c=site&a=entry&op=list&do=repair&m=xfeng_community', 'repair', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15768', '0', '2', '意见建议', './index.php?c=site&a=entry&op=list&do=report&m=xfeng_community', 'report', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15769', '0', '2', '家政服务', './index.php?c=site&a=entry&op=list&do=homemaking&m=xfeng_community', 'homemaking', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15770', '0', '2', '租赁服务', './index.php?c=site&a=entry&op=list&do=houselease&m=xfeng_community', 'houselease', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15771', '0', '2', '缴物业费', './index.php?c=site&a=entry&op=list&do=cost&m=xfeng_community', 'cost', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15772', '0', '2', '小区活动', './index.php?c=site&a=entry&op=list&do=activity&m=xfeng_community', 'activity', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15773', '0', '2', '便民查询', './index.php?c=site&a=entry&op=list&do=search&m=xfeng_community', 'search', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15774', '0', '2', '便民号码', './index.php?c=site&a=entry&op=list&do=phone&m=xfeng_community', 'phone', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15775', '0', '2', '二手市场', './index.php?c=site&a=entry&op=list&do=fled&m=xfeng_community', 'fled', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15776', '0', '2', '小区拼车', './index.php?c=site&a=entry&op=list&do=car&m=xfeng_community', 'car', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15777', '0', '2', '黑名单管理', './index.php?c=site&a=entry&op=list&do=black&m=xfeng_community', 'black', 'fun', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('3', '0', '0', '小区超市', './index.php?c=site&a=entry&do=shop&method=shop&m=xfeng_community', 'shop', 'shop', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15778', '0', '3', '订单管理', './index.php?c=site&a=entry&op=order&do=shopping&m=xfeng_community', 'shoppingorder', 'shop', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15779', '0', '3', '商品管理', './index.php?c=site&a=entry&op=goods&do=shopping&m=xfeng_community', 'shoppinggoods', 'shop', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15780', '0', '3', '商品分类', './index.php?c=site&a=entry&op=list&do=category&type=5&m=xfeng_community', 'category', 'shop', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15781', '0', '3', '提现审核', './index.php?c=site&a=entry&op=cash&do=shopping&m=xfeng_community', 'shoppingcash', 'shop', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('4', '0', '0', '小区商家', './index.php?c=site&a=entry&do=seller&method=seller&m=xfeng_community', 'seller', 'seller', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15782', '0', '4', '店铺分类', './index.php?c=site&a=entry&op=list&type=6&do=category&m=xfeng_community', 'category', 'seller', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15783', '0', '4', '店铺管理', './index.php?c=site&a=entry&op=dp&do=business&m=xfeng_community', 'businessdp', 'seller', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15784', '0', '4', '卡券核销', './index.php?c=site&a=entry&op=coupon&do=business&m=xfeng_community', 'businesscoupon', 'seller', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15785', '0', '4', '提现审核', './index.php?c=site&a=entry&op=cash&do=business&m=xfeng_community', 'businesscash', 'seller', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15786', '0', '4', '订单管理', './index.php?c=site&a=entry&op=order&do=business&m=xfeng_community', 'businessorder', 'seller', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('5', '0', '0', '分权系统', './index.php?c=site&a=entry&do=perm&method=perm&m=xfeng_community', 'perm', 'perm', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15787', '0', '5', '用户管理', './index.php?c=site&a=entry&op=list&do=users&m=xfeng_community', 'userslist', 'perm', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15788', '0', '5', '小区套餐', './index.php?c=site&a=entry&op=list&do=control&m=xfeng_community', 'controllist', 'perm', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('6', '0', '0', '云服务', './index.php?c=site&a=entry&do=system&method=system&m=xfeng_community', 'system', 'system', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15789', '0', '6', '系统授权', './index.php?c=site&a=entry&op=display&do=system&m=xfeng_community', 'systemdisplay', 'system', null);
INSERT INTO `ims_xcommunity_menu` VALUES ('15790', '0', '6', '系统更新', './index.php?c=site&a=entry&op=upgrade&do=system&m=xfeng_community', 'systemupgrade', 'system', null);
SET FOREIGN_KEY_CHECKS=1;