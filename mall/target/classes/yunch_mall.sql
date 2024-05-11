/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost:3306
 Source Schema         : yunch_mall

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 08/03/2024 09:32:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for branch_table
-- ----------------------------
DROP TABLE IF EXISTS `branch_table`;
CREATE TABLE `branch_table`  (
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `resource_group_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `resource_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `branch_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `client_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(6) NULL DEFAULT NULL,
  `gmt_modified` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`branch_id`) USING BTREE,
  INDEX `idx_xid`(`xid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_help
-- ----------------------------
DROP TABLE IF EXISTS `cms_help`;
CREATE TABLE `cms_help`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_status` int(1) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `read_count` int(1) NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_help_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_help_category`;
CREATE TABLE `cms_help_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `help_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '帮助分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_member_report
-- ----------------------------
DROP TABLE IF EXISTS `cms_member_report`;
CREATE TABLE `cms_member_report`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `report_type` int(1) NULL DEFAULT NULL COMMENT '举报类型：0->商品评价；1->话题内容；2->用户评论',
  `report_member_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `report_object` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '举报内容',
  `report_status` int(1) NULL DEFAULT NULL COMMENT '举报状态：0->未处理；1->已处理',
  `handle_status` int(1) NULL DEFAULT NULL COMMENT '处理结果：0->无效；1->有效；2->恶意',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户举报表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_prefrence_area
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area`;
CREATE TABLE `cms_prefrence_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题标题',
  `pic` varbinary(500) NULL DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不推荐，1->推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_prefrence_area
-- ----------------------------
INSERT INTO `cms_prefrence_area` VALUES (1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1);
INSERT INTO `cms_prefrence_area` VALUES (2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (3, '让音质更出众33', NULL, NULL, NULL, NULL);
INSERT INTO `cms_prefrence_area` VALUES (4, '让音质更出众44', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_prefrence_area_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_prefrence_area_product_relation`;
CREATE TABLE `cms_prefrence_area_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) NULL DEFAULT NULL COMMENT '偏好区域id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优选专区和产品关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_prefrence_area_product_relation
-- ----------------------------
INSERT INTO `cms_prefrence_area_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_prefrence_area_product_relation` VALUES (24, 1, 23);

-- ----------------------------
-- Table structure for cms_subject
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject`;
CREATE TABLE `cms_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '类别id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题名称',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态：0->不推荐，1->推荐',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `collect_count` int(11) NULL DEFAULT NULL COMMENT '收藏数量',
  `read_count` int(11) NULL DEFAULT NULL COMMENT '阅读数量',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '评论数量',
  `album_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细描述',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专题内容',
  `forward_count` int(11) NULL DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_subject
-- ----------------------------
INSERT INTO `cms_subject` VALUES (1, 1, 'polo衬衫的也时尚', NULL, NULL, NULL, '2018-11-11 13:26:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (2, 2, '大牌手机低价秒', NULL, NULL, NULL, '2018-11-12 13:27:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` VALUES (3, 2, '晓龙845新品上市', NULL, NULL, NULL, '2018-11-13 13:27:05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');
INSERT INTO `cms_subject` VALUES (4, 1, '夏天应该穿什么', NULL, NULL, NULL, '2018-11-01 13:27:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (5, 1, '夏季精选', NULL, NULL, NULL, '2018-11-06 13:27:18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '服装专题');
INSERT INTO `cms_subject` VALUES (6, 2, '品牌手机降价', NULL, NULL, NULL, '2018-11-07 13:27:21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '手机专题');

-- ----------------------------
-- Table structure for cms_subject_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_category`;
CREATE TABLE `cms_subject_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL COMMENT '显示状态 0->不推荐，1->推荐',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_subject_category
-- ----------------------------
INSERT INTO `cms_subject_category` VALUES (1, '服装专题', NULL, NULL, NULL, NULL);
INSERT INTO `cms_subject_category` VALUES (2, '手机专题', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for cms_subject_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_comment`;
CREATE TABLE `cms_subject_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL COMMENT '专题id',
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不推荐，1->推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_subject_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `cms_subject_product_relation`;
CREATE TABLE `cms_subject_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL COMMENT '专题id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题商品关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cms_subject_product_relation
-- ----------------------------
INSERT INTO `cms_subject_product_relation` VALUES (1, 1, 12);
INSERT INTO `cms_subject_product_relation` VALUES (2, 1, 13);
INSERT INTO `cms_subject_product_relation` VALUES (3, 1, 14);
INSERT INTO `cms_subject_product_relation` VALUES (4, 1, 18);
INSERT INTO `cms_subject_product_relation` VALUES (5, 1, 7);
INSERT INTO `cms_subject_product_relation` VALUES (6, 2, 7);
INSERT INTO `cms_subject_product_relation` VALUES (7, 1, 22);
INSERT INTO `cms_subject_product_relation` VALUES (29, 1, 23);
INSERT INTO `cms_subject_product_relation` VALUES (30, 4, 23);
INSERT INTO `cms_subject_product_relation` VALUES (31, 5, 23);
INSERT INTO `cms_subject_product_relation` VALUES (41, 2, 26);
INSERT INTO `cms_subject_product_relation` VALUES (42, 3, 26);
INSERT INTO `cms_subject_product_relation` VALUES (43, 6, 26);

-- ----------------------------
-- Table structure for cms_topic
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic`;
CREATE TABLE `cms_topic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '类别id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '话题名称',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '参与人数',
  `attention_count` int(11) NULL DEFAULT NULL COMMENT '关注人数',
  `read_count` int(11) NULL DEFAULT NULL COMMENT '阅读数量',
  `award_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '奖品名称',
  `attend_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参与方式',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '话题内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_topic_category
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_category`;
CREATE TABLE `cms_topic_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图标',
  `subject_count` int(11) NULL DEFAULT NULL COMMENT '专题数量',
  `show_status` int(2) NULL DEFAULT NULL COMMENT '显示状态：0->不推荐，1->推荐',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '话题分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for cms_topic_comment
-- ----------------------------
DROP TABLE IF EXISTS `cms_topic_comment`;
CREATE TABLE `cms_topic_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `topic_id` bigint(20) NULL DEFAULT NULL COMMENT '话题id',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不推荐，1->推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专题评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for global_table
-- ----------------------------
DROP TABLE IF EXISTS `global_table`;
CREATE TABLE `global_table`  (
  `xid` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `application_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_service_group` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timeout` int(11) NULL DEFAULT NULL,
  `begin_time` bigint(20) NULL DEFAULT NULL,
  `application_data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`xid`) USING BTREE,
  INDEX `idx_gmt_modified_status`(`gmt_modified`, `status`) USING BTREE,
  INDEX `idx_transaction_id`(`transaction_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for lock_table
-- ----------------------------
DROP TABLE IF EXISTS `lock_table`;
CREATE TABLE `lock_table`  (
  `row_key` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `xid` varchar(96) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `transaction_id` bigint(20) NULL DEFAULT NULL,
  `branch_id` bigint(20) NOT NULL,
  `resource_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `table_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pk` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gmt_create` datetime(0) NULL DEFAULT NULL,
  `gmt_modified` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`row_key`) USING BTREE,
  INDEX `idx_branch_id`(`branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for oms_cart_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_cart_item`;
CREATE TABLE `oms_cart_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车ID，主键，自动递增',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  `product_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品SKU库存ID',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '添加到购物车的价格',
  `product_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sub_title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品副标题（卖点）',
  `product_sku_code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `member_nickname` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_date` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `delete_status` int(1) NULL DEFAULT 0 COMMENT '是否删除',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_cart_item
-- ----------------------------
INSERT INTO `oms_cart_item` VALUES (12, 26, 90, 1, 1, 3788.00, NULL, '华为 HUAWEI P20', 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '201806070026001', 'windir', '2018-08-27 16:53:44', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (13, 27, 98, 1, 3, 2699.00, NULL, '小米8', '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '201808270027001', 'windir', '2018-08-27 17:11:53', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (14, 28, 102, 1, 1, 649.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-27 17:18:02', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (15, 28, 103, 1, 1, 699.00, NULL, '红米5A', '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '201808270028001', 'windir', '2018-08-28 10:22:45', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (16, 29, 106, 1, 1, 5499.00, NULL, 'Apple iPhone 8 Plus', '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '201808270029001', 'windir', '2018-08-28 10:50:50', NULL, 1, 19, NULL, NULL, NULL);
INSERT INTO `oms_cart_item` VALUES (19, 36, 163, 1, 3, 100.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:51:59', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `oms_cart_item` VALUES (20, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 15:54:23', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_cart_item` VALUES (21, 36, 164, 1, 2, 120.00, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '202002210036001', 'windir', '2020-02-25 16:49:53', NULL, 1, 29, 'NIKE', '6799345', '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');

-- ----------------------------
-- Table structure for oms_company_address
-- ----------------------------
DROP TABLE IF EXISTS `oms_company_address`;
CREATE TABLE `oms_company_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) NULL DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) NULL DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市',
  `region` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司收发货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_company_address
-- ----------------------------
INSERT INTO `oms_company_address` VALUES (1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');
INSERT INTO `oms_company_address` VALUES (4, '哈尔滨收货点', 1, 1, '大苹果', '18900900000', '黑龙江省', '哈尔滨市', '南岗区', '学府经典A区');

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '优惠券ID',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) NULL DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) NULL DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) NULL DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) NULL DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) NULL DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) NULL DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) NULL DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT 0 COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) NULL DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order
-- ----------------------------
INSERT INTO `oms_order` VALUES (13, 1, 2, '201809150102000002', '2018-09-15 14:24:29', 'test', 18732.00, 16365.75, 8.00, 2344.25, 0.00, 10.00, 20.00, 1, 1, 0, 0, '顺丰快递', '9090888', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '庄严', '13609887722', '150080', '黑龙江省', '绥化市', '望奎县', 'xxx', '轻拿轻放\n', 0, 0, 1000, '2018-10-11 14:04:19', '2024-01-25 16:56:59', NULL, NULL, '2024-01-26 11:48:26');
INSERT INTO `oms_order` VALUES (14, 1, 2, '201809130101000001', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, '顺丰快递', '201707196398345', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨3', '18033441847', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, '2018-10-13 13:44:04', '2018-10-16 13:43:41', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (15, 1, 2, '201809130102000002', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, '顺丰快递', '201707196398346', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨4', '18033441846', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', NULL, NULL);
INSERT INTO `oms_order` VALUES (16, 1, 2, '201809140101000001', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨5', '18033441845', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2023-02-15 16:58:23');
INSERT INTO `oms_order` VALUES (17, 1, 2, '201809150101000003', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨6', '18033441844', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, '2023-02-15 16:58:23');
INSERT INTO `oms_order` VALUES (18, 1, 2, '201809150102000004', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 2, 0, '圆通快递', '11223333', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨7', '18033441843', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, NULL, '2024-01-25 16:56:59', NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (19, 1, 2, '201809130101000003', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨8', '18033441842', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (20, 1, 2, '201809130102000004', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨1', '18033441841', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (21, 1, 2, '201809140101000002', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨1', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '2023-02-15 16:58:23');
INSERT INTO `oms_order` VALUES (22, 1, 2, '201809150101000005', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨1', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, '2023-02-15 16:58:23');
INSERT INTO `oms_order` VALUES (23, 1, 2, '201809150102000006', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 2, 0, '顺丰快递', '12345677654321', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨1', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', '易碎物品，轻拿轻放！', 0, 0, 1000, NULL, '2018-10-16 14:41:28', NULL, NULL, '2023-02-15 16:21:46');
INSERT INTO `oms_order` VALUES (24, 1, 2, '201809130101000005', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨1', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order` VALUES (28, 1, NULL, '202002250100000002', '2020-02-25 16:05:47', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 25.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨4', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-02-15 16:57:36');
INSERT INTO `oms_order` VALUES (29, 1, NULL, '202002250100000003', '2020-02-25 16:07:58', 'test', 540.00, 540.00, 0.00, 0.00, 0.00, 0.00, 20.00, 0, 1, 4, 0, NULL, NULL, NULL, 0, 0, '无优惠,无优惠', NULL, NULL, NULL, NULL, NULL, '诸葛孔明', '13800112233', '150080', '黑龙江省', '哈尔滨市', '松北区', '黑龙江科技大学门卫', '贵重商品，妥善投递！', 0, 0, NULL, NULL, NULL, NULL, NULL, '2023-02-15 15:50:35');
INSERT INTO `oms_order` VALUES (30, 1, NULL, '202002250100000004', '2020-02-25 16:50:13', 'test', 240.00, 240.00, 20.00, 0.00, 0.00, 0.00, 10.00, 1, 1, 2, 0, '顺丰快递', '12333333', NULL, 0, 0, '无优惠', NULL, NULL, NULL, NULL, NULL, '大梨8', '18033441849', '518000', '广东省', '深圳市', '南山区', '科兴科学园', NULL, 0, 0, NULL, '2020-02-25 16:53:29', '2020-02-25 16:54:03', NULL, NULL, '2020-02-25 16:52:51');
INSERT INTO `oms_order` VALUES (31, 1, NULL, NULL, '2024-02-23 15:35:49', 'test', 9198.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李野', '132****1383', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_item`;
CREATE TABLE `oms_order_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单项id，自增',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品封面图',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌',
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) NULL DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类id',
  `promotion_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) NULL DEFAULT 0 COMMENT '赠送计分',
  `gift_growth` int(11) NULL DEFAULT 0 COMMENT '赠送成长值',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性:[{\"key\":\"颜色\",\"value\":\"颜色\"},{\"key\":\"容量\",\"value\":\"4G\"}]',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单中所包含的商品' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_item
-- ----------------------------
INSERT INTO `oms_order_item` VALUES (21, 12, '201809150101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (26, 13, '201809150102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (31, 14, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (36, 15, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (39, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (40, 15, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (41, 16, '201809140101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (42, 16, '201809140101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (43, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `oms_order_item` VALUES (44, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (45, 16, '201809140101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `oms_order_item` VALUES (46, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (47, 27, '202002250100000001', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (48, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (49, 28, '202002250100000002', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, NULL);
INSERT INTO `oms_order_item` VALUES (50, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 100.00, 3, 163, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 100.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `oms_order_item` VALUES (51, 29, '202002250100000003', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_order_item` VALUES (52, 30, '202002250100000004', 36, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'NIKE', '6799345', 120.00, 2, 164, '202002210036001', 29, '无优惠', 0.00, 0.00, 0.00, 120.00, 0, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `oms_order_item` VALUES (53, 31, NULL, 39, NULL, '小米14', NULL, NULL, 4599.00, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL);

-- ----------------------------
-- Table structure for oms_order_operate_history
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_operate_history`;
CREATE TABLE `oms_order_operate_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) NULL DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作历史记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_operate_history
-- ----------------------------
INSERT INTO `oms_order_operate_history` VALUES (5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货');
INSERT INTO `oms_order_operate_history` VALUES (9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx');
INSERT INTO `oms_order_operate_history` VALUES (15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单');
INSERT INTO `oms_order_operate_history` VALUES (19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息');
INSERT INTO `oms_order_operate_history` VALUES (20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx');
INSERT INTO `oms_order_operate_history` VALUES (22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222');
INSERT INTO `oms_order_operate_history` VALUES (23, 12, '后台管理员', '2019-11-09 16:50:28', 4, '修改备注信息：111');
INSERT INTO `oms_order_operate_history` VALUES (24, 30, '后台管理员', '2020-02-25 16:52:37', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (25, 30, '后台管理员', '2020-02-25 16:52:51', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (26, 30, '后台管理员', '2020-02-25 16:54:03', 2, '完成发货');
INSERT INTO `oms_order_operate_history` VALUES (27, 27, '管理员', '2022-12-06 11:25:38', 4, '顾客不想买了');
INSERT INTO `oms_order_operate_history` VALUES (28, 13, '管理员', '2022-12-06 11:31:13', 1, '修改订单备注：轻拿轻放\n');
INSERT INTO `oms_order_operate_history` VALUES (29, 13, '系统管理员', '2022-12-07 09:26:36', 2, '订单发货');
INSERT INTO `oms_order_operate_history` VALUES (30, 28, '系统管理员', '2022-12-07 10:15:03', 0, '修改费用信息');
INSERT INTO `oms_order_operate_history` VALUES (31, 28, '暂时不写', '2023-02-15 10:56:31', 4, '关闭订单：超时未支付');
INSERT INTO `oms_order_operate_history` VALUES (32, 29, 'orderAdmin/订单管理员', '2023-02-15 11:32:22', 4, '关闭订单：顾客不想要了！');
INSERT INTO `oms_order_operate_history` VALUES (33, 28, 'orderAdmin/订单管理员', '2023-02-15 14:04:06', 4, '关闭订单：测试');
INSERT INTO `oms_order_operate_history` VALUES (34, 29, 'orderAdmin/订单管理员', '2023-02-15 14:26:12', 0, '修改收件人地址！');
INSERT INTO `oms_order_operate_history` VALUES (35, 29, 'orderAdmin/订单管理员', '2023-02-15 14:54:19', 0, '修改订单费用信息！');
INSERT INTO `oms_order_operate_history` VALUES (36, 29, 'orderAdmin/订单管理员', '2023-02-15 14:56:29', 0, '修改订单费用信息！');
INSERT INTO `oms_order_operate_history` VALUES (37, 23, 'orderAdmin/订单管理员', '2023-02-15 15:45:49', 1, '修改备注：易碎物品，轻拿轻放！');
INSERT INTO `oms_order_operate_history` VALUES (38, 29, 'orderAdmin/订单管理员', '2023-02-15 15:50:35', 0, '修改备注：贵重商品，妥善投递！');
INSERT INTO `oms_order_operate_history` VALUES (39, 23, 'admin/系统管理员', '2023-02-15 16:21:46', 2, '订单发货！');
INSERT INTO `oms_order_operate_history` VALUES (40, 16, '系统管理员', '2023-02-15 16:55:40', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (41, 17, '系统管理员', '2023-02-15 16:57:19', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (42, 22, '系统管理员', '2023-02-15 16:57:19', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (43, 21, '系统管理员', '2023-02-15 16:57:36', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (44, 28, '系统管理员', '2023-02-15 16:57:36', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (45, 16, '系统管理员', '2023-02-15 16:58:23', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (46, 17, '系统管理员', '2023-02-15 16:58:23', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (47, 21, '系统管理员', '2023-02-15 16:58:23', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (48, 22, '系统管理员', '2023-02-15 16:58:23', 4, '删除订单！');
INSERT INTO `oms_order_operate_history` VALUES (50, 29, '当前登录管理员', '2024-01-25 15:12:53', 4, '顾客不想要了！！！');
INSERT INTO `oms_order_operate_history` VALUES (54, 29, '当前登录管理员', '2024-01-25 15:30:14', 4, 'hello');
INSERT INTO `oms_order_operate_history` VALUES (55, 13, '当前登录管理员', '2024-01-25 16:56:59', 2, '订单发货');
INSERT INTO `oms_order_operate_history` VALUES (56, 18, '当前登录管理员', '2024-01-25 16:56:59', 2, '订单发货');
INSERT INTO `oms_order_operate_history` VALUES (57, 21, '7,orderAdmin', '2024-01-26 09:55:16', 6, '删除订单');
INSERT INTO `oms_order_operate_history` VALUES (58, 22, '7,orderAdmin', '2024-01-26 09:55:16', 6, '删除订单');
INSERT INTO `oms_order_operate_history` VALUES (59, 13, '登录人信息', '2024-01-26 10:41:26', 0, '修改收件人信息');
INSERT INTO `oms_order_operate_history` VALUES (60, 13, '7,orderAdmin', '2024-01-26 11:48:26', 0, '修改费用信息');

-- ----------------------------
-- Table structure for oms_order_return_apply
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_apply`;
CREATE TABLE `oms_order_return_apply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) NULL DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) NULL DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原因',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime(0) NULL DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单退货申请' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_return_apply
-- ----------------------------
INSERT INTO `oms_order_return_apply` VALUES (3, 12, 4, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', 3585.98, '大梨', '18000000000', 1, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '可以退款', 'admin', 'admin', NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 2, '2022-12-08 11:20:52', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', 'admin', '2022-12-08 11:20:52', '已收到退货，货品完整无损失');
INSERT INTO `oms_order_return_apply` VALUES (5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了');
INSERT INTO `oms_order_return_apply` VALUES (8, 13, NULL, 28, '201809150102000002', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 3, '2018-10-18 13:57:12', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '理由不够充分', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了');
INSERT INTO `oms_order_return_apply` VALUES (13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (15, 16, 2, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', 3585.98, '大梨', '18000000000', 2, '2022-12-08 11:16:52', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '确认退货：可以退货', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2022-12-08 11:06:02', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '拒绝退货：退货理由不充分！', 'admin', NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (17, 16, 4, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2023-02-14 16:52:59', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '11', 'admin', 'admin', NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (18, 17, 4, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', 0.00, '大梨', '18000000000', 3, '2023-02-14 16:57:18', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, 'admin', 'admin', NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (19, 17, 4, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', 2022.81, '大梨', '18000000000', 2, '2023-02-14 16:57:33', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '11', 'admin', 'admin', '2023-02-14 16:58:08', '已收到退货，检查无问题！');
INSERT INTO `oms_order_return_apply` VALUES (20, 17, 4, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', 0.00, '大梨', '18000000000', 1, '2023-02-15 11:13:08', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, 'admin', 'admin', NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (21, 18, 4, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', 3585.98, '大梨', '18000000000', 2, '2024-01-26 15:14:15', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, 'admin', '当前登录用户', '2024-01-26 15:14:15', '退货商品无损坏！');
INSERT INTO `oms_order_return_apply` VALUES (22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (25, 19, NULL, 27, '201809130101000003', '2023-02-13 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `oms_order_return_apply` VALUES (26, 19, NULL, 28, '201809130101000003', '2023-02-14 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_order_return_reason
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_return_reason`;
CREATE TABLE `oms_order_return_reason`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '退货原因表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_return_reason
-- ----------------------------
INSERT INTO `oms_order_return_reason` VALUES (1, '质量问题', 1, 1, '2018-10-17 10:00:45');
INSERT INTO `oms_order_return_reason` VALUES (2, '尺码太大', 1, 1, '2018-10-17 10:01:03');
INSERT INTO `oms_order_return_reason` VALUES (3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13');
INSERT INTO `oms_order_return_reason` VALUES (4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47');
INSERT INTO `oms_order_return_reason` VALUES (5, '价格问题', 1, 0, '2018-10-17 10:01:57');
INSERT INTO `oms_order_return_reason` VALUES (12, '发票问题', 0, 1, '2018-10-19 16:28:36');
INSERT INTO `oms_order_return_reason` VALUES (13, '其他问题', 0, 1, '2018-10-19 16:28:51');
INSERT INTO `oms_order_return_reason` VALUES (14, '物流问题', 0, 1, '2018-10-19 16:29:01');
INSERT INTO `oms_order_return_reason` VALUES (15, '售后问题', 0, 1, '2018-10-19 16:29:11');
INSERT INTO `oms_order_return_reason` VALUES (16, '测试原因', 1, 1, '2022-12-08 08:40:09');
INSERT INTO `oms_order_return_reason` VALUES (19, '不想要了', 0, 1, '2023-02-14 15:14:22');
INSERT INTO `oms_order_return_reason` VALUES (20, '发货时间问题', 0, 1, '2023-02-14 15:14:39');
INSERT INTO `oms_order_return_reason` VALUES (21, '测试2', 0, 1, '2023-02-14 15:14:54');

-- ----------------------------
-- Table structure for oms_order_setting
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_setting`;
CREATE TABLE `oms_order_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) NULL DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) NULL DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) NULL DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) NULL DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) NULL DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单设置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of oms_order_setting
-- ----------------------------
INSERT INTO `oms_order_setting` VALUES (1, 5, 15, 15, 8, 15);

-- ----------------------------
-- Table structure for pms_album
-- ----------------------------
DROP TABLE IF EXISTS `pms_album`;
CREATE TABLE `pms_album`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相册名称',
  `cover_pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `pic_count` int(11) NULL DEFAULT NULL COMMENT '图片数量',
  `sort` int(11) NULL DEFAULT NULL COMMENT '序号',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文字描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '相册表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_album_pic
-- ----------------------------
DROP TABLE IF EXISTS `pms_album_pic`;
CREATE TABLE `pms_album_pic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NULL DEFAULT NULL COMMENT '相册ID',
  `pic` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画册图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_brand
-- ----------------------------
DROP TABLE IF EXISTS `pms_brand`;
CREATE TABLE `pms_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `first_letter` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `factory_status` int(1) NULL DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '是否显示',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) NULL DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专区大图',
  `brand_story` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '品牌故事',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_brand
-- ----------------------------
INSERT INTO `pms_brand` VALUES (1, '万和', 'W', 1, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (2, '三星', 'S', 100, 1, 1, 101, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, '三星的故事');
INSERT INTO `pms_brand` VALUES (3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (2).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (3).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事');
INSERT INTO `pms_brand` VALUES (6, '小米', 'M', 500, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5a912944N474afb7a.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事');
INSERT INTO `pms_brand` VALUES (21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string');
INSERT INTO `pms_brand` VALUES (49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/1522738681.jpg', NULL, 'BOOB的故事');
INSERT INTO `pms_brand` VALUES (50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/LOGO1024.png', '', '海澜之家的故事');
INSERT INTO `pms_brand` VALUES (51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '苹果的故事');
INSERT INTO `pms_brand` VALUES (58, 'NIKE', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事');
INSERT INTO `pms_brand` VALUES (59, '伊利', 'Y', 0, 1, 1, NULL, NULL, 'http://localhost:8080/minio/image/8486945838d24a009b3f018dd5543378.png', '', '中国第一大乳制品生产商');
INSERT INTO `pms_brand` VALUES (61, '雪中飞', 'N', 0, 1, 1, NULL, NULL, 'http://localhost:8000/minio/image/b821bdde6680482fa09a394f89ac8d46.jpg', 'http://localhost:8000/minio/image/9f6a17d0b0c840f88a488d9dbf188e67.jpg', '雪中飞品牌是以羽绒服为基础 [3]  ，并打造为具有影响力的活力时尚运动服装品牌。“雪中飞”品牌创立于功能服装行业蓬勃发展的20世纪末。');

-- ----------------------------
-- Table structure for pms_comment
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment`;
CREATE TABLE `pms_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `star` int(3) NULL DEFAULT NULL COMMENT '评价星数：0->5',
  `member_ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价的ip',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '评价时间',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '是否显示',
  `product_attribute` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买时的商品属性',
  `collect_count` int(11) NULL DEFAULT NULL COMMENT '点赞数',
  `read_count` int(11) NULL DEFAULT NULL COMMENT '阅读次数',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `pics` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传图片地址，以逗号隔开',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户头像',
  `replay_count` int(11) NULL DEFAULT NULL COMMENT '回复数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_comment_replay
-- ----------------------------
DROP TABLE IF EXISTS `pms_comment_replay`;
CREATE TABLE `pms_comment_replay`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) NULL DEFAULT NULL COMMENT '评论id',
  `member_nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复评论的会员昵称',
  `member_icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复评论的会员头像',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  `type` int(1) NULL DEFAULT NULL COMMENT '评论人员类型；0->会员；1->管理员',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品评价回复表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_feight_template
-- ----------------------------
DROP TABLE IF EXISTS `pms_feight_template`;
CREATE TABLE `pms_feight_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `charge_type` int(1) NULL DEFAULT NULL COMMENT '计费类型:0->按重量；1->按件数',
  `first_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '首重kg',
  `first_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '首费（元）',
  `continue_weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '增加重量标准（例如：每增加1Kg）',
  `continme_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '增加运费（例如：增加5元运费）',
  `dest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目的地（省、市）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费模版' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_member_price
-- ----------------------------
DROP TABLE IF EXISTS `pms_member_price`;
CREATE TABLE `pms_member_price`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `member_level_id` bigint(20) NULL DEFAULT NULL COMMENT '会员等级',
  `member_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员等级名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 255 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品会员价格表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_member_price
-- ----------------------------
INSERT INTO `pms_member_price` VALUES (26, 7, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (27, 8, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (28, 9, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (29, 10, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (30, 11, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (31, 12, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (32, 13, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (33, 14, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (37, 18, 1, 500.00, NULL);
INSERT INTO `pms_member_price` VALUES (44, 7, 2, 480.00, NULL);
INSERT INTO `pms_member_price` VALUES (45, 7, 3, 450.00, NULL);
INSERT INTO `pms_member_price` VALUES (52, 22, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (53, 22, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (54, 22, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (58, 24, 1, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (59, 24, 2, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (60, 24, 3, NULL, NULL);
INSERT INTO `pms_member_price` VALUES (112, 23, 1, 88.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (113, 23, 2, 88.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (114, 23, 3, 66.00, '钻石会员');
INSERT INTO `pms_member_price` VALUES (142, 31, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (143, 31, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (144, 31, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (148, 32, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (149, 32, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (150, 32, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (154, 33, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (155, 33, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (156, 33, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (175, 34, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (176, 34, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (177, 34, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (178, 30, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (179, 30, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (180, 30, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (192, 27, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (193, 27, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (194, 27, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (195, 28, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (196, 28, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (197, 28, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (198, 29, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (199, 29, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (200, 29, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (201, 26, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (202, 26, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (203, 26, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (246, 36, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (247, 36, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (248, 36, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (249, 35, 1, NULL, '黄金会员');
INSERT INTO `pms_member_price` VALUES (250, 35, 2, NULL, '白金会员');
INSERT INTO `pms_member_price` VALUES (251, 35, 3, NULL, '钻石会员');
INSERT INTO `pms_member_price` VALUES (252, 39, 1, 4559.00, '黄金会员');
INSERT INTO `pms_member_price` VALUES (253, 39, 2, 4499.00, '白金会员');
INSERT INTO `pms_member_price` VALUES (254, 39, 3, 4399.00, '钻石会员');

-- ----------------------------
-- Table structure for pms_product
-- ----------------------------
DROP TABLE IF EXISTS `pms_product`;
CREATE TABLE `pms_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌id',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品类别',
  `feight_template_id` bigint(20) NULL DEFAULT NULL COMMENT '运费标准id',
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品属性分类id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `product_sn` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '货号',
  `delete_status` int(1) NULL DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) NULL DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) NULL DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) NULL DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '定价',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) NULL DEFAULT 0 COMMENT '赠送的成长值',
  `gift_point` int(11) NULL DEFAULT 0 COMMENT '赠送的积分',
  `use_point_limit` int(11) NULL DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '副标题',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商品描述',
  `original_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '市场价',
  `stock` int(11) NULL DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) NULL DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品关键词',
  `note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `album_pics` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细标题',
  `detail_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详细描述',
  `detail_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情网页内容',
  `detail_mobile_html` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '移动端网页详情',
  `promotion_start_time` datetime(0) NULL DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime(0) NULL DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) NULL DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) NULL DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product
-- ----------------------------
INSERT INTO `pms_product` VALUES (1, 49, 9, 0, 0, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 1, 1, 1, 100, 0, 100.00, 80.00, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', 'http://localhost:8080/minio/image/a39ec7240f6e4360b688683bb8e84522.jpg', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', '2023-02-11 08:00:00', '2023-02-12 16:00:00', NULL, 1, '七匹狼', '休闲裤');
INSERT INTO `pms_product` VALUES (2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套');
INSERT INTO `pms_product` VALUES (3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 0, 1, 1, 1, 1, 1, 0, 100.00, 80.00, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '2023-02-10 16:00:00', '2023-02-12 16:00:00', NULL, 1, '万和', '外套');
INSERT INTO `pms_product` VALUES (6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 0, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 0, 1, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套');
INSERT INTO `pms_product` VALUES (22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套');
INSERT INTO `pms_product` VALUES (23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg\" width=\"500\" height=\"500\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg\" width=\"500\" height=\"500\" /></p>', '', NULL, NULL, 0, 2, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套');
INSERT INTO `pms_product` VALUES (26, 3, 19, 0, 3, '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg\" /><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg\" /></p>', '', NULL, NULL, 0, 1, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 1, 1, 1, 0, 0, 0, 2599.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '<p><img class=\"wscnph\" src=\"http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg\" width=\"500\" /></p>', '', NULL, NULL, 0, 3, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 0, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 4, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 1, 1, 1, 0, 0, 0, 5499.00, NULL, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机数码');
INSERT INTO `pms_product` VALUES (30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 1, 1, 1, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (32, 50, 8, 0, NULL, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤');
INSERT INTO `pms_product` VALUES (33, 6, 35, 0, NULL, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 1, 1, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (34, 6, 35, 0, NULL, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 1, 1, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码');
INSERT INTO `pms_product` VALUES (35, 58, 29, 0, 11, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 1, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (36, 58, 29, 0, 11, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 105, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋');
INSERT INTO `pms_product` VALUES (37, 3, 19, 0, NULL, 'HUAWEI P50', 'http://localhost:8080/minio/image/f7f1d77e4a774b33ac93d9d411be3380.jpg', '100026819200', 0, 1, 1, 1, 0, 0, 0, 4128.00, NULL, 20, 20, 20, 'HUAWEI P50 原色双影像单元 基于鸿蒙操作系统 万象双环设计 支持66W超级快充 8GB+256GB曜金黑 华为手机', 'HUAWEI P50 原色双影像单元 基于鸿蒙操作系统 万象双环设计 支持66W超级快充 8GB+256GB曜金黑 华为手机', 4228.00, 100, 0, '克', 330.00, 1, '', '', '', 'http://localhost:8080/minio/image/0e154bfd0de345499104cf3c5eb23d9f.jpg,http://localhost:8080/minio/image/9620b7940bcc49dd8fa9fca7068d50d0.jpg,http://localhost:8080/minio/image/5711ab9c11d2488184cc39fa59703c91.jpg,http://localhost:8080/minio/image/0a15c614b4e943878c8722694cdd9420.jpg,http://localhost:8080/minio/image/b210db3a2dbe4716afc1c724b055b20e.jpg', '', '', '', '', NULL, NULL, 0, 1, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (38, 3, 19, 0, 3, '华为HUAWEI Mate 50', 'http://localhost:8000/minio/image/14418e323c714c03a298548e2bdfb5ad.jpg', '100035295081', 0, 1, 1, 1, 0, 0, 0, 4699.00, 4599.00, 0, 0, 0, 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息 低电量应急模式 128GB曜金黑华为鸿蒙手机', 'HUAWEI Mate 50 直屏旗舰 超光变XMAGE影像 北斗卫星消息 低电量应急模式 128GB曜金黑华为鸿蒙手机', 4699.00, 100, 0, '台', 550.00, 0, NULL, '', '', 'http://localhost:8000/minio/image/77acc3cfba554a3abc5969d75b6a2d88.jpg,http://localhost:8000/minio/image/4251c3979aaa4a22bab2f0f990419eac.jpg,http://localhost:8000/minio/image/1b9fab11778041759e1783a0bf0ec2b1.jpg', '', '', '<p>华为 yyds</p>\n<p><img src=\"https://m11.360buyimg.com/babel/jfs/t1/70651/26/19797/118882/636e059eE7c7ce5cd/e47ab6d644ce14c1.jpg!q70.dpg.webp\" alt=\"\" width=\"1125\" height=\"1450\" /></p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>', '', '2023-02-11 08:00:00', '2023-02-13 08:00:00', 0, 1, '华为', '手机通讯');
INSERT INTO `pms_product` VALUES (39, 6, 19, 0, 3, '小米14', 'http://127.0.0.1:8000/resource/20240120/ec01f689-8381-4a0c-8dd0-4a07b7452403.jpg', '100071377749', 0, 1, 1, 1, 0, 0, 0, 4599.00, 4399.00, 20, 10, 1000, '小米14 徕卡光学镜头 光影猎人900 徕卡75mm浮动长焦 骁龙8Gen3 16+512 黑色 小米手机 红米手机 5G', '小米14 徕卡光学镜头 光影猎人900 徕卡75mm浮动长焦 骁龙8Gen3 16+512 黑色 小米手机 红米手机 5G', 4599.00, 998, 0, '部', 565.00, 1, '1,2,3', '', '', 'http://127.0.0.1:8000/resource/20240120/401184d3-51cb-4e51-b451-2164b23dbf12.jpg,http://127.0.0.1:8000/resource/20240120/6ab3f062-d596-4b93-b88a-377d2aea386b.jpg,http://127.0.0.1:8000/resource/20240120/85c1c37d-4311-4706-919a-8d43bd7b994f.jpg', '', '', '', '', '2024-01-20 16:00:00', '2024-01-22 16:00:00', 0, 4, '小米', '手机通讯');

-- ----------------------------
-- Table structure for pms_product_attribute
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute`;
CREATE TABLE `pms_product_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品属性分类id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `select_type` int(1) NULL DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) NULL DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) NULL DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) NULL DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) NULL DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) NULL DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) NULL DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_attribute
-- ----------------------------
INSERT INTO `pms_product_attribute` VALUES (1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (44, 3, '容量', 0, 1, '16G,32G,64G,128G', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (46, 3, '网络', 0, 1, '3G,4G', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (49, 11, '颜色', 0, 1, '红色,蓝色,绿色', 0, 1, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (50, 11, '尺寸', 0, 1, '38,39,40', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (51, 11, '风格', 0, 1, '夏季,秋季', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (52, 12, '品种', 0, 1, '水蜜桃,黄桃,蟠桃,油桃,山东富士,新疆阿克苏,莱阳梨,丰水梨,', 0, 0, 1, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (53, 12, '国产/进口', 1, 1, '国产,进口', 0, 0, 0, 0, 1, 0);
INSERT INTO `pms_product_attribute` VALUES (54, 4, '商品产地', 1, 1, '国产,进口', 0, 0, 0, 0, 0, 0);
INSERT INTO `pms_product_attribute` VALUES (55, 4, '插口数', 1, 1, '单口,多口', 0, 0, 0, 0, 0, 1);
INSERT INTO `pms_product_attribute` VALUES (56, 5, '表面工艺', 1, 1, '浸塑', 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_category`;
CREATE TABLE `pms_product_attribute_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性分类名称',
  `attribute_count` int(11) NULL DEFAULT 0 COMMENT '属性数量',
  `param_count` int(11) NULL DEFAULT 0 COMMENT '参数数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品属性分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_attribute_category
-- ----------------------------
INSERT INTO `pms_product_attribute_category` VALUES (1, '服装-T恤', 2, 5);
INSERT INTO `pms_product_attribute_category` VALUES (2, '服装-裤装', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (3, '手机数码-手机通讯', 2, 4);
INSERT INTO `pms_product_attribute_category` VALUES (4, '配件', 1, 1);
INSERT INTO `pms_product_attribute_category` VALUES (5, '居家', 1, 0);
INSERT INTO `pms_product_attribute_category` VALUES (6, '洗护', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (10, '测试分类', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (11, '服装-鞋帽', 3, 0);
INSERT INTO `pms_product_attribute_category` VALUES (12, '生鲜水果', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (13, '测试分类2', 0, 0);
INSERT INTO `pms_product_attribute_category` VALUES (15, '短袖', 0, 0);

-- ----------------------------
-- Table structure for pms_product_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_attribute_value`;
CREATE TABLE `pms_product_attribute_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `product_attribute_id` bigint(20) NULL DEFAULT NULL COMMENT '商品属性id',
  `value` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 238 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储产品参数信息的表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_attribute_value
-- ----------------------------
INSERT INTO `pms_product_attribute_value` VALUES (1, 9, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (2, 10, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (3, 11, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (4, 12, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (5, 13, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (6, 14, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (7, 18, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (8, 7, 1, 'X');
INSERT INTO `pms_product_attribute_value` VALUES (9, 7, 1, 'XL');
INSERT INTO `pms_product_attribute_value` VALUES (10, 7, 1, 'XXL');
INSERT INTO `pms_product_attribute_value` VALUES (11, 22, 7, 'x,xx');
INSERT INTO `pms_product_attribute_value` VALUES (12, 22, 24, 'no110');
INSERT INTO `pms_product_attribute_value` VALUES (13, 22, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (14, 22, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (15, 22, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (16, 22, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (124, 23, 7, '米白色,浅黄色');
INSERT INTO `pms_product_attribute_value` VALUES (125, 23, 24, 'no1098');
INSERT INTO `pms_product_attribute_value` VALUES (126, 23, 25, '春季');
INSERT INTO `pms_product_attribute_value` VALUES (127, 23, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (128, 23, 38, '2018年春');
INSERT INTO `pms_product_attribute_value` VALUES (129, 23, 39, '长袖');
INSERT INTO `pms_product_attribute_value` VALUES (130, 1, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (131, 1, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (132, 1, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (133, 1, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (134, 1, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (135, 1, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (136, 1, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (137, 1, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (138, 1, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (139, 2, 13, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (140, 2, 14, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (141, 2, 15, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (142, 2, 16, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (143, 2, 17, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (144, 2, 18, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (145, 2, 19, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (146, 2, 20, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (147, 2, 21, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (183, 31, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (184, 31, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (185, 31, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (186, 31, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (187, 31, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (198, 30, 24, NULL);
INSERT INTO `pms_product_attribute_value` VALUES (199, 30, 25, '夏季');
INSERT INTO `pms_product_attribute_value` VALUES (200, 30, 37, '青年');
INSERT INTO `pms_product_attribute_value` VALUES (201, 30, 38, '2018年夏');
INSERT INTO `pms_product_attribute_value` VALUES (202, 30, 39, '短袖');
INSERT INTO `pms_product_attribute_value` VALUES (213, 27, 43, '黑色,蓝色');
INSERT INTO `pms_product_attribute_value` VALUES (214, 27, 45, '5.8');
INSERT INTO `pms_product_attribute_value` VALUES (215, 27, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (216, 27, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (217, 27, 48, '3000ml');
INSERT INTO `pms_product_attribute_value` VALUES (218, 28, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (219, 28, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (220, 28, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (221, 28, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (222, 28, 48, '2800ml');
INSERT INTO `pms_product_attribute_value` VALUES (223, 29, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (224, 29, 45, '4.7');
INSERT INTO `pms_product_attribute_value` VALUES (225, 29, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (226, 29, 47, 'IOS');
INSERT INTO `pms_product_attribute_value` VALUES (227, 29, 48, '1960ml');
INSERT INTO `pms_product_attribute_value` VALUES (228, 26, 43, '金色,银色');
INSERT INTO `pms_product_attribute_value` VALUES (229, 26, 45, '5.0');
INSERT INTO `pms_product_attribute_value` VALUES (230, 26, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (231, 26, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (232, 26, 48, '3000');
INSERT INTO `pms_product_attribute_value` VALUES (233, 39, 43, '白色');
INSERT INTO `pms_product_attribute_value` VALUES (234, 39, 45, '6.36英寸');
INSERT INTO `pms_product_attribute_value` VALUES (235, 39, 46, '4G');
INSERT INTO `pms_product_attribute_value` VALUES (236, 39, 47, 'Android');
INSERT INTO `pms_product_attribute_value` VALUES (237, 39, 48, '4500');

-- ----------------------------
-- Table structure for pms_product_category
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category`;
CREATE TABLE `pms_product_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '上级分类的编号：0表示一级分类',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `level` int(1) NULL DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) NULL DEFAULT NULL COMMENT '这个类别的商品数量',
  `product_unit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品计数单位',
  `nav_status` int(1) NULL DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) NULL DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_category
-- ----------------------------
INSERT INTO `pms_product_category` VALUES (1, 0, '服装', 0, 100, '件', 1, 1, 1, NULL, '服装', '服装分类');
INSERT INTO `pms_product_category` VALUES (2, 0, '手机数码', 0, 100, '件', 1, 1, 1, NULL, '手机数码', '手机数码');
INSERT INTO `pms_product_category` VALUES (3, 0, '家用电器', 0, 100, '件', 1, 1, 1, NULL, '家用电器', '家用电器');
INSERT INTO `pms_product_category` VALUES (4, 0, '家具家装', 0, 100, '件', 1, 1, 1, NULL, '家具家装', '家具家装');
INSERT INTO `pms_product_category` VALUES (5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, NULL, '汽车用品', '汽车用品');
INSERT INTO `pms_product_category` VALUES (7, 1, '外套', 1, 100, '件', 1, 1, 0, '', '外套', '外套');
INSERT INTO `pms_product_category` VALUES (8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'T恤', 'T恤');
INSERT INTO `pms_product_category` VALUES (9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, NULL, '休闲裤', '休闲裤');
INSERT INTO `pms_product_category` VALUES (10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, NULL, '牛仔裤', '牛仔裤');
INSERT INTO `pms_product_category` VALUES (11, 1, '衬衫', 1, 100, '件', 1, 1, 0, NULL, '衬衫', '衬衫分类');
INSERT INTO `pms_product_category` VALUES (13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string');
INSERT INTO `pms_product_category` VALUES (19, 2, '手机通讯', 1, 0, '件', 1, 1, 0, '', '手机通讯', '手机通讯');
INSERT INTO `pms_product_category` VALUES (29, 1, '男鞋', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (30, 2, '手机配件', 1, 0, '', 1, 1, 0, '', '手机配件', '手机配件');
INSERT INTO `pms_product_category` VALUES (31, 2, '摄影摄像', 1, 1, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (32, 2, '影音娱乐', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (33, 2, '数码配件', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (34, 2, '智能设备', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (35, 3, '电视', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (36, 3, '空调', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (37, 3, '洗衣机', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (38, 3, '冰箱', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (39, 3, '厨卫大电', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (40, 3, '厨房小电', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (41, 3, '生活电器', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (42, 3, '个护健康', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (43, 4, '厨房卫浴', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (44, 4, '灯饰照明', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (45, 4, '五金工具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (46, 4, '卧室家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (47, 4, '客厅家具', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (48, 5, '全新整车', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (49, 5, '车载电器', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (50, 5, '维修保养', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (51, 5, '汽车装饰', 1, 0, '', 1, 1, 0, '', '', '');
INSERT INTO `pms_product_category` VALUES (52, 0, '食品生鲜', 0, NULL, '份', 1, 1, 0, 'http://localhost:8080/minio/image/a1a9262cac294fdf8a3082142e67c909.jpg', '食品、生鲜', '蔬菜、水果、肉、蛋');
INSERT INTO `pms_product_category` VALUES (53, 52, '新鲜水果', 1, NULL, '箱', 1, 1, 0, 'http://localhost:8080/minio/image/b8ea3bd5331c4ee0a4086f59c2934a35.jpg', '水果', '水果');
INSERT INTO `pms_product_category` VALUES (54, 52, '蔬菜蛋品', 1, NULL, '件', 1, 1, 0, 'http://localhost:8080/minio/image/cb96b650060049659e0c61b5d693837f.jpg', '蔬菜、鸡蛋等', '蔬菜蛋品');
INSERT INTO `pms_product_category` VALUES (55, 0, '母婴', 0, NULL, '件', 1, 1, 0, '', '母婴', '母婴');
INSERT INTO `pms_product_category` VALUES (56, 55, '奶粉', 1, NULL, '件', 1, 1, 0, '', '奶粉,幼儿', '奶粉');
INSERT INTO `pms_product_category` VALUES (58, 55, '测试类别2', 1, NULL, '件', 1, 1, 0, '', '测试', '测试类别');
INSERT INTO `pms_product_category` VALUES (59, 0, '测试分类3', 0, NULL, '克', 0, 0, 0, 'http://localhost:8000/minio/image/9981500984a341e89db5255f83ddda8f.jpg', '', '');

-- ----------------------------
-- Table structure for pms_product_category_attribute_relation
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_category_attribute_relation`;
CREATE TABLE `pms_product_category_attribute_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品类别id',
  `product_attribute_id` bigint(20) NULL DEFAULT NULL COMMENT '商品属性id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_category_attribute_relation
-- ----------------------------
INSERT INTO `pms_product_category_attribute_relation` VALUES (1, 24, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (5, 26, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (7, 28, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (9, 25, 24);
INSERT INTO `pms_product_category_attribute_relation` VALUES (10, 25, 25);

-- ----------------------------
-- Table structure for pms_product_full_reduction
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_full_reduction`;
CREATE TABLE `pms_product_full_reduction`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `full_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '满多少元，例如：满399',
  `reduce_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '减多少元，例如：减20',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品满减表(只针对同商品)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_full_reduction
-- ----------------------------
INSERT INTO `pms_product_full_reduction` VALUES (1, 7, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (2, 8, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (3, 9, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (4, 10, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (5, 11, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (6, 12, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (7, 13, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (8, 14, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (9, 18, 100.00, 20.00);
INSERT INTO `pms_product_full_reduction` VALUES (10, 7, 200.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (11, 7, 300.00, 100.00);
INSERT INTO `pms_product_full_reduction` VALUES (14, 22, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (16, 24, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (34, 23, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (44, 31, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (46, 32, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (48, 33, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (55, 34, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (56, 30, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (59, 27, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (60, 28, 500.00, 50.00);
INSERT INTO `pms_product_full_reduction` VALUES (61, 28, 1000.00, 120.00);
INSERT INTO `pms_product_full_reduction` VALUES (62, 29, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (63, 26, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (78, 36, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (79, 35, 0.00, 0.00);
INSERT INTO `pms_product_full_reduction` VALUES (80, 39, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_ladder
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_ladder`;
CREATE TABLE `pms_product_ladder`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `count` int(11) NULL DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品阶梯价格表(只针对同商品)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_ladder
-- ----------------------------
INSERT INTO `pms_product_ladder` VALUES (1, 7, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (2, 8, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (3, 9, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (4, 10, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (5, 11, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (6, 12, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (7, 13, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (8, 14, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (12, 18, 3, 0.70, 0.00);
INSERT INTO `pms_product_ladder` VALUES (14, 7, 4, 0.60, 0.00);
INSERT INTO `pms_product_ladder` VALUES (15, 7, 5, 0.50, 0.00);
INSERT INTO `pms_product_ladder` VALUES (18, 22, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (20, 24, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (38, 23, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (48, 31, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (50, 32, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (52, 33, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (59, 34, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (60, 30, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (64, 27, 2, 0.80, 0.00);
INSERT INTO `pms_product_ladder` VALUES (65, 27, 3, 0.75, 0.00);
INSERT INTO `pms_product_ladder` VALUES (66, 28, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (67, 29, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (68, 26, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (83, 36, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (84, 35, 0, 0.00, 0.00);
INSERT INTO `pms_product_ladder` VALUES (85, 39, 0, 0.00, 0.00);

-- ----------------------------
-- Table structure for pms_product_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_operate_log`;
CREATE TABLE `pms_product_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `price_old` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价',
  `price_new` decimal(10, 2) NULL DEFAULT NULL COMMENT '新价格',
  `sale_price_old` decimal(10, 2) NULL DEFAULT NULL,
  `sale_price_new` decimal(10, 2) NULL DEFAULT NULL,
  `gift_point_old` int(11) NULL DEFAULT NULL COMMENT '赠送的积分',
  `gift_point_new` int(11) NULL DEFAULT NULL,
  `use_point_limit_old` int(11) NULL DEFAULT NULL,
  `use_point_limit_new` int(11) NULL DEFAULT NULL,
  `operate_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pms_product_vertify_record
-- ----------------------------
DROP TABLE IF EXISTS `pms_product_vertify_record`;
CREATE TABLE `pms_product_vertify_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `vertify_man` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `status` int(1) NULL DEFAULT NULL COMMENT '状态',
  `detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '反馈详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品审核记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_product_vertify_record
-- ----------------------------
INSERT INTO `pms_product_vertify_record` VALUES (1, 1, '2018-04-27 16:36:41', 'test', 1, '验证通过');
INSERT INTO `pms_product_vertify_record` VALUES (2, 2, '2018-04-27 16:36:41', 'test', 1, '验证通过');

-- ----------------------------
-- Table structure for pms_sku_stock
-- ----------------------------
DROP TABLE IF EXISTS `pms_sku_stock`;
CREATE TABLE `pms_sku_stock`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `sku_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编码',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `stock` int(11) NULL DEFAULT 0 COMMENT '库存',
  `low_stock` int(11) NULL DEFAULT NULL COMMENT '预警库存',
  `pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) NULL DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) NULL DEFAULT 0 COMMENT '锁定库存',
  `sp_data` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品销售属性，json格式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku的库存' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pms_sku_stock
-- ----------------------------
INSERT INTO `pms_sku_stock` VALUES (98, 27, '201808270027001', 2599.00, 197, 20, NULL, NULL, NULL, -24, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (99, 27, '201808270027002', 2899.00, 200, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"黑色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (100, 27, '201808270027003', 2599.00, 200, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (101, 27, '201808270027004', 2899.00, 200, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (102, 28, '201808270028001', 649.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (103, 28, '201808270028002', 699.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (104, 28, '201808270028003', 649.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (105, 28, '201808270028004', 699.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (106, 29, '201808270029001', 5499.00, 99, NULL, NULL, NULL, NULL, -8, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (107, 29, '201808270029002', 6299.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (108, 29, '201808270029003', 5499.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (109, 29, '201808270029004', 6299.00, 100, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"64G\"}]');
INSERT INTO `pms_sku_stock` VALUES (110, 26, '201806070026001', 3788.00, 499, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (111, 26, '201806070026002', 3999.00, 500, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"金色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (112, 26, '201806070026003', 3788.00, 500, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');
INSERT INTO `pms_sku_stock` VALUES (113, 26, '201806070026004', 3999.00, 500, NULL, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"银色\"},{\"key\":\"容量\",\"value\":\"32G\"}]');
INSERT INTO `pms_sku_stock` VALUES (163, 36, '202002210036001', 100.00, 103, 25, NULL, NULL, NULL, 9, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (164, 36, '202002210036002', 120.00, 100, 20, NULL, NULL, NULL, 6, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (165, 36, '202002210036003', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (166, 36, '202002210036004', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (167, 36, '202002210036005', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (168, 36, '202002210036006', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (169, 36, '202002210036007', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (170, 36, '202002210036008', 100.00, 100, 20, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (171, 35, '202002250035001', 210.00, 200, 60, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (172, 35, '202002250035002', 250.00, 150, 60, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (173, 35, '202002250035003', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (174, 35, '202002250035004', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"红色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (175, 35, '202002250035005', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (176, 35, '202002250035006', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"38\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (177, 35, '202002250035007', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"夏季\"}]');
INSERT INTO `pms_sku_stock` VALUES (178, 35, '202002250035008', 200.00, 100, 50, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"蓝色\"},{\"key\":\"尺寸\",\"value\":\"39\"},{\"key\":\"风格\",\"value\":\"秋季\"}]');
INSERT INTO `pms_sku_stock` VALUES (179, 39, '170573723353400', 4599.00, 500, 100, NULL, NULL, NULL, 0, '[{\"key\":\"颜色\",\"value\":\"白色\"},{\"key\":\"容量\",\"value\":\"16G\"}]');

-- ----------------------------
-- Table structure for sms_coupon
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon`;
CREATE TABLE `sms_coupon`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(1) NULL DEFAULT NULL COMMENT '优惠券类型；0->全场赠券；1->会员赠券；2->购物赠券；3->注册赠券',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `platform` int(1) NULL DEFAULT NULL COMMENT '使用平台：0->全部；1->移动；2->PC',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `per_limit` int(11) NULL DEFAULT NULL COMMENT '每人限领张数',
  `min_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '使用门槛；0表示无门槛',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `use_type` int(1) NULL DEFAULT NULL COMMENT '使用类型：0->全场通用；1->指定分类；2->指定商品',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `publish_count` int(11) NULL DEFAULT NULL COMMENT '发行数量',
  `use_count` int(11) NULL DEFAULT NULL COMMENT '已使用数量',
  `receive_count` int(11) NULL DEFAULT NULL COMMENT '领取数量',
  `enable_time` datetime(0) NULL DEFAULT NULL COMMENT '可以领取的日期',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `member_level` int(1) NULL DEFAULT NULL COMMENT '可领取的会员类型：0->无限时',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_coupon
-- ----------------------------
INSERT INTO `sms_coupon` VALUES (2, 0, '全品类通用券', 0, 92, 10.00, 1, 100.00, '2018-08-27 16:40:47', '2018-11-23 16:40:47', 0, '满100减10', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (3, 0, '小米手机专用券', 0, 92, 50.00, 1, 1000.00, '2018-08-27 16:40:47', '2018-11-16 16:40:47', 2, '小米手机专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (4, 0, '手机品类专用券', 0, 92, 300.00, 1, 2000.00, '2018-08-27 16:40:47', '2018-09-15 16:40:47', 1, '手机分类专用优惠券', 100, 0, 8, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (7, 0, 'T恤分类专用优惠券', 0, 93, 50.00, 1, 500.00, '2018-08-27 16:40:47', '2018-08-15 16:40:47', 1, '满500减50', 100, 0, 7, '2018-08-27 16:40:47', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (8, 0, '新优惠券', 0, 100, 100.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-27 00:00:00', 0, '测试', 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (9, 0, '全品类通用券', 0, 100, 5.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (10, 0, '全品类通用券', 0, 100, 15.00, 1, 200.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 1, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (11, 0, '全品类通用券', 0, 1000, 50.00, 1, 1000.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 1000, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (12, 0, '移动端全品类通用券', 1, 1, 10.00, 1, 100.00, '2018-11-08 00:00:00', '2018-11-10 00:00:00', 0, NULL, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (19, 0, '手机分类专用', 0, 100, 100.00, 1, 1000.00, '2018-11-09 00:00:00', '2018-11-17 00:00:00', 1, '手机分类专用', 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (20, 0, '小米手机专用', 0, 100, 200.00, 1, 3000.00, '2022-12-17 00:00:00', '2022-12-31 00:00:00', 2, '小米手机专用', 100, 0, 0, '2022-12-17 00:00:00', NULL, NULL);
INSERT INTO `sms_coupon` VALUES (23, 0, '有效期测试', 0, 100, 10.00, 1, 100.00, '2019-10-05 00:00:00', '2019-10-09 00:00:00', 0, NULL, 100, 0, 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon` VALUES (24, 1, '汽车保养专用券', 0, 1000, 50.00, 1, 300.00, '2022-12-16 00:00:00', '2022-12-18 00:00:00', 1, '汽车保养专用券', 1000, 0, 0, '2022-12-16 00:00:00', 'a4bfdb02ea9642efab8c7b18e61d79c0', NULL);
INSERT INTO `sms_coupon` VALUES (26, 0, '食品生鲜指定优惠券', 1, 1000, 30.00, 1, 280.00, '2022-12-16 00:00:00', '2022-12-20 00:00:00', 1, '食品生鲜指定优惠券', 2000, 0, 0, '2022-12-16 00:00:00', '374e573f66ad468ba3bdf110b68608a8', NULL);
INSERT INTO `sms_coupon` VALUES (27, 0, '小米电视专属优惠券', 0, 200, 50.00, 1, 1000.00, '2022-12-16 00:00:00', '2022-12-18 00:00:00', 2, '小米电视专属优惠券', 200, 0, 0, '2022-12-16 00:00:00', '75cec2843f1e464bb44b260af6c645f3', NULL);
INSERT INTO `sms_coupon` VALUES (28, 3, '注册会员赠券', 0, NULL, 15.00, 1, 150.00, '2023-02-13 16:00:00', '2023-02-18 16:00:00', 1, '会员注册全场通用券', 1000, NULL, NULL, '2023-02-13 16:00:00', NULL, NULL);

-- ----------------------------
-- Table structure for sms_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_history`;
CREATE TABLE `sms_coupon_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '优惠券id',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `coupon_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠码',
  `member_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '领取人昵称',
  `get_type` int(1) NULL DEFAULT NULL COMMENT '获取类型：0->后台赠送；1->主动获取',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `use_status` int(1) NULL DEFAULT NULL COMMENT '使用状态：0->未使用；1->已使用；2->已过期',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单编号',
  `order_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id`) USING BTREE,
  INDEX `idx_coupon_id`(`coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券使用、领取历史表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_coupon_history
-- ----------------------------
INSERT INTO `sms_coupon_history` VALUES (2, 2, 1, '4931048380330002', 'windir', 1, '2018-08-29 14:04:12', 1, '2018-11-12 14:38:47', 12, '201809150101000001');
INSERT INTO `sms_coupon_history` VALUES (3, 3, 1, '4931048380330003', 'windir', 1, '2018-08-29 14:04:29', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (4, 4, 1, '4931048380330004', 'windir', 1, '2018-08-29 14:04:32', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (11, 7, 1, '4931048380330001', 'windir', 1, '2018-09-04 16:21:50', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (12, 2, 4, '0340981248320004', 'zhensan', 1, '2018-11-12 14:16:50', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (13, 3, 4, '0342977234360004', 'zhensan', 1, '2018-11-12 14:17:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (14, 4, 4, '0343342928830004', 'zhensan', 1, '2018-11-12 14:17:13', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (15, 2, 5, '0351883832180005', 'lisi', 1, '2018-11-12 14:18:39', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (16, 3, 5, '0352201672680005', 'lisi', 1, '2018-11-12 14:18:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (17, 4, 5, '0352505810180005', 'lisi', 1, '2018-11-12 14:18:45', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (18, 2, 6, '0356114588380006', 'wangwu', 1, '2018-11-12 14:19:21', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (19, 3, 6, '0356382856920006', 'wangwu', 1, '2018-11-12 14:19:24', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (20, 4, 6, '0356656798470006', 'wangwu', 1, '2018-11-12 14:19:27', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (21, 2, 3, '0363644984620003', 'windy', 1, '2018-11-12 14:20:36', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (22, 3, 3, '0363932820300003', 'windy', 1, '2018-11-12 14:20:39', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (23, 4, 3, '0364238275840003', 'windy', 1, '2018-11-12 14:20:42', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (24, 2, 7, '0385034833070007', 'lion', 1, '2018-11-12 14:24:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (25, 3, 7, '0385350208650007', 'lion', 1, '2018-11-12 14:24:13', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (26, 4, 7, '0385632733900007', 'lion', 1, '2018-11-12 14:24:16', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (27, 2, 8, '0388779132990008', 'shari', 1, '2018-11-12 14:24:48', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (28, 3, 8, '0388943658810008', 'shari', 1, '2018-11-12 14:24:49', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (29, 4, 8, '0389069398320008', 'shari', 1, '2018-11-12 14:24:51', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (30, 2, 9, '0390753935250009', 'aewen', 1, '2018-11-12 14:25:08', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (31, 3, 9, '0390882954470009', 'aewen', 1, '2018-11-12 14:25:09', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (32, 4, 9, '0391025542810009', 'aewen', 1, '2018-11-12 14:25:10', 0, NULL, NULL, NULL);
INSERT INTO `sms_coupon_history` VALUES (33, 27, 1, '12121', '大鸭梨', 1, '2024-01-25 16:29:22', 1, '2024-01-25 16:29:22', 29, '2121212121');

-- ----------------------------
-- Table structure for sms_coupon_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_category_relation`;
CREATE TABLE `sms_coupon_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '优惠券id',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品类别id',
  `product_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品分类名称',
  `parent_category_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品分类关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_coupon_product_category_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_category_relation` VALUES (4, 19, 30, '手机配件', '手机数码');
INSERT INTO `sms_coupon_product_category_relation` VALUES (8, 26, 53, '新鲜水果', '食品生鲜');
INSERT INTO `sms_coupon_product_category_relation` VALUES (9, 26, 54, '蔬菜蛋品', '食品生鲜');

-- ----------------------------
-- Table structure for sms_coupon_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_coupon_product_relation`;
CREATE TABLE `sms_coupon_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `coupon_id` bigint(20) NULL DEFAULT NULL COMMENT '优惠券id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `product_sn` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券和产品的关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_coupon_product_relation
-- ----------------------------
INSERT INTO `sms_coupon_product_relation` VALUES (9, 21, 33, '小米（MI）小米电视4A ', '4609652');
INSERT INTO `sms_coupon_product_relation` VALUES (10, 27, 33, '小米（MI）小米电视4A ', '4609652');
INSERT INTO `sms_coupon_product_relation` VALUES (11, 27, 34, '小米（MI）小米电视4A 65英寸', '4609660');
INSERT INTO `sms_coupon_product_relation` VALUES (14, 20, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', '7437788');
INSERT INTO `sms_coupon_product_relation` VALUES (15, 20, 28, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', '7437789');

-- ----------------------------
-- Table structure for sms_flash_promotion
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion`;
CREATE TABLE `sms_flash_promotion`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '秒杀活动标题',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '秒杀时间段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_flash_promotion
-- ----------------------------
INSERT INTO `sms_flash_promotion` VALUES (2, '春季家电家具疯狂秒杀1', '2018-11-12', '2018-11-23', 1, '2018-11-16 11:12:13');
INSERT INTO `sms_flash_promotion` VALUES (3, '手机特卖', '2018-11-03', '2018-11-10', 0, '2018-11-16 11:11:31');
INSERT INTO `sms_flash_promotion` VALUES (4, '春季家电家具疯狂秒杀3', '2018-11-24', '2018-11-25', 1, '2018-11-16 11:12:19');
INSERT INTO `sms_flash_promotion` VALUES (5, '春季家电家具疯狂秒杀4', '2018-11-16', '2018-11-16', 1, '2018-11-16 11:12:24');
INSERT INTO `sms_flash_promotion` VALUES (6, '春季家电家具疯狂秒杀5', '2018-11-16', '2018-11-16', 1, '2018-11-16 11:12:31');
INSERT INTO `sms_flash_promotion` VALUES (9, '春季家电家具疯狂秒杀持续进行', '2022-12-18', '2022-12-20', 1, '2018-11-16 11:12:42');
INSERT INTO `sms_flash_promotion` VALUES (13, '测试', '2018-11-01', '2018-11-30', 0, '2018-11-19 10:34:24');
INSERT INTO `sms_flash_promotion` VALUES (14, '秋冬装限时秒杀', '2022-12-17', '2022-12-18', 1, '2022-12-17 08:52:06');
INSERT INTO `sms_flash_promotion` VALUES (15, '测试活动2', '2023-02-13', '2023-02-14', 1, '2023-02-13 09:58:17');
INSERT INTO `sms_flash_promotion` VALUES (18, '开学季手机换新', '2023-02-12', '2023-02-18', 1, '2023-02-13 10:15:42');
INSERT INTO `sms_flash_promotion` VALUES (19, '测', '2023-02-12', '2023-02-14', 0, '2023-02-13 10:43:05');
INSERT INTO `sms_flash_promotion` VALUES (20, '测试', '2023-02-12', '2023-02-14', 0, '2023-02-13 10:44:16');

-- ----------------------------
-- Table structure for sms_flash_promotion_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_log`;
CREATE TABLE `sms_flash_promotion_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '会员id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `member_phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员手机号',
  `product_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `subscribe_time` datetime(0) NULL DEFAULT NULL COMMENT '会员订阅时间',
  `send_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购通知记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sms_flash_promotion_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_product_relation`;
CREATE TABLE `sms_flash_promotion_product_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `flash_promotion_id` bigint(20) NULL DEFAULT NULL COMMENT '秒杀活动id',
  `flash_promotion_session_id` bigint(20) NULL DEFAULT NULL COMMENT '秒杀时间段id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `flash_promotion_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '限时购价格',
  `flash_promotion_count` int(11) NULL DEFAULT NULL COMMENT '限时购数量',
  `flash_promotion_limit` int(11) NULL DEFAULT NULL COMMENT '每人限购数量',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品限时购与商品关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_flash_promotion_product_relation
-- ----------------------------
INSERT INTO `sms_flash_promotion_product_relation` VALUES (1, 2, 1, 26, 3000.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (2, 2, 1, 27, 2000.00, 10, 1, 20);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (3, 2, 1, 28, 599.00, 19, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (4, 2, 1, 29, 4999.00, 10, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (9, 2, 2, 26, 2999.00, 100, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (10, 2, 2, 27, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (11, 2, 2, 28, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (12, 2, 2, 29, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (15, 2, 3, 32, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (16, 2, 4, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (17, 2, 4, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (18, 2, 5, 36, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (19, 2, 6, 33, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (20, 2, 6, 34, NULL, NULL, NULL, NULL);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (22, 2, 1, 37, 3999.00, 50, 1, 100);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (23, 2, 16, 33, 2299.00, 10, 1, 0);
INSERT INTO `sms_flash_promotion_product_relation` VALUES (25, 2, 16, 37, 3999.00, 20, 1, 1);

-- ----------------------------
-- Table structure for sms_flash_promotion_session
-- ----------------------------
DROP TABLE IF EXISTS `sms_flash_promotion_session`;
CREATE TABLE `sms_flash_promotion_session`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '场次名称',
  `start_time` time(0) NULL DEFAULT NULL COMMENT '每日开始时间',
  `end_time` time(0) NULL DEFAULT NULL COMMENT '每日结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态：0->不启用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '限时购场次表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_flash_promotion_session
-- ----------------------------
INSERT INTO `sms_flash_promotion_session` VALUES (1, '8:00', '08:00:00', '09:00:00', 0, '2018-11-16 13:22:17');
INSERT INTO `sms_flash_promotion_session` VALUES (2, '10:00', '10:00:33', '11:00:33', 1, '2018-11-16 13:22:34');
INSERT INTO `sms_flash_promotion_session` VALUES (3, '12:00', '12:00:00', '13:00:22', 1, '2018-11-16 13:22:37');
INSERT INTO `sms_flash_promotion_session` VALUES (4, '14:00', '14:00:00', '15:00:00', 1, '2018-11-16 13:22:41');
INSERT INTO `sms_flash_promotion_session` VALUES (5, '16:00', '16:00:00', '17:00:00', 1, '2018-11-16 13:22:45');
INSERT INTO `sms_flash_promotion_session` VALUES (6, '18:00', '18:00:00', '19:00:00', 1, '2018-11-16 13:21:34');
INSERT INTO `sms_flash_promotion_session` VALUES (7, '20:00', '12:00:00', '13:00:00', 1, '2018-11-16 13:22:55');
INSERT INTO `sms_flash_promotion_session` VALUES (9, '啊啊', '10:46:13', '12:46:16', 0, '2023-02-13 10:46:21');
INSERT INTO `sms_flash_promotion_session` VALUES (10, 'BB', '11:20:00', '15:20:00', 1, '2023-02-13 10:49:50');

-- ----------------------------
-- Table structure for sms_home_advertise
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_advertise`;
CREATE TABLE `sms_home_advertise`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录播图名称',
  `type` int(1) NULL DEFAULT NULL COMMENT '轮播位置：0->PC首页轮播；1->app首页轮播',
  `pic` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `status` int(1) NULL DEFAULT NULL COMMENT '上下线状态：0->下线；1->上线',
  `click_count` int(11) NULL DEFAULT NULL COMMENT '点击数',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '下单数',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页轮播广告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_home_advertise
-- ----------------------------
INSERT INTO `sms_home_advertise` VALUES (9, '电影推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/movie_ad.jpg', '2018-11-01 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'www.baidu.com', '电影推荐广告', 100);
INSERT INTO `sms_home_advertise` VALUES (10, '汽车促销广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad.jpg', '2018-11-13 00:00:00', '2018-11-24 00:00:00', 1, 0, 0, 'xxx', NULL, 99);
INSERT INTO `sms_home_advertise` VALUES (11, '汽车推荐广告', 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20181113/car_ad2.jpg', '2018-11-13 00:00:00', '2018-11-30 00:00:00', 1, 0, 0, 'xxx', NULL, 98);
INSERT INTO `sms_home_advertise` VALUES (12, '小米13上市', 0, 'http://localhost:8080/minio/image/c55966069106463f8ea5896ebea685e1.jpg', '2022-12-15 00:00:00', '2022-12-30 00:00:00', 1, 0, 0, 'https://item.jd.com/100049486745.html', '小米13上市', 500);
INSERT INTO `sms_home_advertise` VALUES (13, '小米Redmi K50', 0, 'http://localhost:8080/minio/image/a09910c8e5bc4bb998db502993405720.jpg', '2022-12-12 00:00:00', '2022-12-19 00:00:00', 1, 0, 0, 'https://item.jd.com/100035246702.html?extension_id=eyJhZCI6IjM1MDQiLCJjaCI6IjIiLCJza3UiOiIxMDAwMzUyNDY3MDIiLCJ0cyI6IjE2NzEwNjU3NzYiLCJ1bmlxaWQiOiJ7XCJjbGlja19pZFwiOlwiZDQ0MDVlMjAtYjc5OS00NjczLThkY2MtZDEwMzQ3MjQ1MGY1XCIsXCJtYXRlcmlhbF9pZFwiOlwiNjYyNDE4NTAyOVwiLFwicG9zX2lkXCI6XCIzNTA0XCIsXCJzaWRcIjpcImM1NGFiNjI3LWFkYTItNGVkNS1iMDQ3LTdkY2U5MWQzZTRmOVwifSJ9&jd_pop=d4405e20-b799-4673-8dcc-d103472450f5&abt=0', '性价比超神', 200);
INSERT INTO `sms_home_advertise` VALUES (14, 'HUAWEI Mate 50 直屏旗舰', 0, 'http://localhost:8000/minio/image/72600af6bb3c4b46a6c7e039a3a1fd12.jpg', '2023-02-13 16:00:00', '2023-02-18 16:00:00', 1, 0, 0, 'https://item.jd.com/100035295081.html?extension_id=eyJhZCI6IjM1MDMiLCJjaCI6IjIiLCJza3UiOiIxMDAwMzUyOTUwODEiLCJ0cyI6IjE2NzYzMzkwMDEiLCJ1bmlxaWQiOiJ7XCJjbGlja19pZFwiOlwiNTBlNWQyNjctNzZkYS00Nzg4LWI0MWQtNmM1NWU0MDgxYzNlXCIsXCJtYXRlcmlhbF9pZFwiOlwiOTQ3MjY5NTI0NlwiLFwicG9zX2lkXCI6XCIzNTAzXCIsXCJzaWRcIjpcImQwMzVmNWY1LTA1ZWEtNDc3Ny1hMTY1LWZmN2FmZmJjZTQ3YVwifSJ9&jd_pop=50e5d267-76da-4788-b41d-6c55e4081c3e&abt=0', '没有备注', 0);
INSERT INTO `sms_home_advertise` VALUES (15, '京挑惠选2', 0, 'http://localhost:8000/minio/image/8f62e4362c8d4afd9d3f0be76bfadde2.jpg', '2023-02-15 00:00:00', '2023-02-20 00:00:00', 1, 0, 0, 'https://pro.jd.com/mall/active/3ZYfZKGRAhbHzJySpRriJoGWo8v6/index.html?innerAnchor=100012043978&focus=3', '京挑惠选2', 0);

-- ----------------------------
-- Table structure for sms_home_brand
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_brand`;
CREATE TABLE `sms_home_brand`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) NULL DEFAULT NULL COMMENT '品牌id',
  `brand_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌名称',
  `recommend_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态 0->不推荐，1->推荐',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐品牌表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_home_brand
-- ----------------------------
INSERT INTO `sms_home_brand` VALUES (1, 1, '万和', 1, 200);
INSERT INTO `sms_home_brand` VALUES (6, 6, '小米', 1, 300);
INSERT INTO `sms_home_brand` VALUES (8, 5, '方太', 1, 100);
INSERT INTO `sms_home_brand` VALUES (33, 51, '苹果', 1, 10);
INSERT INTO `sms_home_brand` VALUES (34, 2, '三星', 1, 0);
INSERT INTO `sms_home_brand` VALUES (35, 3, '华为', 1, 500);
INSERT INTO `sms_home_brand` VALUES (40, 49, '七匹狼', 1, 0);
INSERT INTO `sms_home_brand` VALUES (41, 21, 'OPPO', 1, 0);
INSERT INTO `sms_home_brand` VALUES (42, 58, 'NIKE', 1, NULL);
INSERT INTO `sms_home_brand` VALUES (43, 59, '伊利', 1, 1);

-- ----------------------------
-- Table structure for sms_home_new_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_new_product`;
CREATE TABLE `sms_home_new_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `recommend_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态 0->不推荐，1->推荐',
  `sort` int(1) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '新鲜好物表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_home_new_product
-- ----------------------------
INSERT INTO `sms_home_new_product` VALUES (2, 27, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 1, 200);
INSERT INTO `sms_home_new_product` VALUES (8, 26, '华为 HUAWEI P20 ', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (12, 30, 'HLA海澜之家简约动物印花短袖T恤', 1, 10);
INSERT INTO `sms_home_new_product` VALUES (13, 36, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 1, 0);
INSERT INTO `sms_home_new_product` VALUES (14, 37, 'HUAWEI P50', 1, 300);
INSERT INTO `sms_home_new_product` VALUES (16, 34, '小米（MI）小米电视4A 65英寸', 1, 100);
INSERT INTO `sms_home_new_product` VALUES (17, 38, '华为HUAWEI Mate 50', 1, 50);

-- ----------------------------
-- Table structure for sms_home_recommend_product
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_product`;
CREATE TABLE `sms_home_recommend_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `recommend_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态 0->不推荐，1->推荐',
  `sort` int(1) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '人气推荐商品表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_home_recommend_product
-- ----------------------------
INSERT INTO `sms_home_recommend_product` VALUES (3, 26, '华为 HUAWEI P20 ', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (7, 30, 'HLA海澜之家简约动物印花短袖T恤', 1, 100);
INSERT INTO `sms_home_recommend_product` VALUES (8, 33, '小米（MI）小米电视4A ', 1, 300);
INSERT INTO `sms_home_recommend_product` VALUES (9, 34, '小米（MI）小米电视4A 65英寸', 1, 0);
INSERT INTO `sms_home_recommend_product` VALUES (10, 37, 'HUAWEI P50', 1, 200);
INSERT INTO `sms_home_recommend_product` VALUES (12, 38, '华为HUAWEI Mate 50', 1, 30);
INSERT INTO `sms_home_recommend_product` VALUES (13, 31, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 1, 20);
INSERT INTO `sms_home_recommend_product` VALUES (14, 32, 'HLA海澜之家短袖T恤男基础款', 1, 10);

-- ----------------------------
-- Table structure for sms_home_recommend_subject
-- ----------------------------
DROP TABLE IF EXISTS `sms_home_recommend_subject`;
CREATE TABLE `sms_home_recommend_subject`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) NULL DEFAULT NULL COMMENT '主题id',
  `subject_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主题名称',
  `recommend_status` int(1) NULL DEFAULT NULL COMMENT '推荐状态 0->不推荐，1->推荐',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页推荐专题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_home_recommend_subject
-- ----------------------------
INSERT INTO `sms_home_recommend_subject` VALUES (14, 1, 'polo衬衫的也时尚', 1, 1000);
INSERT INTO `sms_home_recommend_subject` VALUES (19, 6, '品牌手机降价', 1, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (20, 4, '夏天应该穿什么', 0, 0);
INSERT INTO `sms_home_recommend_subject` VALUES (21, 5, '夏季精选', 1, 100);
INSERT INTO `sms_home_recommend_subject` VALUES (22, 2, '大牌手机低价秒', 1, NULL);

-- ----------------------------
-- Table structure for sms_member_coupon_relation
-- ----------------------------
DROP TABLE IF EXISTS `sms_member_coupon_relation`;
CREATE TABLE `sms_member_coupon_relation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券id',
  `status` int(1) NULL DEFAULT 0 COMMENT '优惠券使用状态：0->未使用, 1->已使用',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '领取时间',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员领券关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sms_member_coupon_relation
-- ----------------------------
INSERT INTO `sms_member_coupon_relation` VALUES (1, 1, 27, 1, '2024-01-25 16:26:16', NULL);
INSERT INTO `sms_member_coupon_relation` VALUES (2, 1, 27, 1, '2024-01-25 16:29:21', NULL);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `oid` int(5) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(5) NULL DEFAULT NULL,
  `pname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pprice` float NOT NULL,
  `number` int(5) NOT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15378 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (15310, 1, '测试用户：于连俊', 4, 'OPPO_测试库', 4000, 1);
INSERT INTO `t_order` VALUES (15311, 1, '测试用户：于连俊', 4, 'OPPO_测试库', 4000, 1);
INSERT INTO `t_order` VALUES (15313, 1, '测试用户：于连俊', 5, '一加手机', 5000, 1);
INSERT INTO `t_order` VALUES (15314, 1, '测试用户：于连俊', 5, '一加手机', 5000, 1);
INSERT INTO `t_order` VALUES (15315, 1, '测试用户：于连俊', 5, '一加手机', 5000, 1);
INSERT INTO `t_order` VALUES (15316, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15317, 6, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15318, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15319, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15320, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15321, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15322, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15323, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15324, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15325, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15326, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15327, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15328, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15329, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15330, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15331, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15332, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15333, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15334, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15335, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15336, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15337, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15338, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15339, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15340, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15341, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15342, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15343, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15344, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15345, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15346, 1, '测试用户：A', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15347, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15348, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15349, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15350, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15351, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15352, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15353, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15354, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15355, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15356, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15357, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15358, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15359, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15360, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15361, 1, '默认', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15362, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15363, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15364, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15365, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15366, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15367, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15368, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15369, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15370, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15371, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15372, 5, 'admin_sunli', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15373, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15374, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15375, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15376, 1, 'admin', 3, '苹果_测试库', 3000, 2);
INSERT INTO `t_order` VALUES (15377, 1, 'admin', 3, '苹果_测试库', 3000, 2);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `pid` int(5) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pprice` float NOT NULL,
  `stock` int(5) NOT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (1, '小米_测试库', 1000, -2);
INSERT INTO `t_product` VALUES (2, '华为_测试库', 2000, 4998);
INSERT INTO `t_product` VALUES (3, '苹果_测试库', 3000, 3994);
INSERT INTO `t_product` VALUES (4, 'OPPO_测试库', 4000, 996);
INSERT INTO `t_product` VALUES (5, '一加手机', 5000, 996);
INSERT INTO `t_product` VALUES (6, '诺基亚', 2000, 41);
INSERT INTO `t_product` VALUES (7, '摩托罗拉', 1000, 99);
INSERT INTO `t_product` VALUES (8, '锤子手机', 1000, 99);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `telephone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nick_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称或姓名',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `login_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户状态: 0禁用 1启用',
  `note` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', '$2a$10$LzAQGlZ7lpmj2c.Ip8x2OO0bWf2mxrgiFO2QjSCWhOGcijCgO1ZzC', '13009848999', '超管账号', '1797844413@qq.com', '2022-11-05 15:51:47', '2022-12-28 15:12:13', 1, '拥有所有权限');
INSERT INTO `t_user` VALUES (3, 'admin_jcx', '$2a$10$0HmPpDQMTg4thpth3vAGWOudgMFriGfZ9itzyS9YKDpi8wBxArteK', '13666677888', '荆晨曦', '989118811@qq.com', '2022-11-12 11:01:50', '2022-11-12 11:01:50', 1, '普通管理员');
INSERT INTO `t_user` VALUES (4, 'admin_chenhao', '$2a$10$2b/lurbWwPCnpCP5vSi8I.Lu3GENXyAPPqtbVERDeSMUxL/SN0HEG', '137****0099', '陈浩', '749077620@qq.com', '2023-02-02 03:58:07', '2023-02-02 03:58:07', 1, '商品模块管理员');
INSERT INTO `t_user` VALUES (5, 'admin_sunli', '123456', '139****1122', '孙立', '442652392@qq.com', '2023-02-02 06:14:33', '2023-02-02 06:14:33', 1, '营销模块管理员');
INSERT INTO `t_user` VALUES (6, 'admin_ljw', '$2a$10$Mtun8gpV3j6o8mUutKiWg..20l2josUR6PgLroqAM1WeBXqBGErJu', '13695847551', '刘珈玮', '198822233@qq.com', '2023-02-02 06:45:22', '2023-02-02 06:45:22', 1, '品牌模块管理员');

-- ----------------------------
-- Table structure for ums_admin
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin`;
CREATE TABLE `ums_admin`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_admin
-- ----------------------------
INSERT INTO `ums_admin` VALUES (3, 'admin', '$2a$10$ZJRkT8EaVHoLMMx7Sc3w2OmOD90ddimwiVYpLJHCTAJJ0oj/bQx8i', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2024-03-01 11:50:34', 1);
INSERT INTO `ums_admin` VALUES (4, 'macro', '$2a$10$ZJRkT8EaVHoLMMx7Sc3w2OmOD90ddimwiVYpLJHCTAJJ0oj/bQx8i', 'string', 'macro@qq.com', 'macro', 'macro专用', '2019-10-06 15:53:51', '2020-02-03 14:55:55', 1);
INSERT INTO `ums_admin` VALUES (6, 'productAdmin', '$2a$10$ZJRkT8EaVHoLMMx7Sc3w2OmOD90ddimwiVYpLJHCTAJJ0oj/bQx8i', NULL, 'product@qq.com', '商品管理员', '只有商品权限', '2020-02-07 16:15:08', '2023-11-19 19:50:01', 1);
INSERT INTO `ums_admin` VALUES (7, 'orderAdmin', '$2a$10$ZJRkT8EaVHoLMMx7Sc3w2OmOD90ddimwiVYpLJHCTAJJ0oj/bQx8i', NULL, 'order@qq.com', '订单管理员', '只有订单管理权限', '2020-02-07 16:15:50', '2024-01-26 09:54:45', 1);
INSERT INTO `ums_admin` VALUES (8, 'cluoAdmin', '$2a$10$slyWif1.HCM7Rb7g5SjnN.oUyw6HLM14UUhkg2cShtC7Yo9McpRcq', NULL, '178009922@163.com', 'C罗', 'xx模块管理员', NULL, '2023-02-07 10:19:24', 1);
INSERT INTO `ums_admin` VALUES (9, 'meixiAdmin', '$2a$10$/4t6iKt5E3aRfsQXjuwbXO7kasjc/Ztcm8kkft4SmPxgJD/oA87Iu', NULL, 'meixi1@qq.com', '梅西', 'xx模块管理员1', '2022-11-29 09:22:16', '2022-11-29 11:27:23', 0);
INSERT INTO `ums_admin` VALUES (10, 'admin_curry', '$2a$10$sfqJTHitMDEu9YPU3n4sC.fs5XOyKDC7djoYed9F9.PZeuX.eFLHm', 'default.jpg', '101010@qq.com', '你的小酷酷', '不是饮水机管理员', '2023-02-03 11:21:30', '2023-02-06 16:11:39', 1);
INSERT INTO `ums_admin` VALUES (13, 'lifenghao', '$2a$10$ywo3jMM4PcOuJ2xS9VW.jeI5U7yMeKiVxfrikXs95lMkzWwqA9xxy', NULL, '123@qq.com', '李丰昊', '李丰昊的号', '2024-01-19 09:48:58', NULL, 1);

-- ----------------------------
-- Table structure for ums_admin_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_login_log`;
CREATE TABLE `ums_admin_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问地址',
  `user_agent` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器登录类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 196 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户登录日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_admin_login_log
-- ----------------------------
INSERT INTO `ums_admin_login_log` VALUES (1, 3, '2018-12-23 14:27:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (2, 3, '2019-04-07 16:04:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (3, 3, '2019-04-08 21:47:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (4, 3, '2019-04-08 21:48:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (5, 3, '2019-04-18 22:18:40', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (6, 3, '2019-04-20 12:45:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (7, 3, '2019-05-19 14:52:12', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (8, 3, '2019-05-25 15:00:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (9, 3, '2019-06-19 20:11:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (10, 3, '2019-06-30 10:33:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (11, 3, '2019-06-30 10:34:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (12, 3, '2019-06-30 10:35:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (13, 3, '2019-07-27 17:11:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (14, 3, '2019-07-27 17:13:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (15, 3, '2019-07-27 17:15:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (16, 3, '2019-07-27 17:17:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (17, 3, '2019-07-27 17:18:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (18, 3, '2019-07-27 21:21:52', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (19, 3, '2019-07-27 21:34:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (20, 3, '2019-07-27 21:35:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (21, 3, '2019-07-27 21:35:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (22, 3, '2019-07-27 21:40:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (23, 3, '2019-08-18 16:00:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (24, 3, '2019-08-18 16:01:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (25, 3, '2019-08-18 16:47:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (26, 3, '2019-10-06 15:54:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (27, 3, '2019-10-06 16:03:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (28, 3, '2019-10-06 16:04:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (29, 3, '2019-10-06 16:06:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (30, 3, '2019-10-06 16:14:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (31, 1, '2019-10-06 16:15:09', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (32, 1, '2019-10-06 16:16:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (33, 3, '2019-10-06 16:16:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (34, 3, '2019-10-06 16:16:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (35, 3, '2019-10-07 15:20:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (36, 3, '2019-10-07 15:40:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (37, 3, '2019-10-07 16:34:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (38, 3, '2019-10-09 21:19:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (39, 4, '2019-10-09 21:30:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (40, 4, '2019-10-09 21:31:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (41, 4, '2019-10-09 21:32:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (42, 4, '2019-10-09 21:33:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (43, 4, '2019-10-09 21:33:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (44, 3, '2019-10-20 16:02:53', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (45, 3, '2019-10-23 21:20:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (46, 3, '2019-10-27 21:41:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (47, 3, '2019-11-09 16:44:57', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (48, 3, '2019-11-09 16:46:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (49, 3, '2019-11-09 16:49:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (50, 3, '2019-11-23 14:17:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (51, 6, '2019-11-23 14:52:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (52, 3, '2019-11-23 15:07:24', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (53, 3, '2019-11-30 21:25:30', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (54, 3, '2019-11-30 21:27:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (55, 3, '2019-12-28 15:23:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (56, 3, '2020-01-01 15:21:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (57, 3, '2020-01-04 16:00:54', '192.168.3.185', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (58, 3, '2020-02-01 15:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (59, 3, '2020-02-01 15:36:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (60, 3, '2020-02-01 15:36:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (61, 3, '2020-02-01 15:37:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (62, 3, '2020-02-01 15:37:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (63, 3, '2020-02-01 15:38:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (64, 3, '2020-02-01 15:38:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (65, 3, '2020-02-01 15:39:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (66, 3, '2020-02-01 15:41:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (67, 3, '2020-02-01 15:43:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (68, 3, '2020-02-01 15:44:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (69, 3, '2020-02-01 15:45:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (70, 3, '2020-02-01 15:46:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (71, 3, '2020-02-01 15:48:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (72, 3, '2020-02-01 16:00:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (73, 3, '2020-02-01 16:07:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (74, 3, '2020-02-01 16:08:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (75, 3, '2020-02-02 15:28:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (76, 3, '2020-02-02 15:44:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (77, 3, '2020-02-02 15:45:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (78, 3, '2020-02-02 15:52:32', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (79, 3, '2020-02-02 15:53:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (80, 3, '2020-02-02 15:54:36', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (81, 3, '2020-02-02 16:01:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (82, 3, '2020-02-02 16:05:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (83, 3, '2020-02-02 16:06:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (84, 3, '2020-02-02 16:17:26', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (85, 3, '2020-02-02 16:18:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (86, 3, '2020-02-02 16:19:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (87, 3, '2020-02-02 16:19:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (88, 3, '2020-02-02 16:22:27', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (89, 3, '2020-02-02 16:23:30', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (90, 3, '2020-02-02 16:23:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (91, 3, '2020-02-02 16:24:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (92, 3, '2020-02-02 16:25:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (93, 3, '2020-02-02 16:26:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (94, 3, '2020-02-02 16:26:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (95, 3, '2020-02-02 16:27:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (96, 3, '2020-02-02 16:31:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (97, 3, '2020-02-02 16:31:08', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (98, 3, '2020-02-02 16:31:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (99, 3, '2020-02-02 16:31:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (100, 3, '2020-02-02 16:33:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (101, 3, '2020-02-02 16:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (102, 3, '2020-02-02 16:34:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (103, 3, '2020-02-02 16:38:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (104, 3, '2020-02-02 16:39:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (105, 3, '2020-02-02 16:42:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (106, 3, '2020-02-02 16:46:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (107, 3, '2020-02-02 16:50:23', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (108, 3, '2020-02-02 16:51:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (109, 3, '2020-02-02 16:51:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (110, 3, '2020-02-02 16:52:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (111, 3, '2020-02-02 17:01:05', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (112, 3, '2020-02-03 10:43:22', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (113, 3, '2020-02-03 10:45:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (114, 3, '2020-02-03 10:46:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (115, 3, '2020-02-03 10:54:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (116, 3, '2020-02-03 14:24:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (117, 3, '2020-02-03 14:25:38', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (118, 5, '2020-02-03 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (119, 5, '2020-02-03 15:23:00', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (120, 5, '2020-02-03 15:24:29', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (121, 3, '2020-02-03 15:24:50', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (122, 5, '2020-02-03 15:27:18', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (123, 3, '2020-02-03 15:27:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (124, 3, '2020-02-03 15:29:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (125, 5, '2020-02-03 15:33:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (126, 3, '2020-02-03 15:33:51', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (127, 1, '2020-02-03 15:34:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (128, 3, '2020-02-03 15:34:47', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (129, 3, '2020-02-04 14:14:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (130, 3, '2020-02-05 10:33:35', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (131, 3, '2020-02-05 10:36:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (132, 3, '2020-02-05 16:34:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (133, 4, '2020-02-05 16:58:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (134, 3, '2020-02-05 16:59:03', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (135, 3, '2020-02-06 10:25:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (136, 3, '2020-02-07 14:34:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (137, 3, '2020-02-07 14:36:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (138, 1, '2020-02-07 14:43:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (139, 3, '2020-02-07 15:18:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (140, 3, '2020-02-07 15:20:07', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (141, 3, '2020-02-07 15:22:20', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (142, 3, '2020-02-07 15:22:28', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (143, 3, '2020-02-07 15:55:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (144, 3, '2020-02-07 15:56:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (145, 3, '2020-02-07 15:58:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (146, 6, '2020-02-07 16:16:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (147, 7, '2020-02-07 16:16:37', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (148, 3, '2020-02-07 16:18:39', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (149, 7, '2020-02-07 16:20:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (150, 3, '2020-02-07 16:20:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (151, 3, '2020-02-07 16:32:31', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (152, 3, '2020-02-07 19:32:34', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (153, 3, '2020-02-07 19:32:48', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (154, 3, '2020-02-07 19:33:01', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (155, 3, '2020-02-07 19:33:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (156, 3, '2020-02-07 19:33:21', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (157, 3, '2020-02-07 19:35:33', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (158, 3, '2020-02-07 19:37:10', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (159, 3, '2020-02-07 19:37:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (160, 3, '2020-02-07 19:37:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (161, 3, '2020-02-07 19:45:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (162, 3, '2020-02-07 19:47:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (163, 3, '2020-02-07 20:02:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (164, 6, '2020-02-07 20:10:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (165, 6, '2020-02-07 20:11:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (166, 6, '2020-02-07 20:13:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (167, 6, '2020-02-07 20:17:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (168, 3, '2020-02-07 20:17:44', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (169, 6, '2020-02-07 20:18:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (170, 3, '2020-02-10 10:28:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (171, 3, '2020-02-10 10:45:15', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (172, 3, '2020-02-10 10:57:46', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (173, 3, '2020-02-10 10:59:06', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (174, 3, '2020-02-10 11:04:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (175, 3, '2020-02-10 11:05:55', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (176, 3, '2020-02-10 11:06:45', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (177, 3, '2020-02-10 11:07:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (178, 3, '2020-02-10 11:08:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (179, 3, '2020-02-10 11:10:02', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (180, 6, '2020-02-10 14:25:17', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (181, 6, '2020-02-10 14:29:14', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (182, 3, '2020-02-10 16:09:16', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (183, 3, '2020-02-20 14:39:19', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (184, 8, '2020-02-20 17:14:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (185, 8, '2020-02-20 17:17:04', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (186, 8, '2020-02-20 17:17:42', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (187, 8, '2020-02-21 10:26:56', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (188, 8, '2020-02-21 10:28:54', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (189, 8, '2020-02-21 10:32:25', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (190, 8, '2020-02-21 10:33:41', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (191, 8, '2020-02-21 10:35:58', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (192, 8, '2020-02-21 10:36:49', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (193, 3, '2020-02-21 11:10:11', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (194, 3, '2020-02-25 16:11:13', '0:0:0:0:0:0:0:1', NULL, NULL);
INSERT INTO `ums_admin_login_log` VALUES (195, 3, '2020-02-25 16:46:29', '0:0:0:0:0:0:0:1', NULL, NULL);

-- ----------------------------
-- Table structure for ums_admin_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_permission_relation`;
CREATE TABLE `ums_admin_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `permission_id` bigint(20) NULL DEFAULT NULL COMMENT '权限id',
  `type` int(1) NULL DEFAULT NULL COMMENT '关系类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和权限关系表(除角色中定义的权限以外的加减权限)' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_admin_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_admin_role_relation`;
CREATE TABLE `ums_admin_role_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `admin_id` bigint(20) NULL DEFAULT NULL COMMENT '管理员id',
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户和角色关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_admin_role_relation
-- ----------------------------
INSERT INTO `ums_admin_role_relation` VALUES (26, 3, 5);
INSERT INTO `ums_admin_role_relation` VALUES (27, 6, 1);
INSERT INTO `ums_admin_role_relation` VALUES (28, 7, 2);
INSERT INTO `ums_admin_role_relation` VALUES (29, 1, 5);
INSERT INTO `ums_admin_role_relation` VALUES (30, 4, 5);
INSERT INTO `ums_admin_role_relation` VALUES (31, 1, 2);
INSERT INTO `ums_admin_role_relation` VALUES (32, 1, 1);
INSERT INTO `ums_admin_role_relation` VALUES (35, 8, 1);
INSERT INTO `ums_admin_role_relation` VALUES (36, 8, 2);
INSERT INTO `ums_admin_role_relation` VALUES (41, 9, 7);
INSERT INTO `ums_admin_role_relation` VALUES (44, 13, 7);
INSERT INTO `ums_admin_role_relation` VALUES (45, 13, 2);

-- ----------------------------
-- Table structure for ums_growth_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_growth_change_history`;
CREATE TABLE `ums_growth_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '成长值变化历史记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_growth_change_history
-- ----------------------------
INSERT INTO `ums_growth_change_history` VALUES (1, 1, '2018-08-29 17:16:35', 0, 1000, 'test', '测试使用', 1);

-- ----------------------------
-- Table structure for ums_integration_change_history
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_change_history`;
CREATE TABLE `ums_integration_change_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `change_type` int(1) NULL DEFAULT NULL COMMENT '改变类型：0->增加；1->减少',
  `change_count` int(11) NULL DEFAULT NULL COMMENT '积分改变数量',
  `operate_man` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人员',
  `operate_note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '积分来源：0->购物；1->管理员修改',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分变化历史记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_integration_consume_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_integration_consume_setting`;
CREATE TABLE `ums_integration_consume_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deduction_per_amount` int(11) NULL DEFAULT NULL COMMENT '每一元需要抵扣的积分数量',
  `max_percent_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高抵用百分比',
  `use_unit` int(11) NULL DEFAULT NULL COMMENT '每次使用积分最小单位100',
  `coupon_status` int(1) NULL DEFAULT NULL COMMENT '是否可以和优惠券同用；0->不可以；1->可以',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '积分消费设置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_integration_consume_setting
-- ----------------------------
INSERT INTO `ums_integration_consume_setting` VALUES (1, 100, 50, 100, 1);

-- ----------------------------
-- Table structure for ums_member
-- ----------------------------
DROP TABLE IF EXISTS `ums_member`;
CREATE TABLE `ums_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_level_id` bigint(20) NULL DEFAULT NULL COMMENT '会员等级ID',
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `phone` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `status` int(1) NULL DEFAULT NULL COMMENT '帐号启用状态:0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `gender` int(1) NULL DEFAULT NULL COMMENT '性别：0->未知；1->男；2->女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所做城市',
  `job` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `personalized_signature` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `source_type` int(1) NULL DEFAULT NULL COMMENT '用户来源',
  `integration` int(11) NULL DEFAULT NULL COMMENT '积分',
  `growth` int(11) NULL DEFAULT NULL COMMENT '成长值',
  `luckey_count` int(11) NULL DEFAULT NULL COMMENT '剩余抽奖次数',
  `history_integration` int(11) NULL DEFAULT NULL COMMENT '历史积分数量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username`) USING BTREE,
  UNIQUE INDEX `idx_phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_member
-- ----------------------------
INSERT INTO `ums_member` VALUES (1, 4, 'test', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windir', '18061581849', 1, '2018-08-02 10:35:44', NULL, 1, '2009-06-01', '上海', '学生', 'test', NULL, 5000, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (3, 4, 'windy', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'windy', '18061581848', 1, '2018-08-03 16:46:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (4, 4, 'zhengsan', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'zhengsan', '18061581847', 1, '2018-11-12 14:12:04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (5, 4, 'lisi', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lisi', '18061581841', 1, '2018-11-12 14:12:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (6, 4, 'wangwu', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'wangwu', '18061581842', 1, '2018-11-12 14:13:09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (7, 4, 'lion', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'lion', '18061581845', 1, '2018-11-12 14:21:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (8, 4, 'shari', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'shari', '18061581844', 1, '2018-11-12 14:22:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ums_member` VALUES (9, 4, 'aewen', '$2a$10$NZ5o7r2E.ayT2ZoxgjlI.eJ6OEYqjH7INR/F.mXDbjZJi9HF0YCVG', 'aewen', '18061581843', 1, '2018-11-12 14:22:55', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ums_member_level
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_level`;
CREATE TABLE `ums_member_level`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `growth_point` int(11) NULL DEFAULT NULL COMMENT '成长值阈值，例如：>5000',
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) NULL DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) NULL DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) NULL DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) NULL DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) NULL DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) NULL DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) NULL DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员等级表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_member_level
-- ----------------------------
INSERT INTO `ums_member_level` VALUES (1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL);
INSERT INTO `ums_member_level` VALUES (4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);

-- ----------------------------
-- Table structure for ums_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_login_log`;
CREATE TABLE `ums_member_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `login_type` int(1) NULL DEFAULT NULL COMMENT '登录类型：0->PC；1->android;2->ios;3->小程序',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员登录记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_member_member_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_member_tag_relation`;
CREATE TABLE `ums_member_member_tag_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `tag_id` bigint(20) NULL DEFAULT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和标签关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_member_product_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_product_category_relation`;
CREATE TABLE `ums_member_product_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `product_category_id` bigint(20) NULL DEFAULT NULL COMMENT '商品分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员与产品分类关系表（用户喜欢的分类）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_member_receive_address
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_receive_address`;
CREATE TABLE `ums_member_receive_address`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人名称',
  `phone_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `default_status` int(1) NULL DEFAULT NULL COMMENT '是否为默认',
  `post_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮政编码',
  `province` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省份/直辖市',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '城市',
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址(街道)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员收货地址表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_member_receive_address
-- ----------------------------
INSERT INTO `ums_member_receive_address` VALUES (1, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '南山区', '科兴科学园');
INSERT INTO `ums_member_receive_address` VALUES (3, 1, '大梨', '18033441849', 0, '518000', '广东省', '深圳市', '福田区', '清水河街道');
INSERT INTO `ums_member_receive_address` VALUES (4, 1, '大梨', '18033441849', 1, '518000', '广东省', '深圳市', '福田区', '东晓街道');

-- ----------------------------
-- Table structure for ums_member_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_rule_setting`;
CREATE TABLE `ums_member_rule_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `continue_sign_day` int(11) NULL DEFAULT NULL COMMENT '连续签到天数',
  `continue_sign_point` int(11) NULL DEFAULT NULL COMMENT '连续签到赠送数量',
  `consume_per_point` decimal(10, 2) NULL DEFAULT NULL COMMENT '每消费多少元获取1个点',
  `low_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低获取点数的订单金额',
  `max_point_per_order` int(11) NULL DEFAULT NULL COMMENT '每笔订单最高获取点数',
  `type` int(1) NULL DEFAULT NULL COMMENT '类型：0->积分规则；1->成长值规则',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分成长规则表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_member_statistics_info
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_statistics_info`;
CREATE TABLE `ums_member_statistics_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` bigint(20) NULL DEFAULT NULL,
  `consume_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '累计消费金额',
  `order_count` int(11) NULL DEFAULT NULL COMMENT '订单数量',
  `coupon_count` int(11) NULL DEFAULT NULL COMMENT '优惠券数量',
  `comment_count` int(11) NULL DEFAULT NULL COMMENT '评价数',
  `return_order_count` int(11) NULL DEFAULT NULL COMMENT '退货数量',
  `login_count` int(11) NULL DEFAULT NULL COMMENT '登录次数',
  `attend_count` int(11) NULL DEFAULT NULL COMMENT '关注数量',
  `fans_count` int(11) NULL DEFAULT NULL COMMENT '粉丝数量',
  `collect_product_count` int(11) NULL DEFAULT NULL,
  `collect_subject_count` int(11) NULL DEFAULT NULL,
  `collect_topic_count` int(11) NULL DEFAULT NULL,
  `collect_comment_count` int(11) NULL DEFAULT NULL,
  `invite_friend_count` int(11) NULL DEFAULT NULL,
  `recent_order_time` datetime(0) NULL DEFAULT NULL COMMENT '最后一次下订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员统计信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_member_tag
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_tag`;
CREATE TABLE `ums_member_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `finish_order_count` int(11) NULL DEFAULT NULL COMMENT '自动打标签完成订单数量',
  `finish_order_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '自动打标签完成订单金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_member_task
-- ----------------------------
DROP TABLE IF EXISTS `ums_member_task`;
CREATE TABLE `ums_member_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `growth` int(11) NULL DEFAULT NULL COMMENT '赠送成长值',
  `intergration` int(11) NULL DEFAULT NULL COMMENT '赠送积分',
  `type` int(1) NULL DEFAULT NULL COMMENT '任务类型：0->新手任务；1->日常任务',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for ums_menu
-- ----------------------------
DROP TABLE IF EXISTS `ums_menu`;
CREATE TABLE `ums_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父级ID',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `level` int(4) NULL DEFAULT NULL COMMENT '菜单级数',
  `sort` int(4) NULL DEFAULT NULL COMMENT '菜单排序',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端名称',
  `icon` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端图标',
  `hidden` int(1) NULL DEFAULT NULL COMMENT '前端隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_menu
-- ----------------------------
INSERT INTO `ums_menu` VALUES (1, 0, '2020-02-02 14:50:36', '商品', 0, 0, 'pms', 'product', 0);
INSERT INTO `ums_menu` VALUES (2, 1, '2020-02-02 14:51:50', '商品列表', 1, 0, 'product', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (3, 1, '2020-02-02 14:52:44', '添加商品', 1, 0, 'addProduct', 'product-add', 0);
INSERT INTO `ums_menu` VALUES (4, 1, '2020-02-02 14:53:51', '商品分类', 1, 0, 'productCate', 'product-cate', 0);
INSERT INTO `ums_menu` VALUES (5, 1, '2020-02-02 14:54:51', '商品类型', 1, 0, 'productAttr', 'product-attr', 0);
INSERT INTO `ums_menu` VALUES (6, 1, '2020-02-02 14:56:29', '品牌管理', 1, 0, 'brand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (7, 0, '2020-02-02 16:54:07', '订单', 0, 0, 'oms', 'order', 0);
INSERT INTO `ums_menu` VALUES (8, 7, '2020-02-02 16:55:18', '订单列表', 1, 0, 'order', 'product-list', 0);
INSERT INTO `ums_menu` VALUES (9, 7, '2020-02-02 16:56:46', '订单设置', 1, 0, 'orderSetting', 'order-setting', 0);
INSERT INTO `ums_menu` VALUES (10, 7, '2020-02-02 16:57:39', '退货申请处理', 1, 0, 'returnApply', 'order-return', 0);
INSERT INTO `ums_menu` VALUES (11, 7, '2020-02-02 16:59:40', '退货原因设置', 1, 0, 'returnReason', 'order-return-reason', 0);
INSERT INTO `ums_menu` VALUES (12, 0, '2020-02-04 16:18:00', '营销', 0, 0, 'sms', 'sms', 0);
INSERT INTO `ums_menu` VALUES (13, 12, '2020-02-04 16:19:22', '秒杀活动列表', 1, 0, 'flash', 'sms-flash', 0);
INSERT INTO `ums_menu` VALUES (14, 12, '2020-02-04 16:20:16', '优惠券列表', 1, 0, 'coupon', 'sms-coupon', 0);
INSERT INTO `ums_menu` VALUES (16, 12, '2020-02-07 16:22:38', '品牌推荐', 1, 0, 'homeBrand', 'product-brand', 0);
INSERT INTO `ums_menu` VALUES (17, 12, '2020-02-07 16:23:14', '新品推荐', 1, 0, 'homeNew', 'sms-new', 0);
INSERT INTO `ums_menu` VALUES (18, 12, '2020-02-07 16:26:38', '人气推荐', 1, 0, 'homeHot', 'sms-hot', 0);
INSERT INTO `ums_menu` VALUES (19, 12, '2020-02-07 16:28:16', '专题推荐', 1, 0, 'homeSubject', 'sms-subject', 0);
INSERT INTO `ums_menu` VALUES (20, 12, '2020-02-07 16:28:42', '广告列表', 1, 0, 'homeAdvertise', 'sms-ad', 0);
INSERT INTO `ums_menu` VALUES (21, 0, '2020-02-07 16:29:13', '权限', 0, 0, 'ums', 'ums', 0);
INSERT INTO `ums_menu` VALUES (22, 21, '2020-02-07 16:29:51', '用户列表', 1, 0, 'admin', 'ums-admin', 0);
INSERT INTO `ums_menu` VALUES (23, 21, '2020-02-07 16:30:13', '角色列表', 1, 0, 'role', 'ums-role', 0);
INSERT INTO `ums_menu` VALUES (24, 21, '2020-02-07 16:30:53', '菜单列表', 1, 0, 'menu', 'ums-menu', 0);
INSERT INTO `ums_menu` VALUES (25, 21, '2020-02-07 16:31:13', '资源列表', 1, 0, 'resource', 'ums-resource', 0);
INSERT INTO `ums_menu` VALUES (28, 0, '2022-11-30 09:34:52', '商家服务', 0, 0, 'bms', 'ums', 1);
INSERT INTO `ums_menu` VALUES (29, 28, '2022-11-30 09:35:39', '合作招商', 1, 0, 'bms-hzzs', 'ums', 0);
INSERT INTO `ums_menu` VALUES (30, 28, '2024-01-29 14:18:19', '合作招商2', 2, 0, '合作招商2', 'ums', 0);
INSERT INTO `ums_menu` VALUES (31, 28, '2024-01-29 14:19:27', '合作招商3', 0, 0, '合作招商3', 'ums', 0);

-- ----------------------------
-- Table structure for ums_permission
-- ----------------------------
DROP TABLE IF EXISTS `ums_permission`;
CREATE TABLE `ums_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父级权限id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限值',
  `icon` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` int(1) NULL DEFAULT NULL COMMENT '权限类型：0->目录；1->菜单；2->按钮（接口绑定权限）',
  `uri` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端资源路径',
  `status` int(1) NULL DEFAULT NULL COMMENT '启用状态；0->禁用；1->启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户权限表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_permission
-- ----------------------------
INSERT INTO `ums_permission` VALUES (1, 0, '商品', NULL, NULL, 0, NULL, 1, '2018-09-29 16:15:14', 0);
INSERT INTO `ums_permission` VALUES (2, 1, '商品列表', 'pms:product:read', NULL, 1, '/pms/product/index', 1, '2018-09-29 16:17:01', 0);
INSERT INTO `ums_permission` VALUES (3, 1, '添加商品', 'pms:product:create', NULL, 1, '/pms/product/add', 1, '2018-09-29 16:18:51', 0);
INSERT INTO `ums_permission` VALUES (4, 1, '商品分类', 'pms:productCategory:read', NULL, 1, '/pms/productCate/index', 1, '2018-09-29 16:23:07', 0);
INSERT INTO `ums_permission` VALUES (5, 1, '商品类型', 'pms:productAttribute:read', NULL, 1, '/pms/productAttr/index', 1, '2018-09-29 16:24:43', 0);
INSERT INTO `ums_permission` VALUES (6, 1, '品牌管理', 'pms:brand:read', NULL, 1, '/pms/brand/index', 1, '2018-09-29 16:25:45', 0);
INSERT INTO `ums_permission` VALUES (7, 2, '编辑商品', 'pms:product:update', NULL, 2, '/pms/product/updateProduct', 1, '2018-09-29 16:34:23', 0);
INSERT INTO `ums_permission` VALUES (8, 2, '删除商品', 'pms:product:delete', NULL, 2, '/pms/product/delete', 1, '2018-09-29 16:38:33', 0);
INSERT INTO `ums_permission` VALUES (9, 4, '添加商品分类', 'pms:productCategory:create', NULL, 2, '/pms/productCate/create', 1, '2018-09-29 16:43:23', 0);
INSERT INTO `ums_permission` VALUES (10, 4, '修改商品分类', 'pms:productCategory:update', NULL, 2, '/pms/productCate/update', 1, '2018-09-29 16:43:55', 0);
INSERT INTO `ums_permission` VALUES (11, 4, '删除商品分类', 'pms:productCategory:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:44:38', 0);
INSERT INTO `ums_permission` VALUES (12, 5, '添加商品类型', 'pms:productAttribute:create', NULL, 2, '/pms/productAttr/create', 1, '2018-09-29 16:45:25', 0);
INSERT INTO `ums_permission` VALUES (13, 5, '修改商品类型', 'pms:productAttribute:update', NULL, 2, '/pms/productAttr/update', 1, '2018-09-29 16:48:08', 0);
INSERT INTO `ums_permission` VALUES (14, 5, '删除商品类型', 'pms:productAttribute:delete', NULL, 2, '/pms/productAttr/delete', 1, '2018-09-29 16:48:44', 0);
INSERT INTO `ums_permission` VALUES (15, 6, '添加品牌', 'pms:brand:create', NULL, 2, '/pms/brand/add', 1, '2018-09-29 16:49:34', 0);
INSERT INTO `ums_permission` VALUES (16, 6, '修改品牌', 'pms:brand:update', NULL, 2, '/pms/brand/update', 1, '2018-09-29 16:50:55', 0);
INSERT INTO `ums_permission` VALUES (17, 6, '删除品牌', 'pms:brand:delete', NULL, 2, '/pms/brand/delete', 1, '2018-09-29 16:50:59', 0);
INSERT INTO `ums_permission` VALUES (18, 0, '首页', NULL, NULL, 0, NULL, 1, '2018-09-29 16:51:57', 0);

-- ----------------------------
-- Table structure for ums_resource
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource`;
CREATE TABLE `ums_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源名称',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源URL',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '资源分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台资源表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_resource
-- ----------------------------
INSERT INTO `ums_resource` VALUES (1, '2020-02-04 17:04:55', '商品品牌管理', '/brand/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (2, '2020-02-04 17:05:35', '商品属性分类管理', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (3, '2020-02-04 17:06:13', '商品属性管理', '/productAttribute/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (4, '2020-02-04 17:07:15', '商品分类管理', '/productCategory/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (5, '2020-02-04 17:09:16', '商品管理', '/product/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (6, '2020-02-04 17:09:53', '商品库存管理', '/sku/**', NULL, 1);
INSERT INTO `ums_resource` VALUES (8, '2020-02-05 14:43:37', '订单管理', '/order/**', '', 2);
INSERT INTO `ums_resource` VALUES (9, '2020-02-05 14:44:22', ' 订单退货申请管理', '/returnApply/**', '', 2);
INSERT INTO `ums_resource` VALUES (10, '2020-02-05 14:45:08', '退货原因管理', '/returnReason/**', '', 2);
INSERT INTO `ums_resource` VALUES (11, '2020-02-05 14:45:43', '订单设置管理', '/orderSetting/**', '', 2);
INSERT INTO `ums_resource` VALUES (12, '2020-02-05 14:46:23', '收货地址管理', '/companyAddress/**', '', 2);
INSERT INTO `ums_resource` VALUES (13, '2020-02-07 16:37:22', '优惠券管理', '/coupon/**', '', 3);
INSERT INTO `ums_resource` VALUES (14, '2020-02-07 16:37:59', '优惠券领取记录管理', '/couponHistory/**', '', 3);
INSERT INTO `ums_resource` VALUES (15, '2020-02-07 16:38:28', '限时购活动管理', '/flash/**', '', 3);
INSERT INTO `ums_resource` VALUES (16, '2020-02-07 16:38:59', '限时购商品关系管理', '/flashProductRelation/**', '', 3);
INSERT INTO `ums_resource` VALUES (17, '2020-02-07 16:39:22', '限时购场次管理', '/flashSession/**', '', 3);
INSERT INTO `ums_resource` VALUES (18, '2020-02-07 16:40:07', '首页轮播广告管理', '/home/advertise/**', '', 3);
INSERT INTO `ums_resource` VALUES (19, '2020-02-07 16:40:34', '首页品牌管理', '/home/brand/**', '', 3);
INSERT INTO `ums_resource` VALUES (20, '2020-02-07 16:41:06', '首页新品管理', '/home/newProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (21, '2020-02-07 16:42:16', '首页人气推荐管理', '/home/recommendProduct/**', '', 3);
INSERT INTO `ums_resource` VALUES (22, '2020-02-07 16:42:48', '首页专题推荐管理', '/home/recommendSubject/**', '', 3);
INSERT INTO `ums_resource` VALUES (23, '2020-02-07 16:44:56', ' 商品优选管理', '/prefrenceArea/**', '', 5);
INSERT INTO `ums_resource` VALUES (24, '2020-02-07 16:45:39', '商品专题管理', '/subject/**', '', 5);
INSERT INTO `ums_resource` VALUES (25, '2020-02-07 16:47:34', '后台用户管理', '/admin/**', '', 4);
INSERT INTO `ums_resource` VALUES (26, '2020-02-07 16:48:24', '后台用户角色管理', '/role/**', '', 4);
INSERT INTO `ums_resource` VALUES (27, '2020-02-07 16:48:48', '后台菜单管理', '/menu/**', '', 4);
INSERT INTO `ums_resource` VALUES (28, '2020-02-07 16:49:18', '后台资源分类管理', '/resourceCategory/**', '', 4);
INSERT INTO `ums_resource` VALUES (29, '2020-02-07 16:49:45', '后台资源管理', '/resource/**', '', 4);
INSERT INTO `ums_resource` VALUES (31, '2022-11-30 10:19:48', 'xyz测试资源_02', '/xyz2', '用于测试的资源22', 6);
INSERT INTO `ums_resource` VALUES (32, '2023-02-08 16:42:14', '团购资源2', '/pms/tg2', '团购资源/团购资源2', 2);
INSERT INTO `ums_resource` VALUES (33, NULL, '问我', '订单', '111', 1);
INSERT INTO `ums_resource` VALUES (34, '2024-01-24 15:49:03', '22', '33', '44', 1);

-- ----------------------------
-- Table structure for ums_resource_category
-- ----------------------------
DROP TABLE IF EXISTS `ums_resource_category`;
CREATE TABLE `ums_resource_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `sort` int(4) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '资源分类表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_resource_category
-- ----------------------------
INSERT INTO `ums_resource_category` VALUES (1, '2020-02-05 10:21:44', '商品模块', 0);
INSERT INTO `ums_resource_category` VALUES (2, '2020-02-05 10:22:34', '订单模块', 0);
INSERT INTO `ums_resource_category` VALUES (3, '2020-02-05 10:22:48', '营销模块', 0);
INSERT INTO `ums_resource_category` VALUES (4, '2020-02-05 10:23:04', '权限模块', 0);
INSERT INTO `ums_resource_category` VALUES (5, '2020-02-07 16:34:27', '内容模块', 0);
INSERT INTO `ums_resource_category` VALUES (6, '2020-02-07 16:35:49', '其他模块', 0);
INSERT INTO `ums_resource_category` VALUES (8, '2022-11-30 10:10:54', 'yy模块', 1);

-- ----------------------------
-- Table structure for ums_role
-- ----------------------------
DROP TABLE IF EXISTS `ums_role`;
CREATE TABLE `ums_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `admin_count` int(11) NULL DEFAULT NULL COMMENT '后台用户数量',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NULL DEFAULT 1 COMMENT '启用状态：0->禁用；1->启用',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_role
-- ----------------------------
INSERT INTO `ums_role` VALUES (1, '商品管理员', '只能查看及操作商品', 0, '2020-02-03 16:50:37', 1, 0);
INSERT INTO `ums_role` VALUES (2, '订单管理员', '只能查看及操作订单', 0, '2018-09-30 15:53:45', 1, 0);
INSERT INTO `ums_role` VALUES (5, '超级管理员', '拥有所有查看和操作功能', 0, '2020-02-02 15:11:05', 1, 0);
INSERT INTO `ums_role` VALUES (7, '营销管理员', '负责处理营销相关业务', 0, '2022-11-29 10:57:53', 1, 0);
INSERT INTO `ums_role` VALUES (8, '市场管理员', '负责市场xx业务', 0, NULL, 1, 0);
INSERT INTO `ums_role` VALUES (9, 'AA管理员', '负责A业务', 0, NULL, 1, 0);
INSERT INTO `ums_role` VALUES (10, 'BB管理员', '负责B业务', 0, '2024-01-24 15:55:31', 1, 0);

-- ----------------------------
-- Table structure for ums_role_menu_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_menu_relation`;
CREATE TABLE `ums_role_menu_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色菜单关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_role_menu_relation
-- ----------------------------
INSERT INTO `ums_role_menu_relation` VALUES (33, 1, 1);
INSERT INTO `ums_role_menu_relation` VALUES (34, 1, 2);
INSERT INTO `ums_role_menu_relation` VALUES (35, 1, 3);
INSERT INTO `ums_role_menu_relation` VALUES (36, 1, 4);
INSERT INTO `ums_role_menu_relation` VALUES (37, 1, 5);
INSERT INTO `ums_role_menu_relation` VALUES (38, 1, 6);
INSERT INTO `ums_role_menu_relation` VALUES (53, 2, 7);
INSERT INTO `ums_role_menu_relation` VALUES (54, 2, 8);
INSERT INTO `ums_role_menu_relation` VALUES (55, 2, 9);
INSERT INTO `ums_role_menu_relation` VALUES (56, 2, 10);
INSERT INTO `ums_role_menu_relation` VALUES (57, 2, 11);
INSERT INTO `ums_role_menu_relation` VALUES (110, 7, 12);
INSERT INTO `ums_role_menu_relation` VALUES (111, 7, 13);
INSERT INTO `ums_role_menu_relation` VALUES (112, 7, 14);
INSERT INTO `ums_role_menu_relation` VALUES (113, 7, 16);
INSERT INTO `ums_role_menu_relation` VALUES (114, 7, 17);
INSERT INTO `ums_role_menu_relation` VALUES (115, 7, 18);
INSERT INTO `ums_role_menu_relation` VALUES (116, 7, 19);
INSERT INTO `ums_role_menu_relation` VALUES (117, 7, 20);
INSERT INTO `ums_role_menu_relation` VALUES (118, 8, 28);
INSERT INTO `ums_role_menu_relation` VALUES (119, 8, 29);
INSERT INTO `ums_role_menu_relation` VALUES (143, 5, 1);
INSERT INTO `ums_role_menu_relation` VALUES (144, 5, 2);
INSERT INTO `ums_role_menu_relation` VALUES (145, 5, 3);
INSERT INTO `ums_role_menu_relation` VALUES (146, 5, 4);
INSERT INTO `ums_role_menu_relation` VALUES (147, 5, 5);
INSERT INTO `ums_role_menu_relation` VALUES (148, 5, 6);
INSERT INTO `ums_role_menu_relation` VALUES (149, 5, 7);
INSERT INTO `ums_role_menu_relation` VALUES (150, 5, 8);
INSERT INTO `ums_role_menu_relation` VALUES (151, 5, 9);
INSERT INTO `ums_role_menu_relation` VALUES (152, 5, 10);
INSERT INTO `ums_role_menu_relation` VALUES (153, 5, 11);
INSERT INTO `ums_role_menu_relation` VALUES (154, 5, 12);
INSERT INTO `ums_role_menu_relation` VALUES (155, 5, 13);
INSERT INTO `ums_role_menu_relation` VALUES (156, 5, 14);
INSERT INTO `ums_role_menu_relation` VALUES (157, 5, 16);
INSERT INTO `ums_role_menu_relation` VALUES (158, 5, 17);
INSERT INTO `ums_role_menu_relation` VALUES (159, 5, 18);
INSERT INTO `ums_role_menu_relation` VALUES (160, 5, 19);
INSERT INTO `ums_role_menu_relation` VALUES (161, 5, 20);
INSERT INTO `ums_role_menu_relation` VALUES (162, 5, 21);
INSERT INTO `ums_role_menu_relation` VALUES (163, 5, 22);
INSERT INTO `ums_role_menu_relation` VALUES (164, 5, 23);
INSERT INTO `ums_role_menu_relation` VALUES (165, 5, 24);
INSERT INTO `ums_role_menu_relation` VALUES (166, 5, 25);
INSERT INTO `ums_role_menu_relation` VALUES (209, 10, 1);
INSERT INTO `ums_role_menu_relation` VALUES (210, 10, 2);
INSERT INTO `ums_role_menu_relation` VALUES (211, 10, 3);
INSERT INTO `ums_role_menu_relation` VALUES (212, 10, 4);
INSERT INTO `ums_role_menu_relation` VALUES (213, 10, 5);
INSERT INTO `ums_role_menu_relation` VALUES (214, 10, 6);
INSERT INTO `ums_role_menu_relation` VALUES (215, 10, 12);
INSERT INTO `ums_role_menu_relation` VALUES (216, 10, 13);
INSERT INTO `ums_role_menu_relation` VALUES (217, 10, 14);
INSERT INTO `ums_role_menu_relation` VALUES (218, 10, 16);
INSERT INTO `ums_role_menu_relation` VALUES (219, 10, 17);
INSERT INTO `ums_role_menu_relation` VALUES (220, 10, 18);
INSERT INTO `ums_role_menu_relation` VALUES (221, 10, 19);
INSERT INTO `ums_role_menu_relation` VALUES (222, 10, 20);

-- ----------------------------
-- Table structure for ums_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_permission_relation`;
CREATE TABLE `ums_role_permission_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色id',
  `permission_id` bigint(20) NULL DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台用户角色和权限关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_role_permission_relation
-- ----------------------------
INSERT INTO `ums_role_permission_relation` VALUES (1, 1, 1);
INSERT INTO `ums_role_permission_relation` VALUES (2, 1, 2);
INSERT INTO `ums_role_permission_relation` VALUES (3, 1, 3);
INSERT INTO `ums_role_permission_relation` VALUES (4, 1, 7);
INSERT INTO `ums_role_permission_relation` VALUES (5, 1, 8);
INSERT INTO `ums_role_permission_relation` VALUES (6, 2, 4);
INSERT INTO `ums_role_permission_relation` VALUES (7, 2, 9);
INSERT INTO `ums_role_permission_relation` VALUES (8, 2, 10);
INSERT INTO `ums_role_permission_relation` VALUES (9, 2, 11);
INSERT INTO `ums_role_permission_relation` VALUES (10, 3, 5);
INSERT INTO `ums_role_permission_relation` VALUES (11, 3, 12);
INSERT INTO `ums_role_permission_relation` VALUES (12, 3, 13);
INSERT INTO `ums_role_permission_relation` VALUES (13, 3, 14);
INSERT INTO `ums_role_permission_relation` VALUES (14, 4, 6);
INSERT INTO `ums_role_permission_relation` VALUES (15, 4, 15);
INSERT INTO `ums_role_permission_relation` VALUES (16, 4, 16);
INSERT INTO `ums_role_permission_relation` VALUES (17, 4, 17);

-- ----------------------------
-- Table structure for ums_role_resource_relation
-- ----------------------------
DROP TABLE IF EXISTS `ums_role_resource_relation`;
CREATE TABLE `ums_role_resource_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL COMMENT '角色ID',
  `resource_id` bigint(20) NULL DEFAULT NULL COMMENT '资源ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '后台角色资源关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ums_role_resource_relation
-- ----------------------------
INSERT INTO `ums_role_resource_relation` VALUES (103, 2, 8);
INSERT INTO `ums_role_resource_relation` VALUES (104, 2, 9);
INSERT INTO `ums_role_resource_relation` VALUES (105, 2, 10);
INSERT INTO `ums_role_resource_relation` VALUES (106, 2, 11);
INSERT INTO `ums_role_resource_relation` VALUES (107, 2, 12);
INSERT INTO `ums_role_resource_relation` VALUES (142, 5, 1);
INSERT INTO `ums_role_resource_relation` VALUES (143, 5, 2);
INSERT INTO `ums_role_resource_relation` VALUES (144, 5, 3);
INSERT INTO `ums_role_resource_relation` VALUES (145, 5, 4);
INSERT INTO `ums_role_resource_relation` VALUES (146, 5, 5);
INSERT INTO `ums_role_resource_relation` VALUES (147, 5, 6);
INSERT INTO `ums_role_resource_relation` VALUES (148, 5, 8);
INSERT INTO `ums_role_resource_relation` VALUES (149, 5, 9);
INSERT INTO `ums_role_resource_relation` VALUES (150, 5, 10);
INSERT INTO `ums_role_resource_relation` VALUES (151, 5, 11);
INSERT INTO `ums_role_resource_relation` VALUES (152, 5, 12);
INSERT INTO `ums_role_resource_relation` VALUES (153, 5, 13);
INSERT INTO `ums_role_resource_relation` VALUES (154, 5, 14);
INSERT INTO `ums_role_resource_relation` VALUES (155, 5, 15);
INSERT INTO `ums_role_resource_relation` VALUES (156, 5, 16);
INSERT INTO `ums_role_resource_relation` VALUES (157, 5, 17);
INSERT INTO `ums_role_resource_relation` VALUES (158, 5, 18);
INSERT INTO `ums_role_resource_relation` VALUES (159, 5, 19);
INSERT INTO `ums_role_resource_relation` VALUES (160, 5, 20);
INSERT INTO `ums_role_resource_relation` VALUES (161, 5, 21);
INSERT INTO `ums_role_resource_relation` VALUES (162, 5, 22);
INSERT INTO `ums_role_resource_relation` VALUES (163, 5, 23);
INSERT INTO `ums_role_resource_relation` VALUES (164, 5, 24);
INSERT INTO `ums_role_resource_relation` VALUES (165, 5, 25);
INSERT INTO `ums_role_resource_relation` VALUES (166, 5, 26);
INSERT INTO `ums_role_resource_relation` VALUES (167, 5, 27);
INSERT INTO `ums_role_resource_relation` VALUES (168, 5, 28);
INSERT INTO `ums_role_resource_relation` VALUES (169, 5, 29);
INSERT INTO `ums_role_resource_relation` VALUES (170, 1, 1);
INSERT INTO `ums_role_resource_relation` VALUES (171, 1, 2);
INSERT INTO `ums_role_resource_relation` VALUES (172, 1, 3);
INSERT INTO `ums_role_resource_relation` VALUES (173, 1, 4);
INSERT INTO `ums_role_resource_relation` VALUES (174, 1, 5);
INSERT INTO `ums_role_resource_relation` VALUES (175, 1, 6);
INSERT INTO `ums_role_resource_relation` VALUES (176, 1, 23);
INSERT INTO `ums_role_resource_relation` VALUES (177, 1, 24);
INSERT INTO `ums_role_resource_relation` VALUES (205, 7, 13);
INSERT INTO `ums_role_resource_relation` VALUES (206, 7, 14);
INSERT INTO `ums_role_resource_relation` VALUES (207, 7, 15);
INSERT INTO `ums_role_resource_relation` VALUES (208, 7, 16);
INSERT INTO `ums_role_resource_relation` VALUES (209, 7, 17);
INSERT INTO `ums_role_resource_relation` VALUES (210, 7, 18);
INSERT INTO `ums_role_resource_relation` VALUES (211, 7, 19);
INSERT INTO `ums_role_resource_relation` VALUES (212, 7, 20);
INSERT INTO `ums_role_resource_relation` VALUES (213, 7, 21);
INSERT INTO `ums_role_resource_relation` VALUES (214, 7, 22);
INSERT INTO `ums_role_resource_relation` VALUES (215, 7, 23);
INSERT INTO `ums_role_resource_relation` VALUES (216, 7, 24);
INSERT INTO `ums_role_resource_relation` VALUES (220, 8, 23);
INSERT INTO `ums_role_resource_relation` VALUES (221, 8, 24);
INSERT INTO `ums_role_resource_relation` VALUES (222, 8, 26);
INSERT INTO `ums_role_resource_relation` VALUES (223, 8, 27);
INSERT INTO `ums_role_resource_relation` VALUES (224, 8, 31);
INSERT INTO `ums_role_resource_relation` VALUES (225, 10, 1);
INSERT INTO `ums_role_resource_relation` VALUES (226, 10, 2);
INSERT INTO `ums_role_resource_relation` VALUES (227, 10, 3);
INSERT INTO `ums_role_resource_relation` VALUES (228, 10, 4);
INSERT INTO `ums_role_resource_relation` VALUES (229, 10, 5);
INSERT INTO `ums_role_resource_relation` VALUES (230, 10, 6);
INSERT INTO `ums_role_resource_relation` VALUES (231, 10, 33);
INSERT INTO `ums_role_resource_relation` VALUES (232, 10, 34);

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `branch_id` bigint(20) NOT NULL,
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rollback_info` longblob NOT NULL,
  `log_status` int(11) NOT NULL,
  `log_created` datetime(0) NULL,
  `log_modified` datetime(0) NULL,
  `ext` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zipkin_annotations
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_annotations`;
CREATE TABLE `zipkin_annotations`  (
  `trace_id_high` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.trace_id',
  `span_id` bigint(20) NOT NULL COMMENT 'coincides with zipkin_spans.id',
  `a_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'BinaryAnnotation.key or Annotation.value if type == -1',
  `a_value` blob NULL COMMENT 'BinaryAnnotation.value(), which must be smaller than 64KB',
  `a_type` int(11) NOT NULL COMMENT 'BinaryAnnotation.type() or -1 if Annotation',
  `a_timestamp` bigint(20) NULL DEFAULT NULL COMMENT 'Used to implement TTL; Annotation.timestamp or zipkin_spans.timestamp',
  `endpoint_ipv4` int(11) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_ipv6` binary(16) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null, or no IPv6 address',
  `endpoint_port` smallint(6) NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  `endpoint_service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Null when Binary/Annotation.endpoint is null',
  UNIQUE INDEX `trace_id_high`(`trace_id_high`, `trace_id`, `span_id`, `a_key`, `a_timestamp`) USING BTREE COMMENT 'Ignore insert on duplicate',
  INDEX `trace_id_high_2`(`trace_id_high`, `trace_id`, `span_id`) USING BTREE COMMENT 'for joining with zipkin_spans',
  INDEX `trace_id_high_3`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTraces/ByIds',
  INDEX `endpoint_service_name`(`endpoint_service_name`) USING BTREE COMMENT 'for getTraces and getServiceNames',
  INDEX `a_type`(`a_type`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  INDEX `a_key`(`a_key`) USING BTREE COMMENT 'for getTraces and autocomplete values',
  INDEX `trace_id`(`trace_id`, `span_id`, `a_key`) USING BTREE COMMENT 'for dependencies job'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zipkin_annotations
-- ----------------------------
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'cs', NULL, -1, 1705385468740466, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'cr', NULL, -1, 1705385469263190, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'http.method', 0x474554, 6, 1705385468740466, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385468740466, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'cs', NULL, -1, 1705385469265567, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'cr', NULL, -1, 1705385469272165, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'http.method', 0x474554, 6, 1705385469265567, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385469265567, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'sr', NULL, -1, 1705385468738899, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'ss', NULL, -1, 1705385469276399, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'ca', 0x01, 0, 1705385468738899, NULL, 0x00000000000000000000000000000001, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'http.method', 0x474554, 6, 1705385468738899, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385468738899, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'mvc.controller.class', 0x4F72646572436F6E74726F6C6C6572, 6, 1705385468738899, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385468738899, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'cs', NULL, -1, 1705385466431076, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'cr', NULL, -1, 1705385467053855, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'http.method', 0x474554, 6, 1705385466431076, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385466431076, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'cs', NULL, -1, 1705385467176915, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'cr', NULL, -1, 1705385467769769, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'http.method', 0x474554, 6, 1705385467176915, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385467176915, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'sr', NULL, -1, 1705385465363094, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'ss', NULL, -1, 1705385467804625, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'ca', 0x01, 0, 1705385465363094, NULL, 0x00000000000000000000000000000001, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'http.method', 0x474554, 6, 1705385465363094, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385465363094, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'mvc.controller.class', 0x4F72646572436F6E74726F6C6C6572, 6, 1705385465363094, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385465363094, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'sr', NULL, -1, 1705385466706918, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'ss', NULL, -1, 1705385467053329, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'ca', 0x01, 0, 1705385466706918, -1062731582, NULL, -27624, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'http.method', 0x474554, 6, 1705385466706918, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385466706918, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'mvc.controller.class', 0x50726F64756374436F6E74726F6C6C6572, 6, 1705385466706918, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6855565613515512750, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385466706918, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'sr', NULL, -1, 1705385467451355, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'ss', NULL, -1, 1705385467775220, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'ca', 0x01, 0, 1705385467451355, -1062731582, NULL, -27623, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'http.method', 0x474554, 6, 1705385467451355, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385467451355, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'mvc.controller.class', 0x41646D696E436F6E74726F6C6C6572, 6, 1705385467451355, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -6510791343451941487, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385467451355, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'cs', NULL, -1, 1705385465087891, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'cr', NULL, -1, 1705385467802932, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'http.method', 0x474554, 6, 1705385465087891, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385465087891, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, 3778139289495614417, 'sa', 0x01, 0, 1705385465087891, -1062731582, NULL, 8081, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -5788783411602954964, 'cs', NULL, -1, 1705385464947803, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -5788783411602954964, 'cr', NULL, -1, 1705385467814857, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -5788783411602954964, 'http.method', 0x474554, 6, 1705385464947803, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -5788783411602954964, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385464947803, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -3060022549647357303, 'sr', NULL, -1, 1705385463727784, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -3060022549647357303, 'ss', NULL, -1, 1705385467851361, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -3060022549647357303, 'ca', 0x01, 0, 1705385463727784, NULL, 0x00000000000000000000000000000001, -27629, '');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -3060022549647357303, 'http.method', 0x474554, 6, 1705385463727784, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -3060022549647357303, -3060022549647357303, 'http.path', 0x2F73686F702D6F726465722F6F726465722F74657374536C65757468, 6, 1705385463727784, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'sr', NULL, -1, 1705385469268494, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'ss', NULL, -1, 1705385469271437, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'ca', 0x01, 0, 1705385469268494, -1062731582, NULL, -27623, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'http.method', 0x474554, 6, 1705385469268494, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385469268494, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'mvc.controller.class', 0x41646D696E436F6E74726F6C6C6572, 6, 1705385469268494, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 4300858333014231990, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385469268494, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'cs', NULL, -1, 1705385468734427, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'cr', NULL, -1, 1705385469275834, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'http.method', 0x474554, 6, 1705385468734427, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385468734427, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 5434659801685043880, 'sa', 0x01, 0, 1705385468734427, -1062731582, NULL, 8081, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -4502736552786504644, 'cs', NULL, -1, 1705385468730468, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -4502736552786504644, 'cr', NULL, -1, 1705385469276304, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -4502736552786504644, 'http.method', 0x474554, 6, 1705385468730468, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -4502736552786504644, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385468730468, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -6643785344546836356, 'sr', NULL, -1, 1705385468727632, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -6643785344546836356, 'ss', NULL, -1, 1705385469279068, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -6643785344546836356, 'ca', 0x01, 0, 1705385468727632, NULL, 0x00000000000000000000000000000001, -27629, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -6643785344546836356, 'http.method', 0x474554, 6, 1705385468727632, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, -6643785344546836356, 'http.path', 0x2F73686F702D6F726465722F6F726465722F74657374536C65757468, 6, 1705385468727632, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'sr', NULL, -1, 1705385468981923, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'ss', NULL, -1, 1705385469272370, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'ca', 0x01, 0, 1705385468981923, -1062731582, NULL, -27606, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'http.method', 0x474554, 6, 1705385468981923, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385468981923, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'mvc.controller.class', 0x50726F64756374436F6E74726F6C6C6572, 6, 1705385468981923, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6643785344546836356, 816646947166374645, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385468981923, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'sr', NULL, -1, 1705385469949625, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'ss', NULL, -1, 1705385469951812, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'ca', 0x01, 0, 1705385469949625, -1062731582, NULL, -27624, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'http.method', 0x474554, 6, 1705385469949625, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385469949625, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'mvc.controller.class', 0x50726F64756374436F6E74726F6C6C6572, 6, 1705385469949625, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385469949625, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'cs', NULL, -1, 1705385469947388, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'cr', NULL, -1, 1705385469952042, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'http.method', 0x474554, 6, 1705385469947388, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, -8052405940615143750, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385469947388, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'cs', NULL, -1, 1705385469953448, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'cr', NULL, -1, 1705385469957634, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'http.method', 0x474554, 6, 1705385469953448, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385469953448, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'sr', NULL, -1, 1705385469945612, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'ss', NULL, -1, 1705385469959833, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'ca', 0x01, 0, 1705385469945612, NULL, 0x00000000000000000000000000000001, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'http.method', 0x474554, 6, 1705385469945612, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385469945612, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'mvc.controller.class', 0x4F72646572436F6E74726F6C6C6572, 6, 1705385469945612, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385469945612, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'cs', NULL, -1, 1705385470334533, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'cr', NULL, -1, 1705385470340572, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'http.method', 0x474554, 6, 1705385470334533, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385470334533, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'cs', NULL, -1, 1705385470342896, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'cr', NULL, -1, 1705385470347247, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'http.method', 0x474554, 6, 1705385470342896, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385470342896, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'sr', NULL, -1, 1705385470332755, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'ss', NULL, -1, 1705385470349280, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'ca', 0x01, 0, 1705385470332755, NULL, 0x00000000000000000000000000000001, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'http.method', 0x474554, 6, 1705385470332755, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385470332755, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'mvc.controller.class', 0x4F72646572436F6E74726F6C6C6572, 6, 1705385470332755, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385470332755, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'sr', NULL, -1, 1705385469954184, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'ss', NULL, -1, 1705385469956986, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'ca', 0x01, 0, 1705385469954184, -1062731582, NULL, -27623, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'http.method', 0x474554, 6, 1705385469954184, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385469954184, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'mvc.controller.class', 0x41646D696E436F6E74726F6C6C6572, 6, 1705385469954184, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 7132479164433499117, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385469954184, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'sr', NULL, -1, 1705385470345301, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'ss', NULL, -1, 1705385470347617, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'ca', 0x01, 0, 1705385470345301, -1062731582, NULL, -27623, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'http.method', 0x474554, 6, 1705385470345301, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385470345301, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'mvc.controller.class', 0x41646D696E436F6E74726F6C6C6572, 6, 1705385470345301, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, -8415678153684597698, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385470345301, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'cs', NULL, -1, 1705385469941571, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'cr', NULL, -1, 1705385469959142, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'http.method', 0x474554, 6, 1705385469941571, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385469941571, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 1013528909788561917, 'sa', 0x01, 0, 1705385469941571, -1062731582, NULL, 8081, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 8872748241027512131, 'cs', NULL, -1, 1705385469939208, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 8872748241027512131, 'cr', NULL, -1, 1705385469959688, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 8872748241027512131, 'http.method', 0x474554, 6, 1705385469939208, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 8872748241027512131, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385469939208, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 4229827255948614585, 'sr', NULL, -1, 1705385469936235, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 4229827255948614585, 'ss', NULL, -1, 1705385469962360, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 4229827255948614585, 'ca', 0x01, 0, 1705385469936235, NULL, 0x00000000000000000000000000000001, -27629, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 4229827255948614585, 'http.method', 0x474554, 6, 1705385469936235, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4229827255948614585, 4229827255948614585, 'http.path', 0x2F73686F702D6F726465722F6F726465722F74657374536C65757468, 6, 1705385469936235, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'cs', NULL, -1, 1705385470329661, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'cr', NULL, -1, 1705385470349175, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'http.method', 0x474554, 6, 1705385470329661, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385470329661, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4181811672062179623, 'sa', 0x01, 0, 1705385470329661, -1062731582, NULL, 8081, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 1334219830169082035, 'cs', NULL, -1, 1705385470327964, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 1334219830169082035, 'cr', NULL, -1, 1705385470349617, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 1334219830169082035, 'http.method', 0x474554, 6, 1705385470327964, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 1334219830169082035, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385470327964, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4152705155539470669, 'sr', NULL, -1, 1705385470325078, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4152705155539470669, 'ss', NULL, -1, 1705385470351759, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4152705155539470669, 'ca', 0x01, 0, 1705385470325078, NULL, 0x00000000000000000000000000000001, -27629, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4152705155539470669, 'http.method', 0x474554, 6, 1705385470325078, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 4152705155539470669, 'http.path', 0x2F73686F702D6F726465722F6F726465722F74657374536C65757468, 6, 1705385470325078, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'sr', NULL, -1, 1705385470337735, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'ss', NULL, -1, 1705385470340413, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'ca', 0x01, 0, 1705385470337735, -1062731582, NULL, -27606, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'http.method', 0x474554, 6, 1705385470337735, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385470337735, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'mvc.controller.class', 0x50726F64756374436F6E74726F6C6C6572, 6, 1705385470337735, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4152705155539470669, 8887493682160136213, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385470337735, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'sr', NULL, -1, 1705385480900945, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'ss', NULL, -1, 1705385480903103, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'ca', 0x01, 0, 1705385480900945, -1062731582, NULL, -27623, '');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'http.method', 0x474554, 6, 1705385480900945, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385480900945, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'mvc.controller.class', 0x41646D696E436F6E74726F6C6C6572, 6, 1705385480900945, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385480900945, -1062731582, NULL, NULL, 'shop-user');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'cs', NULL, -1, 1705385480890305, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'cr', NULL, -1, 1705385480904991, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'http.method', 0x474554, 6, 1705385480890305, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385480890305, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'sa', 0x01, 0, 1705385480890305, -1062731582, NULL, 8081, '');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -6035667775017318898, 'cs', NULL, -1, 1705385480888538, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -6035667775017318898, 'cr', NULL, -1, 1705385480905498, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -6035667775017318898, 'http.method', 0x474554, 6, 1705385480888538, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -6035667775017318898, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385480888538, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -628554986166791937, 'sr', NULL, -1, 1705385480886535, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -628554986166791937, 'ss', NULL, -1, 1705385480908422, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -628554986166791937, 'ca', 0x01, 0, 1705385480886535, NULL, 0x00000000000000000000000000000001, -27629, '');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -628554986166791937, 'http.method', 0x474554, 6, 1705385480886535, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -628554986166791937, 'http.path', 0x2F73686F702D6F726465722F6F726465722F74657374536C65757468, 6, 1705385480886535, -1062731582, NULL, NULL, 'api-gateway');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'sr', NULL, -1, 1705385480895928, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'ss', NULL, -1, 1705385480897384, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'ca', 0x01, 0, 1705385480895928, -1062731582, NULL, -27624, '');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'http.method', 0x474554, 6, 1705385480895928, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385480895928, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'mvc.controller.class', 0x50726F64756374436F6E74726F6C6C6572, 6, 1705385480895928, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385480895928, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'cs', NULL, -1, 1705385480894885, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'cr', NULL, -1, 1705385480897671, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'http.method', 0x474554, 6, 1705385480894885, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, -151991236383333714, 'http.path', 0x2F70726F647563742F74657374536C65757468, 6, 1705385480894885, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'cs', NULL, -1, 1705385480899132, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'cr', NULL, -1, 1705385480903034, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'http.method', 0x474554, 6, 1705385480899132, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 7866356946429241261, 'http.path', 0x2F757365722F61646D696E2F74657374536C65757468, 6, 1705385480899132, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'sr', NULL, -1, 1705385480892928, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'ss', NULL, -1, 1705385480905366, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'ca', 0x01, 0, 1705385480892928, NULL, 0x00000000000000000000000000000001, NULL, '');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'http.method', 0x474554, 6, 1705385480892928, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'http.path', 0x2F6F726465722F74657374536C65757468, 6, 1705385480892928, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'mvc.controller.class', 0x4F72646572436F6E74726F6C6C6572, 6, 1705385480892928, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, -628554986166791937, 1458824543193135037, 'mvc.controller.method', 0x74657374536C65757468, 6, 1705385480892928, -1062731582, NULL, NULL, 'shop-order');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'sr', NULL, -1, 1705391749126458, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'ss', NULL, -1, 1705391749244352, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'ca', 0x01, 0, 1705391749126458, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'error', 0x343034, 6, 1705391749126458, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'http.method', 0x474554, 6, 1705391749126458, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'http.path', 0x2F, 6, 1705391749126458, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'http.status_code', 0x343034, 6, 1705391749126458, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 1525891317773507772, 1525891317773507772, 'mvc.controller.class', 0x5265736F75726365487474705265717565737448616E646C6572, 6, 1705391749126458, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6225603913240019947, -6225603913240019947, 'sr', NULL, -1, 1705391758861131, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6225603913240019947, -6225603913240019947, 'ss', NULL, -1, 1705391758866968, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6225603913240019947, -6225603913240019947, 'ca', 0x01, 0, 1705391758861131, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6225603913240019947, -6225603913240019947, 'http.method', 0x474554, 6, 1705391758861131, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6225603913240019947, -6225603913240019947, 'http.path', 0x2F636F6E6669675465737431, 6, 1705391758861131, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6225603913240019947, -6225603913240019947, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391758861131, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6225603913240019947, -6225603913240019947, 'mvc.controller.method', 0x676574417574686F7250726F7065727479, 6, 1705391758861131, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 850717761124197636, 850717761124197636, 'sr', NULL, -1, 1705391768730082, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 850717761124197636, 850717761124197636, 'ss', NULL, -1, 1705391768732943, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 850717761124197636, 850717761124197636, 'ca', 0x01, 0, 1705391768730082, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, 850717761124197636, 850717761124197636, 'http.method', 0x474554, 6, 1705391768730082, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 850717761124197636, 850717761124197636, 'http.path', 0x2F636F6E6669675465737432, 6, 1705391768730082, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 850717761124197636, 850717761124197636, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391768730082, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 850717761124197636, 850717761124197636, 'mvc.controller.method', 0x676574417574686F7250726F706572747932, 6, 1705391768730082, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -7072393887381512326, -7072393887381512326, 'sr', NULL, -1, 1705391773041236, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -7072393887381512326, -7072393887381512326, 'ss', NULL, -1, 1705391773043091, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -7072393887381512326, -7072393887381512326, 'ca', 0x01, 0, 1705391773041236, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, -7072393887381512326, -7072393887381512326, 'http.method', 0x474554, 6, 1705391773041236, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -7072393887381512326, -7072393887381512326, 'http.path', 0x2F636F6E6669675465737432, 6, 1705391773041236, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -7072393887381512326, -7072393887381512326, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391773041236, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -7072393887381512326, -7072393887381512326, 'mvc.controller.method', 0x676574417574686F7250726F706572747932, 6, 1705391773041236, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 7114149310961474855, 7114149310961474855, 'sr', NULL, -1, 1705391776239169, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 7114149310961474855, 7114149310961474855, 'ss', NULL, -1, 1705391776240579, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 7114149310961474855, 7114149310961474855, 'ca', 0x01, 0, 1705391776239169, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, 7114149310961474855, 7114149310961474855, 'http.method', 0x474554, 6, 1705391776239169, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 7114149310961474855, 7114149310961474855, 'http.path', 0x2F636F6E6669675465737432, 6, 1705391776239169, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 7114149310961474855, 7114149310961474855, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391776239169, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 7114149310961474855, 7114149310961474855, 'mvc.controller.method', 0x676574417574686F7250726F706572747932, 6, 1705391776239169, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -9033326548557664588, -9033326548557664588, 'sr', NULL, -1, 1705391829740254, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -9033326548557664588, -9033326548557664588, 'ss', NULL, -1, 1705391829742913, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -9033326548557664588, -9033326548557664588, 'ca', 0x01, 0, 1705391829740254, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, -9033326548557664588, -9033326548557664588, 'http.method', 0x474554, 6, 1705391829740254, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -9033326548557664588, -9033326548557664588, 'http.path', 0x2F636F6E6669675465737432, 6, 1705391829740254, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -9033326548557664588, -9033326548557664588, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391829740254, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -9033326548557664588, -9033326548557664588, 'mvc.controller.method', 0x676574417574686F7250726F706572747932, 6, 1705391829740254, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5716049449372573572, 5716049449372573572, 'sr', NULL, -1, 1705391831548111, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5716049449372573572, 5716049449372573572, 'ss', NULL, -1, 1705391831549827, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5716049449372573572, 5716049449372573572, 'ca', 0x01, 0, 1705391831548111, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, 5716049449372573572, 5716049449372573572, 'http.method', 0x474554, 6, 1705391831548111, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5716049449372573572, 5716049449372573572, 'http.path', 0x2F636F6E6669675465737432, 6, 1705391831548111, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5716049449372573572, 5716049449372573572, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391831548111, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5716049449372573572, 5716049449372573572, 'mvc.controller.method', 0x676574417574686F7250726F706572747932, 6, 1705391831548111, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4903522602557247792, 4903522602557247792, 'sr', NULL, -1, 1705391841706858, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4903522602557247792, 4903522602557247792, 'ss', NULL, -1, 1705391841708956, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4903522602557247792, 4903522602557247792, 'ca', 0x01, 0, 1705391841706858, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, 4903522602557247792, 4903522602557247792, 'http.method', 0x474554, 6, 1705391841706858, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4903522602557247792, 4903522602557247792, 'http.path', 0x2F636F6E6669675465737432, 6, 1705391841706858, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4903522602557247792, 4903522602557247792, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391841706858, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 4903522602557247792, 4903522602557247792, 'mvc.controller.method', 0x676574417574686F7250726F706572747932, 6, 1705391841706858, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5110551607749881141, 5110551607749881141, 'sr', NULL, -1, 1705391843062280, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5110551607749881141, 5110551607749881141, 'ss', NULL, -1, 1705391843064354, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5110551607749881141, 5110551607749881141, 'ca', 0x01, 0, 1705391843062280, NULL, 0x00000000000000000000000000000001, 25277, '');
INSERT INTO `zipkin_annotations` VALUES (0, 5110551607749881141, 5110551607749881141, 'http.method', 0x474554, 6, 1705391843062280, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5110551607749881141, 5110551607749881141, 'http.path', 0x2F636F6E6669675465737432, 6, 1705391843062280, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5110551607749881141, 5110551607749881141, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705391843062280, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, 5110551607749881141, 5110551607749881141, 'mvc.controller.method', 0x676574417574686F7250726F706572747932, 6, 1705391843062280, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6700941802508192467, -6700941802508192467, 'sr', NULL, -1, 1705393125033218, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6700941802508192467, -6700941802508192467, 'ss', NULL, -1, 1705393125146374, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6700941802508192467, -6700941802508192467, 'ca', 0x01, 0, 1705393125033218, NULL, 0x00000000000000000000000000000001, 26977, '');
INSERT INTO `zipkin_annotations` VALUES (0, -6700941802508192467, -6700941802508192467, 'http.method', 0x474554, 6, 1705393125033218, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6700941802508192467, -6700941802508192467, 'http.path', 0x2F636F6E6669675465737433, 6, 1705393125033218, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6700941802508192467, -6700941802508192467, 'mvc.controller.class', 0x436F6E66696754657374436F6E74726F6C6C6572, 6, 1705393125033218, -1062731582, NULL, NULL, 'shop-product');
INSERT INTO `zipkin_annotations` VALUES (0, -6700941802508192467, -6700941802508192467, 'mvc.controller.method', 0x676574456E7650726F706572747933, 6, 1705393125033218, -1062731582, NULL, NULL, 'shop-product');

-- ----------------------------
-- Table structure for zipkin_dependencies
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_dependencies`;
CREATE TABLE `zipkin_dependencies`  (
  `day` date NOT NULL,
  `parent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `child` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `call_count` bigint(20) NULL DEFAULT NULL,
  `error_count` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`day`, `parent`, `child`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for zipkin_spans
-- ----------------------------
DROP TABLE IF EXISTS `zipkin_spans`;
CREATE TABLE `zipkin_spans`  (
  `trace_id_high` bigint(20) NOT NULL DEFAULT 0 COMMENT 'If non zero, this means the trace uses 128 bit traceIds instead of 64 bit',
  `trace_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remote_service_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_id` bigint(20) NULL DEFAULT NULL,
  `debug` bit(1) NULL DEFAULT NULL,
  `start_ts` bigint(20) NULL DEFAULT NULL COMMENT 'Span.timestamp(): epoch micros used for endTs query and to implement TTL',
  `duration` bigint(20) NULL DEFAULT NULL COMMENT 'Span.duration(): micros used for minDuration and maxDuration query',
  PRIMARY KEY (`trace_id_high`, `trace_id`, `id`) USING BTREE,
  INDEX `trace_id_high`(`trace_id_high`, `trace_id`) USING BTREE COMMENT 'for getTracesByIds',
  INDEX `name`(`name`) USING BTREE COMMENT 'for getTraces and getSpanNames',
  INDEX `remote_service_name`(`remote_service_name`) USING BTREE COMMENT 'for getTraces and getRemoteServiceNames',
  INDEX `start_ts`(`start_ts`) USING BTREE COMMENT 'for getTraces ordering and range'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zipkin_spans
-- ----------------------------
INSERT INTO `zipkin_spans` VALUES (0, -9033326548557664588, -9033326548557664588, 'get /configtest2', '', NULL, NULL, 1705391829740254, 2659);
INSERT INTO `zipkin_spans` VALUES (0, -7072393887381512326, -7072393887381512326, 'get /configtest2', '', NULL, NULL, 1705391773041236, 1855);
INSERT INTO `zipkin_spans` VALUES (0, -6700941802508192467, -6700941802508192467, 'get /configtest3', '', NULL, NULL, 1705393125033218, 113156);
INSERT INTO `zipkin_spans` VALUES (0, -6643785344546836356, -6643785344546836356, 'get', '', NULL, NULL, 1705385468727632, 551436);
INSERT INTO `zipkin_spans` VALUES (0, -6643785344546836356, -4502736552786504644, 'get', '', -6643785344546836356, NULL, 1705385468730468, 545836);
INSERT INTO `zipkin_spans` VALUES (0, -6643785344546836356, 816646947166374645, 'get /product/testsleuth', '', 5434659801685043880, NULL, 1705385468740466, 522724);
INSERT INTO `zipkin_spans` VALUES (0, -6643785344546836356, 4300858333014231990, 'get /user/admin/testsleuth', '', 5434659801685043880, NULL, 1705385469265567, 6598);
INSERT INTO `zipkin_spans` VALUES (0, -6643785344546836356, 5434659801685043880, 'get', '', -6643785344546836356, NULL, 1705385468734427, 541407);
INSERT INTO `zipkin_spans` VALUES (0, -6225603913240019947, -6225603913240019947, 'get /configtest1', '', NULL, NULL, 1705391758861131, 5837);
INSERT INTO `zipkin_spans` VALUES (0, -3060022549647357303, -6855565613515512750, 'get /product/testsleuth', '', 3778139289495614417, NULL, 1705385466431076, 622779);
INSERT INTO `zipkin_spans` VALUES (0, -3060022549647357303, -6510791343451941487, 'get /user/admin/testsleuth', '', 3778139289495614417, NULL, 1705385467176915, 592854);
INSERT INTO `zipkin_spans` VALUES (0, -3060022549647357303, -5788783411602954964, 'get', '', -3060022549647357303, NULL, 1705385464947803, 2867054);
INSERT INTO `zipkin_spans` VALUES (0, -3060022549647357303, -3060022549647357303, 'get', '', NULL, NULL, 1705385463727784, 4123577);
INSERT INTO `zipkin_spans` VALUES (0, -3060022549647357303, 3778139289495614417, 'get', '', -3060022549647357303, NULL, 1705385465087891, 2715041);
INSERT INTO `zipkin_spans` VALUES (0, -628554986166791937, -6035667775017318898, 'get', '', -628554986166791937, NULL, 1705385480888538, 16960);
INSERT INTO `zipkin_spans` VALUES (0, -628554986166791937, -628554986166791937, 'get', '', NULL, NULL, 1705385480886535, 21887);
INSERT INTO `zipkin_spans` VALUES (0, -628554986166791937, -151991236383333714, 'get', '', 1458824543193135037, NULL, 1705385480894885, 2786);
INSERT INTO `zipkin_spans` VALUES (0, -628554986166791937, 1458824543193135037, 'get /order/testsleuth', '', -628554986166791937, NULL, 1705385480890305, 14686);
INSERT INTO `zipkin_spans` VALUES (0, -628554986166791937, 7866356946429241261, 'get', '', 1458824543193135037, NULL, 1705385480899132, 3902);
INSERT INTO `zipkin_spans` VALUES (0, 850717761124197636, 850717761124197636, 'get /configtest2', '', NULL, NULL, 1705391768730082, 2861);
INSERT INTO `zipkin_spans` VALUES (0, 1525891317773507772, 1525891317773507772, 'get /**', '', NULL, NULL, 1705391749126458, 117894);
INSERT INTO `zipkin_spans` VALUES (0, 4152705155539470669, -8415678153684597698, 'get /user/admin/testsleuth', '', 4181811672062179623, NULL, 1705385470342896, 4351);
INSERT INTO `zipkin_spans` VALUES (0, 4152705155539470669, 1334219830169082035, 'get', '', 4152705155539470669, NULL, 1705385470327964, 21653);
INSERT INTO `zipkin_spans` VALUES (0, 4152705155539470669, 4152705155539470669, 'get', '', NULL, NULL, 1705385470325078, 26681);
INSERT INTO `zipkin_spans` VALUES (0, 4152705155539470669, 4181811672062179623, 'get', '', 4152705155539470669, NULL, 1705385470329661, 19514);
INSERT INTO `zipkin_spans` VALUES (0, 4152705155539470669, 8887493682160136213, 'get /product/testsleuth', '', 4181811672062179623, NULL, 1705385470334533, 6039);
INSERT INTO `zipkin_spans` VALUES (0, 4229827255948614585, -8052405940615143750, 'get', '', 1013528909788561917, NULL, 1705385469947388, 4654);
INSERT INTO `zipkin_spans` VALUES (0, 4229827255948614585, 1013528909788561917, 'get', '', 4229827255948614585, NULL, 1705385469941571, 17571);
INSERT INTO `zipkin_spans` VALUES (0, 4229827255948614585, 4229827255948614585, 'get', '', NULL, NULL, 1705385469936235, 26125);
INSERT INTO `zipkin_spans` VALUES (0, 4229827255948614585, 7132479164433499117, 'get /user/admin/testsleuth', '', 1013528909788561917, NULL, 1705385469953448, 4186);
INSERT INTO `zipkin_spans` VALUES (0, 4229827255948614585, 8872748241027512131, 'get', '', 4229827255948614585, NULL, 1705385469939208, 20480);
INSERT INTO `zipkin_spans` VALUES (0, 4903522602557247792, 4903522602557247792, 'get /configtest2', '', NULL, NULL, 1705391841706858, 2098);
INSERT INTO `zipkin_spans` VALUES (0, 5110551607749881141, 5110551607749881141, 'get /configtest2', '', NULL, NULL, 1705391843062280, 2074);
INSERT INTO `zipkin_spans` VALUES (0, 5716049449372573572, 5716049449372573572, 'get /configtest2', '', NULL, NULL, 1705391831548111, 1716);
INSERT INTO `zipkin_spans` VALUES (0, 7114149310961474855, 7114149310961474855, 'get /configtest2', '', NULL, NULL, 1705391776239169, 1410);

SET FOREIGN_KEY_CHECKS = 1;
