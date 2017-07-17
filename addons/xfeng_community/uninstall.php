<?php
/**
 * Created by PhpStorm.
 * User: zhoufeng
 * Date: 16/6/11
 * Time: 下午7:48
 */
$uninstallSql = <<<uninstallSql
	DROP TABLE IF EXISTS `ims_xcommunity_nav`;
	DROP TABLE IF EXISTS `ims_xcommunity_menu`;
	DROP TABLE IF EXISTS `ims_xcommunity_slide`;
	DROP TABLE IF EXISTS `ims_xcommunity_property`;
	DROP TABLE IF EXISTS `ims_xcommunity_announcement`;
	DROP TABLE IF EXISTS `ims_xcommunity_reading_member`;
	DROP TABLE IF EXISTS `ims_xcommunity_member`;
	DROP TABLE IF EXISTS `ims_xcommunity_room`;
	DROP TABLE IF EXISTS `ims_xcommunity_phone`;
	DROP TABLE IF EXISTS `ims_xcommunity_region`;
	DROP TABLE IF EXISTS `ims_xcommunity_report`;
	DROP TABLE IF EXISTS `ims_xcommunity_houselease`;
	DROP TABLE IF EXISTS `ims_xcommunity_homemaking`;
	DROP TABLE IF EXISTS `ims_xcommunity_search`;
	DROP TABLE IF EXISTS `ims_xcommunity_fled`;
	DROP TABLE IF EXISTS `ims_xcommunity_carpool`;
	DROP TABLE IF EXISTS `ims_xcommunity_category`;
	DROP TABLE IF EXISTS `ims_xcommunity_template`;
	DROP TABLE IF EXISTS `ims_xcommunity_wechat_notice`;
	DROP TABLE IF EXISTS `ims_xcommunity_wechat_tplid`;
	DROP TABLE IF EXISTS `ims_xcommunity_wechat_smsid`;
	DROP TABLE IF EXISTS `ims_xcommunity_print`;
	DROP TABLE IF EXISTS `ims_xcommunity_set`;
	DROP TABLE IF EXISTS `ims_xcommunity_cost_list`;
	DROP TABLE IF EXISTS `ims_xcommunity_cost`;
    DROP TABLE IF EXISTS `ims_xcommunity_activity`;
    DROP TABLE IF EXISTS `ims_xcommunity_res`;
    DROP TABLE IF EXISTS `ims_xcommunity_goods`;
    DROP TABLE IF EXISTS `ims_xcommunity_cart`;
    DROP TABLE IF EXISTS `ims_xcommunity_order`;
    DROP TABLE IF EXISTS `ims_xcommunity_order_goods`;
    DROP TABLE IF EXISTS `ims_xcommunity_pay`;
    DROP TABLE IF EXISTS `ims_xcommunity_alipayment`;
    DROP TABLE IF EXISTS `ims_xcommunity_users`;
    DROP TABLE IF EXISTS `ims_xcommunity_dp`;
    DROP TABLE IF EXISTS `ims_xcommunity_rank`;
    DROP TABLE IF EXISTS `ims_xcommunity_users_group`;
    DROP TABLE IF EXISTS `ims_xcommunity_images`;
uninstallSql;
pdo_run($uninstallSql);