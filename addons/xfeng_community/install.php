<?php

$installSql = <<<SQL
CREATE TABLE IF NOT EXISTS `ims_xcommunity_activity` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='小区活动表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_alipayment`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_alipayment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) NOT NULL COMMENT '公众号ID',
  `pid` int(11) NOT NULL,
  `account` varchar(50) NOT NULL COMMENT '支付宝账号',
  `partner` varchar(50) NOT NULL COMMENT '合作者身份',
  `secret` varchar(50) NOT NULL COMMENT '校验密钥',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='独立支付宝配置' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_announcement`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_announcement` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='公告管理' AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_building_device`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_building_device` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_carpool`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_carpool` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='拼车表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_cart`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `goodsid` int(11) NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `marketprice` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='购物车表' AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_category`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_category` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='类型表' AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_cost`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_cost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `createtime` int(10) unsigned NOT NULL,
  `regionid` int(10) unsigned NOT NULL,
  `costtime` varchar(30) NOT NULL COMMENT '费用时间',
  `enable` int(1) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='物业费用时间表' AUTO_INCREMENT=237 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_cost_list`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_cost_list` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='物业费表' AUTO_INCREMENT=6708 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_dp`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_dp` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商家店铺表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_fled`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_fled` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='二手管理' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_goods`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_goods` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='商品表' AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_homemaking`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_homemaking` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='家政服务表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_houselease`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_houselease` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='房屋租赁表' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_images`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) DEFAULT NULL,
  `file` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='图片表' AUTO_INCREMENT=115 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_member`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_member` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户管理' AUTO_INCREMENT=835 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_member_address`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_member_address` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_menu`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `pcate` int(10) NOT NULL,
  `title` varchar(30) NOT NULL COMMENT '菜单标题',
  `url` varchar(1000) NOT NULL COMMENT '菜单链接',
  `do` varchar(20) NOT NULL COMMENT '动作',
  `method` varchar(20) DEFAULT NULL,
  `xcommunity_menu` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='后台菜单管理' AUTO_INCREMENT=15750 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_nav`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_nav` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='微信端菜单管理' AUTO_INCREMENT=14786 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_notice`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_notice` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='通知设置' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_opendoor_data`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_opendoor_data` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='访客码数据' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_open_log`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_open_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `regionid` int(11) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT '门类型',
  `openid` varchar(50) NOT NULL COMMENT '业主openid',
  `realname` varchar(50) NOT NULL COMMENT '业主姓名',
  `createtime` int(11) NOT NULL COMMENT '开门时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='开门记录' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_order`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_order` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='订单表' AUTO_INCREMENT=1199 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_order_goods`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_order_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `orderid` int(10) unsigned NOT NULL,
  `goodsid` int(10) unsigned NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `total` int(10) unsigned NOT NULL DEFAULT '1',
  `createtime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='订单商品附表' AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_pay`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_pay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `pay` varchar(200) NOT NULL,
  `type` int(1) NOT NULL COMMENT '1超市2物业费3商家4小区活动',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='支付方式配置表' AUTO_INCREMENT=32 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_pay_api`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_pay_api` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL,
  `pay` text NOT NULL,
  `type` int(1) NOT NULL,
  `paytype` int(1) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_phone`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_phone` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='常用电话' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_print`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_print` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='打印机表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_property`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_property` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='物业管理' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_pstyle`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_pstyle` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='物业风采' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_pstyle_content`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_pstyle_content` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='物业风采' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_rank`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `weid` int(10) unsigned NOT NULL,
  `type` int(1) unsigned NOT NULL COMMENT '1商家,2超市',
  `content` varchar(2000) NOT NULL COMMENT '评价内容',
  `dpid` int(11) DEFAULT '0' COMMENT '商家店铺id',
  `openid` varchar(100) NOT NULL COMMENT '粉丝openid',
  `createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='评价表' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_reading_member`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_reading_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL COMMENT '公众号ID',
  `aid` int(10) unsigned NOT NULL COMMENT '公告id',
  `openid` varchar(50) NOT NULL,
  `status` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='公告阅读记录表' AUTO_INCREMENT=886 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_region`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_region` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='小区管理' AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_report`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_report` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='报修投诉管理' AUTO_INCREMENT=262 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_res`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_res` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='报名表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_room`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_room` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='房号表' AUTO_INCREMENT=1151 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_search`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_search` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='便民查询' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_service`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_service` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='社区服务' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_service_data`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_service_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `type` int(1) NOT NULL COMMENT '物业费1，超市2，商家3',
  `sub_mch_id` varchar(50) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='子商户关联数据' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_service_set`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_service_set` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `switch` int(1) NOT NULL,
  `mchid` varchar(50) NOT NULL,
  `signkey` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='服务商设置' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_set`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_set` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='小区设置' AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_setting`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_setting` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(11) NOT NULL,
  `regionid` int(11) NOT NULL,
  `value` text NOT NULL,
  `key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_slide`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_slide` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='幻灯管理' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_template`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `styleid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模板设置' AUTO_INCREMENT=2386 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_users`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_users` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=29 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_users_group`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_users_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属帐号',
  `title` varchar(50) NOT NULL,
  `maxaccount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_wechat_notice`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_wechat_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uniacid` int(10) unsigned NOT NULL,
  `regionid` text NOT NULL,
  `fansopenid` varchar(50) NOT NULL,
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='通知设置' AUTO_INCREMENT=43 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_wechat_smsid`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_wechat_smsid` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='短信设置' AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_wechat_tplid`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_wechat_tplid` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='模板消息设置' AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- 表的结构 `ims_xcommunity_wnotice`
--

CREATE TABLE IF NOT EXISTS `ims_xcommunity_wnotice` (
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='业主须知' AUTO_INCREMENT=1 ;
SQL;
$row = pdo_run($installSql);


