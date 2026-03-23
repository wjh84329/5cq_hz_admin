/*
 Navicat Premium Data Transfer

 Source Server         : 120.77.82.230
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : 120.77.82.230:3306
 Source Schema         : ulthon

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 25/04/2023 22:39:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for basic
-- ----------------------------
DROP TABLE IF EXISTS `basic`;
CREATE TABLE `basic`  (
  `id` int(11) NOT NULL DEFAULT 1 COMMENT '运营配置基础配置',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'basic' COMMENT '基础配置标识',
  `smsCode` int(11) NULL DEFAULT NULL COMMENT '默认验证码，用填0',
  `sbkBanner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赛事banner图',
  `qq` int(11) NULL DEFAULT NULL COMMENT 'QQ客服',
  `wechatQf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信客服二维码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of basic
-- ----------------------------
INSERT INTO `basic` VALUES (1, 'basic', NULL, 'http://cqadmin.bluechs.com/storage/upload/20230419/643f8c9a386d0.png', 12345678, 'http://cqadmin.bluechs.com/storage/upload/20230419/643f7278e97d4.jpg');

-- ----------------------------
-- Table structure for coin_info
-- ----------------------------
DROP TABLE IF EXISTS `coin_info`;
CREATE TABLE `coin_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '金币使用记录',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open_id',
  `coin_num` decimal(10, 0) NULL DEFAULT NULL COMMENT '金币数量',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0增加1减少',
  `fs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录方式',
  `hb_id` int(11) NULL DEFAULT NULL COMMENT '红包id',
  `sbk_id` int(11) NULL DEFAULT NULL COMMENT '沙巴克id',
  `yx_id` int(11) NULL DEFAULT NULL COMMENT '游戏id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `tz_type` int(1) NULL DEFAULT NULL COMMENT '1为红方2为蓝方',
  `is_sw` int(1) NOT NULL DEFAULT 0 COMMENT '是否实物0否1是',
  `updata_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1341 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coin_info
-- ----------------------------
INSERT INTO `coin_info` VALUES (2, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, NULL, '比赛竞猜', NULL, NULL, NULL, NULL, 1, 0, '2023-04-05 12:51:30');
INSERT INTO `coin_info` VALUES (14, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 09:14:49');
INSERT INTO `coin_info` VALUES (15, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 09:43:23');
INSERT INTO `coin_info` VALUES (16, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 09:43:59');
INSERT INTO `coin_info` VALUES (17, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 09:45:02');
INSERT INTO `coin_info` VALUES (18, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 09:47:20');
INSERT INTO `coin_info` VALUES (19, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 09:52:32');
INSERT INTO `coin_info` VALUES (20, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 300, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 09:53:08');
INSERT INTO `coin_info` VALUES (21, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '测试', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 10:52:35');
INSERT INTO `coin_info` VALUES (22, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-23 20:21:53');
INSERT INTO `coin_info` VALUES (23, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 13:14:49');
INSERT INTO `coin_info` VALUES (24, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 13:16:18');
INSERT INTO `coin_info` VALUES (25, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 13:17:05');
INSERT INTO `coin_info` VALUES (26, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 13:17:53');
INSERT INTO `coin_info` VALUES (27, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '0', '实名认证', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 13:36:12');
INSERT INTO `coin_info` VALUES (29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '0', '绑定手机', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 14:46:07');
INSERT INTO `coin_info` VALUES (30, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 111, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 20:28:41');
INSERT INTO `coin_info` VALUES (31, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 111, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 20:30:04');
INSERT INTO `coin_info` VALUES (32, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 20:33:30');
INSERT INTO `coin_info` VALUES (33, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 20:34:42');
INSERT INTO `coin_info` VALUES (34, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 21:21:14');
INSERT INTO `coin_info` VALUES (35, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 111, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 22:51:47');
INSERT INTO `coin_info` VALUES (36, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 22:51:54');
INSERT INTO `coin_info` VALUES (37, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1000, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-24 22:56:23');
INSERT INTO `coin_info` VALUES (38, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2000, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-25 18:17:25');
INSERT INTO `coin_info` VALUES (39, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 10:04:23');
INSERT INTO `coin_info` VALUES (40, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 10:14:50');
INSERT INTO `coin_info` VALUES (41, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 10:14:59');
INSERT INTO `coin_info` VALUES (42, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 10:15:00');
INSERT INTO `coin_info` VALUES (43, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 10:18:13');
INSERT INTO `coin_info` VALUES (52, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 11:57:13');
INSERT INTO `coin_info` VALUES (53, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 12:03:38');
INSERT INTO `coin_info` VALUES (54, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 12:06:36');
INSERT INTO `coin_info` VALUES (55, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 12:07:49');
INSERT INTO `coin_info` VALUES (56, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 12:08:53');
INSERT INTO `coin_info` VALUES (57, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 12:10:03');
INSERT INTO `coin_info` VALUES (58, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 12:10:56');
INSERT INTO `coin_info` VALUES (59, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 12:12:10');
INSERT INTO `coin_info` VALUES (75, 'ociWS6j17km6QToj5dcoy1kNB8YA', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 13:06:51');
INSERT INTO `coin_info` VALUES (76, 'ociWS6j17km6QToj5dcoy1kNB8YA', 188, '0', '累计签到7天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 13:38:47');
INSERT INTO `coin_info` VALUES (77, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 19, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 13:38:47');
INSERT INTO `coin_info` VALUES (78, 'ociWS6j17km6QToj5dcoy1kNB8YA', 111, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 15:10:41');
INSERT INTO `coin_info` VALUES (85, 'ociWS6j17km6QToj5dcoy1kNB8YA', 2, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 17:57:08');
INSERT INTO `coin_info` VALUES (86, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 19, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 13:38:47');
INSERT INTO `coin_info` VALUES (91, 'ociWS6j17km6QToj5dcoy1kNB8YA', 100, '0', '绑定手机', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 20:03:37');
INSERT INTO `coin_info` VALUES (92, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 20:03:37');
INSERT INTO `coin_info` VALUES (93, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-26 20:04:42');
INSERT INTO `coin_info` VALUES (155, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 00:09:59');
INSERT INTO `coin_info` VALUES (156, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 00:09:59');
INSERT INTO `coin_info` VALUES (157, 'ociWS6j17km6QToj5dcoy1kNB8YA', 1111, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 12:54:30');
INSERT INTO `coin_info` VALUES (158, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 4, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 17:39:22');
INSERT INTO `coin_info` VALUES (161, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:24:39');
INSERT INTO `coin_info` VALUES (162, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:24:50');
INSERT INTO `coin_info` VALUES (163, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:24:50');
INSERT INTO `coin_info` VALUES (164, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:24:59');
INSERT INTO `coin_info` VALUES (165, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:24:59');
INSERT INTO `coin_info` VALUES (166, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:24:59');
INSERT INTO `coin_info` VALUES (167, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:25:10');
INSERT INTO `coin_info` VALUES (168, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:25:10');
INSERT INTO `coin_info` VALUES (169, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:25:10');
INSERT INTO `coin_info` VALUES (170, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:25:10');
INSERT INTO `coin_info` VALUES (171, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:21');
INSERT INTO `coin_info` VALUES (172, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:22');
INSERT INTO `coin_info` VALUES (173, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:22');
INSERT INTO `coin_info` VALUES (174, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:22');
INSERT INTO `coin_info` VALUES (175, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:22');
INSERT INTO `coin_info` VALUES (176, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:49');
INSERT INTO `coin_info` VALUES (177, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:49');
INSERT INTO `coin_info` VALUES (178, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:49');
INSERT INTO `coin_info` VALUES (179, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:49');
INSERT INTO `coin_info` VALUES (180, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:49');
INSERT INTO `coin_info` VALUES (181, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:26:49');
INSERT INTO `coin_info` VALUES (182, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 4, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:33:33');
INSERT INTO `coin_info` VALUES (183, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 4, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:33:33');
INSERT INTO `coin_info` VALUES (184, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:34:22');
INSERT INTO `coin_info` VALUES (185, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:34:29');
INSERT INTO `coin_info` VALUES (186, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:34:29');
INSERT INTO `coin_info` VALUES (187, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:44:19');
INSERT INTO `coin_info` VALUES (188, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:44:27');
INSERT INTO `coin_info` VALUES (189, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:44:31');
INSERT INTO `coin_info` VALUES (190, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:44:37');
INSERT INTO `coin_info` VALUES (191, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 4, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:44:44');
INSERT INTO `coin_info` VALUES (192, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:44:51');
INSERT INTO `coin_info` VALUES (193, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 4, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:45:01');
INSERT INTO `coin_info` VALUES (194, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:45:15');
INSERT INTO `coin_info` VALUES (195, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 19:45:27');
INSERT INTO `coin_info` VALUES (196, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 111, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 20:38:45');
INSERT INTO `coin_info` VALUES (197, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 20:41:45');
INSERT INTO `coin_info` VALUES (198, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 20:46:11');
INSERT INTO `coin_info` VALUES (199, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 20:47:57');
INSERT INTO `coin_info` VALUES (200, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 20:50:09');
INSERT INTO `coin_info` VALUES (201, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 20:52:25');
INSERT INTO `coin_info` VALUES (202, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-27 20:55:11');
INSERT INTO `coin_info` VALUES (212, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 12:33:15');
INSERT INTO `coin_info` VALUES (215, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 12:43:42');
INSERT INTO `coin_info` VALUES (218, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:43:37');
INSERT INTO `coin_info` VALUES (221, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:44:13');
INSERT INTO `coin_info` VALUES (224, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:50:04');
INSERT INTO `coin_info` VALUES (227, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:52:56');
INSERT INTO `coin_info` VALUES (230, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:53:09');
INSERT INTO `coin_info` VALUES (233, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:57:40');
INSERT INTO `coin_info` VALUES (236, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:58:15');
INSERT INTO `coin_info` VALUES (239, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:58:27');
INSERT INTO `coin_info` VALUES (242, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:58:46');
INSERT INTO `coin_info` VALUES (245, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 13:59:45');
INSERT INTO `coin_info` VALUES (248, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:00:21');
INSERT INTO `coin_info` VALUES (251, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:00:38');
INSERT INTO `coin_info` VALUES (252, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:07:21');
INSERT INTO `coin_info` VALUES (253, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:07:21');
INSERT INTO `coin_info` VALUES (259, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:38:15');
INSERT INTO `coin_info` VALUES (262, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:38:28');
INSERT INTO `coin_info` VALUES (265, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:38:53');
INSERT INTO `coin_info` VALUES (268, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:51:18');
INSERT INTO `coin_info` VALUES (271, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:51:28');
INSERT INTO `coin_info` VALUES (274, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:51:35');
INSERT INTO `coin_info` VALUES (277, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:51:42');
INSERT INTO `coin_info` VALUES (280, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:53:20');
INSERT INTO `coin_info` VALUES (283, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:53:28');
INSERT INTO `coin_info` VALUES (286, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:53:36');
INSERT INTO `coin_info` VALUES (289, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 14:53:44');
INSERT INTO `coin_info` VALUES (292, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:03:44');
INSERT INTO `coin_info` VALUES (295, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:03:52');
INSERT INTO `coin_info` VALUES (298, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:04:00');
INSERT INTO `coin_info` VALUES (301, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:04:07');
INSERT INTO `coin_info` VALUES (304, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:04:15');
INSERT INTO `coin_info` VALUES (307, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:04:36');
INSERT INTO `coin_info` VALUES (310, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:05:00');
INSERT INTO `coin_info` VALUES (313, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:05:07');
INSERT INTO `coin_info` VALUES (316, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:22:40');
INSERT INTO `coin_info` VALUES (319, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:22:51');
INSERT INTO `coin_info` VALUES (320, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:35:00');
INSERT INTO `coin_info` VALUES (323, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:46:26');
INSERT INTO `coin_info` VALUES (326, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:52:45');
INSERT INTO `coin_info` VALUES (329, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:54:02');
INSERT INTO `coin_info` VALUES (332, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 15:54:12');
INSERT INTO `coin_info` VALUES (342, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 16:09:15');
INSERT INTO `coin_info` VALUES (345, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 16:28:10');
INSERT INTO `coin_info` VALUES (347, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1000, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:32:29');
INSERT INTO `coin_info` VALUES (349, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:33:00');
INSERT INTO `coin_info` VALUES (351, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:33:15');
INSERT INTO `coin_info` VALUES (353, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:35:07');
INSERT INTO `coin_info` VALUES (355, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:35:13');
INSERT INTO `coin_info` VALUES (357, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:35:57');
INSERT INTO `coin_info` VALUES (359, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:36:05');
INSERT INTO `coin_info` VALUES (361, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:36:13');
INSERT INTO `coin_info` VALUES (363, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:36:28');
INSERT INTO `coin_info` VALUES (365, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:36:35');
INSERT INTO `coin_info` VALUES (367, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:36:42');
INSERT INTO `coin_info` VALUES (369, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:36:55');
INSERT INTO `coin_info` VALUES (371, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:04');
INSERT INTO `coin_info` VALUES (373, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:13');
INSERT INTO `coin_info` VALUES (375, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:18');
INSERT INTO `coin_info` VALUES (377, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:25');
INSERT INTO `coin_info` VALUES (379, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:30');
INSERT INTO `coin_info` VALUES (381, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:36');
INSERT INTO `coin_info` VALUES (383, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:41');
INSERT INTO `coin_info` VALUES (385, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:47');
INSERT INTO `coin_info` VALUES (387, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:52');
INSERT INTO `coin_info` VALUES (389, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:37:58');
INSERT INTO `coin_info` VALUES (391, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:05');
INSERT INTO `coin_info` VALUES (393, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:08');
INSERT INTO `coin_info` VALUES (395, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:15');
INSERT INTO `coin_info` VALUES (397, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:19');
INSERT INTO `coin_info` VALUES (399, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:24');
INSERT INTO `coin_info` VALUES (401, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:31');
INSERT INTO `coin_info` VALUES (403, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:38');
INSERT INTO `coin_info` VALUES (405, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:38:42');
INSERT INTO `coin_info` VALUES (407, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:39:11');
INSERT INTO `coin_info` VALUES (409, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:39:20');
INSERT INTO `coin_info` VALUES (411, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:39:25');
INSERT INTO `coin_info` VALUES (413, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:39:31');
INSERT INTO `coin_info` VALUES (415, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:39:35');
INSERT INTO `coin_info` VALUES (417, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:39:40');
INSERT INTO `coin_info` VALUES (419, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:42:18');
INSERT INTO `coin_info` VALUES (421, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:42:24');
INSERT INTO `coin_info` VALUES (423, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:43:26');
INSERT INTO `coin_info` VALUES (425, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:43:33');
INSERT INTO `coin_info` VALUES (427, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:43:39');
INSERT INTO `coin_info` VALUES (429, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 18:50:15');
INSERT INTO `coin_info` VALUES (431, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:00:20');
INSERT INTO `coin_info` VALUES (433, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:01:29');
INSERT INTO `coin_info` VALUES (435, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:01:42');
INSERT INTO `coin_info` VALUES (437, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:18:52');
INSERT INTO `coin_info` VALUES (439, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:19:33');
INSERT INTO `coin_info` VALUES (441, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 40, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:20:08');
INSERT INTO `coin_info` VALUES (443, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:27:27');
INSERT INTO `coin_info` VALUES (445, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:44:32');
INSERT INTO `coin_info` VALUES (447, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 19:52:59');
INSERT INTO `coin_info` VALUES (451, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 20:12:06');
INSERT INTO `coin_info` VALUES (453, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 20:12:28');
INSERT INTO `coin_info` VALUES (460, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 20:29:31');
INSERT INTO `coin_info` VALUES (462, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 20:41:11');
INSERT INTO `coin_info` VALUES (464, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 20:41:21');
INSERT INTO `coin_info` VALUES (466, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 20:44:06');
INSERT INTO `coin_info` VALUES (470, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:03:32');
INSERT INTO `coin_info` VALUES (478, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:25:27');
INSERT INTO `coin_info` VALUES (480, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:27:35');
INSERT INTO `coin_info` VALUES (482, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:27:56');
INSERT INTO `coin_info` VALUES (484, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:28:25');
INSERT INTO `coin_info` VALUES (486, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:29:04');
INSERT INTO `coin_info` VALUES (488, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:29:27');
INSERT INTO `coin_info` VALUES (490, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:29:59');
INSERT INTO `coin_info` VALUES (492, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:30:39');
INSERT INTO `coin_info` VALUES (494, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:45:23');
INSERT INTO `coin_info` VALUES (496, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:45:52');
INSERT INTO `coin_info` VALUES (498, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:46:30');
INSERT INTO `coin_info` VALUES (500, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 40, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:47:25');
INSERT INTO `coin_info` VALUES (502, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:47:59');
INSERT INTO `coin_info` VALUES (504, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:48:15');
INSERT INTO `coin_info` VALUES (506, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:48:43');
INSERT INTO `coin_info` VALUES (508, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:50:03');
INSERT INTO `coin_info` VALUES (510, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:50:10');
INSERT INTO `coin_info` VALUES (512, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:50:36');
INSERT INTO `coin_info` VALUES (514, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:50:45');
INSERT INTO `coin_info` VALUES (516, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:51:18');
INSERT INTO `coin_info` VALUES (518, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:51:42');
INSERT INTO `coin_info` VALUES (520, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:51:49');
INSERT INTO `coin_info` VALUES (522, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:51:58');
INSERT INTO `coin_info` VALUES (524, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:52:21');
INSERT INTO `coin_info` VALUES (526, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:52:46');
INSERT INTO `coin_info` VALUES (528, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:54:11');
INSERT INTO `coin_info` VALUES (532, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:58:41');
INSERT INTO `coin_info` VALUES (534, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:59:13');
INSERT INTO `coin_info` VALUES (536, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:59:24');
INSERT INTO `coin_info` VALUES (538, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 21:59:32');
INSERT INTO `coin_info` VALUES (540, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:00:07');
INSERT INTO `coin_info` VALUES (542, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:00:17');
INSERT INTO `coin_info` VALUES (544, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:00:23');
INSERT INTO `coin_info` VALUES (546, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:00:42');
INSERT INTO `coin_info` VALUES (548, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:04:18');
INSERT INTO `coin_info` VALUES (550, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:04:38');
INSERT INTO `coin_info` VALUES (552, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:04:48');
INSERT INTO `coin_info` VALUES (554, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:05:30');
INSERT INTO `coin_info` VALUES (556, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:05:39');
INSERT INTO `coin_info` VALUES (558, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:05:46');
INSERT INTO `coin_info` VALUES (560, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:05:52');
INSERT INTO `coin_info` VALUES (562, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:06:01');
INSERT INTO `coin_info` VALUES (564, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:06:29');
INSERT INTO `coin_info` VALUES (566, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:06:36');
INSERT INTO `coin_info` VALUES (568, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:06:43');
INSERT INTO `coin_info` VALUES (570, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:08:50');
INSERT INTO `coin_info` VALUES (572, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 40, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:09:37');
INSERT INTO `coin_info` VALUES (574, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 40, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:09:45');
INSERT INTO `coin_info` VALUES (576, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 40, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:09:52');
INSERT INTO `coin_info` VALUES (578, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:10:27');
INSERT INTO `coin_info` VALUES (580, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:10:38');
INSERT INTO `coin_info` VALUES (582, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:10:46');
INSERT INTO `coin_info` VALUES (584, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:11:08');
INSERT INTO `coin_info` VALUES (586, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:11:28');
INSERT INTO `coin_info` VALUES (588, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:11:50');
INSERT INTO `coin_info` VALUES (590, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:11:58');
INSERT INTO `coin_info` VALUES (592, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:18:24');
INSERT INTO `coin_info` VALUES (594, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:18:31');
INSERT INTO `coin_info` VALUES (596, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:18:39');
INSERT INTO `coin_info` VALUES (598, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:19:24');
INSERT INTO `coin_info` VALUES (600, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:19:30');
INSERT INTO `coin_info` VALUES (602, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:19:44');
INSERT INTO `coin_info` VALUES (604, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:21:07');
INSERT INTO `coin_info` VALUES (606, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:21:13');
INSERT INTO `coin_info` VALUES (608, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:31:20');
INSERT INTO `coin_info` VALUES (610, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:31:54');
INSERT INTO `coin_info` VALUES (612, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:32:03');
INSERT INTO `coin_info` VALUES (614, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:32:11');
INSERT INTO `coin_info` VALUES (616, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:32:31');
INSERT INTO `coin_info` VALUES (621, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 80, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:35:39');
INSERT INTO `coin_info` VALUES (624, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:35:49');
INSERT INTO `coin_info` VALUES (627, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:35:58');
INSERT INTO `coin_info` VALUES (630, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:36:07');
INSERT INTO `coin_info` VALUES (633, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:36:11');
INSERT INTO `coin_info` VALUES (636, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:39:05');
INSERT INTO `coin_info` VALUES (639, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:39:11');
INSERT INTO `coin_info` VALUES (642, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:41:51');
INSERT INTO `coin_info` VALUES (645, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:41:56');
INSERT INTO `coin_info` VALUES (648, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:42:06');
INSERT INTO `coin_info` VALUES (651, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-28 22:42:16');
INSERT INTO `coin_info` VALUES (654, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 00:12:26');
INSERT INTO `coin_info` VALUES (655, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '0', '恭喜获得100金币', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 00:13:00');
INSERT INTO `coin_info` VALUES (656, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '0', '恭喜获得100金币', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 00:15:44');
INSERT INTO `coin_info` VALUES (659, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 00:33:07');
INSERT INTO `coin_info` VALUES (660, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 00:33:07');
INSERT INTO `coin_info` VALUES (663, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 10:10:44');
INSERT INTO `coin_info` VALUES (666, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 10:10:51');
INSERT INTO `coin_info` VALUES (669, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 10:11:27');
INSERT INTO `coin_info` VALUES (670, 'ociWS6jH_wjSOXxF0norcSBsFke8', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 13:22:32');
INSERT INTO `coin_info` VALUES (671, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-29 14:55:24');
INSERT INTO `coin_info` VALUES (673, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-30 14:50:07');
INSERT INTO `coin_info` VALUES (674, 'ociWS6j17km6QToj5dcoy1kNB8YA', 1, '0', '领取红包', 1, NULL, NULL, NULL, NULL, 0, '2023-03-30 16:42:52');
INSERT INTO `coin_info` VALUES (675, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-30 16:42:52');
INSERT INTO `coin_info` VALUES (676, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-30 17:28:06');
INSERT INTO `coin_info` VALUES (677, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-30 17:28:10');
INSERT INTO `coin_info` VALUES (678, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '0', '红包奖励', 1, NULL, NULL, NULL, NULL, 0, '2023-03-30 17:52:21');
INSERT INTO `coin_info` VALUES (679, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '0', '红包奖励', 2, NULL, NULL, NULL, NULL, 0, '2023-03-30 18:36:41');
INSERT INTO `coin_info` VALUES (680, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '0', '红包奖励', 7, NULL, NULL, NULL, NULL, 0, '2023-03-30 18:43:30');
INSERT INTO `coin_info` VALUES (681, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 8, NULL, NULL, NULL, NULL, 0, '2023-03-30 18:45:14');
INSERT INTO `coin_info` VALUES (682, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 8, NULL, NULL, NULL, NULL, 0, '2023-03-30 18:46:21');
INSERT INTO `coin_info` VALUES (683, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 8, NULL, NULL, NULL, NULL, 0, '2023-03-30 18:46:57');
INSERT INTO `coin_info` VALUES (684, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50, '0', '红包奖励', 9, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:01:03');
INSERT INTO `coin_info` VALUES (685, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50, '0', '红包奖励', 9, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:01:06');
INSERT INTO `coin_info` VALUES (686, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50, '0', '红包奖励', 9, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:01:13');
INSERT INTO `coin_info` VALUES (687, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '0', '红包奖励', 13, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:03:01');
INSERT INTO `coin_info` VALUES (688, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 10, '0', '红包奖励', 14, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:03:20');
INSERT INTO `coin_info` VALUES (689, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 17, '0', '红包奖励', 15, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:05:34');
INSERT INTO `coin_info` VALUES (690, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 111, '0', '红包奖励', 16, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:41:00');
INSERT INTO `coin_info` VALUES (691, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 22, '0', '红包奖励', 17, NULL, NULL, NULL, NULL, 0, '2023-03-30 19:51:20');
INSERT INTO `coin_info` VALUES (692, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 11, '0', '红包奖励', 21, NULL, NULL, NULL, NULL, 0, '2023-03-31 09:39:12');
INSERT INTO `coin_info` VALUES (693, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 11, '0', '红包奖励', 18, NULL, NULL, NULL, NULL, 0, '2023-03-31 11:51:46');
INSERT INTO `coin_info` VALUES (694, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1111111, '0', '红包奖励', 20, NULL, NULL, NULL, NULL, 0, '2023-03-31 11:52:51');
INSERT INTO `coin_info` VALUES (695, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-03-31 13:14:37');
INSERT INTO `coin_info` VALUES (698, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-01 16:32:25');
INSERT INTO `coin_info` VALUES (699, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-01 20:43:14');
INSERT INTO `coin_info` VALUES (700, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-01 20:43:21');
INSERT INTO `coin_info` VALUES (701, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100000, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-01 20:44:01');
INSERT INTO `coin_info` VALUES (708, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 13:08:27');
INSERT INTO `coin_info` VALUES (709, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 13:22:18');
INSERT INTO `coin_info` VALUES (712, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 13:24:01');
INSERT INTO `coin_info` VALUES (713, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 16:19:13');
INSERT INTO `coin_info` VALUES (714, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 188, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 16:19:22');
INSERT INTO `coin_info` VALUES (715, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 16:52:54');
INSERT INTO `coin_info` VALUES (716, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 288, '0', '累计签到7天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 16:52:59');
INSERT INTO `coin_info` VALUES (729, 'ociWS6jH_wjSOXxF0norcSBsFke8', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-02 17:35:10');
INSERT INTO `coin_info` VALUES (739, 'ociWS6jH_wjSOXxF0norcSBsFke8', 50, '0', '红包奖励', 9, NULL, NULL, NULL, NULL, 0, '2023-04-02 19:24:12');
INSERT INTO `coin_info` VALUES (740, 'ociWS6jH_wjSOXxF0norcSBsFke8', 10, '0', '红包奖励', 14, NULL, NULL, NULL, NULL, 0, '2023-04-02 19:24:13');
INSERT INTO `coin_info` VALUES (741, 'ociWS6jH_wjSOXxF0norcSBsFke8', 11, '0', '红包奖励', 15, NULL, NULL, NULL, NULL, 0, '2023-04-02 19:24:14');
INSERT INTO `coin_info` VALUES (742, 'ociWS6jH_wjSOXxF0norcSBsFke8', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:46:14');
INSERT INTO `coin_info` VALUES (745, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:13');
INSERT INTO `coin_info` VALUES (746, 'ociWS6j17km6QToj5dcoy1kNB8YA', 1, '0', '红包奖励', 1, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:24');
INSERT INTO `coin_info` VALUES (747, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:24');
INSERT INTO `coin_info` VALUES (748, 'ociWS6j17km6QToj5dcoy1kNB8YA', 1, '0', '红包奖励', 2, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:26');
INSERT INTO `coin_info` VALUES (749, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:26');
INSERT INTO `coin_info` VALUES (750, 'ociWS6j17km6QToj5dcoy1kNB8YA', 2, '0', '红包奖励', 7, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:27');
INSERT INTO `coin_info` VALUES (751, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:27');
INSERT INTO `coin_info` VALUES (752, 'ociWS6j17km6QToj5dcoy1kNB8YA', 111, '0', '红包奖励', 16, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:30');
INSERT INTO `coin_info` VALUES (753, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 11, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:30');
INSERT INTO `coin_info` VALUES (754, 'ociWS6j17km6QToj5dcoy1kNB8YA', 11, '0', '红包奖励', 18, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:32');
INSERT INTO `coin_info` VALUES (755, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:32');
INSERT INTO `coin_info` VALUES (756, 'ociWS6j17km6QToj5dcoy1kNB8YA', 44, '0', '红包奖励', 25, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:35');
INSERT INTO `coin_info` VALUES (757, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 4, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:35');
INSERT INTO `coin_info` VALUES (758, 'ociWS6j17km6QToj5dcoy1kNB8YA', 1111111, '0', '红包奖励', 20, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:36');
INSERT INTO `coin_info` VALUES (759, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 111111, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:36');
INSERT INTO `coin_info` VALUES (760, 'ociWS6j17km6QToj5dcoy1kNB8YA', 11, '0', '红包奖励', 21, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:38');
INSERT INTO `coin_info` VALUES (761, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:38');
INSERT INTO `coin_info` VALUES (763, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:49:39');
INSERT INTO `coin_info` VALUES (764, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 15:57:10');
INSERT INTO `coin_info` VALUES (765, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 22, NULL, NULL, NULL, NULL, 0, '2023-04-03 16:04:13');
INSERT INTO `coin_info` VALUES (822, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 17:47:02');
INSERT INTO `coin_info` VALUES (824, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 17:59:45');
INSERT INTO `coin_info` VALUES (826, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 18:02:10');
INSERT INTO `coin_info` VALUES (827, 'ociWS6j17km6QToj5dcoy1kNB8YA', 11, '0', '红包奖励', 22, NULL, NULL, NULL, NULL, 0, '2023-04-03 18:05:23');
INSERT INTO `coin_info` VALUES (828, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 18:05:23');
INSERT INTO `coin_info` VALUES (829, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 18:14:18');
INSERT INTO `coin_info` VALUES (830, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 13, '0', '红包奖励', 22, NULL, NULL, NULL, NULL, 0, '2023-04-03 18:14:21');
INSERT INTO `coin_info` VALUES (831, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 13, '0', '红包奖励', 22, NULL, NULL, NULL, NULL, 0, '2023-04-03 18:17:02');
INSERT INTO `coin_info` VALUES (834, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 1, '0', '红包奖励', 1, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:15:54');
INSERT INTO `coin_info` VALUES (835, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 2, '0', '红包奖励', 7, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:15:56');
INSERT INTO `coin_info` VALUES (836, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '0', '红包奖励', 8, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:15:57');
INSERT INTO `coin_info` VALUES (837, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 50, '0', '红包奖励', 9, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:15:59');
INSERT INTO `coin_info` VALUES (838, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 18, '0', '红包奖励', 15, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:16:00');
INSERT INTO `coin_info` VALUES (839, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 1, '0', '红包奖励', 2, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:16:16');
INSERT INTO `coin_info` VALUES (840, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 11, '0', '红包奖励', 18, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:32:47');
INSERT INTO `coin_info` VALUES (841, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 10, '0', '红包奖励', 14, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:35:09');
INSERT INTO `coin_info` VALUES (842, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:48:08');
INSERT INTO `coin_info` VALUES (843, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:48:33');
INSERT INTO `coin_info` VALUES (844, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:48:39');
INSERT INTO `coin_info` VALUES (845, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:48:43');
INSERT INTO `coin_info` VALUES (846, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:48:49');
INSERT INTO `coin_info` VALUES (847, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:48:53');
INSERT INTO `coin_info` VALUES (848, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 78, '0', '红包奖励', 26, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:54:02');
INSERT INTO `coin_info` VALUES (849, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 21:55:50');
INSERT INTO `coin_info` VALUES (850, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 68, '0', '红包奖励', 26, NULL, NULL, NULL, NULL, 0, '2023-04-03 22:05:41');
INSERT INTO `coin_info` VALUES (851, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 157, '0', '红包奖励', 27, NULL, NULL, NULL, NULL, 0, '2023-04-03 22:08:13');
INSERT INTO `coin_info` VALUES (852, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 169, '0', '红包奖励', 27, NULL, NULL, NULL, NULL, 0, '2023-04-03 22:10:37');
INSERT INTO `coin_info` VALUES (853, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 22:18:52');
INSERT INTO `coin_info` VALUES (854, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 22:19:00');
INSERT INTO `coin_info` VALUES (855, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 22:19:04');
INSERT INTO `coin_info` VALUES (856, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 22:19:05');
INSERT INTO `coin_info` VALUES (857, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '绑定身份证', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-03 23:14:11');
INSERT INTO `coin_info` VALUES (858, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 95800, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 10:42:33');
INSERT INTO `coin_info` VALUES (859, 'ociWS6j17km6QToj5dcoy1kNB8YA', 888, '0', '红包奖励', 27, NULL, NULL, NULL, NULL, 0, '2023-04-04 10:48:16');
INSERT INTO `coin_info` VALUES (860, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 89, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 10:48:16');
INSERT INTO `coin_info` VALUES (861, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 15:25:32');
INSERT INTO `coin_info` VALUES (862, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 15:25:32');
INSERT INTO `coin_info` VALUES (863, 'ociWS6j17km6QToj5dcoy1kNB8YA', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 16:09:33');
INSERT INTO `coin_info` VALUES (864, 'ociWS6j17km6QToj5dcoy1kNB8YA', 200, '1', '兑换余额', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 16:11:26');
INSERT INTO `coin_info` VALUES (867, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 17:54:39');
INSERT INTO `coin_info` VALUES (870, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 40, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 17:54:58');
INSERT INTO `coin_info` VALUES (873, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 17:56:06');
INSERT INTO `coin_info` VALUES (876, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 5, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 17:56:17');
INSERT INTO `coin_info` VALUES (879, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 17:57:52');
INSERT INTO `coin_info` VALUES (882, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 17:59:28');
INSERT INTO `coin_info` VALUES (885, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 60, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 18:01:12');
INSERT INTO `coin_info` VALUES (888, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 70, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 18:01:33');
INSERT INTO `coin_info` VALUES (929, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '0', '实名认证', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 20:03:43');
INSERT INTO `coin_info` VALUES (930, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-04 20:04:39');
INSERT INTO `coin_info` VALUES (931, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-05 12:53:17');
INSERT INTO `coin_info` VALUES (932, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-05 12:53:45');
INSERT INTO `coin_info` VALUES (933, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 2, 0, '2023-04-05 12:54:06');
INSERT INTO `coin_info` VALUES (934, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 2, 0, '2023-04-05 12:56:13');
INSERT INTO `coin_info` VALUES (935, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '绑定手机', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-05 14:45:52');
INSERT INTO `coin_info` VALUES (936, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-05 15:12:05');
INSERT INTO `coin_info` VALUES (943, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 161, '0', '红包奖励', 29, NULL, NULL, NULL, NULL, 0, '2023-04-05 17:56:55');
INSERT INTO `coin_info` VALUES (944, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-05 18:04:09');
INSERT INTO `coin_info` VALUES (945, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-05 18:12:21');
INSERT INTO `coin_info` VALUES (946, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 138, '0', '红包奖励', 29, NULL, NULL, NULL, NULL, 0, '2023-04-05 18:19:10');
INSERT INTO `coin_info` VALUES (947, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-05 18:19:26');
INSERT INTO `coin_info` VALUES (954, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 118, '0', '红包奖励', 29, NULL, NULL, NULL, NULL, 0, '2023-04-05 18:41:04');
INSERT INTO `coin_info` VALUES (955, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 190, '0', '红包奖励', 28, NULL, NULL, NULL, NULL, 0, '2023-04-05 19:21:35');
INSERT INTO `coin_info` VALUES (956, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-06 08:54:34');
INSERT INTO `coin_info` VALUES (957, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 9999999999, '1', '比赛竞猜', NULL, 2, NULL, NULL, 2, 0, '2023-04-06 09:18:46');
INSERT INTO `coin_info` VALUES (958, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 9999999999, '0', '测试', 0, NULL, NULL, NULL, NULL, 0, '2023-04-06 09:41:00');
INSERT INTO `coin_info` VALUES (959, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-06 09:41:53');
INSERT INTO `coin_info` VALUES (960, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 10000000, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-06 10:34:40');
INSERT INTO `coin_info` VALUES (961, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-06 10:35:58');
INSERT INTO `coin_info` VALUES (962, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-06 10:39:20');
INSERT INTO `coin_info` VALUES (963, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-06 10:41:45');
INSERT INTO `coin_info` VALUES (964, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-06 10:45:29');
INSERT INTO `coin_info` VALUES (965, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '比赛竞猜', NULL, 2, NULL, NULL, 2, 0, '2023-04-06 10:57:55');
INSERT INTO `coin_info` VALUES (966, 'ociWS6j17km6QToj5dcoy1kNB8YA', 200, '0', '签到', 0, NULL, NULL, NULL, NULL, 0, '2023-04-06 11:53:36');
INSERT INTO `coin_info` VALUES (967, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-06 11:53:36');
INSERT INTO `coin_info` VALUES (968, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '竞猜奖励', 0, 2, NULL, NULL, NULL, 0, '2023-04-06 12:08:32');
INSERT INTO `coin_info` VALUES (969, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '竞猜奖励', 0, 2, NULL, NULL, NULL, 0, '2023-04-06 12:08:52');
INSERT INTO `coin_info` VALUES (974, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 31, NULL, NULL, NULL, NULL, 0, '2023-04-06 18:05:12');
INSERT INTO `coin_info` VALUES (975, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 31, NULL, NULL, NULL, NULL, 0, '2023-04-06 18:27:01');
INSERT INTO `coin_info` VALUES (976, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 31, NULL, NULL, NULL, NULL, 0, '2023-04-06 18:27:08');
INSERT INTO `coin_info` VALUES (977, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 31, NULL, NULL, NULL, NULL, 0, '2023-04-06 18:27:10');
INSERT INTO `coin_info` VALUES (978, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 111, '0', '红包奖励', 28, NULL, NULL, NULL, NULL, 0, '2023-04-06 18:33:33');
INSERT INTO `coin_info` VALUES (979, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 300, '0', '红包奖励', 32, NULL, NULL, NULL, NULL, 0, '2023-04-06 19:42:30');
INSERT INTO `coin_info` VALUES (980, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 182, '0', '红包奖励', 33, NULL, NULL, NULL, NULL, 0, '2023-04-06 22:43:44');
INSERT INTO `coin_info` VALUES (981, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 111, '0', '红包奖励', 34, NULL, NULL, NULL, NULL, 0, '2023-04-06 22:52:22');
INSERT INTO `coin_info` VALUES (982, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-07 03:56:08');
INSERT INTO `coin_info` VALUES (983, 'ociWS6tg9QIyLgxa8i5yCtdPV-yI', 100, '0', '实名认证', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-07 04:07:03');
INSERT INTO `coin_info` VALUES (984, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 888, '0', '红包奖励', 36, NULL, NULL, NULL, NULL, 0, '2023-04-07 04:10:55');
INSERT INTO `coin_info` VALUES (985, 'ociWS6tg9QIyLgxa8i5yCtdPV-yI', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-07 05:08:30');
INSERT INTO `coin_info` VALUES (986, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 888, '0', '红包奖励', 36, NULL, NULL, NULL, NULL, 0, '2023-04-07 08:49:15');
INSERT INTO `coin_info` VALUES (987, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 13, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-07 14:08:39');
INSERT INTO `coin_info` VALUES (988, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 11, '0', '红包奖励', 38, NULL, NULL, NULL, NULL, 0, '2023-04-07 14:45:08');
INSERT INTO `coin_info` VALUES (1008, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '实物抽奖', 0, NULL, NULL, '键盘', NULL, 1, '2023-04-07 20:03:16');
INSERT INTO `coin_info` VALUES (1011, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-07 21:06:41');
INSERT INTO `coin_info` VALUES (1012, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 200, '1', '比赛竞猜', NULL, 2, NULL, NULL, 1, 0, '2023-04-07 21:07:20');
INSERT INTO `coin_info` VALUES (1013, 'ociWS6jH_wjSOXxF0norcSBsFke8', 888, '0', '红包奖励', 36, NULL, NULL, NULL, NULL, 0, '2023-04-07 21:27:40');
INSERT INTO `coin_info` VALUES (1014, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 37, NULL, NULL, NULL, NULL, 0, '2023-04-07 22:37:47');
INSERT INTO `coin_info` VALUES (1015, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 39, NULL, NULL, NULL, NULL, 0, '2023-04-07 23:02:23');
INSERT INTO `coin_info` VALUES (1016, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 40, NULL, NULL, NULL, NULL, 0, '2023-04-07 23:06:33');
INSERT INTO `coin_info` VALUES (1017, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-08 00:15:41');
INSERT INTO `coin_info` VALUES (1018, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', -7, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-08 00:18:38');
INSERT INTO `coin_info` VALUES (1019, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 152, '0', '红包奖励', 41, NULL, NULL, NULL, NULL, 0, '2023-04-08 00:30:35');
INSERT INTO `coin_info` VALUES (1020, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 14, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 00:05:52');
INSERT INTO `coin_info` VALUES (1021, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 6, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 00:19:02');
INSERT INTO `coin_info` VALUES (1022, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 268, '0', '累计签到7天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 00:19:11');
INSERT INTO `coin_info` VALUES (1023, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 09:06:13');
INSERT INTO `coin_info` VALUES (1024, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 09:06:13');
INSERT INTO `coin_info` VALUES (1025, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 09:06:33');
INSERT INTO `coin_info` VALUES (1026, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '0', '红包奖励', 41, NULL, NULL, NULL, NULL, 0, '2023-04-09 09:08:00');
INSERT INTO `coin_info` VALUES (1027, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 768, '0', '红包奖励', 36, NULL, NULL, NULL, NULL, 0, '2023-04-09 10:25:07');
INSERT INTO `coin_info` VALUES (1028, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 36, NULL, NULL, NULL, NULL, 0, '2023-04-09 10:34:06');
INSERT INTO `coin_info` VALUES (1029, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-09 10:48:33');
INSERT INTO `coin_info` VALUES (1030, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 43, NULL, NULL, NULL, NULL, 0, '2023-04-09 13:26:04');
INSERT INTO `coin_info` VALUES (1031, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-09 13:34:35');
INSERT INTO `coin_info` VALUES (1032, 'ociWS6nV9F09A0JfGeCfvLPqbvr8', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 20:35:20');
INSERT INTO `coin_info` VALUES (1033, 'ociWS6nV9F09A0JfGeCfvLPqbvr8', 80, '0', '实名认证', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-09 20:35:59');
INSERT INTO `coin_info` VALUES (1034, 'ociWS6hE90h36YJqSzP6pA_zBJgM', 11, '0', '红包奖励', 38, NULL, NULL, NULL, NULL, 0, '2023-04-09 20:56:46');
INSERT INTO `coin_info` VALUES (1035, 'ociWS6hE90h36YJqSzP6pA_zBJgM', 77, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-09 20:56:48');
INSERT INTO `coin_info` VALUES (1036, 'ociWS6hE90h36YJqSzP6pA_zBJgM', -81, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-09 20:56:49');
INSERT INTO `coin_info` VALUES (1039, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 00:37:58');
INSERT INTO `coin_info` VALUES (1040, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 14, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 00:41:34');
INSERT INTO `coin_info` VALUES (1041, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', -13, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-10 00:43:02');
INSERT INTO `coin_info` VALUES (1042, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 99, '0', '红包奖励', 45, NULL, NULL, NULL, NULL, 0, '2023-04-10 00:43:31');
INSERT INTO `coin_info` VALUES (1043, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', -18, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-10 00:43:47');
INSERT INTO `coin_info` VALUES (1044, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 7, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:00');
INSERT INTO `coin_info` VALUES (1045, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:08');
INSERT INTO `coin_info` VALUES (1046, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:11');
INSERT INTO `coin_info` VALUES (1047, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:13');
INSERT INTO `coin_info` VALUES (1048, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 44, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:21');
INSERT INTO `coin_info` VALUES (1049, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 101, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:42');
INSERT INTO `coin_info` VALUES (1050, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '红包奖励', 45, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:45');
INSERT INTO `coin_info` VALUES (1051, 'ociWS6ki2ki7j5sv44DWiwhva9H4', -40, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:48');
INSERT INTO `coin_info` VALUES (1052, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:51');
INSERT INTO `coin_info` VALUES (1053, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:53');
INSERT INTO `coin_info` VALUES (1054, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-10 08:51:55');
INSERT INTO `coin_info` VALUES (1055, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-10 09:28:04');
INSERT INTO `coin_info` VALUES (1056, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 42, NULL, NULL, NULL, NULL, 0, '2023-04-10 09:35:28');
INSERT INTO `coin_info` VALUES (1057, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-10 09:50:32');
INSERT INTO `coin_info` VALUES (1058, 'ociWS6ki2ki7j5sv44DWiwhva9H4', -79, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-10 09:52:26');
INSERT INTO `coin_info` VALUES (1059, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', -88, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 13:27:23');
INSERT INTO `coin_info` VALUES (1060, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 6, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 14:54:03');
INSERT INTO `coin_info` VALUES (1061, 'ociWS6j17km6QToj5dcoy1kNB8YA', 170, '0', '测试', 0, NULL, NULL, NULL, NULL, 0, '2023-04-10 14:58:18');
INSERT INTO `coin_info` VALUES (1062, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 14:58:18');
INSERT INTO `coin_info` VALUES (1063, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '比赛竞猜', NULL, 3, NULL, NULL, 1, 0, '2023-04-10 15:05:56');
INSERT INTO `coin_info` VALUES (1064, 'ociWS6j17km6QToj5dcoy1kNB8YA', 30, '0', '测试', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 15:06:27');
INSERT INTO `coin_info` VALUES (1065, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 3, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 15:06:27');
INSERT INTO `coin_info` VALUES (1066, 'ociWS6j17km6QToj5dcoy1kNB8YA', 0, '0', '测试', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 15:07:07');
INSERT INTO `coin_info` VALUES (1067, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 15:07:07');
INSERT INTO `coin_info` VALUES (1068, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 91, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 15:18:59');
INSERT INTO `coin_info` VALUES (1069, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '比赛竞猜', NULL, 3, NULL, NULL, 2, 0, '2023-04-10 15:55:52');
INSERT INTO `coin_info` VALUES (1070, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 15:57:36');
INSERT INTO `coin_info` VALUES (1076, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 171, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-10 17:45:40');
INSERT INTO `coin_info` VALUES (1077, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-10 17:45:58');
INSERT INTO `coin_info` VALUES (1078, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 17:57:09');
INSERT INTO `coin_info` VALUES (1080, 'ociWS6rBWGu91iaK-NbjGNbP7jLY', 200, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 18:07:20');
INSERT INTO `coin_info` VALUES (1081, 'ociWS6rBWGu91iaK-NbjGNbP7jLY', 0, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-10 18:07:53');
INSERT INTO `coin_info` VALUES (1082, 'ociWS6rBWGu91iaK-NbjGNbP7jLY', 0, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-10 18:07:54');
INSERT INTO `coin_info` VALUES (1083, 'ociWS6rBWGu91iaK-NbjGNbP7jLY', 0, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-10 18:07:55');
INSERT INTO `coin_info` VALUES (1084, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, 'null', NULL, 0, '2023-04-10 18:14:21');
INSERT INTO `coin_info` VALUES (1085, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x6倍', NULL, 0, '2023-04-10 18:14:21');
INSERT INTO `coin_info` VALUES (1086, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 18:14:57');
INSERT INTO `coin_info` VALUES (1087, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 18:14:57');
INSERT INTO `coin_info` VALUES (1088, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 18:17:41');
INSERT INTO `coin_info` VALUES (1089, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 18:17:41');
INSERT INTO `coin_info` VALUES (1090, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 18:18:34');
INSERT INTO `coin_info` VALUES (1091, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 18:18:34');
INSERT INTO `coin_info` VALUES (1092, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 18:20:42');
INSERT INTO `coin_info` VALUES (1093, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 18:20:42');
INSERT INTO `coin_info` VALUES (1094, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 18:21:48');
INSERT INTO `coin_info` VALUES (1095, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x8倍', NULL, 0, '2023-04-10 18:21:48');
INSERT INTO `coin_info` VALUES (1096, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 18:23:06');
INSERT INTO `coin_info` VALUES (1097, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 18:23:06');
INSERT INTO `coin_info` VALUES (1098, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 18:23:33');
INSERT INTO `coin_info` VALUES (1099, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 18:23:33');
INSERT INTO `coin_info` VALUES (1100, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-10 18:25:44');
INSERT INTO `coin_info` VALUES (1102, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 20:17:29');
INSERT INTO `coin_info` VALUES (1103, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '100金币', NULL, 0, '2023-04-10 20:17:29');
INSERT INTO `coin_info` VALUES (1104, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 20:18:33');
INSERT INTO `coin_info` VALUES (1105, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '键盘', NULL, 1, '2023-04-10 20:18:33');
INSERT INTO `coin_info` VALUES (1106, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 20:21:14');
INSERT INTO `coin_info` VALUES (1107, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '100金币', NULL, 0, '2023-04-10 20:21:14');
INSERT INTO `coin_info` VALUES (1108, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 20:22:44');
INSERT INTO `coin_info` VALUES (1109, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '100金币', NULL, 0, '2023-04-10 20:22:44');
INSERT INTO `coin_info` VALUES (1110, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 20:23:09');
INSERT INTO `coin_info` VALUES (1111, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '100金币', NULL, 0, '2023-04-10 20:23:09');
INSERT INTO `coin_info` VALUES (1112, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-10 20:23:36');
INSERT INTO `coin_info` VALUES (1113, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-10 20:23:36');
INSERT INTO `coin_info` VALUES (1114, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-10 22:39:58');
INSERT INTO `coin_info` VALUES (1116, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-11 11:00:54');
INSERT INTO `coin_info` VALUES (1117, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-11 11:35:08');
INSERT INTO `coin_info` VALUES (1118, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '0', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-11 11:35:14');
INSERT INTO `coin_info` VALUES (1119, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-11 11:36:09');
INSERT INTO `coin_info` VALUES (1120, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-11 11:37:29');
INSERT INTO `coin_info` VALUES (1121, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 11:40:46');
INSERT INTO `coin_info` VALUES (1122, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x20倍', NULL, 0, '2023-04-11 11:40:46');
INSERT INTO `coin_info` VALUES (1123, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 11:42:46');
INSERT INTO `coin_info` VALUES (1124, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '实物抽奖', NULL, NULL, NULL, '1000金币', NULL, 0, '2023-04-11 11:42:46');
INSERT INTO `coin_info` VALUES (1125, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 11:44:49');
INSERT INTO `coin_info` VALUES (1126, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x5倍', NULL, 0, '2023-04-11 11:44:49');
INSERT INTO `coin_info` VALUES (1127, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:17:09');
INSERT INTO `coin_info` VALUES (1128, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:17:09');
INSERT INTO `coin_info` VALUES (1129, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:17:55');
INSERT INTO `coin_info` VALUES (1130, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:17:55');
INSERT INTO `coin_info` VALUES (1131, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:18:38');
INSERT INTO `coin_info` VALUES (1132, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:18:38');
INSERT INTO `coin_info` VALUES (1133, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:20:33');
INSERT INTO `coin_info` VALUES (1134, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:20:33');
INSERT INTO `coin_info` VALUES (1135, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:22:13');
INSERT INTO `coin_info` VALUES (1136, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 50, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:22:13');
INSERT INTO `coin_info` VALUES (1137, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:40:55');
INSERT INTO `coin_info` VALUES (1138, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 30, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:40:55');
INSERT INTO `coin_info` VALUES (1139, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:41:16');
INSERT INTO `coin_info` VALUES (1140, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:41:16');
INSERT INTO `coin_info` VALUES (1141, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:41:28');
INSERT INTO `coin_info` VALUES (1142, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:41:28');
INSERT INTO `coin_info` VALUES (1143, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:41:36');
INSERT INTO `coin_info` VALUES (1144, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:41:36');
INSERT INTO `coin_info` VALUES (1145, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:42:19');
INSERT INTO `coin_info` VALUES (1146, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:42:19');
INSERT INTO `coin_info` VALUES (1147, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:42:39');
INSERT INTO `coin_info` VALUES (1148, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x20倍', NULL, 0, '2023-04-11 12:42:39');
INSERT INTO `coin_info` VALUES (1149, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:43:04');
INSERT INTO `coin_info` VALUES (1150, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x0.5倍', NULL, 0, '2023-04-11 12:43:04');
INSERT INTO `coin_info` VALUES (1151, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x20倍', NULL, 0, '2023-04-11 12:43:43');
INSERT INTO `coin_info` VALUES (1152, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:43:43');
INSERT INTO `coin_info` VALUES (1153, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x20倍', NULL, 0, '2023-04-11 12:43:55');
INSERT INTO `coin_info` VALUES (1154, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 12:43:55');
INSERT INTO `coin_info` VALUES (1155, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:02:25');
INSERT INTO `coin_info` VALUES (1156, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '金币抽奖', NULL, NULL, NULL, 'x20倍', NULL, 0, '2023-04-11 13:02:25');
INSERT INTO `coin_info` VALUES (1157, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:02:41');
INSERT INTO `coin_info` VALUES (1158, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:02:49');
INSERT INTO `coin_info` VALUES (1159, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:02:58');
INSERT INTO `coin_info` VALUES (1160, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:04:01');
INSERT INTO `coin_info` VALUES (1161, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:04:10');
INSERT INTO `coin_info` VALUES (1162, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:11:44');
INSERT INTO `coin_info` VALUES (1163, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '50金币', NULL, 0, '2023-04-11 13:11:44');
INSERT INTO `coin_info` VALUES (1164, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:11:53');
INSERT INTO `coin_info` VALUES (1165, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '50金币', NULL, 0, '2023-04-11 13:11:53');
INSERT INTO `coin_info` VALUES (1166, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:12:00');
INSERT INTO `coin_info` VALUES (1167, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '50金币', NULL, 0, '2023-04-11 13:12:00');
INSERT INTO `coin_info` VALUES (1168, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:12:08');
INSERT INTO `coin_info` VALUES (1169, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '实物抽奖', NULL, NULL, NULL, '50金币', NULL, 0, '2023-04-11 13:12:08');
INSERT INTO `coin_info` VALUES (1170, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '实物抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-11 13:16:50');
INSERT INTO `coin_info` VALUES (1171, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 161, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-11 20:56:02');
INSERT INTO `coin_info` VALUES (1172, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 39, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-11 20:56:05');
INSERT INTO `coin_info` VALUES (1173, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-11 20:56:19');
INSERT INTO `coin_info` VALUES (1174, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-11 20:56:46');
INSERT INTO `coin_info` VALUES (1175, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-11 20:56:57');
INSERT INTO `coin_info` VALUES (1176, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-11 22:51:43');
INSERT INTO `coin_info` VALUES (1177, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-11 22:52:14');
INSERT INTO `coin_info` VALUES (1178, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-11 22:52:17');
INSERT INTO `coin_info` VALUES (1179, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-11 22:52:18');
INSERT INTO `coin_info` VALUES (1180, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 99, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-12 10:09:45');
INSERT INTO `coin_info` VALUES (1181, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 88, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-12 10:09:53');
INSERT INTO `coin_info` VALUES (1182, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-12 14:31:16');
INSERT INTO `coin_info` VALUES (1183, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 6, '1', '购买物品', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-12 15:08:43');
INSERT INTO `coin_info` VALUES (1184, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 88, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-13 01:19:38');
INSERT INTO `coin_info` VALUES (1185, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 01:36:42');
INSERT INTO `coin_info` VALUES (1187, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 01:36:58');
INSERT INTO `coin_info` VALUES (1188, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 01:42:07');
INSERT INTO `coin_info` VALUES (1190, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 01:43:19');
INSERT INTO `coin_info` VALUES (1192, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 01:45:02');
INSERT INTO `coin_info` VALUES (1194, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 01:45:10');
INSERT INTO `coin_info` VALUES (1196, 'ociWS6j17km6QToj5dcoy1kNB8YA', 88, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:04:45');
INSERT INTO `coin_info` VALUES (1197, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 9, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:04:45');
INSERT INTO `coin_info` VALUES (1198, 'ociWS6j17km6QToj5dcoy1kNB8YA', 99, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:04:50');
INSERT INTO `coin_info` VALUES (1199, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:04:50');
INSERT INTO `coin_info` VALUES (1200, 'ociWS6j17km6QToj5dcoy1kNB8YA', 13, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:05:03');
INSERT INTO `coin_info` VALUES (1201, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:05:03');
INSERT INTO `coin_info` VALUES (1202, 'ociWS6j17km6QToj5dcoy1kNB8YA', 0, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:11:47');
INSERT INTO `coin_info` VALUES (1203, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:11:47');
INSERT INTO `coin_info` VALUES (1204, 'ociWS6j17km6QToj5dcoy1kNB8YA', 0, '0', '累计签到3天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:11:56');
INSERT INTO `coin_info` VALUES (1205, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:11:56');
INSERT INTO `coin_info` VALUES (1206, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 99, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:16:23');
INSERT INTO `coin_info` VALUES (1207, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:17:44');
INSERT INTO `coin_info` VALUES (1208, 'ociWS6j17km6QToj5dcoy1kNB8YA', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:17:45');
INSERT INTO `coin_info` VALUES (1209, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:23:18');
INSERT INTO `coin_info` VALUES (1211, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-13 12:23:33');
INSERT INTO `coin_info` VALUES (1213, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-15 12:26:16');
INSERT INTO `coin_info` VALUES (1214, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-16 05:35:24');
INSERT INTO `coin_info` VALUES (1215, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 88, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-16 08:06:49');
INSERT INTO `coin_info` VALUES (1216, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 99, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-16 08:06:53');
INSERT INTO `coin_info` VALUES (1217, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, '', NULL, 0, '2023-04-16 08:07:42');
INSERT INTO `coin_info` VALUES (1218, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-16 19:22:09');
INSERT INTO `coin_info` VALUES (1219, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-17 09:28:10');
INSERT INTO `coin_info` VALUES (1220, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 132, '0', '红包奖励', 46, NULL, NULL, NULL, NULL, 0, '2023-04-17 21:10:45');
INSERT INTO `coin_info` VALUES (1221, 'ociWS6j17km6QToj5dcoy1kNB8YA', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 09:15:42');
INSERT INTO `coin_info` VALUES (1223, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 09:15:48');
INSERT INTO `coin_info` VALUES (1224, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 88, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-18 09:34:38');
INSERT INTO `coin_info` VALUES (1225, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 99, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-18 09:34:42');
INSERT INTO `coin_info` VALUES (1226, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:11:21');
INSERT INTO `coin_info` VALUES (1227, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:19:16');
INSERT INTO `coin_info` VALUES (1229, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:20:00');
INSERT INTO `coin_info` VALUES (1230, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:20:39');
INSERT INTO `coin_info` VALUES (1231, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:20:50');
INSERT INTO `coin_info` VALUES (1232, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:20:57');
INSERT INTO `coin_info` VALUES (1233, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:21:04');
INSERT INTO `coin_info` VALUES (1234, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:21:11');
INSERT INTO `coin_info` VALUES (1235, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:21:18');
INSERT INTO `coin_info` VALUES (1236, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:21:25');
INSERT INTO `coin_info` VALUES (1237, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:21:31');
INSERT INTO `coin_info` VALUES (1238, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 96, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-18 10:58:06');
INSERT INTO `coin_info` VALUES (1239, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-19 11:37:14');
INSERT INTO `coin_info` VALUES (1240, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', 0, NULL, NULL, NULL, NULL, 0, '2023-04-19 16:42:42');
INSERT INTO `coin_info` VALUES (1241, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-19 16:42:42');
INSERT INTO `coin_info` VALUES (1242, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 85, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-19 17:56:21');
INSERT INTO `coin_info` VALUES (1243, 'ociWS6j17km6QToj5dcoy1kNB8YA', 99, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-20 12:23:34');
INSERT INTO `coin_info` VALUES (1244, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 10, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-20 12:23:34');
INSERT INTO `coin_info` VALUES (1245, 'ociWS6j17km6QToj5dcoy1kNB8YA', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-20 12:23:54');
INSERT INTO `coin_info` VALUES (1246, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 2, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-20 12:23:54');
INSERT INTO `coin_info` VALUES (1247, 'ociWS6j17km6QToj5dcoy1kNB8YA', 78, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-20 12:24:03');
INSERT INTO `coin_info` VALUES (1248, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 8, '0', '分享收益', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-20 12:24:03');
INSERT INTO `coin_info` VALUES (1249, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-20 15:24:22');
INSERT INTO `coin_info` VALUES (1250, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 57, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-20 19:28:33');
INSERT INTO `coin_info` VALUES (1251, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 11:45:04');
INSERT INTO `coin_info` VALUES (1252, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 12:07:13');
INSERT INTO `coin_info` VALUES (1253, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 12:07:13');
INSERT INTO `coin_info` VALUES (1254, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 12:07:39');
INSERT INTO `coin_info` VALUES (1255, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 99, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-21 12:08:01');
INSERT INTO `coin_info` VALUES (1256, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 61, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 12:08:24');
INSERT INTO `coin_info` VALUES (1257, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 12:36:28');
INSERT INTO `coin_info` VALUES (1258, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 13:31:08');
INSERT INTO `coin_info` VALUES (1259, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 13:33:52');
INSERT INTO `coin_info` VALUES (1260, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 288, '0', '累计签到7天奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 13:36:19');
INSERT INTO `coin_info` VALUES (1261, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 88, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-21 13:36:59');
INSERT INTO `coin_info` VALUES (1268, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 29, '0', '白银宝箱', NULL, NULL, NULL, '15', NULL, 0, '2023-04-21 17:39:51');
INSERT INTO `coin_info` VALUES (1269, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 95, '0', '黄金宝箱', NULL, NULL, NULL, '50', NULL, 0, '2023-04-21 18:20:42');
INSERT INTO `coin_info` VALUES (1270, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '0', '铂金宝箱', NULL, NULL, NULL, '115', NULL, 0, '2023-04-21 18:27:57');
INSERT INTO `coin_info` VALUES (1271, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 2, '0', '钻石宝箱', NULL, NULL, NULL, '176', NULL, 0, '2023-04-21 18:34:13');
INSERT INTO `coin_info` VALUES (1272, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '游戏评分', NULL, NULL, 28, '任务三', NULL, 0, '2023-04-21 18:39:42');
INSERT INTO `coin_info` VALUES (1273, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-21 19:02:37');
INSERT INTO `coin_info` VALUES (1274, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 15, '0', '白银宝箱', NULL, NULL, NULL, '15', NULL, 0, '2023-04-21 20:07:51');
INSERT INTO `coin_info` VALUES (1275, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 59, '0', '黄金宝箱', NULL, NULL, NULL, '59', NULL, 0, '2023-04-21 20:08:00');
INSERT INTO `coin_info` VALUES (1276, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-22 14:28:34');
INSERT INTO `coin_info` VALUES (1277, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 22, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-23 18:28:47');
INSERT INTO `coin_info` VALUES (1278, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '游戏评分', NULL, NULL, 28, '任务三', NULL, 0, '2023-04-24 10:54:52');
INSERT INTO `coin_info` VALUES (1279, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 10:56:32');
INSERT INTO `coin_info` VALUES (1280, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 10:56:41');
INSERT INTO `coin_info` VALUES (1281, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 119800, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:02:14');
INSERT INTO `coin_info` VALUES (1282, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 119800, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:02:14');
INSERT INTO `coin_info` VALUES (1283, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 119800, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:02:14');
INSERT INTO `coin_info` VALUES (1284, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 119800, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:02:14');
INSERT INTO `coin_info` VALUES (1285, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 119800, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:02:14');
INSERT INTO `coin_info` VALUES (1286, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1287, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1288, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1289, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1290, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1291, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1292, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1293, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:03:20');
INSERT INTO `coin_info` VALUES (1294, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:04:04');
INSERT INTO `coin_info` VALUES (1295, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 38800, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:10');
INSERT INTO `coin_info` VALUES (1296, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:26');
INSERT INTO `coin_info` VALUES (1297, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6000, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:36');
INSERT INTO `coin_info` VALUES (1298, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6000, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:36');
INSERT INTO `coin_info` VALUES (1299, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6000, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:43');
INSERT INTO `coin_info` VALUES (1300, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6000, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:43');
INSERT INTO `coin_info` VALUES (1301, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:48');
INSERT INTO `coin_info` VALUES (1302, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:05:48');
INSERT INTO `coin_info` VALUES (1303, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:45:42');
INSERT INTO `coin_info` VALUES (1304, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:45:42');
INSERT INTO `coin_info` VALUES (1305, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:45:42');
INSERT INTO `coin_info` VALUES (1306, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:46:19');
INSERT INTO `coin_info` VALUES (1307, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:46:19');
INSERT INTO `coin_info` VALUES (1308, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:46:19');
INSERT INTO `coin_info` VALUES (1309, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 11:46:19');
INSERT INTO `coin_info` VALUES (1310, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50600, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:15:27');
INSERT INTO `coin_info` VALUES (1311, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50600, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:15:36');
INSERT INTO `coin_info` VALUES (1312, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50600, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:16:15');
INSERT INTO `coin_info` VALUES (1313, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50600, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:16:23');
INSERT INTO `coin_info` VALUES (1314, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:21:33');
INSERT INTO `coin_info` VALUES (1315, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 13600, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:21:52');
INSERT INTO `coin_info` VALUES (1316, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 29999, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:22:34');
INSERT INTO `coin_info` VALUES (1317, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:24:24');
INSERT INTO `coin_info` VALUES (1318, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-24 14:26:47');
INSERT INTO `coin_info` VALUES (1319, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '签到', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 08:10:37');
INSERT INTO `coin_info` VALUES (1320, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '0', '幸运礼盒奖励', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 08:11:00');
INSERT INTO `coin_info` VALUES (1321, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '0', '红包奖励', 48, NULL, NULL, NULL, NULL, 0, '2023-04-25 08:11:17');
INSERT INTO `coin_info` VALUES (1322, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 1, '0', '红包奖励', 47, NULL, NULL, NULL, NULL, 0, '2023-04-25 08:11:33');
INSERT INTO `coin_info` VALUES (1323, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '游戏评分', NULL, NULL, 28, '任务三', NULL, 0, '2023-04-25 08:37:15');
INSERT INTO `coin_info` VALUES (1324, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 08:37:42');
INSERT INTO `coin_info` VALUES (1325, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 08:37:52');
INSERT INTO `coin_info` VALUES (1326, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 50600, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 08:38:17');
INSERT INTO `coin_info` VALUES (1327, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:41:45');
INSERT INTO `coin_info` VALUES (1328, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 6, '1', '金币商城兑换', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:42:09');
INSERT INTO `coin_info` VALUES (1329, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '游戏评分', NULL, NULL, 28, '任务三', NULL, 0, '2023-04-25 13:42:40');
INSERT INTO `coin_info` VALUES (1330, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 20, '0', '游戏评分', NULL, NULL, 28, '任务三', NULL, 0, '2023-04-25 13:42:40');
INSERT INTO `coin_info` VALUES (1331, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:45:24');
INSERT INTO `coin_info` VALUES (1332, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:45:33');
INSERT INTO `coin_info` VALUES (1333, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:45:40');
INSERT INTO `coin_info` VALUES (1334, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '实物抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:45:47');
INSERT INTO `coin_info` VALUES (1335, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:45:56');
INSERT INTO `coin_info` VALUES (1336, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:46:03');
INSERT INTO `coin_info` VALUES (1337, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:46:11');
INSERT INTO `coin_info` VALUES (1338, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:46:18');
INSERT INTO `coin_info` VALUES (1339, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '0', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 13:46:24');
INSERT INTO `coin_info` VALUES (1340, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 100, '1', '金币抽奖', NULL, NULL, NULL, NULL, NULL, 0, '2023-04-25 17:08:41');

-- ----------------------------
-- Table structure for cs
-- ----------------------------
DROP TABLE IF EXISTS `cs`;
CREATE TABLE `cs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '星期表',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cs
-- ----------------------------
INSERT INTO `cs` VALUES (1, '每天');
INSERT INTO `cs` VALUES (2, '星期一');
INSERT INTO `cs` VALUES (3, '星期二');
INSERT INTO `cs` VALUES (4, '星期三');
INSERT INTO `cs` VALUES (5, '星期四');
INSERT INTO `cs` VALUES (6, '星期五');
INSERT INTO `cs` VALUES (7, '星期六');
INSERT INTO `cs` VALUES (8, '星期天');

-- ----------------------------
-- Table structure for fbsp
-- ----------------------------
DROP TABLE IF EXISTS `fbsp`;
CREATE TABLE `fbsp`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '发布视频',
  `file_id` int(11) NULL DEFAULT NULL COMMENT '文件ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '视频标题',
  `tjwz` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐网址',
  `is_sh` int(1) NOT NULL DEFAULT 0 COMMENT '0未审核1审核通过2审核未通过',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fbsp
-- ----------------------------
INSERT INTO `fbsp` VALUES (4, 246, 'test', 'www.baidu.com', 0, '2023-03-22 16:54:51');
INSERT INTO `fbsp` VALUES (5, 247, 'haha', '', 1, '2023-03-22 16:55:34');
INSERT INTO `fbsp` VALUES (9, 432, 'test', '', 1, '2023-03-30 17:45:40');

-- ----------------------------
-- Table structure for fbtz
-- ----------------------------
DROP TABLE IF EXISTS `fbtz`;
CREATE TABLE `fbtz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子表',
  `fl_id` int(11) NULL DEFAULT NULL COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '帖子标题',
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '帖子内容',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发表人',
  `is_sh` int(1) NOT NULL DEFAULT 0 COMMENT '0未审核，1审核通过，2审核不通过',
  `fb_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fbtz
-- ----------------------------
INSERT INTO `fbtz` VALUES (16, 2, '测试', '<p></p><img src=\"http://cqadmin.bluechs.com/storage/upload/20230324/641dbc706fd24.jpg\" width=\"1280\" style=\";max-width:30%\"><p></p><p>哈哈</p>', 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '2023-03-24 23:07:05');
INSERT INTO `fbtz` VALUES (18, 2, 'before', '<p><img src=\"http://cqadmin.bluechs.com/storage/upload/20230401/6428283154138.jpg\"></p>', 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '2023-04-01 20:48:58');
INSERT INTO `fbtz` VALUES (19, 2, '1', '<p>1222</p>\n', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 1, '2023-04-03 18:20:10');

-- ----------------------------
-- Table structure for h5_config
-- ----------------------------
DROP TABLE IF EXISTS `h5_config`;
CREATE TABLE `h5_config`  (
  `id` int(11) NOT NULL COMMENT 'h5配置',
  `fwxy` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '服务协议',
  `yszc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '隐私政策',
  `djjs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '等级介绍',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of h5_config
-- ----------------------------
INSERT INTO `h5_config` VALUES (1, '<p><strong><strong>用户协议</strong></strong></p>\n\n<p>感谢您申请注册本平台账户!在成为本平台用户之前，请您仔细阅读以下条文，确保您理解并同意本协议全部内容。以下内容将构成您和平台之间的服务合同条款。</p>\n\n<p>一、用户注册</p>\n\n<p>您同意本协议并注册成功即成为本平台的注册用户直至您的账户注销。本平台可能在必要的时候对本协议条款及本平台各单项服务协议进行更改，此种更改在本平台上公布或在具体服务过程中经双方以口头、书面等形式协商一致生效。您可以选择停止使用本平台相关的服务或者注销您在本平台的账户，否则本平台将认为您同意更改后的服务条款。未在本平台发布或在具体服务过程中末经本平台告知的服务条款将不具有法律效力，除非签有书面协议，并目仅对签署协议的当事人有效。</p>\n\n<p>二、用户账户</p>\n\n<p>您应当拥有中华人民共和国法律认可的完全民事权利能力和完全民事行为能力，否则您和能够代表您行使权利或承担责任的其他主体将承担一切后果。为此，您应当提供相应的证明。如果您是自然人，此类证明可以是您的居民身份证件、个人户营业执照。如果您是法人，此类证明可以是您的营业执照。如果您是其他组织类型，您应当提供相应的合法证明。</p>\n\n<p>如果使用本平台提供的各单项服务，您可能还需要提交其他相关的资料和信息。为了提供更好的服务，您也可以向我们提供其他资料和信息，我们将按照本平台的隐私政策保护您的资料和信息</p>\n\n<p>您应当保护好您的账户，除非已经得到您的提前通知，本平台将认为您的账户处于您的控制之下。如果您的账户在不受您控制的情况下处于风险状态或者已经发生损失，请您及时以有效方式通知本平台，您可以要求本平台暂停服务或者冻结账户。</p>\n\n<p>如果您使用本平台账户直接访问其他网站，您应当遵守该网站的服务条款。</p>\n\n<p>三、账户管理</p>\n\n<p>1、本平台帐号的所有权归本平台所有，用户完成申请注册手续后，获得本平台帐号的使用权，该使用权仅属于初始申请注册人，禁止赠与、借用、租用、转让或售卖。本平台因经营需要，有权回收用户的本平台帐号。</p>\n\n<p>2、用户可以更改、删除本平台帐户上的个人资料、注册信息及传送内容等，但需注意，删除有关信息的同时也会删除用户储存在系统中的文字和图片。用户需承担该风险</p>\n', '<p>本平台尊重并保护所有使用服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，本平台会按照本隐私权政策的规定使用和披露您的个人信息。但本平台将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，本平台不会将这些信息对外披露或向第三方提供。本平台会不时更新本隐私权政策。您在同意本平台服务使用协议之时，即视为您已经同意本隐私权政策全部内容。本隐私权政策属于本平台服务使用协议不可分割的一部分。<br />\n1.适用范围<br />\na)在您使用本平台网络服务，本平台自动接收并记录的您的手机上的信息，包括但不限于您的健康数据、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据;<br />\n2.信息的使用<br />\na)在获得您的数据之后，本平台会将其上传至服务器，以生成您的排行榜数据，以便您能够更好地使用服务<br />\n3.信息披露<br />\na)本平台不会将您的信息披露给不受信任的第三方<br />\nb)根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露;</p>\n', '<p>1、只有在本系统玩游戏达到指定时长才能享有对应等级的权益。(您当前等级: 0、今日签到可得20X1.00=20.00)2、每日金币上限:(以您当前的等级0、金币上限为200举例)<br />\n2.1例如:今日获取金币总量已到达198，点击签到获取了20金币，系统会默认只加2个金币，超出200的部分直接忽略且无法再次获取<br />\n2.2、例如:今日获取金币总量已到达200，点击签到获取了20金币，系统会默认只加0个金币，超出200的部分直接忽略，并且获取金币记录会存在且记录金币为0，金币增加为0<br />\n3、每日获取金币加成(所有获取金币的记录均会乘上金币加成的倍数)<br />\n等级名称: LV0</p>\n\n<p>等级:1</p>\n\n<p>等级图标:<img src=\"http://cqadmin.bluechs.com/storage/upload/20230403/642ab5f263039.png\" style=\"height:17px; width:36px\" /></p>\n\n<p><br />\n需要玩游戏时长(小时): 0<br />\n每日金币上限:200金币加成倍数:1.00<br />\n等级名称: LV1<br />\n等级:1</p>\n\n<p>等级图标: <img src=\"http://cqadmin.bluechs.com/storage/upload/20230403/642ab66145745.png\" style=\"height:17px; width:36px\" /><br />\n需要玩游戏时长(小时): 1<br />\n每日金币上限:400<br />\n金币加成倍数:1.02</p>\n');

-- ----------------------------
-- Table structure for hb
-- ----------------------------
DROP TABLE IF EXISTS `hb`;
CREATE TABLE `hb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '红包表',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '红包名称',
  `type` int(255) NULL DEFAULT NULL COMMENT '红包类型0单次领取1重复领取',
  `num` int(11) NULL DEFAULT NULL COMMENT '红包数量',
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '红包金额',
  `statu` int(1) NOT NULL DEFAULT 1 COMMENT '发放方式0立即发送1定时发送',
  `fsrq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发放时间  每天或者星期几',
  `fssj` time NULL DEFAULT NULL COMMENT '具体发放时间',
  `updata_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hb
-- ----------------------------
INSERT INTO `hb` VALUES (46, 'test', 1, 10, '100-200', 1, '每天', '17:18:00', '2023-04-10 00:45:20');
INSERT INTO `hb` VALUES (47, '凌晨福利', 1, 86, '88', 1, '每天', '00:00:00', '2023-04-10 09:48:20');
INSERT INTO `hb` VALUES (48, '123', 1, 88, '99', 1, '每天', '04:09:00', '2023-04-10 09:51:14');

-- ----------------------------
-- Table structure for hz_step
-- ----------------------------
DROP TABLE IF EXISTS `hz_step`;
CREATE TABLE `hz_step`  (
  `id` int(11) NOT NULL COMMENT '盒子安装记录',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统版本',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `add_time` datetime NULL DEFAULT NULL COMMENT '安装时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hz_step
-- ----------------------------

-- ----------------------------
-- Table structure for hzlm
-- ----------------------------
DROP TABLE IF EXISTS `hzlm`;
CREATE TABLE `hzlm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '盒子栏目',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序',
  `is_xs` int(1) NOT NULL DEFAULT 0 COMMENT '0不显示1显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hzlm
-- ----------------------------
INSERT INTO `hzlm` VALUES (1, '新服推荐', '1', 1);
INSERT INTO `hzlm` VALUES (2, '广告排行', '3', 1);
INSERT INTO `hzlm` VALUES (3, '特色好服', '4', 1);
INSERT INTO `hzlm` VALUES (4, '活动赛事', '2', 1);
INSERT INTO `hzlm` VALUES (5, '活动中心', '5', 1);
INSERT INTO `hzlm` VALUES (6, '幸运转盘', '6', 1);
INSERT INTO `hzlm` VALUES (7, '金币商城', '7', 1);

-- ----------------------------
-- Table structure for jhm
-- ----------------------------
DROP TABLE IF EXISTS `jhm`;
CREATE TABLE `jhm`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '激活码表',
  `jhm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '激活码',
  `sbk_id` int(11) NULL DEFAULT NULL COMMENT '沙巴克id',
  `is_sy` int(1) NOT NULL DEFAULT 0 COMMENT '0未使用1已使用',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户open_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2514 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jhm
-- ----------------------------
INSERT INTO `jhm` VALUES (1015, 'kz8pcL0qBdlc4wT25WlQ', 2, 1, 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `jhm` VALUES (1018, 'JNjYw6iMrM6XBcDXd2iZ', 2, 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `jhm` VALUES (1019, 'CBPzY6RWomg3zvNANyrA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1020, '30gEl86vpuODqhbBZ842', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1021, 'T01x6fdZ3gvcbuc7i74V', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1022, 'G1bK8gNaKbhxREjUbd2I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1023, 'W7x6V8oQyB3BPUy7uze1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1024, 'TZoL2f44uIKGh8bJ83d5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1025, '6bVH1vKkr3upgIJtR9Ti', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1026, 'iSoYFCh33ZmlvHjzSujM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1027, 'xDzBUv5giPHa0qHzjJtX', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1028, 'M1rwaNHgTC8uuMjtadPW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1029, 'ClSFSNZzgGJuo5VaAcWM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1030, 'o3pcIzV9U2hLth7WjGHz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1031, 'bDjwxPsUv8gz2unXqIGf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1032, 'o2Z7frSr4fLj5kHGA688', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1033, 'ntnkEuRuLv0WoRP0d8QU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1034, 'iJfrggQxkKlUYpsuK0UC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1035, 'uEbmyRLWh5b69jRUcdfG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1036, 'xVWeuiauaZmA5ME7LJQ9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1037, '87hvqZlmsJLexcMPMvgL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1038, 'Wkj4w33AuRwp5fDEMRMh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1039, 'kLTQnXowujSMRyAPQa4U', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1040, 'IffAuOJEtNeqR4nkIjgv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1041, 'JCurMqbXmlTseFY87MYT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1042, 'WJ7CqC89feojIAjLnUiF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1043, 'Gze4XV0CjZjPncb0qUDF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1044, 'MZj8ha0jYMTqK9CY1nBR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1045, 'itlbdt8oCMbX1l3wtcj5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1046, 'MOZzj5vGiYfSPg1KUjhe', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1047, 'NSv6Ii7oHdQBuVspHuqw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1048, 'uxiC79jqTPEoyAjGSZO1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1049, '2meL6W5jI77fvXV1Qxrm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1050, 'A52Uc9DGuFy8Gl0fIqlt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1051, 'FIsbKOQWmli4KyqVCHEP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1052, 'iriSG5RCj3wvTLSdmvyY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1053, 'Tw2BUVakWTUQXxeHBH30', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1054, '8YCBwcfHb8KhTtBzhoHx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1055, 'gTG5mlUmbrgw8W1UKV0A', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1056, 'S4bDm3TwDGtSjkmL2K0I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1057, 'ChLkRkCSY9rnHWFK99nd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1058, '5YWbFciWNRiTw0hQr2rI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1059, 'Yq5A5QWJzjvrKPKsmj9w', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1060, 'i1ljRuzh3fyquVC0EM3X', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1061, 'WRfALcqsg2JthkvCKWhG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1062, 'Wh5r9ONLc7t8DzXtddAE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1063, 'B0BhGlxae7vewa93ZGb0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1064, 's9gleCKqcY48AJILN1fm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1065, 'ZiSiZ7Vsy1Rubahr5Ts3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1066, 'rPkHNpyDJ52OEc6oVcOf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1067, 'xoES4z90RYn7QD0Qmp9j', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1068, 'XQ40nqrOmpiexI9QivgD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1069, 'sQ1TQrIXzuyAR7NerjGk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1070, 'tIehgDrJKdm16hLMz3FO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1071, 'oU4btVLUhJhKxSVMWcdv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1072, 'zwOhCyhYXZxM4DGwAAGu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1073, 'fVNBHiVdA7ozVPfTrudK', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1074, 'cyHEegyOBqqXoElKnxFb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1075, 'j99Ds1r2bDO4WPlGc1i0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1076, 'mNPA10NJcNjW6PpQEUA0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1077, 'hwlpcLQpz591P1tGBdDw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1078, 'L6v2RXhbIgkWjww6fbVo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1079, 'wHM35rC8K6JzKqy3uWFv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1080, '903NpSscwT6m9rRBaTnq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1081, 'mwygJ39VkWZFvY4jX7Ny', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1082, 'Ybz9wQDKApcjK9rFUyuu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1083, 'nu7in6JvthtGuKG0dtwS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1084, 'VUrNHgWvtG0tppTj79i7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1085, 'Do8YKmTbTpbAGMEr09ae', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1086, 'Gr5dYR2sdNOADRlWqbOk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1087, 'hOEWsjs0MEjGY1KDxx51', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1088, 'EUv715VCyaZeGYwCSKry', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1089, 'rvYaPTt3Bk9EQ5TFZ1hC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1090, 'WOAaY5dbZzTODrqatj7Z', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1091, 'F6qmvfJdn8QjpUNWrcPB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1092, 'R9csg9wo1lft4tJLYvny', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1093, '6iKUxbvkmfiZVAjnyvXA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1094, 'dliR976qUM29oiUXPOrj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1095, 'eIHhv7jfl42Wyv8zEMFd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1096, 'Q0CB8FBCokcky0Ia33yt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1097, 'urFmBzYzzQiQq9u8JWwX', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1098, 'XzxPLiKQL0GxCZnrfOLY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1099, 'W1sU9y96faXJInx27UdI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1100, 'Rx0KS4W9PJ6Yg19AQUvZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1101, 'VYzmBBBTJwP9RBD8jd40', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1102, 'Pg35KaAQfWWxle9lX1PD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1103, 'uLNpqGaEwgFbg6NPP25Q', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1104, '5yZ4lyoHYxemOwMB8IVx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1105, 'h3tMMUyhQVqaNlV57TgB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1106, 'RbbvAExDttv9cDW9czue', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1107, 'TQoqitIhNEawd3ziyEH9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1108, 'eIj3DJ5gIk2pVsKt3YVh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1109, '819g4DfUb5UAw4IzUktO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1110, 'lJiOXMB1UZ62x2K128bV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1111, 'V8bXg8Eg3gPqWANkocP5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1112, '4pOPO3Om8nOm1gmgRvHQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1113, 'bJEaFrQkYcZJ4P2JMqPb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1114, 'lqyssTTS37sGcW8Vu3va', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1115, 'Uxu5RFgXTmUVHFIWevrg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1116, 'E5hUCS6MMpI3wVTBhpv7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1117, 'Ya1M8xRglS3tN0jf7RTS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1118, '6ckY5YSRJCtZb05R84Nb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1119, 'KcOyzB1iRJSBVfPmdpYY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1120, 'gSZ3zBsHG9EwZ4Zmmesn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1121, 'U9z7Tm5c3uJDyU3yohqX', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1122, 'r1pYEi5mv4dgobiNTSld', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1123, 'z9y5K3MPw4Bfb5V1NMyT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1124, 'l68X6HZZD4Nhcyrqdzq3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1125, 'z5Dj7Ave6lCBLsinpohA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1126, 'tN0Jk2nBNTtjfuPXeYHf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1127, 'BqMUI0lLxK2QlN1l5nyz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1128, 'Tub1Hl7vCVKsG3YmIyBB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1129, 'cLMMTY0wZHUwA8QjEDqA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1130, 'gq4v4twLD0U8vZrKwb1m', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1131, 'XEJRYDi0EEeZzbOB9Tst', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1132, 'T9otyuVSsw7OgvXuqS5O', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1133, 'UtO0KXhPvctTq60iHk73', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1134, 'xApp4YoX1f3Pmpeei7gt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1135, 'xsrdnIagSibvPFzYnhnl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1136, 'XaOhxNMXxySRqspizcYw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1137, 'Nv5oXdcN7DwpI7FdW4pG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1138, 'cKbBgxZo0eiyk7uXQdSP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1139, 'agP6r5DcbLHX5QhX6wgB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1140, 'grNTtHvzIoasQM2QkFdj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1141, 'mRqlRVACLuRo6V3SKpzA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1142, 'WzsDHrovr4Q9jHQl4nb4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1143, 'lur1aFLsuJ4Pl2YUunWb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1144, 'eNmcG2CXX8urzKmzA3cL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1145, 'vvBJqbPF54MB61Bu64vY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1146, 'zxMVp3mI51CikM9IWMRF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1147, 'kaPt1fjNp7sjJ0MPCdKY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1148, 'ile6xPeXaEiiKvKccWDB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1149, 'koKzRcfZUTPfbwMNVRrf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1150, '7JUEyhkLPUpLZ50ziRKj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1151, 'V7Sn79XKGihypG8vVd4G', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1152, 'BIXaaTZwTrpwpfkZK32A', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1153, 'E7toMdE9dVFVRvf4vU3n', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1154, '2wxKdwrZDcTFm49dlq77', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1155, 'KcimRow55HxJ7JD0HOIw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1156, '9LyFkdZCmNd3GyudfrbL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1157, 'VADMk9pUVZi8rNcgH8Hb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1158, 'W3yn7BcFhBIprAfJICWu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1159, 'V7fSEHX8w7DQl1XOHyaP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1160, 'CSx4oxiacaoyelCYoJLa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1161, 'irApOGNi3LKW44SDBeQo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1162, 'Cvxrcfi1MFlEwJ0nRMKI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1163, '8QdlnoXRZZAxPoYIccp0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1164, 'sn75CujhPL27CVlCdb9B', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1165, 'r5FprkiUvQlpLvKiuCr8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1166, 'd8XtwTAdzty73cTvjxl0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1167, 'fWLl28uhVc2vos7J3bR9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1168, 'TrkcnwCPjBU8WZeUPaL8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1169, 'dUmtDRDU9Uxv3VzavSnE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1170, '8qSzMZEMiRDW3ZabAimp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1171, 'aWRv79WPUzIoJiARCMll', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1172, '6LntvqmRUXc1plMAM3wc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1173, '0wnGf5FpZQBRq2whq3SU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1174, 'eEEkR9XZVzrH7rVwntfn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1175, 'p6xJ1Em3llmoNWDO3KKs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1176, 'eCwSOOC4xRiqtfaY0KnY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1177, '3ukS3HltdX0UbGQiralw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1178, '57DSUXa6vAyTy4WAVD65', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1179, 'msPXVWeUemNojxo6pZUU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1180, 'g2M1p0EpVNZzGfyGg1Bn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1181, 'wVOWsZFTIaoV4trFlJ95', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1182, 'lSiQtDVagpGhtueIPoJy', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1183, 'c4gQZ58l3y8oWFZF6e3J', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1184, 'iAZuiJIMrNDoHGK7sP25', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1185, 'YPsg9512bDhzC5gxFxd9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1186, 'CDKs1g38hz086WiT680P', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1187, 'Z5AXRHH1wH4ScvDBvNma', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1188, 'wMiRc8ppRK2D7fCa3r4G', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1189, 'n6PJAA72MPbFHbTcvcpb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1190, 'Il1HXlJbBsWtSDjfVQUn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1191, 'uYT8rXMRj6Af9syjqNQJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1192, '4SCjQs9QxrRi78E101VD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1193, 'hUngKlXvyE27qV58o4dx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1194, '9yOYZr2oHIsy54n7xa1p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1195, 'wnAE6F7rfdfUmb0HkmUv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1196, 'X9xf1ya3fp54AWZlc6aj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1197, 'FU6HPR8EM1cApixKsoiX', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1198, 'TTIRTZ1EGElau964FckT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1199, 'hjl8GyDh18MYyGzO94nz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1200, '8UYSwnVVAZzkZbE4MVI1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1201, 'BVSt2qnkw82lhXxs6Nz1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1202, '2WpRHEEOyis31TJKxnTo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1203, 'DcA5KMhbgDmvRULUDtIE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1204, 'tO5gUEi79RurUabiEWU0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1205, '8M4b3tVmHMS4z6YRgIgh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1206, 'LsTDRFrtUY5MSuc05gNZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1207, 'g9k4LRTyNk9t6pjUs34q', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1208, 'tc0eT4frYNLKimoxmqUu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1209, 'a78ELkw6LQlHOpKxzjPn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1210, '6REgrk2rrEK6DDTd3Eoo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1211, 'aK9WkMuQ0JIISoKdH5Da', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1212, 'KLFA8H9EXWuP6FvO9gPG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1213, '0C2uMnMHQq2QQDV2IMwd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1214, '7BOcjm1au2tZj1MqRGz6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1215, 'JgRKHUqRttW8LUu9zHev', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1216, 'ozY3mhjhgwTwBpQjwocL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1217, 'RzpAWH2OxpEfZABJp6IO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1218, '56511ykuN67k1YwuoRMV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1219, 'zcxDSo6zu4kIJr9nxz6p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1220, 'BEQZowLR9qFvjBVq9V1J', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1221, 'StlRDSF8Bm5ILDlqVCaN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1222, 'akZAllGPmuIKhokynEj6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1223, 'WfKmjwwee8Ik3QtVtMr5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1224, 'TSyU8IgAlfl16p3nX9XW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1225, 'x7qoDQveZtymTjEGOEt1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1226, 'vRlTGLPJygbNkOCvLkbO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1227, 'ZOj2GbSw6lKWzcXSEQD0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1228, 'wSJmMm1NlD34qLka4HqA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1229, 'IcexSPJgSrNGpMttTNMm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1230, 'vYzVizUWR7srFUcpk1uU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1231, 'B88nJlV7pxl7rJfWeDkG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1232, 'HBMVPDC68cQaJrSqMszB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1233, 'eJU0djNgSqxb1bWCzkpG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1234, '4ShnS0aTiXlUVKlB3lrD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1235, 'p7neV4HQpvCsLb6EItPM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1236, 'sFheyT1xXgiWNvRhlrue', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1237, '48G29ZTtXvqOxVhPkbfH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1238, '5bKilLs7wY3pSrFby1ff', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1239, 'CumbGUJA48VkeZCAeWfy', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1240, 'tjWg1mARsbiJPMLckcO6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1241, 'fOC4r0jfMl4KsC5GQyik', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1242, 'BUCsUNochlkcrwCKUAQV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1243, 'Wk2pjILjTPSMQ0ALl1ed', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1244, '15ovGidLhcZRtlkP1LRP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1245, 'gwZoGzHughqWb3qqHVuW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1246, 'L0VKqQaQcmCvLuYR4UGf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1247, 'be4iVNMDNJqrv12m45Ny', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1248, 'r3faWEGZ9dUZAfPxv4IQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1249, 'mryaoxA91Re4rOAfg9aO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1250, 'UOH3J3ecJDvAm2WJvbc3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1251, 'aNDZiKOsUthm3Fnnl40r', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1252, 'By23IxBVARD53df7rqBn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1253, 'NYONiKpQ5T6pB8CM8t9W', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1254, '8s7BT834vmn7vC1apJaO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1255, 'vP46FolCO96J1KLsQuPc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1256, 'vn4lhCaOvEmrrHRc1ql7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1257, '7X8eLcebyMv7JVjWUGma', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1258, '5gnLPBcin3RpZEUVkRvZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1259, 'tgTPWL6gKvPuRSWONO8E', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1260, 'eJNUstRil5PHQMRHEp7R', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1261, 'avjizdJ8r8gQ0vGAd0Ki', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1262, 'r8UfOFEj8Rw3HYHt97FO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1263, 'HHYFYNHRgx2HoQyWxoKT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1264, 'X4HxnBUfI6NiOSpnn0Yq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1265, 'vLSOMbYtJdZxB0F73ZzT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1266, 'L5kkjXjpbt6tzlikDErH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1267, 'cUk8Rd6itEGV2mZylQqb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1268, 'xrAuI8fPIDvts05Cz5IO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1269, 'c3HKmYoJxrw1972dRCRd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1270, 'w8H0vk521HJ1GvLZaoUK', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1271, '1SurghhEeMjcghot0Ain', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1272, 'T7lBCerXtK7ziQC7ZjsZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1273, '2IWggUQULkhbXEt14VAB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1274, 'm3B6oNm8x6uLjSvImyn8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1275, 'WIf9bd6VapQqnxAwona8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1276, 'h9kRYALgRGv87fMglbpy', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1277, 'QFn2QJD6OGDd7Yjqwjj9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1278, 'Vhhb71QWCxHC36NyRUHj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1279, '04IuZu4jsnWl4bWRMz9g', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1280, 'cRobdtpHPCe4LVuqIiUP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1281, 'lQSjzbZhbNKgE1IXlYLU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1282, 'kg4Zx6RNaIrhpCgZ86tf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1283, 'xaioW5u52OqzCbBv1skK', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1284, 'DjhyBMH2OkbYEgLMgWO6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1285, '5q4wa77jBfzzwMncN5l6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1286, 'n1LXC2FDUbUCPLz6RUll', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1287, 'aQ7wkFZFAfBa0MNmftg7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1288, 'sd8EHo4VMlX2ArfoZ30u', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1289, 'iRuU9lo0K28Ift8NT1IT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1290, 'vviNHwEY9C7ZEtE0JbvJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1291, 'yVQO0Lvpv2VkNuCEQFTH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1292, '9zeEYA8M7fw5kGGVaXqZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1293, 'Yf4TbpKiBs2mfsZZDT86', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1294, 'C9l3F2Od1KnTzWWh4tk2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1295, 'W3dMppEgiTJQQYXUdmTs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1296, '0f9UE44Y3UNZQVNzdueK', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1297, 'AiJecdWHA9VAPB3YwcPS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1298, 'ZReTIJJT6z3BEYDXpvJH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1299, 'rUaqozsqqXBCkTl6Y0KS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1300, '52LQbL2JzAvrZ66CWnV2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1301, 'LzIuFmrUL8rRfRaaZ4Y1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1302, 'mt8pTNxAsXsdPwYxcZOS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1303, 'sCiZYpLptsfxO6c90Cwd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1304, '2QHkBhmz6RgeKtiD8VUc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1305, 'AkdRWnTuqJb14zyt9dM9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1306, '8FOp4HW0FDNXjJJPaT5W', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1307, '7PMcQoVvVvtOsg4AkCKL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1308, 'S9V2pdLh6JkDJldh7x5X', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1309, 'Nu377MKBFIoVdH1o80GO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1310, 'HYByI5kcbq8C3LUKysEL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1311, 'fs0YzhXXveCrYhgX3Ytb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1312, 'VPN5AXJcILbqDOgThdKo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1313, 'LXcx0jD9cc9H0E47bkcK', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1314, '6HfHSmO1Hex6CUkhTwTG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1315, 'tPEOiRUj28BAXWzBeXHk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1316, 'RO0cqJ2ZvLsRhpednwB0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1317, '9aG0vnc9BpHkQ8e7eSjh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1318, 'FxL3mWQ5iEguybut8PBV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1319, 'fXpAba4jzwy7FPFMV7oK', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1320, 'r4YebvyarzOOcfe7Q91G', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1321, 'zB37bHfTk57zrEpQeFBh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1322, 'oj2ASH0js47VUDnZvu9f', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1323, 'OU4uBvPxKFaddtrM2738', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1324, 'FtAYc6f6vFmpOpp6cSTd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1325, 'czTZYPgHfbLOBDai9hbz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1326, 'hSvPKG0TJUyoqdIaN1fV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1327, 'wq4RmwQHZwqqa8WonW6n', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1328, 'svEU62fLAwY5FvW1H6KV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1329, 'KDr2YAVzzmsICps6vSgb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1330, 'gIWzgWYIdRAnRxeIf0v4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1331, 'l8ODTZsQIojVKPpQHPXu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1332, 'yNWZCvxucSUkSxt7zsHB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1333, 'CvdEmUdyqhOv02hO3X19', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1334, 'kPeZSkzQWi65tVZgp9QY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1335, 'iIk86t8PxG6W4fs5RJaf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1336, 'JoliQAhBqquTi4nQwkdd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1337, 'AcqVObfktvB2cIpGVZ5I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1338, '3RCxWQIShHd0LbrbsyOt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1339, 'hQpaGnAC9SU7rRFcc1AJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1340, '9WFR8d7dAaK7f9C5RphP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1341, 'MfxqiBnF3LjnCXiFWZaJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1342, 'CNgkMJsNVmJxBfULK9TR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1343, 'gouvxuQmDCppWV6bx9vC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1344, 'hY4KDLiXF36ozZ7N5ueD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1345, 'kFk28xw605mjwpCNjwzU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1346, 'y7Tk5rE1VUo1GJsV0WJa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1347, 'yhILGGxfu0PlfslNUmzl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1348, 'Yj1ZO81vmxMHl7Kte0Wt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1349, '0HEMMDgM3S8I63LOACAB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1350, 'g8MPSm6cSeWBkQYoOZwA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1351, 'FVJavuErJu3rnojjhjyq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1352, 'VHOqiAz1VsNM1UlscdoR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1353, 'I0lPFs7gRb0AqW2HwId0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1354, 'CwpoXbts9yy7Q4olEs8G', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1355, '4rkNxNLNcHg0jUj1s5VJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1356, 'lJwQG10HWPoqK3zole4J', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1357, 'ns1UkPQ9hBKNRHM45Sw6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1358, 'anAeH7hlMc2PPlKXuAOn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1359, 'aExi76vycxQmQPLW0g0s', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1360, '4F9CZzIT6Cw7uvYccnAU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1361, 'YcjW4NzHU0kdNzpPsnZw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1362, 'ltNw1zITh0nqRfXrg1a8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1363, '5OW3qp9NPcTa0hvwAFCt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1364, 'iqBiJb04xRp62QVo2fcC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1365, 'thghYCbfclCXpSK0bRWx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1366, 'LruJAcJ9fgn2nwXes1Kn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1367, 'PcCt6lHkYoudrlVTlriM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1368, 'xutAftid6wwQ020cQstI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1369, 'RMxaINZSQK85tJ6F9jFL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1370, 'cCndKPHwn4zNLlrDy1oH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1371, '4ODkn1m2ncIHBSR4gq7Q', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1372, '07QgZB6s0MvFAGlUtdqk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1373, 'UA0xYBjMhNBUkL6cdik4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1374, 'zDktpyq9JDl5WKU25Oqm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1375, 'fmE4CG8hU1sfmu6cySXA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1376, 'S8XX3vWQynSeaHlJRSgZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1377, 'FK8AbT7Y1p9sBG9xwODS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1378, 'IpVCUWuOCkFHeDAkrxoO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1379, 'eQipAeooViwkbUqK6a5a', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1380, 'bkO76shdYwYRGefVL5zI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1381, '1V5o6jXJvFYUpP4QZ92r', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1382, 'fK7DkIbVEDnqil3RvhNT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1383, 'NTutdlaAkzyt6swcipQR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1384, 'pBo94OCBhn1bdo7fiGro', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1385, 'f4aSMm0KL1p5q5en4blk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1386, '2yAQETiK89KVEiKV7nk4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1387, '8X7RzyuxkaOUe84eVaJF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1388, 'BNdnXATREpMUNnnbfuJ0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1389, '8LRW7vKjnjgTVShQGC6w', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1390, '0tneaqfH2YuyP1YtE8fs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1391, '8HuD3Z86wBRoGCEwB2Qd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1392, 'vkpWn1fvzEpqjl5PKphr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1393, 'J9SGohvFvMVYsZiv05GI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1394, 'OgieiVorCpwuHV8Oxo90', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1395, 'iecQazlRO5tRbwjxT2kx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1396, 'XiS5hAXahDiDXREU6tZ6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1397, '2l6F2pSvhtWIdn4pGmQL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1398, 'HLCIOsvI0ktnL3PNev6m', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1399, 'rQYGN76gr28K3VNfR4HE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1400, 'I9vKhEIanrXO0KTnL5CL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1401, 'GlOxagVOPH1GeWPSHiNd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1402, 'oiZ4WqEw8anT4zlUrkHI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1403, 'hH4AUECAxLk0bVK7jYhd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1404, 'VXAj1a1AHXu7FHrfG0cF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1405, 'ka5NlvIKA5NbzLEpSHuY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1406, 'S6yXQ3CE3nNKy84sjSp0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1407, 'HDBeGggPt11K5qsM4R7x', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1408, 'M2LpKZoWyIZsNqgVvbGc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1409, 'Tw22r7zVbY5yLqTwMxgL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1410, 'eI7DruV1T9kOMLZVUkeN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1411, 'BKupLou9jrmM8s6CJUbc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1412, 'vjyiCMaL26zS8XYs1aij', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1413, 'Yj7aIKFwTXFAAQGFWo7h', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1414, 'sr9mZcCWP5j3xRimhiyb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1415, 'eubld8Qx0F30WwouTjjP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1416, 'FZcEsQjTM3sB193YWREx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1417, 'Z5D2uMmG8qZSUp6Fm48B', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1418, 'bcXG7jZkt97TfnNDO2DQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1419, 'hRCKn11SfmEUx94v83Wh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1420, 'I2VNe6Nkv9WdG6yNFMIB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1421, 'En67pQF1KQc1vielDbb1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1422, 'qHD7VAfxkya2wJlfKO0y', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1423, 'PHJCJJdeLASy6H8ab5sf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1424, 'TeUcs2lJsEomhC1TDqsx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1425, 'FTTBLVTZkmdPHvPeoA6p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1426, 'QsBOHBlcSCyIzh8SNNun', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1427, 'DouI3L2Rg9LfthxRotQN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1428, 'hjg8N3XMlw53ZOXma8UH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1429, 'wKIXgtZAFLQRl2QWarH4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1430, 'k8EfNhZuQEifXqPc8ZKr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1431, 'oZhSGqPzUTLnuH9OY9Ur', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1432, 'EgZeN49QchyFp7mk6lWs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1433, 'XdWp5POy2oee7afMnjZm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1434, 'xZI0g1uUW3ghyp3ABPiG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1435, 'eO1XMzt8Kts5PkdWP4Ft', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1436, 'gpjAPvE8TlwmAS5hwcCw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1437, 'mqza2rMqMJBeWVSzLYrh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1438, 'tJIJd9yEb47dbvKUOTuE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1439, 'IUptrUBuFe5O0cymgbaq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1440, '2A00CPmPqHulO1LKUPUv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1441, 'gv6mA8iCKJOGN96o3QlP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1442, 'V3daROTk2gV0LnS90YWF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1443, 'djVhzlETzHeq2iWSn0uc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1444, '3DTTYvZ6qIx9SEXKcc8v', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1445, 'LeT6WxF1HWrxAMs4bUk2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1446, 'I04d8O0aMeYtJZp4LIem', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1447, 'GlGe3kg0dEcd6hEbbhBR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1448, 'eJ4CyR6rhKb5MCsKsbRq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1449, 'bOTf0dCeBrMEh90zWgoq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1450, 'JRlPGDiDMzqJLz1C4f6e', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1451, 'T5DbXaxwX9egBkgTWXrh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1452, 'TPahCUl3ilBtgVI3PDGD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1453, '3tyngLTbSvGSDfO8Ga7F', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1454, 'eZJGWiyNM4lVaWjCS2Tq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1455, 'UZDnkN1feKu4NRVfmGyz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1456, 'qslNGJGNYXQQSc6DL9Wi', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1457, 'CjGXGyd5nhbQtiRWTqnM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1458, 'YjfLu4Z5sEe7qjFOyFqy', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1459, 'x5eSeonFJlqsui7Vjt1h', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1460, '6vXq3Z0Tsvsu2wqXGn2z', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1461, 'aZZvCyfpBofRHHIm8ehH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1462, 'LQigWnDFnPABVhxk58Nz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1463, '3za3NmK7ngOZbMUCunMl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1464, '4pWlft2gR8BOUTEogEAh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1465, 'gjUUCJ2NgSFEZjkIVbBN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1466, 'tad2H2eJZY9M0o5CREDx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1467, '2PEds1XIeo6ILDnpkczd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1468, 'L7oTfqQAyColycsSgPtU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1469, 'TSkdumiSMcTpTCVIygKg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1470, 'RY1vhskUFlBkjutu9CdN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1471, 'eRkr5N1J6kdNUkhSnJmL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1472, 'UXkQAKl8sIS5kN5ttEI2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1473, 'qISK30cfVFdbuFaPc3Le', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1474, 'TQ93tVAh6BQnv90Ot9Sh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1475, 'QPOgktcHK8G7Y1Rwbtnq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1476, 'hgAHjEQWegphRoaYXo3i', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1477, 'p3mvd23gJfJg0qrlHEX2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1478, 'b3bGtRAooN64fRJBKGh5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1479, '7UgyRVKFwi1Vpe55Flq8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1480, '9RkMqqH5rfljMV4EUs9t', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1481, 'NxfsWu1KmF22dtRs12Bv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1482, 'ztgG9DZqiscLIRk6AAZU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1483, 'vJ26d3oRrzMh3N2cL6kL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1484, '1jGXNAFx6DIjeJuP5yNs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1485, 'ysficw9ZHUGoBvoewEWR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1486, 'UV8najBlHhJ89J1UAcYz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1487, 'M0yORsOrhOWQgpzoBLUi', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1488, 'RtPBWexdyLerJfuWKwmO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1489, 'cVJsA6nT4R8cpNFwefKM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1490, 'K0CVrw1Dv6V00kz9Jay4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1491, 'huWmDrGoVchvHcCXBB5Z', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1492, 'CYjFp16Wdm0N1RuNTZju', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1493, 'nTdWScjoMQPY9EwvPxFL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1494, 'QYIjUxbw1h4Bervio5gu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1495, 'VeBPRcr8j0Jj2yYEkPBl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1496, '4KPVylGK8VZfer8w2s6c', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1497, 'QI2o3tsr1N5MN1qjYeXW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1498, 'bTDMobvr1PXodn1RXANE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1499, 'bRO7HppQ5Egq1wvNIwzN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1500, 'aJM5UZhIEoQkBeiJQwN2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1501, 'NyB34ewCfnD3lEhZutkg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1502, '3DuPmcsDsvzO02MSUD1n', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1503, 'WNPJgCDWGTC4TdWyAQ7Z', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1504, 'cBUVlviZm6esAXhAfJMU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1505, 'kYiNMzJiwjtbXywa26pD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1506, 'TyAsMGdJ8YSD2vFmMy4d', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1507, '4zLtLHrXHhZ8bqbz6vhM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1508, 'bcOdOiXIn7CyGp641HoO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1509, 'dOQS25CCFHX4hWCCTLSQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1510, 'R5Og82rUfcg4Re0TUzhC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1511, 'LsNXhfYqZYM1P46SXSIF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1512, '3ojKjWPiNLo8EP1H3wG6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1513, 'kMz7kxZjSEVYJN1LL3Nm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1514, 'XCv2g3G8wNxqDY0m41Rb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1515, 'bWI1PB0vvONrprYsDHJB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1516, 'Ht0GKXjWfYKTFoIDlZtx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1517, '3Ue58LSxP6f9LzgWEC0I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1518, 'UGo502cj5Ns2lwZe1XwP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1519, 'wmmUpPj3DeZTJEuH1sWL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1520, 'jL8kh0JedW2INvNcVOoM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1521, 'VfyuAxo4At1JQT9zFe5a', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1522, 'Q98DVefCnQAPrQ1hhe7L', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1523, 'azXLqJJaqqlB0AQDEJCb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1524, '692WpPsIRPYZ6EpPJA1q', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1525, '324U4R0bCKoSjtWctE4A', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1526, 'PsHaExBqNOf9I4URuZkL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1527, 'JhvTsCiWr2mfjlpexwb7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1528, '9ZLLUTAN2CCNYj2ZQqoc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1529, 'oVbLnSEWpn77XwrDy0iL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1530, '7UOEg60h6vNddB3euHLJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1531, 'mvpi1h8bje7Len8z1Ijj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1532, 'BdhZwDex8RGuNJK90Wei', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1533, 'jqnjKzEiCBAxNvYRuCpb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1534, 'ToYqlt7Gfx9yuTMxM7Bg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1535, 'DsPNR1YV9LDQmIVdX0N5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1536, 'E7wBoMUt1CH8UAfzoKFa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1537, 'UjRVIL32IcNZLORmT5iC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1538, 'ecwSlSreqcQtrRWgV8yM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1539, 'IXHyT3KxFJCGFxSFvgzR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1540, 'TfnPj5g4Xjsn5M9ZTkZo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1541, 'GYkmZNCB9K1w36YRvWmU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1542, 'uSH6Sh7UxE8tDY69bD5r', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1543, 'IGm5NpgwiItnU2RLkXbe', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1544, 'J6borkvAbPjYb4qcrcLY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1545, 'YQi5yhrnbbsbM4SZ6TEB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1546, 'EBJybJjMs05TNbfChQBG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1547, 'cr4dHaiv1pRDYsceTxFA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1548, 'UwKpsFsUBFoKBmV0vwbb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1549, 'zU0JGJvClzFczO7Yt5A8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1550, 'Psdd7k1mrzI11v62d3qE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1551, '6lTJ0VHIlyyf28mV7GSF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1552, 'bclAJVFUIoTqImg5Nb31', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1553, '6mza6STcRICHje2rieNA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1554, '8qFzLtEikeBznhV5Wy0A', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1555, 'GjeJvbRUCtH2x23htb5j', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1556, 'Kd43YHLa1ah0XUNLrchC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1557, 'ZMlBKTFvAfUkZpzp0EpQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1558, 'rvi5YCBLo1qq5yH31USH', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1559, 'IGNJv5WAADpJuxh3VeGU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1560, 'twPMsOpeTH4t0P0X815l', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1561, 'vi7yKNoejvJLvPGmTr86', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1562, 'GJmwvALvWzsRxFyTWkKS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1563, 'bhqzgX7rxK3WeVXFxD8a', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1564, 'qLxpBWCTbZGBfSwMDEyQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1565, 'kFOe3etJFE2RNdtw9ZDM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1566, 'KECz8MJF5aTgWczMZPo9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1567, 'DQRJJTvxNMef6nh2pi4p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1568, 'q2YjEjrnpDMIYa6ryKMf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1569, 'ii1Xmv3WWHmph473QMBq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1570, 'Bo9breesYl5TFqy4Z9iW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1571, 'Um6THjQJc3SzdLYGZ4Xj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1572, 'LWkzl1uV62KHokZjYbVX', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1573, 'UPHznN2WwS3iaFtcwE9g', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1574, 'kI4wchGWBZuxttHEg38H', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1575, 'Z8yD9zTVkdbTCyM4gaqj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1576, 'hY4x9QpcHyoDMxBeRva0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1577, 'WhOulH5DanqpsC4mGYSp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1578, 'AFm5MLPhVSBNHDwBbAo5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1579, 'icwQaUjBDuJP9NoikB4E', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1580, 'QeE2EmoeBz0bOKHfPgD9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1581, 'wzA50ixZaooZCVaEsjxl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1582, 'p8AVgFIx8aMmuGza06C2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1583, 'aKZKex5Z2FZMIEFefXsw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1584, '9u3TYY30I0MWmXQ4pyih', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1585, 'EcNza6NT411AaFpBrqpJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1586, 'lvmRZjyLxL9twiPPFcHx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1587, 'S0kscV9oCPRBW2J0pEav', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1588, 'G2yhOcgQco9eXTwfP9Tq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1589, 'gDx2076WHOAIS2CTFEi6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1590, 'd9tWHuCWAs56a6dPO04b', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1591, 'LVcgWwAPVp8odgzPuAFl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1592, 'cnWbLwrWFCb83hUQnkb0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1593, 'iV5yKjB7N4tndmXumyyO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1594, 'fE3jsi3fTDv6ufcUNogW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1595, 'Yvl2WbkA4gMnEO1xgMnu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1596, 'DQQQy4gQUSfVmdhOQVCI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1597, 'IGbyJoa89C7mCLNPWIZF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1598, 'gaAIGAVsCxYkP5uMc9hA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1599, 'AjD3xprMAvOGHdDemqEF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1600, 'R0q83YtCWG4h7qR2w8kR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1601, 'v0Uw57akmJ2hfI5g7RQL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1602, '16XA9Zmdt64OA35TQMRs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1603, 'tM8uAhajxSjjwEbhrmYS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1604, 'p7awFpmbJwNgYYGNERh2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1605, 'GWfSaAGV3IVGqfVT9uLV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1606, 'bQ5k5WDkFAZrGr28Zmf0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1607, 'dNelVlhOlciS4j3KpYIr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1608, 'oeWiWxhiO4L3gTDtzksx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1609, '3VvOwjXXT9dnxVGgAv6r', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1610, '5gCAfbjgRPVwP2qvHw2y', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1611, 'YYiiLTIXsci0TanUeJ6w', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1612, 'pSRdYTTQ7azjlo6WB6rc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1613, 'OUEPD22DBGlCO3gj32kF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1614, 'PsrA1Q6FNFX7wCgswLym', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1615, 'anbIWPg8CUYV7UA5EWUs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1616, 'TO72omls4r48YDguYCcp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1617, 'k9baFRxQghhPPpXdB49r', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1618, 'FbDNrNBLtfo8MZL8x1gd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1619, 'euIR0YEgfQs0y6VH5WNZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1620, 'xyWLkYQooSLuhIBFEod7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1621, 'KUq6xUEtjZoJi9hTDwKd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1622, 'WMAn1jO6l2Uw4HkSIrQm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1623, 'fh2MU09cwQlmR9AUNMh0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1624, 'KsoQ3W7faYYfGje0xkGR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1625, 'obQ5bEuoiM0024rrgbY9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1626, 'B1Cj9k1IbEfTOGl20jdu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1627, '5ozdUXQHQ409Nu9Zo0XW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1628, '5R6IAfavs5iCiftnjWqO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1629, 'TWRw8ROFwJ3nHQjDpMFr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1630, 'r8uV1pQOsC2pKELNZcdl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1631, 'Rb5Z7SXjeZXlVJ7G4jtq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1632, '46KslcgJTYWGclVjnMjX', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1633, '6OkCi34DsRxQrjhRNgsZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1634, '8vLgbZLDVwlE5CQnEwCT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1635, 'QEduwpakafwDc1efPiCG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1636, 'He0VweFAujS0LP91KYzi', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1637, 'RetshX5WZkdkSPVV6LlW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1638, 'aK8fljx5ueYZCU4g0t5p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1639, 'WkKSQoZfegHXPbJ0pWKG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1640, 'O6HPXR3VocjVo7y6ZKBU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1641, 'x92ExWOPemDARPXNGRA1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1642, 'Hz3ldq53zNzCZl8cvGbv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1643, 'pkLtbT6YYxQj2G3SKZcb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1644, '40hK3AIMfIKG2tthjGSe', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1645, 'vBlg0HoUcThvYJe2e9NC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1646, 'v4O1d8tuwVy4SHzbAKx4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1647, '3GJTwLhX3b3WCjPCRQwY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1648, 'X0ncjQiTSTBnxkCuh21t', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1649, 'gnqkJ0hIsXI9Uf7TvSDW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1650, 'dClRkmjYtsbiXk69rKvu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1651, '4v5HECidfa3Vdmsr16R1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1652, 'RFUEUZmhNcCdoK7DrJ17', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1653, 'HBG7gyOkj2k3HhZQqt6M', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1654, '4o0y8DGX4xgo8W6v1QNq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1655, 'jlDp55tveqxKzZgz3pNM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1656, 'if0zhhsMAQZMVhxC5lKr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1657, 'FA0PfthiJ600ngNKYiBr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1658, '30FuVeFeJkrAKEw3vlB3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1659, 'OxjKjzXykyo9ishMYg7E', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1660, 'twcf9GpH3R9efocDtU7m', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1661, 'lvrnTE2tPeI8AXAPZiw0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1662, 'V297k8p6y6o4SWdED0pD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1663, 'Xxx5uDakdgphlHOVqMwW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1664, 'vQ4gl1Wx200hQbtRdqjx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1665, '2c5CW3gtiUmkIvnTvaR9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1666, '2CiozTLKXuU5bo3GR6di', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1667, 'hNhZPlMfWHK6Y1w2a2J1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1668, 'pbEUdpzcg2bnnIx4TNDL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1669, 'Y8Q756S6OwzRSvntRr6q', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1670, 'spPnukK0CSTFKhj8FA3p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1671, 'RSNPGUkweF5IOFErQcvr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1672, 'iPWH6lWZQSOuLMRtw7zm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1673, '9zwHdS0I4jmLvoJdkTJo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1674, 'U9H1r00vGWWvc4iNb0Lq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1675, '4XWLl0mqUZKQkT2j59iD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1676, 'fWZmh1GdHxBdbumDKLG9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1677, '08qRPHqbcI3WxE6IJpYI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1678, 'Fc0fFCabBAorAfI4dTcR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1679, 'gzr4WoxvyQFetye4IeDG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1680, 'ocd2AsnFeNIggCWBYgnQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1681, 'iiE1ZP2JohR0dNjzZLz7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1682, 'D47IvRilVsxrQDiPzfWc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1683, 'rzJmjy1A4d1MDdhGpklr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1684, 'GbUmSkn5pUcDAGaeaO3z', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1685, 'EDIVbV8409RvZXwZXS9p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1686, 'PFYc99bs0WoQUAFl5Oro', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1687, 'hjOa2nmHQPFRovtDtk3C', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1688, 'nTXYUM5olbQ8LNmzG5DT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1689, 'DAUSybOnGfayiuMdChEv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1690, 'UrZcAh3QZZK7RUJ8ugR3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1691, '1w1naaRcvqhR8UgFd9V1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1692, 'F9W7wvvBj4EzwgVJdNcw', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1693, 'sGyzODsQTSe6AHpAi3Hb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1694, 'wdIIIW03RVFkIeM9Yxwa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1695, 'OrX0nTPkowiCuxx1j0U1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1696, 'mCUYeyDNWlTrDNX0vuQi', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1697, 'idLVw0uyrVBxdFtjNyvj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1698, 'ztl7IJyjCrnwLtjIdfz3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1699, 'U6X1LALasSceujeCAAH1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1700, 'sgoAzp6Uq8sBmg82D2AR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1701, 'B5fZqRe9TLx0x1wxeZCF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1702, 'Jenws5oWamO2YCMmdsbb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1703, 'McR3jARzyCkK7nqcBD2s', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1704, 'ICknKN2nAtR25Zt70pCz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1705, 'pL924ZQu6CamLX9p46m0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1706, 'BvikuTLBMiOzxkAJp48l', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1707, 'vIi5rTaPpInseVVJpmws', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1708, 'wvy39sQ1wrew55U4YQ0x', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1709, 'vqXDccZnB0ZaHtZ7PK0b', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1710, '9QQ8GyW1UmHXDyCinV7n', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1711, 'Whpop63mauEceXvn8EBU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1712, '9Fg28VOf7dLdpr0CeiII', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1713, 'DpK9rWZVJNHqS5fZNxzo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1714, 'hUobYF2zrOMBtrPheR58', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1715, '2dVKIf1Ff3M2FJNrM5oa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1716, 'qNh8gNW2eqcROLqW9fcc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1717, 'RsB3Tz5h76gXlFKFyvDg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1718, 'eZc24umN6UGEw7la2SNl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1719, 'xJXRH0KEUFzSZ6u0x8y6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1720, '9mwrfwSUIJj1olQFpM3O', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1721, 'vnspAUotbs4ooXvbhMi5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1722, 'n6zjew101NlQwSXlxtUm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1723, '7Rdv7UfIi9F6f0GEuE5l', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1724, 'lUN2x02MEMYuzhns9PKT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1725, 'dYneM70ihEuFIZyTge4p', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1726, 'PJKf2BnbNcerWXAFNs6I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1727, 'yEkLTNou9KQqnkvAraGt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1728, 'gV9QOCwBXYUN4dKN62KM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1729, '0THbQDWYv8bweJC80xxE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1730, 'P7CrDnkCaw3I3HxUe2wG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1731, 'kHHAvwoxxMRpsyC8TI3f', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1732, 'RrmWdGatmMvEpGiI0R9v', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1733, 'R5aYg56chpyLJLT2COba', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1734, 'rdO1elRzdTtnkS5m6G0H', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1735, 'EithT3vpvpHvA7pW42nf', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1736, '2v3bVfqUsv9sLkww1dq8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1737, 'cUran2dS4pKuPiTPvLjh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1738, 'XyOWiMnSiR2LYxlcqNLL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1739, '37FjUv7a2j4w5p9Zpfep', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1740, 'bpXFEvL2hlntoCkfvA6n', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1741, 'IYLFlcx7VWCC88JuiOnG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1742, '0d9rOLwLtyYJkxI9ikSj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1743, '6amVON53Q5YfPcDLFdh3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1744, 'rTWCSzY0B7hkzzUOKuVZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1745, '3ESY2tcalRqG0ezZgSgu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1746, 'ZrTmKSvw5xcl2cPzqZ0O', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1747, 'TOSuMoG3ZMwo6VvDzS2f', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1748, '3C4SjrbXsr9dRpGkhAHl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1749, 'HehJTbLogZVQ72LZEUFc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1750, '6Y9jfnl4CPl1PU8ifjC4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1751, 'S8UXSVviAcyKBC1EXJvu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1752, '4jvN0NCiKPSeIgCuqREv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1753, 'hzhefm3RIfpvU3b4uMYg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1754, 'wsmhk0MHlowXMXq1Ac35', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1755, '1bWQ18L4p7zjWtu1sdei', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1756, '6Wm0N76toxqQ7zzn2zWe', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1757, 'ufcq3KSDSMBuuYim5C8W', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1758, 'aKttAtFMFA9M1Rla4Qgm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1759, 'I9iATjQW53zbLuxNFp34', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1760, 'VYOmiQtP2ygRHCkMc9A6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1761, 'tCZpABwozjf5UxEvLDiG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1762, 'sQCdb0oTuVKjMvk6U9o6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1763, 'tx6GVrlewq21JgMp7p8I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1764, 'SDptPU8gaNLnP3zXtkhJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1765, 'MlJdosevVp8by0v16iAc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1766, 'q4WJzOJu6rkSXlx25C4d', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1767, '0NNBcwipkVZ2ZgeSXDuZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1768, 'Noz7NbGxYDTrNJ4SFfVs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1769, 'jSIeXjXrLnNV9kD9srm3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1770, 'vOJFeLmIGnPKfyEIfaSk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1771, 'VMKQK1H17o4QfLTKg9MF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1772, 'XgQDQdAufhuZoxo89kqx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1773, '0mh128ygU9hcqgdXfBgZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1774, 'yDZOwjpWwvP7gNNSIjDM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1775, 'p4oghmGv0LHeZB8SHY1i', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1776, 'KgJi3uGSJ7lzFTDMYQCB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1777, 'sguhDcQ1wfVu8giNyc6R', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1778, 'nTzKfsBeS5k8sPJINZX5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1779, '2kw2ElL4O4NY2gbvI6RU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1780, 'OFeaVQ3ev9Q8iGAMRF56', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1781, 'zhZqUEK1NLzwC7nWPWdz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1782, 'rcP3QAfJjDsIqvNgDgdM', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1783, 'Zp2jMMXtIzO6jDQQ9e4y', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1784, 'BhWUd4N48R8dh2A8Fcgi', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1785, 'zGyOzyXLw0bKhoZVmbTg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1786, 'LdDqKgvPEJL344Ds3sLn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1787, 'dhlqRfcLrPhuMsu67urB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1788, '6cuTQcAUru2pC7fHNOY1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1789, 'PBmbTgu6oZ89BLBZmrQk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1790, 'ns2ngH1lDODSxy0iynyq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1791, 'DOnytiGc8Ds0jMa2hYxk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1792, 'PGHBn6RHzy0x0HnBVJRa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1793, 'vjzh0g7oF80FMV1D7iey', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1794, 'N7vbDYiN3rfVCiajldP9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1795, 'kvP9UJIrqtm3MjOabsiZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1796, 'sokr70aV27yhIUOE3TUn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1797, 'RlwyOjsm5tFVSbvljzlz', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1798, 'mh2BkQW0WFKOsk2tx9c6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1799, 'b2MWNajPbyiti3pp4NVk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1800, 'VKEBO7KYBLfAvAXuQUGW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1801, 'bZbEkuQQ3fQUm0QZaXm9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1802, 'xNAjAdBpuldJ6bIrGwgN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1803, 'BA3RjqFcPvigxJTRaLOl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1804, 'DAnAVvgdfFeLxYNo1Oab', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1805, 'xcLHaowGNRsy4r5noGwb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1806, 'etSnT4eFNOXTutBG5qkm', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1807, 'f4nh3cNG7MEDTBZ7u8WO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1808, 'MCwbYnTmODuGbT86XEV1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1809, 'QEVqM9SqDy0ZFnwEVRYq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1810, 'umweNMrJLLcH6bqIamMt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1811, 'XH5P9mqe2NG3aAeQP44y', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1812, 'baCgi6hzPCthu6an1T7A', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1813, 'KYn8XNzfih5rbuQ1jMFa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1814, 'QR4vU7kfIq8Qb7QBli4I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1815, 'ZhkMN5LDbrY2XDFMapH0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1816, 'hBJjFbSRg3uK4I1wUcE2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1817, 'p1ieIkkH83Z83mIC8iy6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1818, 'ak3sv0YalLso740yefI1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1819, '2i19BDXzYl9HUUhCMI1r', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1820, 'OJKZOpevMVhwkSPaF5Oj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1821, 'obUyu7H7Ul22iE8PcCeF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1822, 'GFGDc7JRdW3MzR8hHLIr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1823, 'Qh1Vz3EmeZnHoIzBM5JP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1824, '4CFBXNMMAgtAu5AFBaKU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1825, 'BBT8ZKjJH56VlEhawtlN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1826, '5vVZlvDMRp814wx0ZKj6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1827, 'j2PyRhGHpCfgItVpnvPP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1828, 'eOVwkOcUN1y0CLuNqNGY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1829, 'cRhPLZsgdDUJpmBYAOcG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1830, '9N8hevi3p0ja7SkfaulO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1831, 'iym5dKS3fbBKDpy6BQvW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1832, 'CiGmFqcHMfxJEK5NpoHY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1833, '5vm99XRvfflqs9J5efgb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1834, '7mTgIliU8Tz2I2pYJf3e', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1835, 'sHkdupVB2iFgOLgsK1aa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1836, 'EK246FR3eT1lMhhINX29', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1837, 'lZhqaq4ddv4g6w0Qfl01', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1838, '28Scy7kjwRl3QpaDdB2i', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1839, 'PjiW9zdnQqSabb48X1bp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1840, 'NwkGGdaPZpJzwelLhAHd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1841, 'Qa25vmebextFdi3Ilyu7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1842, 'kbjzdBuB4DBXtZz013SS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1843, '22jr4TFeZ32ZeVekmYBG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1844, 'TQsBRQOCQRUOIkf2of8q', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1845, 'dkbNVzQnFah6vZxhQDff', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1846, 'nrhxvPKCvVyMwLLMiJhp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1847, 'fZhBN9xuE6U35eYvlAPo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1848, 'XkZsvmESMbHjcfHpsAH1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1849, 'CCXtVblpzei5AvYT9yD1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1850, 'e2PgN3GHjCE5ipglWxIO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1851, 'iTkIsuVmft9pOoWtDZmT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1852, 'GCoOznEjFNx7dygfZT4I', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1853, '5oet1nyqTWZDiacjeWvi', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1854, '7G3c3Ed9Jh5PB2ei81xA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1855, 'UN4LEwYAAQolEu8XN7OY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1856, 'LTOqcjTuNV8HZN9STqhq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1857, 'GdSdw4gHx5AoopYXGN16', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1858, 'fq1Xu4SZus0OzfUbTK45', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1859, 'XENArDhESwyyf2RCMDQn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1860, 'Lczv8NzolcVFvwG0RzIP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1861, 'zAz3mkk3H1X9HZu6LXul', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1862, '3fzBOUPJy6R3jA0flXtk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1863, '6s03laWacldmxb8js48H', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1864, 'nSZrEyVoPqFCi880DP9a', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1865, '468UCmPOM2G5f5PaFFjL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1866, '1mwDS0SmanLUxQO5YtgE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1867, 'G4JsmeRI1h69MBrpBe6Y', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1868, 'OjBrFoLULXOoqMKkKPZQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1869, 'Nil2EuCWdWN94jsyYOdC', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1870, 'cFwtyYtf5JqUK6vS5q8T', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1871, 'zd1GfpsW3ptLziRbAxbU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1872, 'IjcLPHOE1c3iGFLhDx4X', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1873, 'qTd7ccaS32mnUBRYBWx0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1874, 'tXKdxHz3xWQLMMvR84Bi', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1875, 'XHF0jE78chTGNClJldQY', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1876, '3PVOKUdihBMfscPxa2Xc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1877, 'Wlq4CIgIupUqaJKNs05t', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1878, 'uXfofSUcQ5Ly7f3ZR2uh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1879, 'MNg8dc7ZOCGJ0ZO6EJ3S', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1880, 'JhNBAifp9jOG50X6PcB9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1881, 'DteIEhNptrz9EaISNp4k', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1882, 'RPbUNlQN97a7Uv4pGnKV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1883, 'KlASXeGCpweuv1p5H9u7', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1884, 'Il7UkDnaGccGOBdcNVpx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1885, 'dFU8iO2NUNwRKWy45N0V', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1886, 'i9fd3r3k2Hsi6LOVJj5Z', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1887, 'FfLUl6XZJUJ8uOLjbJrS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1888, 'SX22RsX1a9RcKJcicbPq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1889, 'jVRhdnvtqb6WhYF0Z2jy', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1890, 'WI3EqikN0NLsGiCHjXP2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1891, 'Zpgtcp0KRTgcZRP1HNtF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1892, 'mDhLVGTjQPAumv7R6pub', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1893, 'vhFmtzTnk5IaV7DR3pvo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1894, 'EbRZIZbKCH9qDOSIqVHL', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1895, 'tdI4kk8Yih9uJfiYueVF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1896, 'MPMAqvkLjQKHhfGRVTEV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1897, 'deKb1CQjWS86SqRRAGeN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1898, 'DhtgmiaxOFBBX6VIkFZa', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1899, 'YVmEJyfizDOME1kGplR9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1900, 'pImq0S2R5FIcp7QUpt0W', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1901, 'OxLB0kwztaBT57gIZGw3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1902, 'DITNcuHzWZBcZXxNZoMD', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1903, 'xz2AKjQdoUNevGcuD6Oq', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1904, 'LuxdXmjF7MONaxvp6OVc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1905, 'Cn3GcXOpj1R2BMJR4JoQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1906, 'WwkMsLF4mL2C4q4OhYfg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1907, 'IR2Efln9WmWXoWax7LbK', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1908, 'ugEXJgRSxv23ud0XOCRc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1909, 'xWFppoouMkWhieEESrtb', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1910, '6aHvsGnhbcrb2vZcxYtg', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1911, 'heSTeJraZiN7ysV1RmaR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1912, 'XIbyGBkFvyCksO7JOCta', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1913, '54H34qqZKLFlQPufLo3L', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1914, 'GFxq04YN5pgpYyGTa4wk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1915, 'OwOlFb3ORRZuZnOO2lsW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1916, '9cU9oGXSzEJJQSCNUCNR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1917, 'b4BMGqyv2XYDJrXYFRBF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1918, 'zRuXDjWDkL1fm0kARZJ0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1919, 'jdxUcYroqsC3scvIZGCN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1920, 'OWPsDJtGVnmVjA3EHad9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1921, 'JCTwO4fYhOK2ZDCm2BEB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1922, 'tPyh9fhlUcxwCYSNes39', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1923, 'p7u0Sn7mHGFEqP4aWUvF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1924, '0MUh66AM6zFgASWASsV0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1925, 'fySQwG1Rxn5aIU95kxUA', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1926, '32hqxIoVFTiP2nj51b9i', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1927, 'sI2NejKChcrPApEiulRd', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1928, 'FuCUOjLwWWwxC8Y9r2WW', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1929, 'aQGL0VlTOdGr489ZOfwv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1930, '1VzIvRdcXUaLR0F3KWQ0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1931, 'jx5zuNw6AGLPIf7FP2Kl', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1932, 'dyoN8dto2YC9XEXoufn1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1933, 'wkDFLGMQ6PevRSxOQ5h5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1934, 'YW80dYmxoMdD8w261ddr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1935, 'qtaWjKwSBa6sJTdWwoTG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1936, 'it5WmJoCB62PagKredgR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1937, 'FQzGXk1lL56F6bwciVgo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1938, '6w8I8SbN3RC0UBNzPB2v', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1939, '3m8yeHareP7c5b7aZCOj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1940, '0JaA2xVXBeSPcdq0xyCV', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1941, 'sleb5MjfOJktCyanY2aN', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1942, '7FRBJCVMEvJFZFQ90hQu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1943, 'n64WH1j6z1hMCzXjj6Ex', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1944, 'zK9CP5esQq9q8NaDJfTs', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1945, 'gjd0w9IBJTla8yuuS2a9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1946, 'hAB8WH5ZYVoGOZv7jA04', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1947, 'OR0ZaF8IZ32swqb1CE9B', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1948, 'LipFUk4byoGpy7bOuNhk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1949, 'j4Clxu8set56Wr7WUY9k', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1950, 'le4E9m6XXI3U0x8YC3jp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1951, '51vgvqdLXNdlFNMb67xG', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1952, '5FKqtJEoDbxrPenyICIu', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1953, 'fbChf1iH5dI5GYnjzlLR', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1954, 'NUugkUbafeWSlHkeEdAo', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1955, 'aHTWQXMsGGw2U49ljZ3H', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1956, 'SARE9uJotw6IvtyHTStT', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1957, 'fxgrRKGmVBTbwp4tyoTp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1958, '6Pa6NrilCSNmzeCQ75oe', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1959, 'iZ43jjrBsxHzCw9SIaNt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1960, 'G9bTVn7ArJ8WY7vCmxmS', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1961, 'AwrBDXXnVA0xQ5cZR3Wk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1962, 'BWeCIVmkiSi6FM7ZEyF2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1963, '4tFImoP6N1p17XAeMWP8', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1964, 'mGqjxs6CiuDbtt7T2Lho', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1965, 'fCSlZsZHEaJG9FwHJ1lt', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1966, 'ogSSgecyVIIYEqm1ZkzI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1967, 'IvYK8yBdzs1oIchs1F5x', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1968, 'VLcL4m5OqDHQQYznuNfn', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1969, 'MqAYjcdHaZW9QDwmKTaB', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1970, 'BMQdrpeZlsIpxhURktrk', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1971, 'pxHVDhABrFuIBzN9rZDJ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1972, 'ZQqtszewDBcOwbm3IErZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1973, 'ouGFttDvbQnX74Ju3s1Y', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1974, 'KHOntY5gHKdScOaF2ExF', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1975, 'vZJlZrhs0fB7utO3APQx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1976, '41lVinI3VNJdjHjv82Hy', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1977, 'i7d1CURpFlplPlm9qND1', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1978, 'Fn33bWw2xpO2PjESFnRj', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1979, 'wxM5k3fOO6Gn2nJWONgE', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1980, 'oKavsFhVXSX2AKwjJW5Q', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1981, 'lANyz3g4uRGxtTODMuq5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1982, '0oSKHphTL2xRx2GL4yO0', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1983, 'd08ZzTSisNVbJQ6KvS3r', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1984, 'oR5Qk6Dp8tJ4twXfLoJ4', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1985, 'yC89XjmAEDBR7VpwV66P', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1986, 'E0JubVCTNJLmzDvezCPP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1987, '4IGkixTdNMRtwelFbrrO', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1988, 'shMS9I2mj8u8TEE6tfFp', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1989, '3jePHAVyt3iN0HPSeKx9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1990, '35EFB82Ue1FYnDvIrOny', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1991, 'pdfKvvKWqTQtASdTxaO2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1992, 'LZXhmWnZhK9LMjfqjMEU', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1993, 'aIpiTz2IXkJPlsTGSr3x', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1994, 'am4WL3h5utf6Kx1bGnVP', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1995, 'J4dW24ZVYndCon7rbfrc', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1996, 'pbRMC0lnVWaS9edJWEpQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1997, 'PPCnNhVpQCl2ktqijTCh', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1998, 'Ha6yZCn0uvNSleNclHLX', 2, 0, NULL);
INSERT INTO `jhm` VALUES (1999, 'u8GVTK1PQNPeusdRRD0N', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2000, 'm162Ep2FNqbKl0tWflQZ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2001, 'nuSBt1IVmq3i3GaQfgQQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2002, 'O5sFefw8USv6MqhEiO2R', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2003, 'lGcR1T6purddYVtjWIX2', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2004, 'HEyO5tkRpCvUpwmO2Cr9', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2005, 'iHvcvVddOA5wH2dOkN21', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2006, '77xTWR33Br91YtUD0Slv', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2007, 'EfeKTL1kcd368CKJyvn5', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2008, 'TuF8yURzmpleBwUfBcvQ', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2009, 'tgJj8SZIjFDokDpAd3cI', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2010, 'pjM6X6VSwmTt67M13VIx', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2011, '1dgtwlhTfwvGnAwufAG6', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2012, 'YrWb3Muehmk7oc0oh7zr', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2013, '17JS0gNR1Sn5Ni6wUHu3', 2, 0, NULL);
INSERT INTO `jhm` VALUES (2014, 'YTIvp4ccZbHwO3Abyrgi', 3, 1, 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `jhm` VALUES (2015, 'gDGkJ2YW0jsZY6Lfngf0', 3, 1, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `jhm` VALUES (2016, 'cOpjLmzIwDO9cipTAUIF', 3, 0, 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `jhm` VALUES (2017, 'NkinAie6il7QkdImDbBI', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2018, 'j3UBUMSb6aWjEZv4CSYx', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2019, '9rcI91SCb1DUNhrc67pO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2020, 'L2YYpJXZGVOz93FVJeWK', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2021, 'DcF4h1riZEjiXmPXkQcU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2022, 'YI97TNjIKQQbI5toFLad', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2023, 'ymU6LKEsFuEknr6RhX2D', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2024, 'jwb1I6kKdY9pAlzFqDVO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2025, 'Ml5PRn89aAe8L6sZXGAQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2026, '5zw8WsQv758b4aUnLOyo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2027, 'o94vZphvTmNOmX5D0aIX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2028, '2iGYISFbrwSRoAgaEDU8', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2029, 'w16Eh5MNRvWfG9BIizIc', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2030, 'PcW9vZ0ht4c3zgkST2c5', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2031, 'nhvNEFSX5QQqkfaOBuNV', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2032, 'hFNm14twn1y8ynrAJQAh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2033, 'RKes1B83Eqx1PG10Ic6O', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2034, 'qoHDleLOM5vl7kmNp8qJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2035, 'hP5CArMAAocy1ZeXS95F', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2036, '7ZxGML4P8DHFA4BXjTen', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2037, 'K5M47h67ltifvtKNjG6i', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2038, 'pnRcGRPOfczfOca2VJOv', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2039, 'VvhdDr1qlUzbZ0DFw2Cd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2040, 'Jvxx0hNyZL99DAa2H3od', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2041, 'b38UA3b1lywVekIC88vN', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2042, 'wA0SUTtAujJzaQTS052K', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2043, 'GEpNx9mdvC4EPcJfDABO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2044, 'QSHVw6x0B8sknLlarc4x', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2045, 'PmpaBso9rYuspdu9A1x6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2046, 'ESrR7R4ywtWx5j05Zxp6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2047, 'BM6vS0KMi3orp7KFIr0w', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2048, '3LCmGWDGbpBVTa0MviBd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2049, 'eMMc0C3xinvmJKGwJK4w', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2050, 'lwo1ePyKQphYaarAoeMu', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2051, 'dPX3aWTj0ucN6HTfEJpK', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2052, 'kx6GWkzTBHumMwB7SeZ2', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2053, 'IRjJqxZo0oVO7i01VDaR', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2054, 'IVXyIHTW7IWLBfT4aC87', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2055, 'tgGyLRZSqjlMoqHv2sh0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2056, 'Vi3bvhDZbL488dGFZU3i', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2057, 'NuieETG9UXkC9WDvKNGC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2058, 'rN5HltpoPzTLn3cw43zQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2059, 'gq2TkeTXaXxMqtqJtyBd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2060, 'qdpq2eKxDC9SprQr8ROz', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2061, 'ZmwC5o1sqdtKyrJFpfmg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2062, 'y35l2t7tSi6KUgCkTKTD', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2063, 'EEy1lvRWLeFwPMDRUTdm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2064, 'hcQT1lkn2kFfvkIFbef8', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2065, 'dNUkVlBgj2R9j6PJFesh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2066, 'd0EAKlMC7Spg1q7R5PPN', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2067, '51rB4hHSXuDbEQAs31cE', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2068, 'IuyOU3figqCqQtPEZ1D6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2069, 'tjU2BkYxM3IfSLafoDB4', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2070, '3liXl26Y6LMtEmnAOOMT', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2071, 'yvBKtjMZgKIscECxqqgF', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2072, 'wPVHWgcEh6aclwd7ITzg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2073, 'UFkmb16ahaTS9KdOVnNJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2074, '1VurxG8qJYVSyHo2akEE', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2075, 'a871cCiTaj9rLWyuD7bC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2076, 'zQhLN1woGTvw1NDhe072', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2077, 'YdQttYPl9TQ2HnxtmfHc', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2078, 'Aap7XTOaCU1iq7myffrk', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2079, 'cnEMiG0xz2LaW5j8UYDP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2080, 'TYSz1ld6e85kXTx2d867', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2081, '7xYxRCqHTivOnGIVIf8w', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2082, 'VtK9A8DWB7tZhSdAdFsI', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2083, 'k2TvFOxSuHd8UzOIE3aw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2084, 'SsqgCJI3ylB8PGaSRchl', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2085, 'WRtNSsdyM0LKbwjLTg02', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2086, 'gvvYF1KZC7oau0f5s2pR', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2087, 'PEFhxOWCtaiqsgRkmW8x', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2088, '48Cwb4ZMIZC5kvReQAjd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2089, 'YlJVr3g12bX5b8Nh5WDb', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2090, 'Y1rIvtqPcbKpSduiXiat', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2091, 'HSbNVv67CsXT3ruDQCvt', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2092, 'fzK0zLHi9JkY63SKVYpW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2093, 'kqQi4stSUgNBsVxXsRBG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2094, 'RZZu4UnwvaLlAZjhxN7H', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2095, 'VGgdZEnHz8Na2M802LNu', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2096, 'ZXjiqkdhWj7KlErNr4xh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2097, 'QG5I7GvS9S9KQfs6zWkm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2098, 'r7w4zYslo5FFT51aLxdm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2099, 'Y4Zze00JwKLQbxaBYKpu', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2100, 'DnaHOYk9tE8y7wSFMjZo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2101, 'ilxkZ6XXLfGAUCQLAttC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2102, 'mIGdZwxubkanUdyttSsw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2103, 'BK1k3py5aE20v1roPZyo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2104, '15t6QwsWtqvhGYZ6Eh0y', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2105, 'a005W1LMhHQvqAOM9bGs', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2106, 'YzOkQBzA4yg5oG3xGUj2', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2107, 'KKd4rmoGnOdpXoy6du6W', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2108, 'XTcKyyH8CEIQsmXvsR9G', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2109, 'KIYBXiSVgpBq30ukpnc1', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2110, 'SBLIJHCdTQoWqu7hzXVj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2111, '9Vm0V7z8hmmZzDD5RJ3O', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2112, 'MxGKJk75LQMnPbHjCMIl', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2113, 'tVWV1jCeK0VVpw3oEDiR', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2114, 'bL3dnt8FQ4t1Wp1AaCKw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2115, 'WOrttxzvlvvYgMm8KRHe', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2116, '6QpdES0tEVEpkOxUBWi9', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2117, 'b6RkTHqtaVOffSb9tGdN', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2118, 'UWl0Gs759kQhDgDP8QA0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2119, 'kONNVgdrF4cmtIbJMv8I', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2120, 'nlt0WV5giAVnC4QGGbUS', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2121, 'eLCEob7PPU8iW7oxQBHg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2122, 'IqU5pu7zuymRUQIc7VjU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2123, 'fLKKWgN9LjJPZHbfotDl', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2124, 'Foi3YiZjS7Kg4MrRigzP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2125, 'w0brJqyMppckTaSAWuRX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2126, 'Q3NDtxOguf4mbHSdBN3t', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2127, 'VqrZ4vW3ru2OlgSvp1Si', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2128, 'JnOTGCdBid8MND5jATdX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2129, 'tfpQWCRf3iDGuOiTtuuG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2130, 'aDXv515HGnUfy1r8MozJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2131, 'hs1rbeF2YppQwer7UxSY', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2132, '2w9ZovgVuGAhiwKFim6S', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2133, 's8c6omNmqbOokjbmva8d', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2134, 'oDp7tY1Y2zRG4EDDRooQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2135, 'XA6c28VKxHQXyUixiYuY', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2136, 'l26I5MPsLi9g7o9rNWeq', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2137, 'foEcnaxNfu5UBXY6nW37', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2138, 'PhMQQMopTzlvcK0qLqII', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2139, '78P7wMt3saTHbW0ZB6dU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2140, 'QqucgGhzg7H6VAa8ydQJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2141, 'BqBhvxojmcby9SVqlHUA', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2142, 'JONjI5oCpDCw6vwnKumb', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2143, '5qzIpgXjpFpir8l6HODt', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2144, 'u3bShinmvPzQ4BS3rCW6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2145, 'iGxQ7l9731eT43Xya00T', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2146, '1utWBbqQYmTRi8BdANQ6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2147, 'FEEKuboLj1ykIJjNOmWj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2148, 'NhAhrClIoeZYMmH7e6vC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2149, '3hxTI83FcnUqr0ACo2Y0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2150, 'usyuvtj9IseXsx5CQq8b', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2151, 'Cw1V5vCa7QPsYmiZaCIH', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2152, 'sNxme0UdGq5nFm5GrJTe', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2153, 'LUjLp7UsW1N7YuMQ3lAG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2154, '7YvwfARHQR9KPSPuL9G0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2155, '9zvRC8OnkP9Wpf1Cgqfc', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2156, 'YP4HNU6kR5swoPrr0tHu', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2157, 'NSo8eSkLQPsJh4JcCvYH', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2158, '61rBSBhH2UafNEqtHCHe', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2159, 't2G45q7laI2RhSP6YGQW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2160, 'Dt7ZTPrP8HoKxNcECecC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2161, '8ZwGCMpxM4n03DK4Yfml', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2162, 'w9DDMUUlBkrI0csbaEre', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2163, 'HCf61ZWeh6y6TS17TvL5', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2164, 'rA72EzMK76sBARnFjF7w', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2165, 'zfQ3rqHpM1SspTJXAWOK', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2166, 'rZxjb4Ed7kDFi3YnfTai', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2167, 'XD8EGlvkhbx6f5ix5B3N', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2168, 'Kz1FhzCxRSmNmcsHtN40', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2169, 'J0JeMmjCsztYSOfQzY3k', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2170, 'p5ocoPEcwx1xAsRRqTMu', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2171, 'BL6yJMhcssTYFT9QPkVT', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2172, '6M7AxNogKKSOK0D7T1kg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2173, 'PsTKxpVpmXcRgQQegL6x', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2174, '1U49RPZeevsEjimbaE7X', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2175, 'zzojZqdaQ3CHrmWZjgup', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2176, 'ioUDvwuNIuHavJVtsSPN', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2177, 'NE81iYKmoh7TO8Cl8FLw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2178, 'YxILY7OmFaBvRyGgV3QG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2179, '5jrDZ0yvi3roX5u04eY6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2180, 'NIHPaJ3n1JUxDrawy6au', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2181, 'qn4X7rIPFTljKETwquNt', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2182, 'WLYmvFQOsLueagjAs8vv', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2183, 'lIFoqqou1Od35KkerM2V', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2184, 'OWuDg0UwR6dRm64gJBDW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2185, 'Vuj57E2MZWmYYukaco3m', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2186, 'Z684HkPboYtcSwDxw2Te', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2187, 'G6paw6Q2eUDl9J8FoFdl', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2188, 'Tqt7USceBb8ApjZBEcH4', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2189, 'iau4AmUvSfdPyxU4zuuy', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2190, 'wxFtakvMnYjBwJeXG2VB', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2191, '7Z4ERdCXoRLzJBI4yqgm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2192, 'tSgWom6rJAl3hU5qAtXU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2193, 'Gr9tPZ1GKBUBtxBzxgfJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2194, 'aaSMID9D2PVkaBRdQzzm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2195, 'Y4sMqup8LRmodkTVPx7Y', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2196, 'Z1TLgbf1yDux5zrr3187', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2197, 'VRvzJMv7Hk3pDi8u5626', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2198, 'O0gCoBqioTEfrramdd65', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2199, 'rPnYzsqcHbZ0Huz812RI', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2200, 'xU5UselK7oCJgOuzXar2', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2201, 'UEwrRvbAaTWvtkTNWH0C', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2202, 'y0A09DnsBnu0XggDY5ms', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2203, 'LsOQVWEc6wSBOQaNjucY', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2204, 'Bq3AfqbVirB06KHGGCFi', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2205, '8MF7sjxQeBAl2AMXTk3e', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2206, 'ghRxB9X9LJAKs9zilhsy', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2207, 'gSiqHWHcTCB2wOlvLosq', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2208, '6xnu5XfBNW1xku1lZRAk', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2209, 'J5lQF6sbD8nJmyEQVK9o', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2210, '4lfzvEI5dJ0jsbtPMRee', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2211, 'Jz3WJVlOglZVTIJcIDui', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2212, 'L6b4lquuIw9OYP74xKpf', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2213, '3WTnNfCfPFxGPIN3FHDM', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2214, 'FjUFJC17TFbKw5ykcmip', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2215, 'ZQQMaBxeCXl3rxpwHyDf', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2216, 'S96F9RZHR4SnUgxdDneb', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2217, 'kYrb0Z1gskHxrhqlKmPg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2218, 'ZXmvmByVzuFJ4ef330jN', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2219, 'TPlX87aOitZQPB6tJMiU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2220, 'VLQ1ZzGF8pFQNfsBUYYO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2221, 'o7W82rFLdZzwqxWjeiNE', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2222, 'Mlwl2AntktGexZLdcLw7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2223, '1YZVDmgcpwRS9d3LUQIk', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2224, 'RxWWl5G1m9gi0TVjThIq', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2225, 'MiC4tZFvv00mtmv3jKPW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2226, 'QTI2tXwMCUOABeVOdddU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2227, 'kPkjWIcgyNWZpLUd78n0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2228, '53n63dQ4NUp6gRyl8kSN', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2229, 'j4lfqQn4C8Fnk65SSD5K', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2230, 'sfGnLF4MvrmpHc8wxw6k', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2231, 'OahQtiFk2qJo3BCu0is0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2232, 'xoomykVpqpmsCv9FzuQi', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2233, 'ZYyu6sXjlRUd8TkUPQuJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2234, 'X8x84yLoiap1lCZqsQte', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2235, '5VrhmRMs1KFy00ML1CoJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2236, '2H7R5TFxbd3tPtPymNwQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2237, 'WikP0t1k8JhOREWJj2QU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2238, 'lxC8okZvBO9f3vhyEvib', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2239, 'jvFK5DHYa5090ftcRLdJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2240, 'IDT3qui6tZQEiItqT8zp', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2241, '40Sw5IsFlVpSvBejV6ud', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2242, '526Z3BzFLwnK7K7k6PYo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2243, '9Q3Kmd5CkDGhlORF7jRH', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2244, 'EgVTYDdOE3XU1FBHHTCg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2245, 'SYUM2Ln6qy3nB1eurbhc', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2246, '7lKvyta4YieLKbR0xeLe', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2247, 'fql7rKpfrcARzcEPoXkG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2248, '4rcgyck1JE21aTQtmfHL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2249, 'wRwRLnKK6T2h9soS4Run', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2250, '41k4ng0xplFH9qT7T0jy', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2251, 'bSPmxsomPgZR11dR4rSS', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2252, 'C3IcbVK8GA4BoZp5Bzbm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2253, 'Um8di23tMFf2yt40Aj48', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2254, '0N6YQ8hoMNXVi1rjnZAs', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2255, 'yKho3Z7UvO2tRUQjd7sG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2256, '5tQ8rM3Leab0vDJf2NOV', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2257, 'Q43pClYkTZfURF6zXDxL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2258, 'UNMryPdv1JL0ACUfw9IT', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2259, 'J116ynUkv3LrIkbhLjtX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2260, '68IuqdYnzihYMQRGWCus', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2261, 'Odnq2ypPbb4NpZSUorEJ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2262, 'g2kxIGaig9XXhr2r23DP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2263, 'rKXSBTy9RTCR2pjeFZFF', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2264, 'zkDYDbrpfJ59YsXcX9Wf', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2265, 'THaWtjv5cRPYa10iKC5N', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2266, 'AIROipuD76j3uLsPw8e4', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2267, '6Bdpf9C24bTnNSB7JwqQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2268, 'AR6QGOHuNiR6L8mFg5kC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2269, 'iOLcKaiWlU2rioZfM4xo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2270, '3jDxuUFkUUAM2N2dUDpx', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2271, 'GGTuu1o4TdggLEK6g0tX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2272, 'Eb0WV0y39KCQFReAF4r5', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2273, 'vNV9TIYlcKQxr2mKBaSa', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2274, 'wMbukfKNXn9acB6fVhKW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2275, 'PSMzQgoH6Ewsr0SPaI18', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2276, 'Aom7YXzPb4iPNWUuTSqP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2277, 'rymufKk38shVPy6J2kU2', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2278, 'EGC0zx48S4McqlBs3lOw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2279, 'N66C6HlLC4odyKGH5OEj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2280, 'FlGx7lx73jnBl3VExLIm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2281, 'c70R8SxNTcPSNP8HWfZj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2282, 'UQQHfkEa5X8Z3W5flxIG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2283, 'Fumjm9gAZqetQOdw7tKX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2284, 'bZiqQYrGoF3AuBIP3INZ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2285, 'CLjYVeSwxv4i5TW4J3pO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2286, 'y9HUSwJwDn3xPYPVnj2K', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2287, 'xB6EDG6E7HGfbpau9Qho', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2288, 'V8bphh2CnRnOWfumMSGA', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2289, '7Hb1GfS9hyMefY7bHi2f', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2290, 'XKZBPP8NDVYJoiaWjqcv', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2291, 'LncuuyzdKmF7YW6qyuLE', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2292, 'E6NHMGu4oV4QE2VhrevS', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2293, 'BR9pJH7ClODzO2VNRlTj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2294, '1AgZ2gfkQBQQAkevOh9Q', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2295, '60yYLhrLG7xMyI4mLCmK', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2296, 'efbF5rk4TaqD5z5LgtSX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2297, 's6rBhKvZr7OrwtRCzgYS', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2298, 'vkGeEoCmdbPz84ou7zSi', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2299, 'LIDtRXteT6h4xoRklngL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2300, 'LMxpovnDCMV3tXmbDTnd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2301, 'Gi7IFkUZZFfqkokTcwIL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2302, '4gbWWMTnsJpa4Xq28skn', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2303, '1QFC9qTWa4KFWjNIAxgG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2304, 'BA8umuHctLr2LtTeOZQL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2305, 'xpgTBKsOdJwjl83FJHVO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2306, '42Ezk3BR3QBXhOEbUy8F', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2307, 'X1yN2BDzcOfzmp4cGYYt', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2308, 'LMcszYuEHi7whbXtGXBn', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2309, 'B7KWIQL5HwE9uedTlm5y', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2310, 'qdXoYhc5uW0lNQDjr0w4', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2311, 'DBWAiciZVUx7oeAH1f5b', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2312, 'mBGunXgIsRAbBSWbre1I', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2313, 'kYNZcMqLhs8mWWpEUDDO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2314, 'k5nnP2PFafM9MdngmUGV', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2315, 'LYkHE0JXy6UK0gjlcVyM', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2316, '3VMvjjTactGV1xwZU3bQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2317, 'LZVhcGg9xB9DDtaDZKtF', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2318, 'OYingvWa4WAXrNd9eHdP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2319, '0Jwo6RFwJBSs68CNpxL7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2320, '9pfarchBjaXjOZ18LRon', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2321, 'nWPHZ7RCqp8pYclZKujl', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2322, 'uyjvEZQBQLLMcqjbW3op', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2323, 'qR1ws5inoFfQ1cAxjGOi', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2324, 'RW40Xp9UyhhkWK2wXvxr', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2325, 'TPtdstcjtWB7KrZbPS72', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2326, 'FOOknKcGqD8qyO06RYSd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2327, 'SVbesJUXN7IM2YE64Tvj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2328, '4tpTBhNRDK5UeXWVDdW3', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2329, '6z7Wxsu3r3bj2Mb3WOdm', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2330, '5S0wW6hDOyXZIJ4P4R6n', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2331, '9ybaS2nav6SqS15iCUcw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2332, 'ew7c8U36uakXW9ZbTgNg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2333, 'grKNk1ZaMDxk1bz8u9Il', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2334, 'rJ4qPOBIaIP00KjMEtcL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2335, 'fmbyf5mecq6vhiNctIAQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2336, 'BOWcGi7Qfl23y1U4it81', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2337, 'Z7HtFwNuP3MgUiocBzeB', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2338, 'Evp7NOzMsbzzAn5xCJ4T', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2339, 'LLZ0HstEfJDErpWrTWMx', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2340, 'VF0jfzujWaVEZdp0DsO2', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2341, '6d2YyX6GDMFifoOYo4L9', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2342, '6hrsVoMvVOKhpWlPjDum', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2343, 'iOxrp8AcYid9pzCau7t3', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2344, '2pq3QWiPRppbM21xN4xw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2345, 'UrXWdUyWUrSXjF9QNESu', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2346, 'DJ4sZOEvIxWzcqE6Ki7M', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2347, 'Rw1Cf6dsMLeA99CrkDiF', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2348, 'U9HLGPAg6uyuEBFazFoM', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2349, 'Ua3MOxe1Wg0jFNoJPDfh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2350, 'X3duLyEHUBLariuRqnEO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2351, 'v07yL0UyPqhZ0V63PC0p', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2352, 'aFUTW5nM6q8mq52c5LvO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2353, 'PPmt96DfFsZUV4X6u6gR', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2354, '8X4LddPeL5tvrP4VTQnb', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2355, 'IrQjWL8RbOhTN7CRCmV9', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2356, 'qQJOmh7RoKfRiDGS00mg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2357, 'd7RidWbwXvnNz9c0v9b0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2358, 'SCqqzy9UokJMoUR652Nd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2359, 'VYUiBxXGdTxME1C9KS4h', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2360, '5bvujyT2hWehOnszlxrE', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2361, 'AL0EMm3RbCHnqznleSgQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2362, 'G8ZroOPkibdx5O5nLKPo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2363, 'ttq59YkPLxOk8ehvl525', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2364, 'nmSCuY0BQZiSwVUttuw2', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2365, 'GvAIafURdqS9ySzMGxbx', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2366, 'zoatY9tZrLhDEYUjhJa4', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2367, 'dTgnmOAI6AB0O6KU5NPf', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2368, 'NSchgrMuTUrLjl24OXZ7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2369, 'K2bQqBsH1rLBC1rvVqB7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2370, 'rWVg00KW7Qr3VyT5K7jB', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2371, 'LkHNNydry8fbvmSX4mwO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2372, 'ayl1PYn6VzaRqtdpnkYA', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2373, 'cZrN8ITtXZAZTv95Sbbu', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2374, 'YuKI5HyFyPFwIEUaWPEa', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2375, 'OI8qdcNuhe3bPHz1y2WH', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2376, 'BAselO7LZv1ejmqUXaTG', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2377, 'dQhqr8PIrsr8lEj0LGf6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2378, 'EHsQKuc64WcwwaRoyu0B', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2379, 'znOoMmhlnHIow3dDluBw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2380, 'fCABtCNW5tQZzveVKgzs', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2381, '3zfxlBdSRRrXCxhXfZlf', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2382, 'Yie6NxkbPyqxfFPxYTF1', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2383, '7ls1c1fFjDTEbzAMODxU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2384, 'qn2uNUIs373463fDfVQo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2385, 'MKZVu7QrWbwA7MEUSMpZ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2386, 'fW1fsrrvm7PYs8hATKL7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2387, 'gCe53Ctvr0SGOcMhT15U', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2388, 'rEiubnZq6iz9laxy5pMO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2389, 'HbSfi0UihyeOVDjKUYqL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2390, '9uEkC3CVTfy0MMkEkIY2', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2391, 'o8CCuZ5b0fxMUoBenCX8', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2392, 'koRU9ikMLw66BTdvIKE6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2393, 'vvdQbdr235kWdZO8ozCo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2394, 'f40DiJ6oRSdmYKgK2pyd', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2395, '6LtsB6C1sh6MFcFiSayS', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2396, 'NaE2tgndgAB2zjqEec44', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2397, 'ZkPPcHE8E5j4VZi9pNQW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2398, 'ReJyjzWHyczcrChdBSpM', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2399, 'Vv0axIDx5BSI0nyFIGjU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2400, 'cqYiEC2it304mVquF6TT', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2401, 'cN7fjFVoH7Lz89TYqOvS', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2402, 'hrFowH83b7IDCQSYQ00A', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2403, 'owefuUlSQkdyMElGj46n', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2404, 'HhnLzqGJNmC5dbkGc59q', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2405, '0nAf63lcTn1hXGiy4xX0', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2406, '7nEbzY52xdazXiVJpWj7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2407, '4Rna2S8mF3vL2sKtiHzL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2408, 'AlQLDJYPg1ne1m9mmwvR', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2409, 'OpSUbNbg7tPoaOkwzxaj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2410, 'dnPqN412gyYNN7rGDHmP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2411, 'gkVSQponjB5tCMV1F1ko', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2412, '6b0DrHWwsvEEBUPbtOrM', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2413, '3grRVCmUmbQoploAWoab', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2414, 'cFf6ZrFVNqIKUwekJDOU', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2415, 'lAph62PbJn97GM46G3NH', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2416, 'EyW0C3F96R9CQLMypR8Y', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2417, '5lP8S23y8ohM1QD8mcMx', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2418, 'beRIZuZOnk4CCuoqm2Uc', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2419, 'yi2UfeddrFuVBruHRKpD', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2420, '7d7L43CvRuGpPxTlV8gh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2421, 'd22D5KxVd3hml1hbrgFb', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2422, 'JtjLOxpAEKdglxH6vQcx', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2423, 'djs36NOmIp7ChUymF2hg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2424, 'XVsIBIS1s3MxqE2AdgyP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2425, '9jHT0YesoIbim4ZKPSDN', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2426, 'G5l5sBiyHxAvmcQ62VPh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2427, 'VJDopaTthcklwjdH8gs9', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2428, '1rY9GCw8uYARnkybMcpi', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2429, '83H6uSCfNNpbwY4AQKS1', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2430, 'QZtl0Nd3frIQDnUr66Rl', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2431, 'eZFdeHbI3Wi4fNj3u1SC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2432, 'KX93wTH2UtqrAGr27aHn', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2433, 'xpbj6Kot6U0gFw0heSpy', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2434, 'e5456nGsphOEPXkXWD8l', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2435, 'KqxQpQzN85jiIZQpB3nB', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2436, 'ueHcxCJEMufQU52RMf6n', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2437, 'HdzpqFFZys6W5daEunBt', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2438, 'jOQcEeUKLD6UDYLV4Iae', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2439, 'kzyrG4JA7OIKsLT6p2mH', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2440, 'CPCOvYKMPwwmsYE02ePc', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2441, 'ecTi19qEKeLFs6yfs0Rt', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2442, 'aB92htkhb3GCFPu0ijSj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2443, 'RfuuO2YwU8MiWheCEc2r', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2444, 'cd0RG5NurIrNxJbypERC', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2445, 'evZ6zd6IfVlDeT8nh8Pw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2446, 'OGaGGuPSzFIAUAYNF5RO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2447, 'oBmezvGmspYr67TOA4GQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2448, 'etgWcttwUO6gtxZs7Jkn', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2449, 'eXTJOxFeTOg9dw1porWW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2450, 'FK7VO00tiq8ICDc3pmeF', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2451, 'DYkNV5X7Fjoy0JiTnP49', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2452, '9xRGRfER77sKS8w1xWXt', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2453, 'DA2f1nGal8BochZKyNIa', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2454, 'p5UWvGXkIkb51OxqBPDg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2455, 'OmpIbZSbP8o678DJBWWh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2456, 'YyGutfigIeyacrpI2fT3', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2457, 'QZCUsISN3iu2oVNUzSmq', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2458, '42D6PSyTzNsLfFNa2uJf', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2459, 'OOwdEBmWAF3jyd01nqZR', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2460, 'O9wnu7VGl5hUtgiGcEZO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2461, 'xBnneiGn8JKBpDF565Mp', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2462, 'zRWXFaKaUwEhCoNqyhyk', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2463, 'fOvGvHBbwmr8jsEdBzUL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2464, 'R2kf3JWI8BPBYJbOZEWh', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2465, 'd5Ynm1yR3hH4HYPKz5AP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2466, '96mCeLlmGEjAC8rmtFCX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2467, 'XO7JltqpKsaj34CsgxJD', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2468, 'FOCrTyUT43Jjtt3qbWtq', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2469, 'uW84Hw7CGKeQOdZz3fLg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2470, '8Vh8dCo96UVA7Fgf01fZ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2471, 'za4aqdJrNlWegkB3IRE6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2472, 'PWULrUN0Exug1tjBVp4h', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2473, 'CfyOwB8auv5gLcfPxXb7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2474, 'gIbwwdcbdiGqYKTJ3gvA', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2475, 'b8NUtKE7Dv2Vmp6eJVTv', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2476, 'NVhe1vmZgvr8u1K0jPcO', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2477, '7nrWdtWMamclSdqG4CoT', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2478, '8fzIuDNLfczW5tHqZdcx', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2479, 'kdvIKwQBc2SvhnrH5QM5', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2480, 'nfj4iHPpEWwNW9ALTPQ4', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2481, 'HPVa62C0PsEieFvwayWI', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2482, 'DmBCVcvDX6wvV9Mrb5X4', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2483, 'I3xQ5YKBKhUMNXaMnG5t', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2484, 'uCUI104hfdyKhFWEApl6', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2485, 'h8WtJy91FmiGxhrvFXn7', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2486, 'yvv6z0DllQxwACIteSVW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2487, 'vGJqkKW4pvwtZIs1lhTQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2488, 'Gg9tgxsIaGXV7o4AlLoj', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2489, 'osaBYlcei3G8PgCzyaNw', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2490, 'TdPOO9Otyjcvw6AYbUak', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2491, 'x2Gz20fjDygZGHqcp3ax', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2492, 'PQd3PhqjcjDipyMau0It', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2493, 'ba90GbfSW8DCpOCUpg47', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2494, 'bF1PfwYLFp7Hy2tkNo6v', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2495, '1xaZHNSyEmxtCapAhyqX', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2496, 'A8v6GUFltrWO1KIcVvVa', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2497, 'e77PGZY1Jf4MuTX0TZMR', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2498, 'lA4GHgEVQzQcorvz20gg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2499, 'wf0gHDyFlRxkkxAviYLW', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2500, 'pnOnx0xuWPJalWOih3dp', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2501, 'hkuATSPwh9dToSGNEyHo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2502, 'E8gtPIk0hU1Xmpt0931f', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2503, 'D0SkOJkg9a5mm7XPLJPs', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2504, '1rCJ33q4pSYhoqKb0ma9', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2505, '1JQ5S9T0nJzHiyeXqSmg', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2506, 'EePnio1HTZjk2d6ktNTD', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2507, '1RabIZiI1lBLDuUEY3TL', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2508, 'nAFGTOgYfFqckv4UMHaP', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2509, 'pa2ntF4mSKItbDXBJY2V', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2510, 'vYysCAx0Q8QW5Jo7c4Bo', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2511, 'JexjY6GjOiVCU8gq5DKI', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2512, 'jsRw12TsBDRgdR2E87iQ', 3, 0, NULL);
INSERT INTO `jhm` VALUES (2513, 'Ihn7a2UDStPaq3ezsjuh', 3, 0, NULL);

-- ----------------------------
-- Table structure for look_yx
-- ----------------------------
DROP TABLE IF EXISTS `look_yx`;
CREATE TABLE `look_yx`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '浏览游戏表',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open_id',
  `yx_id` int(11) NULL DEFAULT NULL COMMENT '游戏列表id',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of look_yx
-- ----------------------------
INSERT INTO `look_yx` VALUES (1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '2023-04-11 10:24:24');
INSERT INTO `look_yx` VALUES (2, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '2023-04-16 19:08:56');
INSERT INTO `look_yx` VALUES (3, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, '2023-04-19 10:19:54');

-- ----------------------------
-- Table structure for luckyCoin
-- ----------------------------
DROP TABLE IF EXISTS `luckyCoin`;
CREATE TABLE `luckyCoin`  (
  `id` int(11) NOT NULL DEFAULT 1 COMMENT '金币抽奖配置表',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'luckyCoin' COMMENT '金币抽奖配置标识',
  `luckyCoinBackgroundImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '金币抽奖的背景图片',
  `luckyCoinItemBackgroundColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '金币抽奖的奖品背景色',
  `luckyCoinItemSelectBackgroundColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中奖奖品背景色',
  `luckyCoinStartBtn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始按钮图片',
  `luckyCoinImg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一奖品图片',
  `luckyCoinItemImg1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品一图片',
  `luckyCoinItemTitle1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品一标题',
  `luckyCoinItemNumber1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品一倍数',
  `luckyCoinItemProb1` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品一概率',
  `luckyCoinItemImg2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品2图片',
  `luckyCoinItemTitle2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品2标题',
  `luckyCoinItemNumber2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品2倍数',
  `luckyCoinItemProb2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品2概率',
  `luckyCoinItemImg3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品3图片',
  `luckyCoinItemTitle3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品3标题',
  `luckyCoinItemNumber3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品3倍数',
  `luckyCoinItemProb3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品3概率',
  `luckyCoinItemImg4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品4图片',
  `luckyCoinItemTitle4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品4标题',
  `luckyCoinItemNumber4` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品4倍数',
  `luckyCoinItemProb4` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品4概率',
  `luckyCoinItemImg5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品5图片',
  `luckyCoinItemTitle5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品5标题',
  `luckyCoinItemNumber5` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品5倍数',
  `luckyCoinItemProb5` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品5概率',
  `luckyCoinItemImg6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品6图片',
  `luckyCoinItemTitle6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品6标题',
  `luckyCoinItemNumber6` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品6倍数',
  `luckyCoinItemProb6` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品6概率',
  `luckyCoinItemImg7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品7图片',
  `luckyCoinItemTitle7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品7标题',
  `luckyCoinItemNumber7` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品7倍数',
  `luckyCoinItemProb7` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品7概率',
  `luckyCoinItemImg8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品8图片',
  `luckyCoinItemTitle8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品8标题',
  `luckyCoinItemNumber8` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品8倍数',
  `luckyCoinItemProb8` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品8概率',
  `luckCoinConsume` int(11) NULL DEFAULT NULL COMMENT '每一局金币转盘消耗多少金币',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of luckyCoin
-- ----------------------------
INSERT INTO `luckyCoin` VALUES (1, 'luckyCoin', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420489f4e4fe.png', '#b8c5f2', '#680809', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7dee9ae6.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7e493702.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7e93ea0b.png', 'x0.5倍', '0.5', '40', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7ef0987e.png', 'x2倍', '2', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7f3debc6.png', 'x5倍', '5', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7f8a0d53.png', 'x10倍', '10', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7fd64383.png', 'x20倍', '20', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d80275b01.png', 'x50倍', '50', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d806cacc0.png', 'x100倍', '100', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d80b457df.png', '谢谢惠顾', '0', '900', 100);

-- ----------------------------
-- Table structure for luckyPrize
-- ----------------------------
DROP TABLE IF EXISTS `luckyPrize`;
CREATE TABLE `luckyPrize`  (
  `id` int(11) NOT NULL DEFAULT 1 COMMENT '实物抽奖配置表',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'luckyPrize' COMMENT '实物抽奖配置标识',
  `luckyPrizeBackgroundImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实物抽奖的背景图片',
  `luckyPrizeItemBackgroundColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实物抽奖的奖品背景色',
  `luckyPrizeItemSelectBackgroundColor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '中将奖品背景色',
  `luckyPrizeStartBtn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开始按钮图片',
  `luckyPrizeImg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一奖品图片',
  `luckyPrizeItemImg1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品一图片',
  `luckyPrizeItemTitle1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品一标题',
  `luckyPrizeItemProb1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品一概率',
  `luckyPrizeItemImg2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品2图片',
  `luckyPrizeItemTitle2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品2标题',
  `luckyPrizeItemProb2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品2概率',
  `luckyPrizeItemImg3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品3图片',
  `luckyPrizeItemTitle3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品3标题',
  `luckyPrizeItemProb3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品3概率',
  `luckyPrizeItemImg4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品4图片',
  `luckyPrizeItemTitle4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品4标题',
  `luckyPrizeItemProb4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品4概率',
  `luckyPrizeItemImg5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品5图片',
  `luckyPrizeItemTitle5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品5标题',
  `luckyPrizeItemProb5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品5概率',
  `luckyPrizeItemImg6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品6图片',
  `luckyPrizeItemTitle6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品6标题',
  `luckyPrizeItemProb6` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品6概率',
  `luckyPrizeItemImg7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品7图片',
  `luckyPrizeItemTitle7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品7标题',
  `luckyPrizeItemProb7` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品7概率',
  `luckyPrizeItemImg8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品8图片',
  `luckyPrizeItemTitle8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品8标题',
  `luckyPrizeItemProb8` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖品8概率',
  `luckPrizeCoinConsume` int(11) NULL DEFAULT NULL COMMENT '每一局食物转盘消耗多少金币',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of luckyPrize
-- ----------------------------
INSERT INTO `luckyPrize` VALUES (1, 'luckyPrize', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204892c4537.png', '#b8c5f2', '#680809', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d81719794.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d81b91f23.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d82030035.png', '50金币', '40', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d825346a5.png', '200金币', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d82a18ab4.png', '300金币', '10', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ed5a4875c.png', '500金币', '10', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d82f7ab0f.png', '1000金币', '10', 'http://cqadmin.bluechs.com/storage/upload/20230416/643bd1e0c38bd.png', '雷蛇鼠标', '10', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436edac23eae.png', '雷蛇键盘', '10', 'http://cqadmin.bluechs.com/storage/upload/20230418/643df23f17af0.png', '谢谢惠顾', '900', 100);

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation`  (
  `id` int(11) NOT NULL DEFAULT 1 COMMENT '运营参数配置表',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'operation' COMMENT '运营参数配置标识',
  `sharUserMoney1` int(2) NULL DEFAULT NULL COMMENT '被邀请的用户注册时给分享者的金币收益',
  `sharUserMoney2` int(2) NULL DEFAULT NULL COMMENT '被邀请的用户注册时给分享者上级的金币收益',
  `sharUserPercentage1` int(2) NULL DEFAULT NULL COMMENT '被邀请的用户获取金币时给分享者的收益比例',
  `sharUserPercentage2` int(2) NULL DEFAULT NULL COMMENT '二级关系的被邀请的用户获取金币时给分享者的上级收益比例',
  `registerCoin` int(11) NULL DEFAULT NULL COMMENT '注册立得金币，如不需要填0',
  `signlnCoin` int(11) NULL DEFAULT NULL COMMENT '签到可获得的金币数',
  `signlnCoin3` int(11) NULL DEFAULT NULL COMMENT '签到3天额外获得金币数',
  `signlnCoin7` int(11) NULL DEFAULT NULL COMMENT '签到7天额外获得金币数',
  `signlnCoin14` int(11) NULL DEFAULT NULL COMMENT '签到14天额外获得金币数',
  `signlnCoin28` int(11) NULL DEFAULT NULL COMMENT '签到两次14天额外获得金币数',
  `mainCoin` int(11) NULL DEFAULT NULL COMMENT '绑定手机实名得金币数',
  `postCoin` int(11) NULL DEFAULT NULL COMMENT '发帖回帖评论得金币',
  `postNumber` int(11) NULL DEFAULT NULL COMMENT '发帖回帖评论得金币次数',
  `lookGame` int(11) NULL DEFAULT NULL COMMENT '浏览游戏得金币',
  `lookGameNumber` int(2) NULL DEFAULT NULL COMMENT '每天最多浏览游戏次数',
  `boxCoin30` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '白银宝箱金币区间，玩游戏30分钟获得',
  `boxCoin60` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '黄金宝箱金币区间，玩游戏60分钟获得',
  `boxCoin120` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '铂金宝箱金币区间，玩游戏120分钟获得',
  `boxCoin240` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钻石宝箱金币区间，玩游戏240分钟获得',
  `luckCoinConsume` int(11) NULL DEFAULT NULL COMMENT '每一局金币转盘消耗多少金币',
  `luckPrizeCoinConsume` int(11) NULL DEFAULT NULL COMMENT '每一局食物转盘消耗多少金币',
  `coinToMoney` int(11) NULL DEFAULT NULL COMMENT '兑换1元余额所用金币数',
  `luck` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每日盲盒数量',
  `renwu1` int(11) NULL DEFAULT NULL COMMENT '特色好服任务一奖励',
  `renwu2` int(11) NULL DEFAULT NULL COMMENT '特色好服任务二奖励',
  `renwu3` int(11) NULL DEFAULT NULL COMMENT '特色好服任务三奖励',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation
-- ----------------------------
INSERT INTO `operation` VALUES (1, 'operation', 10, 2, 10, 2, 100, 20, 188, 288, 388, 588, 100, 3, 10, 10, 10, '10-30', '30-60', '60-120', '120-240', 100, 100, 200, '50-100', 40, 40, 20);

-- ----------------------------
-- Table structure for reg
-- ----------------------------
DROP TABLE IF EXISTS `reg`;
CREATE TABLE `reg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg
-- ----------------------------
INSERT INTO `reg` VALUES (481, 'gQE-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycjBZbTRMT0JlaUcxMEE4dk5BY2wAAgRwBx9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (482, 'gQF08TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWEtrNDRTT0JlaUcxMFE4dk5BYzYAAgSABx9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (483, 'gQHM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeGV4TjViT0JlaUcxMUI4dk5BY0oAAgSxBx9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (484, 'gQHi7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTnlzTzVhT0JlaUcxMGo5dnhBY04AAgRfCB9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (485, 'gQH57zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeWwxUDRpT0JlaUcxMEc5dnhBY18AAgR2CB9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (486, 'gQFs8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySmU4SjRFT0JlaUcxME45dnhBYzcAAgR9CB9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (487, 'gQHH8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS1pTczR2T0JlaUcxMW45djFBY3EAAgSjCB9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (488, 'gQEC8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU1ljVDVTT0JlaUcxMXo5djFBY0gAAgSvCB9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (489, 'gQGC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybjVkdzV0T0JlaUcxMzA5dk5BY1kAAgQMCR9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (490, 'gQFT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV1lCQzRJT0JlaUcxMGVhdk5BY1UAAgRaCR9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (491, 'gQEl8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS2pLVDQwT0JlaUcxMWJhdjFBY18AAgSXCR9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (492, 'gQHG8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVktjNTRyT0JlaUcxMVFhdnhBYzgAAgTACR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (493, 'gQF78DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU2pSWTRoT0JlaUcxMV9hdmhBY1UAAgTLCR9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (494, 'gQHA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOFI5UzUzT0JlaUcxM3hhdk5BYzIAAgQtCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (495, 'gQF98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQTRSQTRXT0JlaUcxM0NhdnhBY2YAAgQyCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (496, 'gQEz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyd0w0cDVhT0JlaUcxM0NhdmhBY1YAAgQyCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (497, 'gQFe8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySEdRTjVPT0JlaUcxM1VhdnhBY0IAAgRECh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (498, 'gQHq7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybVZpSjVhT0JlaUcxMGZidnhBYzYAAgRbCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (499, 'gQHd7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybkJlRzVzT0JlaUcxMGlidk5BY28AAgReCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (500, 'gQE-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWTJpSTQtT0JlaUcxMGlidk5BY3MAAgReCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (501, 'gQH-7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZkRMODV1T0JlaUcxMHVidk5BY2EAAgRqCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (502, 'gQHv7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTW1EZjRDT0JlaUcxMEtidmhBY24AAgR6Ch9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (503, 'gQGX7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZWtfXzRYT0JlaUcxME9idnhBY28AAgR_Ch9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (504, 'gQEM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNFdTaDRxT0JlaUcxME9idmhBYzkAAgR_Ch9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (505, 'gQH68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWlptQzRNT0JlaUcxMWhidk5BYzIAAgSdCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (506, 'gQE18TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLTdfRTQ4T0JlaUcxMWpidmhBY0oAAgSfCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (507, 'gQEm8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ0c4STVKT0JlaUcxMWpidjFBY1YAAgSfCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (508, 'gQEc8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM050QzVrT0JlaUcxMjlidjFBYzAAAgTVCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (509, 'gQFl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUXZPbjVsT0JlaUcxMmNidjFBY20AAgTYCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (510, 'gQGM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNWFNQjRiT0JlaUcxMmNidnhBY2kAAgTYCh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (511, 'gQGp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS2lEaDV4T0JlaUcxMzVidjFBYzQAAgQRCx9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (512, 'gQH57zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYi1xdDVvT0JlaUcxM2xkdnhBY0cAAgQhDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (513, 'gQEy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydUE0VzV0T0JlaUcxM0RkdmhBY2IAAgQzDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (514, 'gQFB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycnFZYzRUT0JlaUcxM1JkdjFBYzEAAgRBDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (515, 'gQFA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUDQ4RDVOT0JlaUcxMGlldmhBY20AAgReDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (516, 'gQH_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLTVSajRYT0JlaUcxMHNldnhBY2QAAgRoDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (517, 'gQG58DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyektYWjQyT0JlaUcxMWlldk5BY3MAAgSeDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (518, 'gQEa8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaTBUMTRET0JlaUcxMXNldk5BY0UAAgSoDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (519, 'gQHW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYjRqcjRQT0JlaUcxMXNldjFBY0YAAgSoDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (520, 'gQEj8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeU8wOTU5T0JlaUcxMVdldk5BYzEAAgTGDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (521, 'gQHX8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMUpFTTVmT0JlaUcxMVdldk5BY3QAAgTGDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (522, 'gQE_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUnc1bzVZT0JlaUcxMmlldmhBY3UAAgTeDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (523, 'gQGA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU1pwSzVNT0JlaUcxMmlldmhBY0QAAgTeDR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (524, 'gQHT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ2NyYjRGT0JlaUcxMFRmdmhBYzMAAgSDDh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (525, 'gQHi8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNXpYVjV0T0JlaUcxMTVmdmhBY0YAAgSRDh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (526, 'gQEs8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRWRIOTVST0JlaUcxMTVmdk5BY2sAAgSRDh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (527, 'gQFE8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQTRwTTU2T0JlaUcxMTVmdk5BY2cAAgSRDh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (528, 'gQF_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyekZONzRyT0JlaUcxMXRmdmhBY24AAgSpDh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (529, 'gQEJ8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM0dYXzUyT0JlaUcxMXRmdjFBY20AAgSpDh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (530, 'gQGC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN0F3ZTR6T0JlaUcxMzhmdjFBY1gAAgQUDx9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (531, 'gQGa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTzZtYzRUT0JlaUcxYVhJdmhBY20AAgQHrB9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (532, 'gQF-8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySEhUTDRWT0JlaUcxOFZKdk5BY3EAAgSFrB9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (533, 'gQFb8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyemhtSjQtT0JlaUcxOTFKdnhBY0cAAgSNrB9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (534, 'gQGy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyczdMbjRpT0JlaUcxYXBKdjFBY3EAAgTlrB9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (535, 'gQFa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySDZ1ejVqT0JlaUcxYnNKdjFBY3YAAgQorR9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (536, 'gQE_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZlRObzVYT0JlaUcxOHdLdnhBYzQAAgRsrR9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (537, 'gQG18DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU3hiYjRUT0JlaUcxYWlLdk5BY0YAAgTfrR9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (538, 'gQGg8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycmpfSDU0T0JlaUcxYUVLdnhBY2sAAgT0rR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (539, 'gQG48DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycjdZQTRXT0JlaUcxYUlLdmhBY3kAAgT4rR9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (540, 'gQHN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN2JlWTR0T0JlaUcxYUpLdjFBY2gAAgT5rR9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (541, 'gQE_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybHF6RzVOT0JlaUcxYkdLdnhBY1IAAgQ2rh9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (542, 'gQGA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydFh0azVmT0JlaUcxODFMdjFBY1oAAgRNrh9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (543, 'gQFj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydVBlNTVXT0JlaUcxOEpMdnhBY0YAAgR5rh9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (544, 'gQFG8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyekhCNTVwT0JlaUcxOE5MdmhBY3gAAgR9rh9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (545, 'gQEs8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV0hlVTVrT0JlaUcxOWVMdjFBY3kAAgSarh9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (546, 'gQEj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybEI3cjVkT0JlaUcxY0M1dnhBY2UAAgRyxB9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (547, 'gQHo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMzVBdjRyT0JlaUcxZVc1dmhBYzAAAgQGxR9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (548, 'gQFV8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS3dRLTR2T0JlaUcxZmY1dnhBY2kAAgQbxR9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (549, 'gQFy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOXpwNjV4T0JlaUcxZThHdnhBY3AAAgTU6R9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (550, 'gQFt8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWFJObzV0T0JlaUcxZFhLdnhBY1EAAgTH7R9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (551, 'gQGt8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMlJ3UDQ0T0JlaUcxZUNLdmhBY2cAAgTy7R9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (552, 'gQFB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRkJTZzVsT0JlaUcxZVRLdnhBY3AAAgQD7h9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (553, 'gQGC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyakRqVzVzT0JlaUcxZVlLdjFBYzgAAgQI7h9kAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (554, 'gQHo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycmQyNjRLT0JlaUcxZElTdmhBY0cAAgS49R9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (555, 'gQEF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZjJKczRNT0JlaUcxY3VVdmhBYzAAAgRq9x9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (556, 'gQHV8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyenFZTzQtT0JlaUcxZEJVdjFBY2QAAgSx9x9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (557, 'gQEr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySXBpYzRyT0JlaUcxZXlVdk5BY0UAAgTu9x9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (558, 'gQEx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeUZ1WDU0T0JlaUcxYzZWdjFBY3EAAgRS_B9kAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (559, 'gQH97zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNkRWdTRNT0JlaUcxMHpwd2hBYzMAAgRvGCBkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (560, 'gQHt7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUXJFSjVnT0JlaUcxMGVSd05BY2EAAgRaNCBkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (561, 'gQHx7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRFNqZDRlT0JlaUcxMERSdzFBY3MAAgRyNCBkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (562, 'gQGi7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyamNwZjVOT0JlaUcxNk13d3hBY2oAAgT8XyBkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (563, 'gQHC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycVQtRTRaT0JlaUcxNUVMd05BY0IAAgS0biBkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (564, 'gQGF7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeHJ6YzVzT0JlaUcxMG1jeE5BY04AAgRiCyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (565, 'gQEa8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYkRBdDQzT0JlaUcxMWdjeDFBY04AAgScCyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (566, 'gQHD8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyd3FGQzVaT0JlaUcxMWhjeDFBY2UAAgSdCyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (567, 'gQFU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWkFYNjRmT0JlaUcxM2lpeGhBY0kAAgQeEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (568, 'gQHw7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybUFhNzVLT0JlaUcxMGhqeGhBY24AAgRdEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (569, 'gQHf7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybFZqYTRYT0JlaUcxMGpqeDFBY18AAgRfEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (570, 'gQFF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNDJLSDRFT0JlaUcxMHFqeHhBY0sAAgRmEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (571, 'gQHg7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUExxVzVST0JlaUcxMHNqeDFBY3oAAgRoEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (572, 'gQFF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYXZCdDUyT0JlaUcxMEJqeDFBYzQAAgRxEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (573, 'gQEA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRXFzVzVMT0JlaUcxMENqeE5BY00AAgRyEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (574, 'gQEK8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUldERzUxT0JlaUcxMXRqeE5BY0EAAgSpEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (575, 'gQFZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySWV5bjRRT0JlaUcxMmFqeHhBYy0AAgTWEiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (576, 'gQGN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ0NlMjRoT0JlaUcxMktqeE5BY3YAAgT6EiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (577, 'gQEj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybUJ5ODVRT0JlaUcxM2dqeHhBY0kAAgQcEyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (578, 'gQE68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRUdTbjU2T0JlaUcxM3hqeE5BY2gAAgQtEyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (579, 'gQEG8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb25QZDVNT0JlaUcxMDlreE5BY1oAAgRVEyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (580, 'gQHl7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc3hFLTU4T0JlaUcxMG5reHhBY1cAAgRjEyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (581, 'gQHL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUEg2dDVOT0JlaUcxMFdreGhBY3oAAgSGEyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (582, 'gQF_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySlRWWjRXT0JlaUcxMmRreE5BY2sAAgTZEyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (583, 'gQGy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWUIxcTRhT0JlaUcxMk1reE5BYzIAAgT8EyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (584, 'gQEA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycWtZTTVtT0JlaUcxM3hreDFBY1EAAgQtFCFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (585, 'gQFY8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVUhiajRDT0JlaUcxMkxseHhBY1QAAgT7FCFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (586, 'gQGD8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWDFkdzQzT0JlaUcxMlJseDFBY3gAAgQBFSFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (587, 'gQGg8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybDA4TDRCT0JlaUcxMl9seHhBYzIAAgQLFSFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (588, 'gQFj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMW1XTzR1T0JlaUcxM0RseDFBY1EAAgQzFSFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (589, 'gQHu7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya3RoZzQ3T0JlaUcxM0VseGhBY2EAAgQ0FSFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (590, 'gQHw7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNzJTYTV0T0JlaUcxMG1teHhBY04AAgRiFSFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (591, 'gQHZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNFNJdjUyT0JlaUcxMkpteDFBY08AAgT5FSFkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (592, 'gQEm8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZDlhVzVQT0JlaUcxMFJveDFBY0MAAgSBFyFkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (593, 'gQEU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYkhldDRWT0JlaUcxM0pweE5BY08AAgQ5GSFkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (594, 'gQG-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZWYtVDRmT0JlaUcxMFNxeGhBY2EAAgSCGSFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (595, 'gQFr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyd1BZbzQwT0JlaUcxMmJxeDFBY3kAAgTXGSFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (596, 'gQHN7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWWhTaTRqT0JlaUcxMnlxeHhBY3oAAgTuGSFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (597, 'gQHS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybWRHZDRFT0JlaUcxMThyeHhBYzUAAgSUGiFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (598, 'gQEr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQU5lSDVxT0JlaUcxM29yeDFBY2wAAgQkGyFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (599, 'gQE38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNmJJYzR2T0JlaUcxM1FyeDFBY1YAAgRAGyFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (600, 'gQG38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVjJWMzRkT0JlaUcxMlp0eDFBY0YAAgQJHSFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (601, 'gQEj8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySWJkNDVCT0JlaUcxMWJ1eDFBYzMAAgSXHSFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (602, 'gQGA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyY0hpTjR2T0JlaUcxMWFOeHhBY1MAAgSWMCFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (603, 'gQH68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTDI2bDQ5T0JlaUcxNW9veDFBYzcAAgSkVyFkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (604, 'gQF68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUzBIYjV0T0JlaUcxNWh2eDFBY24AAgSdXiFkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (605, 'gQEg8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTzUydjVzT0JlaUcxN2tBeDFBY3EAAgQgZCFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (606, 'gQGD7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQmlPWDVkT0JlaUcxNGpEeHhBY3AAAgRfZiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (607, 'gQGN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUU11NjRuT0JlaUcxNUREeGhBY0cAAgSzZiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (608, 'gQFX8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV0JmbTVDT0JlaUcxNmVEeDFBY3IAAgTaZiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (609, 'gQFJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMG9rYzUyT0JlaUcxNDJFeDFBY08AAgROZyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (610, 'gQHN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySFVRNTVXT0JlaUcxNVVFeE5BYzkAAgTEZyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (611, 'gQHA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycDAyNDVmT0JlaUcxNjNFeGhBY1AAAgTPZyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (612, 'gQFZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyR0wxWDVST0JlaUcxNmxFeHhBY1oAAgThZyFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (613, 'gQGI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUkoyMjVST0JlaUcxNnQteGhBY0kAAgTpfSFkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (614, 'gQH77zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb0YxczVnT0JlaUcxNnQteGhBY2gAAgTpfSFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (615, 'gQGf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMHk4TzRzT0JlaUcxNFVfeE5BY08AAgSEfiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (616, 'gQGF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZUFRdDV4T0JlaUcxYnEyeGhBY0sAAgQmgiFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (617, 'gQEE8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySkNCYjRLT0JlaUcxODFzeE5BYzcAAgRNmyFkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (618, 'gQH78DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTV80aTVFT0JlaUcxMURaeU5BYzEAAgSzPCJkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (619, 'gQEL8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS1JhUTQ5T0JlaUcxNC02eWhBY2YAAgSKRSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (620, 'gQGU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMUNJMDRFT0JlaUcxNlg2eXhBY3gAAgQHRiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (621, 'gQEu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRDZ6cDRBT0JlaUcxNzVkeXhBY04AAgQRTSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (622, 'gQH87zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaWZtSzRrT0JlaUcxN2JmeTFBY0MAAgQXTyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (623, 'gQEl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ2paTTRDT0JlaUcxN2VmeTFBY28AAgQaTyJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (624, 'gQEe8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWGJLaTRYT0JlaUcxNW5neXhBY28AAgSjTyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (625, 'gQF38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLW9INjVOT0JlaUcxNXNneXhBY2kAAgSoTyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (626, 'gQEE8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMVdIUDRNT0JlaUcxNjRneTFBYzUAAgTQTyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (627, 'gQFT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVTNPSTRlT0JlaUcxN3NneTFBYzUAAgQoUCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (628, 'gQHg7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaWNNZjQ1T0JlaUcxN0FneWhBY2wAAgQwUCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (629, 'gQEW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybE9BMjRxT0JlaUcxN0pneWhBYzkAAgQ5UCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (630, 'gQGl7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeWpaSTRQT0JlaUcxN1FneWhBY2UAAgRAUCJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (631, 'gQEY8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyam4tNTRCT0JlaUcxNDBoeWhBY2MAAgRMUCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (632, 'gQGv7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyenRRQTV3T0JlaUcxNDFoeWhBY04AAgRNUCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (633, 'gQFL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWUpIdzVIT0JlaUcxNnVoeTFBY1MAAgTqUCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (634, 'gQFJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWGd1WTRNT0JlaUcxNzloeTFBYzUAAgQVUSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (635, 'gQGa7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydkFpOTRxT0JlaUcxN3VoeWhBY2wAAgQqUSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (636, 'gQGT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRDNZcjVYT0JlaUcxNjJpeWhBY0EAAgTOUSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (637, 'gQGe8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWVBlNjRBT0JlaUcxNmNpeTFBY0gAAgTYUSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (638, 'gQH_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQXBVZjU2T0JlaUcxNnJpeXhBY2UAAgTnUSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (639, 'gQGf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWGFTbTRRT0JlaUcxNFJqeTFBY2oAAgSBUiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (640, 'gQH17zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTTBPMzVwT0JlaUcxN1BqeXhBY2cAAgQ-UyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (641, 'gQFG7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySnZ5cTV2T0JlaUcxNGxueTFBY2oAAgRhViJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (642, 'gQGE8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWndIdjVDT0JlaUcxNU5veTFBYzkAAgS9VyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (643, 'gQE48DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUWYtZzR4T0JlaUcxNVZveU5BY2gAAgTFVyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (644, 'gQE-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeEN0QjRyT0JlaUcxNFpxeXhBY0wAAgSJWSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (645, 'gQFX8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmFzRTRxT0JlaUcxNWVzeU5BYzAAAgSaWyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (646, 'gQFy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYmdMTjVMT0JlaUcxNWpzeTFBY2gAAgSfWyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (647, 'gQE88DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV19NZzRuT0JlaUcxNXFzeTFBY2gAAgSmWyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (648, 'gQH87zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySnFnMjRDT0JlaUcxNnNzeWhBY20AAgToWyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (649, 'gQH87zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySXpoazVHT0JlaUcxNkFzeU5BY2oAAgTwWyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (650, 'gQEM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVWhPcTRlT0JlaUcxNkNzeTFBY28AAgTyWyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (651, 'gQHY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWWdpWjRzT0JlaUcxNktzeU5BY2IAAgT6WyJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (652, 'gQEw8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUjRJbDU4T0JlaUcxNl9zeU5BY2YAAgQLXCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (653, 'gQHz7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyak5BTDV0T0JlaUcxNlF1eWhBY1gAAgQAXiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (654, 'gQH67zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMVVXZDVWT0JlaUcxNll1eXhBY1MAAgQIXiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (655, 'gQFO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNW9MdTVMT0JlaUcxNWF2eWhBY18AAgSWXiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (656, 'gQEW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeG9MTDR4T0JlaUcxNWZ2eU5BY2IAAgSbXiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (657, 'gQFT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUDY0YTR1T0JlaUcxNXN2eWhBY1gAAgSoXiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (658, 'gQHo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydzQzZjU5T0JlaUcxNUN2eTFBYzIAAgSyXiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (659, 'gQHh7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybzFzaDRNT0JlaUcxNm92eWhBY1kAAgTkXiJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (660, 'gQGL7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMmJrNjVTT0JlaUcxNGR3eXhBY3QAAgRZXyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (661, 'gQFH7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZzlxUzRtT0JlaUcxNHJ3eWhBY2QAAgRnXyJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (662, 'gQHl7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM0dQZDVET0JlaUcxN1R3eWhBY2IAAgRDYCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (663, 'gQGd7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTmNtZDVXT0JlaUcxNy13eXhBY1MAAgRKYCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (664, 'gQHq7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNWFxRTQtT0JlaUcxNEJ4eU5BY1cAAgRxYCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (665, 'gQGY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnM0UTR6T0JlaUcxNEl4eU5BY3AAAgR4YCJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (666, 'gQHz7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUEFPeDQzT0JlaUcxNmx4eXhBY3YAAgThYCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (667, 'gQHH7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWmhRSzRQT0JlaUcxNnR4eXhBY3AAAgToYCJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (668, 'gQEh8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya09wNTUxT0JlaUcxNkV4eWhBY2YAAgT0YCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (669, 'gQFf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycUhFMjR4T0JlaUcxNk14eTFBYzgAAgT8YCJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (670, 'gQFS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYlZCRjRGT0JlaUcxNlV4eTFBY1YAAgQEYSJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (671, 'gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMFZFTDRuT0JlaUcxN094eU5BY2EAAgQ_YSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (672, 'gQHJ7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUEx5XzVXT0JlaUcxN1Z4eU5BYzkAAgRFYSJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (673, 'gQEp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU0RZMTVGT0JlaUcxNlZ5eWhBY2IAAgQFYiJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (674, 'gQFt8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV3RvbzVBT0JlaUcxNXBIeTFBY0IAAgSlaiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (675, 'gQFM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycFpGWTVzT0JlaUcxNUVIeWhBY1YAAgS0aiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (676, 'gQFn8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNDItODVZT0JlaUcxNFJJeTFBY08AAgSBayJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (677, 'gQFe8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRkVCODUtT0JlaUcxNEJMeU5BY0cAAgRxbiJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (678, 'gQFs8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTGlSQTRMT0JlaUcxNkFMeTFBY3UAAgTwbiJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (679, 'gQE38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySXhkVjRvT0JlaUcxOGZreWhBY0cAAgRbkyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (680, 'gQF68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyT0VWZTRxT0JlaUcxOGZreU5BY0gAAgRbkyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (681, 'gQEA8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMkpzdDQ5T0JlaUcxYThreU5BY3IAAgTUkyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (682, 'gQGO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYmRkUjV4T0JlaUcxYWtreU5BY0wAAgTgkyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (683, 'gQHD8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ0FTQzVrT0JlaUcxYW5reXhBY1YAAgTjkyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (684, 'gQHa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUFdEVjVjT0JlaUcxOXNteXhBY3oAAgSolSJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (685, 'gQFw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZjdJMzVrT0JlaUcxOUtueU5BY0MAAgS5liJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (686, 'gQHv8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb29URjRMT0JlaUcxYUVueTFBY0UAAgT0liJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (687, 'gQHb8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya1N0QzVPT0JlaUcxOWtveXhBY2UAAgSglyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (688, 'gQE-8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTlpOOTROT0JlaUcxOXdveTFBY3gAAgSslyJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (689, 'gQEp8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNnBZRzUyT0JlaUcxYTdEeXhBY1gAAgTTpiJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (690, 'gQEZ8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNnhFZzVIT0JlaUcxOWpaeWhBY0sAAgSfvCJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (691, 'gQFp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyanRDajVtT0JlaUcxZGx0eTFBY3MAAgSh3CJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (692, 'gQFz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTzRPYTViT0JlaUcxZHZ0eXhBY3EAAgSr3CJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (693, 'gQEy8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMkIzMzV3T0JlaUcxZHp0eTFBYzUAAgSv3CJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (694, 'gQE88DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ3pXUzRoT0JlaUcxZV9DeU5BY3YAAgQL5iJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (695, 'gQF98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNGJzLTVKT0JlaUcxZnZDeWhBYzEAAgQr5iJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (696, 'gQG_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOVpyMjVmT0JlaUcxZUpEeU5BY0sAAgT55iJkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (697, 'gQHS7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySHNpQjVpT0JlaUcxY01YeU5BY1kAAgR8_iJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (698, 'gQFH8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOVNLeTVRT0JlaUcxZnQteWhBY0gAAgQp-iJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (699, 'gQGh8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN1F3eTVuT0JlaUcxMXI1emhBY1IAAgSnBCNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (700, 'gQEt8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMDY1dzRxT0JlaUcxMGw2enhBY2YAAgRgBSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (701, 'gQEE8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydUI3RzR4T0JlaUcxMW02emhBYzEAAgSiBSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (702, 'gQFJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycWxMeTVrT0JlaUcxMnE2emhBY0IAAgTmBSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (703, 'gQEm8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySnRrZTRWT0JlaUcxMFA3ejFBY04AAgR-BiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (704, 'gQEW8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTXplUzQ4T0JlaUcxMFE3emhBY1IAAgSABiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (705, 'gQEv8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMmhpQjRoT0JlaUcxMTc3emhBY0kAAgSTBiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (706, 'gQGp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyczV1XzRLT0JlaUcxMFhhemhBY3QAAgSHCSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (707, 'gQFT8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLXk5SzRIT0JlaUcxMTZhek5BY08AAgSSCSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (708, 'gQHh8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMC1vdjRaT0JlaUcxMWhhek5BY1oAAgSdCSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (709, 'gQGc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN295YzRNT0JlaUcxMW9henhBYzQAAgSkCSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (710, 'gQHM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMjBUWDVnT0JlaUcxMVlhek5BY3kAAgTICSNkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (711, 'gQFU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTUdjYTRGT0JlaUcxMGdiejFBY0MAAgRcCiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (712, 'gQGx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaV9BUDVoT0JlaUcxMW1iek5BY1gAAgSiCiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (713, 'gQFN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTGU4cDVWT0JlaUcxM2Jiek5BY2EAAgQXCyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (714, 'gQGW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMVUwVjRFT0JlaUcxM21iek5BY2EAAgQiCyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (715, 'gQFF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaF96MTRLT0JlaUcxMDBjenhBYzEAAgRMCyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (716, 'gQFu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc1pDUjVGT0JlaUcxMDBjejFBY2MAAgRMCyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (717, 'gQET8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN0NKSjVMT0JlaUcxMnJjejFBYy0AAgTnCyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (718, 'gQE98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNk1naTV1T0JlaUcxM3RjejFBY08AAgQpDCNkAwS0AAAA', 'ociWS6ivPwEsFPbDMhiQWJN8pD04');
INSERT INTO `reg` VALUES (719, 'gQHL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyajQzMTRpT0JlaUcxM0NjejFBY0cAAgQyDCNkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (720, 'gQHY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM2h6ZDVKT0JlaUcxMHVkenhBYzIAAgRqDCNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (721, 'gQG_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYy04azQxT0JlaUcxMmpkek5BY2oAAgTfDCNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (722, 'gQGm8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc00ydjViT0JlaUcxMmtkejFBYzYAAgTgDCNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (723, 'gQEW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOVlkbTV2T0JlaUcxMzNkenhBY3cAAgQPDSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (724, 'gQH97zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTXhVejR2T0JlaUcxMzNkemhBY3AAAgQPDSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (725, 'gQFL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmYyVTQ0T0JlaUcxM0dkenhBY1oAAgQ2DSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (726, 'gQEo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybkxkMDRQT0JlaUcxM0hkemhBY3QAAgQ3DSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (727, 'gQFc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUjY1UTV6T0JlaUcxM0pkenhBY0EAAgQ5DSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (728, 'gQFj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMXBmSTRXT0JlaUcxM0xkek5BY0IAAgQ7DSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (729, 'gQHp7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVHNWejRIT0JlaUcxM05kemhBY2YAAgQ9DSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (730, 'gQHW7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOWNzaTVoT0JlaUcxM1BkemhBY3MAAgQ-DSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (731, 'gQFo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYk9MWjU4T0JlaUcxM1FkemhBYzAAAgRADSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (732, 'gQFI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycXZjTTRkT0JlaUcxMkhlemhBYzcAAgT3DSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (733, 'gQG_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQkRfTzRUT0JlaUcxMlhlek5BYy0AAgQHDiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (734, 'gQEC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaTVDazRVT0JlaUcxM1ZmenhBY2cAAgRFDyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (735, 'gQE98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybzBnTjV6T0JlaUcxMy1memhBYzIAAgRKDyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (736, 'gQEK8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV2N0UjVqT0JlaUcxM05nek5BY00AAgQ9ECNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (737, 'gQEJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc2hsaDRCT0JlaUcxMmdpemhBY3QAAgTcESNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (738, 'gQFX8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTm9EWDVjT0JlaUcxMmtpek5BY2wAAgTgESNkAwS0AAAA', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `reg` VALUES (739, 'gQG68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybmFJczRBT0JlaUcxMFNqemhBY1YAAgSCEiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (740, 'gQHi8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMEhTVTQwT0JlaUcxMmNqenhBYzIAAgTYEiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (741, 'gQGL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOEUxcjV2T0JlaUcxMmRqemhBY1AAAgTZEiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (742, 'gQGc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRjB1SzVPT0JlaUcxMkhtenhBYzgAAgT3FSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (743, 'gQEk8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaWN6WjVfT0JlaUcxMl9tek5BYzQAAgQLFiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (744, 'gQG_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZEctOTRxT0JlaUcxMlNuejFBY0gAAgQCFyNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (745, 'gQEK8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc1h1STVDT0JlaUcxM3Rwek5BY0cAAgQpGSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (746, 'gQHZ7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyellJWTRnT0JlaUcxM3hwek5BY2EAAgQtGSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (747, 'gQEv8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydW1wcTVBT0JlaUcxOU8yejFBY2cAAgS_gSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (748, 'gQGb8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ3FCZTVyT0JlaUcxOVAyejFBYzAAAgS-gSNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (749, 'gQFr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybmlJUDRfT0JlaUcxYWZ6emhBY2UAAgTboiNkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (750, 'gQHB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZTlpdjVUT0JlaUcxZEJiek5BY2EAAgSxyiNkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (751, 'gQG38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNFpZejV2T0JlaUcxZUFiejFBY0MAAgTwyiNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (752, 'gQEH8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydi00QTRxT0JlaUcxY2NjenhBY3EAAgRYyyNkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (753, 'gQE-8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycVBSSzRJT0JlaUcxYW00QXhBYzgAAgTigyRkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (754, 'gQEa8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUEM4azVMT0JlaUcxYnI0QWhBY0UAAgQnhCRkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (755, 'gQEy8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTFlWczVET0JlaUcxYkw0QTFBY0YAAgQ7hCRkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (756, 'gQFM8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMHhmSzVwT0JlaUcxYUQ1QTFBY2UAAgTzhCRkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (757, 'gQHL7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaDdDeDV4T0JlaUcxNENWQk5BY1gAAgRyeCVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (758, 'gQHc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU2o3YjVIT0JlaUcxYU1NQmhBY3IAAgT8ryVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (759, 'gQFs8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya3pxQTRJT0JlaUcxYlJNQnhBY0UAAgRBsCVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (760, 'gQHE8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUy1lSDVwT0JlaUcxOTdOQjFBY2cAAgSTsCVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (761, 'gQG98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRm84cDRxT0JlaUcxYVBOQk5BY3QAAgT-sCVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (762, 'gQEe8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ3YyNjU0T0JlaUcxYnZOQjFBYzAAAgQrsSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (763, 'gQFs8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMDlSTTU1T0JlaUcxODRPQjFBY2QAAgRQsSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (764, 'gQHL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQWFXRjViT0JlaUcxYkVPQmhBY0oAAgQ0siVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (765, 'gQGM8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNHFNMTQtT0JlaUcxOVNQQnhBY1cAAgTCsiVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (766, 'gQHF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS3B6VzROT0JlaUcxYXZQQjFBY2cAAgTrsiVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (767, 'gQFl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycW9KeDRJT0JlaUcxOGlRQnhBYzAAAgResyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (768, 'gQHU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySDJTQzVMT0JlaUcxOEhRQnhBY1cAAgR3syVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (769, 'gQFg8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVDlLZTU0T0JlaUcxOXBRQnhBY18AAgSlsyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (770, 'gQEy8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV3d3OTVYT0JlaUcxOXFRQjFBY20AAgSmsyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (771, 'gQE68TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMUdrTTRVT0JlaUcxOXNRQnhBY2wAAgSosyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (772, 'gQEx8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyXzdsNDVZT0JlaUcxOXVRQmhBY3YAAgSqsyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (773, 'gQE78TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWkxmMjRKT0JlaUcxOXZRQnhBY2IAAgSrsyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (774, 'gQEO8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTTZyODRYT0JlaUcxYjhSQk5BY2UAAgQUtSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (775, 'gQGZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySTh3YTVUT0JlaUcxYmZSQnhBY1IAAgQbtSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (776, 'gQEK8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLUlCNTQ4T0JlaUcxYkNSQnhBY3YAAgQytSVkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (777, 'gQGn8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycXBJUTQwT0JlaUcxYVFaQmhBY3gAAgQAvSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (778, 'gQEW8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydVJ4ajRoT0JlaUcxZGs4QjFBYzUAAgSgxyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (779, 'gQFX8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNDhmSDVLT0JlaUcxZG04QnhBY1QAAgSixyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (780, 'gQEo8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWkRldjV6T0JlaUcxYy1jQjFBY2YAAgSKyyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (781, 'gQFj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRHNvTzRBT0JlaUcxZXVjQnhBY3gAAgTqyyVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (782, 'gQFL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMXk1czR5T0JlaUcxY0NkQjFBY2wAAgRyzCVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (783, 'gQHP8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZXdwazVQT0JlaUcxZDZkQnhBY1AAAgSSzCVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (784, 'gQEZ8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU1FLYjVPT0JlaUcxZFZkQjFBY2EAAgTFzCVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (785, 'gQHy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYzNPajRMT0JlaUcxZS1kQk5BY1MAAgQKzSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (786, 'gQFJ8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeC1nTTRhT0JlaUcxZDBlQjFBY3UAAgSMzSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (787, 'gQHX8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyalZvbTR4T0JlaUcxZHFlQjFBYzIAAgSmzSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (788, 'gQEk8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTjc5ZjQ2T0JlaUcxZTllQmhBY3AAAgTVzSVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (789, 'gQFC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyalkyVjR1T0JlaUcxY0dmQjFBY3QAAgR2ziVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (790, 'gQEf8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS09UYTVNT0JlaUcxY1hmQmhBY2EAAgSHziVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (791, 'gQGy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWVB1bDRCT0JlaUcxZFlOQmhBY1IAAgTI8CVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (792, 'gQFC8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySk1wMDU5T0JlaUcxNUMyQ3hBYzEAAgSyQSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (793, 'gQHV8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMmZmRTVTT0JlaUcxNmsyQ05BY0sAAgTgQSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (794, 'gQGr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySEdFXzR5T0JlaUcxNkMyQ05BY3YAAgTyQSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (795, 'gQEg8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeG9OeTQ0T0JlaUcxNl8yQ3hBY2sAAgQLQiZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (796, 'gQFi8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOG5MQTV0T0JlaUcxNGczQ05BYzUAAgRcQiZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (797, 'gQHH8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyX2FlVTRDT0JlaUcxNjMzQ3hBY1AAAgTPQiZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (798, 'gQGJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMi1tRTVTT0JlaUcxN0gzQ2hBY3cAAgQ3QyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (799, 'gQF38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYjhIZjRGT0JlaUcxNE00QzFBY08AAgR8QyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (800, 'gQGv8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ3hheDQwT0JlaUcxNWw0Q2hBY0EAAgShQyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (801, 'gQG08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyX1RabDQ5T0JlaUcxNjc0Q2hBY3QAAgTTQyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (802, 'gQHA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN0Q4TTRUT0JlaUcxN3U0QzFBY2YAAgQqRCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (803, 'gQHq8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyanctdjVKT0JlaUcxNUM1Q05BY08AAgSyRCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (804, 'gQEz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyblc2ZTUwT0JlaUcxN3c1Q3hBY2kAAgQsRSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (805, 'gQEW8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTWFmRzRTT0JlaUcxNFk5QzFBY24AAgSISCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (806, 'gQGg8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMENLcjRnT0JlaUcxNmVnQzFBY2YAAgTaTyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (807, 'gQEp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaXlYNTVuT0JlaUcxNmpnQ3hBY0UAAgTfTyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (808, 'gQFU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySzh0RjRYT0JlaUcxNldnQ3hBY04AAgQGUCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (809, 'gQFH8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVTNtQzU5T0JlaUcxNTJoQzFBY2IAAgSOUCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (810, 'gQGs8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydUJ4TzVLT0JlaUcxNUVoQ2hBYzUAAgS0UCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (811, 'gQFe8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeTAydjVpT0JlaUcxNVZoQ2hBY3AAAgTFUCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (812, 'gQHx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNVA0MTRNT0JlaUcxNjZpQ2hBY3EAAgTSUSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (813, 'gQEr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyalJfcDRqT0JlaUcxNnFpQ05BY0QAAgTmUSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (814, 'gQFQ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMDZQRDR2T0JlaUcxNGFqQ05BY0QAAgRWUiZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (815, 'gQG37zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycE9peDRsT0JlaUcxNGtqQzFBY0oAAgRgUiZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (816, 'gQGM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMVRiQjVST0JlaUcxNm9qQ2hBY0QAAgTkUiZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (817, 'gQGL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRHFLZTR2T0JlaUcxNXJrQ05BYzkAAgSnUyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (818, 'gQGw8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNkJFQTV0T0JlaUcxNXNrQ3hBY1AAAgSoUyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (819, 'gQEa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ1dhTTRQT0JlaUcxNGNsQzFBY2cAAgRYVCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (820, 'gQGb7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybWhYYzRxT0JlaUcxN3NsQ3hBY1IAAgQoVSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (821, 'gQGg7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeGtJRDV1T0JlaUcxNGxtQ05BY2IAAgRhVSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (822, 'gQHS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM0hqNTVhT0JlaUcxNzZuQzFBYzYAAgQSVyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (823, 'gQFx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycDZFVDRxT0JlaUcxNXRvQ2hBY1gAAgSpVyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (824, 'gQEy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya3o2ZDQ4T0JlaUcxNV9vQ3hBY3MAAgTLVyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (825, 'gQH07zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNnFveTVBT0JlaUcxNEVwQ05BYzEAAgR0WCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (826, 'gQHm7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLUJZbTQ2T0JlaUcxNEhwQ3hBY3UAAgR3WCZkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (827, 'gQGC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySVVDeDVkT0JlaUcxNFhwQ2hBY3YAAgSHWCZkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (828, 'gQFa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUGxjUTRuT0JlaUcxNWZwQ3hBY0sAAgSbWCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (829, 'gQEK8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWXlvdDVPT0JlaUcxNWlyQ2hBY3oAAgSeWiZkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (830, 'gQHM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN1VmTjQ2T0JlaUcxNVVyQ2hBYzUAAgTEWiZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (831, 'gQEC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycGpiSjU0T0JlaUcxN09zQ3hBYzEAAgQ_XCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (832, 'gQF28DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeE8wSjRHT0JlaUcxNmN0Q3hBY0IAAgTYXCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (833, 'gQHm7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybXJzeDVHT0JlaUcxNk50Q2hBY0gAAgT9XCZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (834, 'gQFB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycjFrSjVGT0JlaUcxNlR0Q3hBY0MAAgQDXSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (835, 'gQH-7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycGZObjRyT0JlaUcxN0J0Q05BYy0AAgQxXSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (836, 'gQE-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS3gzTTV2T0JlaUcxN0V0Q05BYzEAAgQ0XSZkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (837, 'gQHF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMWk3LTR2T0JlaUcxNWR1Q2hBY1QAAgSZXSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (838, 'gQE_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycVk1WTRrT0JlaUcxNWx1Q3hBY2wAAgShXSZkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (839, 'gQGy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVEpCOTRpT0JlaUcxNWtDQ2hBY3UAAgSgZSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (840, 'gQGs8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySGFmVjQyT0JlaUcxNzBEQ05BY0oAAgQMZyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (841, 'gQEk8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybUxoTTQ1T0JlaUcxNE9FQzFBY1QAAgR_ZyZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (842, 'gQFh8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySExIUDUtT0JlaUcxN1BIQ3hBY00AAgQ-ayZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (843, 'gQEb8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySkwxbjVDT0JlaUcxNEZJQ05BY3QAAgR1ayZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (844, 'gQHc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMF9oeTUtT0JlaUcxNFZJQ05BY24AAgSFayZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (845, 'gQHr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydzNNazR0T0JlaUcxNThJQzFBY1IAAgSUayZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (846, 'gQFu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRHBySjRTT0JlaUcxNWVJQ2hBY3gAAgSaayZkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (847, 'gQFQ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNU5VZTV5T0JlaUcxNm9LQ05BY2MAAgTkbSZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (848, 'gQHj7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycGdFOTV2T0JlaUcxNEVMQzFBY3IAAgR0biZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (849, 'gQHw8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUUliRzRDT0JlaUcxYUZqQ3hBY3MAAgT1kiZkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (850, 'gQHP8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZkE3OTRVT0JlaUcxYzB6RE5BYzMAAgRM4idkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (851, 'gQGy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeVhBSDRCT0JlaUcxMXp2RXhBY0EAAgSvHihkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (852, 'gQGu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydTAtaDR4T0JlaUcxMmJ2RU5BY0gAAgTXHihkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (853, 'gQEW8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQVVRSjRmT0JlaUcxMFR5RU5BY1kAAgSDIShkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (854, 'gQGq8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNHBaXzRMT0JlaUcxMjd5RWhBY2QAAgTTIShkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (855, 'gQHJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycDBYNTRST0JlaUcxMU56RWhBY20AAgS9IihkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (856, 'gQH57zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydFFfdDRnT0JlaUcxM0lBRXhBY2wAAgQ4JChkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (857, 'gQHR7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyanZTcDRyT0JlaUcxM3pDRWhBY2IAAgQvJihkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (858, 'gQH97zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNVl3RjV2T0JlaUcxMHZIRnhBYzkAAgRrKilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (859, 'gQEf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN3dmRTRuT0JlaUcxM1dWRmhBY0YAAgRGOSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (860, 'gQFL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQzdCdzVHT0JlaUcxM1hWRmhBY2QAAgRHOSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (861, 'gQEz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc1dnbzRCT0JlaUcxMDhYRk5BY0IAAgRUOilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (862, 'gQHA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVlk2UDVMT0JlaUcxMDlYRjFBYzAAAgRVOilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (863, 'gQFf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyR2QxdTV1T0JlaUcxM3NZRjFBYzkAAgQoPClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (864, 'gQEb8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYnpDMTRiT0JlaUcxMDVaRmhBY3IAAgRRPClkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (865, 'gQFC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV1VqcDUyT0JlaUcxN0ZhRk5BY00AAgQ1SilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (866, 'gQEY8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc1JYQTVPT0JlaUcxNTZiRk5BYzYAAgSSSilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (867, 'gQGi8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMkR6dzRoT0JlaUcxNVViRjFBY1cAAgTESilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (868, 'gQFB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN3l0VzVNT0JlaUcxNVliRnhBY28AAgTISilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (869, 'gQFd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYjB6eTQtT0JlaUcxNVpiRnhBY2gAAgTJSilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (870, 'gQEu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRGZCVzRuT0JlaUcxNlFiRmhBY3gAAgQASylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (871, 'gQEq8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTDBQbjRYT0JlaUcxN2liRmhBY2QAAgQeSylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (872, 'gQGa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybHREMTV3T0JlaUcxNFlkRmhBY18AAgSITClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (873, 'gQGY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWVJ5ZjR5T0JlaUcxNGhlRk5BY18AAgRdTSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (874, 'gQEC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycUVZTTR3T0JlaUcxNEVlRk5BYzEAAgR0TSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (875, 'gQGB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyekpESjRvT0JlaUcxNWhlRnhBY00AAgSdTSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (876, 'gQFu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMkltWTRzT0JlaUcxNmJlRnhBYzgAAgTXTSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (877, 'gQH47zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZW9IMzRKT0JlaUcxNEZmRk5BY3EAAgR1TilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (878, 'gQFW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycUlTSzRyT0JlaUcxNVZmRnhBY1cAAgTFTilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (879, 'gQHZ7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySGtTcDVqT0JlaUcxNGtnRk5BYzYAAgRgTylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (880, 'gQEs8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRlVDUzRFT0JlaUcxNHBnRk5BY0QAAgRlTylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (881, 'gQHZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQnctQTVjT0JlaUcxNUJnRmhBY0kAAgSxTylkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (882, 'gQHR8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyd3ZESDVHT0JlaUcxNjNnRjFBY0IAAgTPTylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (883, 'gQEg8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRURDZTRsT0JlaUcxN1doRmhBY0EAAgRGUSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (884, 'gQHZ7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyX3ktMDU4T0JlaUcxNHRqRmhBY3cAAgRpUilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (885, 'gQHn8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMzNrZzVaT0JlaUcxNThqRnhBY0QAAgSUUilkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (886, 'gQHd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyckRSNTVWT0JlaUcxNXJqRjFBY0cAAgSnUilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (887, 'gQFo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycXNLeDQxT0JlaUcxNUtqRnhBY0UAAgS6UilkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (888, 'gQEu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycHBWTTVtT0JlaUcxNkxrRk5BY0sAAgT7UylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (889, 'gQG08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaEY3LTRZT0JlaUcxNkxrRjFBY2gAAgT7UylkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (890, 'gQEm8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaW9JRTR6T0JlaUcxNkxrRmhBY0oAAgT7UylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (891, 'gQHL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMndOWDUtT0JlaUcxNWh0Rk5BY1MAAgSdXClkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (892, 'gQFy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydjFSTjVDT0JlaUcxNml0RnhBYzEAAgTeXClkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (893, 'gQFj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWjdjNDRhT0JlaUcxNnZ3RjFBY2kAAgTrXylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (894, 'gQFV8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyR19kQTQyT0JlaUcxNll3RmhBY0sAAgQIYClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (895, 'gQE08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTk1BSDRoT0JlaUcxNl93RmhBY1QAAgQLYClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (896, 'gQF_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyay1RMjU2T0JlaUcxNzB3RnhBY2EAAgQMYClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (897, 'gQGZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQVpaNDRmT0JlaUcxNzF3Rk5BYzEAAgQNYClkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (898, 'gQFL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyT1d5RDVpT0JlaUcxNW94RmhBY1MAAgSkYClkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (899, 'gQFU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyczh2MTRaT0JlaUcxN2VBRjFBY2cAAgQaZClkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (900, 'gQEC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWG9ELTR0T0JlaUcxN3BBRmhBY2wAAgQlZClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (901, 'gQF78DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRDhjNzRpT0JlaUcxN3NBRjFBY1EAAgQoZClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (902, 'gQEr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeFdJSDRJT0JlaUcxN0hCRmhBY1oAAgQ3ZSlkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (903, 'gQG-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySDNfcTU4T0JlaUcxNkRDRmhBYzMAAgTzZSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (904, 'gQHJ7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydXFMTjRJT0JlaUcxNG5ERmhBY0oAAgRjZilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (905, 'gQGt7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeHdqSzRMT0JlaUcxN1FFRmhBY3kAAgRAaClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (906, 'gQEo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTzgtRzV0T0JlaUcxN1JFRnhBY2wAAgRBaClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (907, 'gQHk7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVGltbzRsT0JlaUcxN1dFRjFBY1gAAgRGaClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (908, 'gQH_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycmhvYjRPT0JlaUcxNkVGRmhBY3YAAgT0aClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (909, 'gQHa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNTM0UTUyT0JlaUcxN0VGRjFBY2kAAgQ0aSlkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (910, 'gQFd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMUVNUTROT0JlaUcxNDlHRnhBY0oAAgRVaSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (911, 'gQEM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybllTNTVaT0JlaUcxNGFHRjFBY3EAAgRWaSlkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (912, 'gQHw7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb3ZBVzRvT0JlaUcxNHBHRjFBYy0AAgRlaSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (913, 'gQH-7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUldMTzRwT0JlaUcxNEFHRjFBY3oAAgRwaSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (914, 'gQHN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyajVpQzV5T0JlaUcxNFFHRnhBYzQAAgSAaSlkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (915, 'gQH67zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZnFvVjRYT0JlaUcxNlZJRk5BY3EAAgQFbClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (916, 'gQH87zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydUVITzVNT0JlaUcxN2tLRmhBY3UAAgQgbilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (917, 'gQEf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQVR4azRYT0JlaUcxNkRMRmhBY3UAAgTzbilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (918, 'gQFE8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydXpLQTRKT0JlaUcxNkZMRnhBY0cAAgT1bilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (919, 'gQFF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU3NrbTVDT0JlaUcxNkhMRk5BY08AAgT3bilkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (920, 'gQEP8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMGhmdzVMT0JlaUcxN1BMRk5BY1MAAgQ-bylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (921, 'gQEl8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLXduNTQ1T0JlaUcxYnRkRjFBYzEAAgQpjSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (922, 'gQFy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ0x1OTR0T0JlaUcxYl9kRk5BY2EAAgRLjSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (923, 'gQGc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydl8wQTViT0JlaUcxOGZoRk5BY28AAgRbkClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (924, 'gQFy8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRzgyXzV1T0JlaUcxOWNoRmhBY2cAAgSYkClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (925, 'gQEM8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyXzUzTjR6T0JlaUcxYUhoRmhBY1gAAgT3kClkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (926, 'gQFp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYVNkZjRXT0JlaUcxOE91Rk5BY1AAAgR_nSlkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (927, 'gQGn8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZGZCbjRFT0JlaUcxOTFIRjFBY3MAAgSNqilkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (928, 'gQEZ8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc0YtdzQtT0JlaUcxYTlJRnhBY3UAAgTVqylkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (929, 'gQH68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycUJINTVMT0JlaUcxYUVJRnhBY3YAAgT0qylkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (930, 'gQEK8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU2hqdjRyT0JlaUcxYTRNRjFBY0oAAgTQrylkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (931, 'gQFS8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyX0ltRjR3T0JlaUcxOXEtRjFBY2QAAgSmvSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (932, 'gQF98TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySk5fQzVET0JlaUcxYTQtRk5BY1oAAgTQvSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (933, 'gQEl8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyd1dPQjUyT0JlaUcxYUQtRk5BY2wAAgTzvSlkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (934, 'gQG08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLWRySjQ2T0JlaUcxYmstRnhBY2wAAgQgvilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (935, 'gQHZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNHBrQzQyT0JlaUcxYkUtRnhBY1gAAgQ0vilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (936, 'gQFu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYXlMWTRST0JlaUcxODBfRnhBY2sAAgRMvilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (937, 'gQFR8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTFRHczRUT0JlaUcxZEkzRk5BY0wAAgS4wilkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (938, 'gQHF7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRWJkdzVkT0JlaUcxY09sRnhBY18AAgR_1ClkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (939, 'gQHA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybXRDQzVRT0JlaUcxZTJuRmhBY2kAAgTO1ilkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (940, 'gQGt8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRm94MjRZT0JlaUcxZURuRnhBYzYAAgTz1ilkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (941, 'gQGi8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyR0dheTQ0T0JlaUcxZmluRk5BYzUAAgQe1ylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (942, 'gQFL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMzRZcDRtT0JlaUcxYzVvRmhBY3QAAgRR1ylkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (943, 'gQEd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySVJEUjVOT0JlaUcxY3hvRnhBY1AAAgRt1ylkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (944, 'gQF98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycXpZRDRRT0JlaUcxMjVJR3hBY3cAAgTRKypkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (945, 'gQHC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWDNNWTRpT0JlaUcxMktJRzFBY3kAAgT6KypkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (946, 'gQEo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ01KZDR6T0JlaUcxMEVKR2hBY0oAAgR0LCpkAwS0AAAA', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `reg` VALUES (947, 'gQEc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySktqdTRpT0JlaUcxMnZVR2hBY3EAAgTrNypkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (948, 'gQFW8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTFdISTRNT0JlaUcxYXU0RzFBY3IAAgTqgypkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (949, 'gQFp8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVE12bjVNT0JlaUcxOWM1R05BY3oAAgSYhCpkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (950, 'gQGj8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNFkteDQ5T0JlaUcxYTk1R3hBY0MAAgTVhCpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (951, 'gQGl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUjAteDRWT0JlaUcxOG5mR2hBY2oAAgRjjipkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (952, 'gQFS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb2ZoTTVhT0JlaUcxOHdnR05BY1QAAgRsjypkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (953, 'gQFB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyekhwWDQzT0JlaUcxOHlnR2hBY3YAAgRujypkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (954, 'gQFo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyT1d4UTViT0JlaUcxYlZ4R05BY1MAAgRFoSpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (955, 'gQEH8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyXzNQRTUtT0JlaUcxOG55RzFBY0EAAgRjoSpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (956, 'gQHN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ2pTOTRtT0JlaUcxOGlDR05BY0kAAgRepSpkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (957, 'gQEP8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya0FKMzVET0JlaUcxYlVDR05BY0IAAgREpipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (958, 'gQGo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ0VoMzRsT0JlaUcxYlhDR2hBY2gAAgRHpipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (959, 'gQGF8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTGZLTTR1T0JlaUcxYkZIR3hBY2UAAgQ1qypkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (960, 'gQGC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUGlPcDRKT0JlaUcxYnNNR2hBY0sAAgQosCpkAwS0AAAA', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `reg` VALUES (961, 'gQGH8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLXRwSjVqT0JlaUcxOHdTRzFBY1AAAgRstSpkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (962, 'gQHS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYWJ1djQ3T0JlaUcxYVFTR05BYzEAAgQAtipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (963, 'gQGm8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMmxzWjVUT0JlaUcxYS1TR3hBY3IAAgQKtipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (964, 'gQGO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeElFYzR3T0JlaUcxYjBTR3hBY2QAAgQMtipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (965, 'gQHA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTFBNLTRXT0JlaUcxOEpUR05BY3EAAgR5tipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (966, 'gQF08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRXJjNzRWT0JlaUcxOE5UR3hBY1EAAgR9tipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (967, 'gQGN8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQnFNdzRZT0JlaUcxOFFUR05BYzMAAgSAtipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (968, 'gQGk8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMHlUNzRLT0JlaUcxZkloR2hBY0YAAgQ40SpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (969, 'gQHW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMGlHMDR3T0JlaUcxZS1pR3hBY0UAAgQK0ipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (970, 'gQGh8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU0NhWjRPT0JlaUcxZjRpR2hBY2MAAgQQ0ipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (971, 'gQG68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyR1ZjazRQT0JlaUcxZjVpR2hBYy0AAgQR0ipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (972, 'gQHR8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydy1oTzVXT0JlaUcxZEJqR2hBY3IAAgSx0ipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (973, 'gQEP8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS3dXTDRMT0JlaUcxZEZqR05BY0gAAgS10ipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (974, 'gQGu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycXNMejVCT0JlaUcxZEZqR3hBY0MAAgS10ipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (975, 'gQHK8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybHUwbTVKT0JlaUcxZFptR05BY0cAAgTJ1SpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (976, 'gQF98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVmh5bTU4T0JlaUcxZTFtR3hBY3oAAgTN1SpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (977, 'gQGg8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZXlVcjVBT0JlaUcxZTRtR3hBY0cAAgTQ1SpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (978, 'gQG68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyck9SRTUwT0JlaUcxZXZyR2hBYzQAAgTr2ipkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (979, 'gQF58DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZjZvbTVWT0JlaUcxZVFyRzFBY3UAAgQA2ypkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (980, 'gQGZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybG1INzVGT0JlaUcxZVRyR2hBY0gAAgQD2ypkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (981, 'gQGa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySFhhcTVaT0JlaUcxZEFWSHhBY20AAgSw_CtkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (982, 'gQHq8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVzk4ZDVGT0JlaUcxZVdWSDFBY1AAAgQG_StkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (983, 'gQF08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycDRXdDVJT0JlaUcxZU5XSE5BY3QAAgT9_StkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (984, 'gQHT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVmpDNjVoT0JlaUcxMkozSXhBY1YAAgT5AixkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (985, 'gQF58DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya2VvRjVaT0JlaUcxMlI3SWhBY2kAAgQBByxkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (986, 'gQF-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOG14QzVfT0JlaUcxZmRUSU5BYzIAAgQZ9yxkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (987, 'gQEI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydGdLUjRyT0JlaUcxZmRUSXhBY1UAAgQZ9yxkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (988, 'gQGz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNUhFbzVvT0JlaUcxNWFlSmhBY1EAAgSWTS1kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (989, 'gQFn8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWWUtejVoT0JlaUcxNWNlSmhBY2wAAgSYTS1kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (990, 'gQGz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLVVwQTRRT0JlaUcxMW11TGhBY3YAAgSiHS9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (991, 'gQG68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySkREYzV5T0JlaUcxMXF1TDFBY3MAAgSmHS9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (992, 'gQE48DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUWF3ajR3T0JlaUcxMXR1TE5BY3cAAgSpHS9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (993, 'gQEa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWlIydjRrT0JlaUcxMElDTGhBY00AAgR4JS9kAwS0AAAA', 'ociWS6tg9QIyLgxa8i5yCtdPV-yI');
INSERT INTO `reg` VALUES (994, 'gQFE8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOUljZzVLT0JlaUcxMFRDTGhBYzQAAgSDJS9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (995, 'gQHO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydUFicTQ2T0JlaUcxMFVDTHhBY3EAAgSEJS9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (996, 'gQHU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVTI2czRHT0JlaUcxM2pDTDFBY0YAAgQfJi9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (997, 'gQFT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyckZOSjU0T0JlaUcxM21DTHhBY2wAAgQiJi9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (998, 'gQFc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZE16YzRDT0JlaUcxOHVMTGhBY0EAAgRqri9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (999, 'gQGe8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydE5BTDQwT0JlaUcxOHZMTE5BY2kAAgRrri9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1000, 'gQHy8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOUlLLTRCT0JlaUcxM3AzTXhBY0EAAgQlAzBkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1001, 'gQGJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybWV6MDU0T0JlaUcxM3UzTTFBY3IAAgQqAzBkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1002, 'gQHr7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV3Z0ejR1T0JlaUcxM3YzTU5BY3IAAgQrAzBkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1003, 'gQEI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM3V6ODVDT0JlaUcxMHNNTWhBY1AAAgRoLzBkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1004, 'gQF68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRmZ0NzVwT0JlaUcxMlVNTWhBYzMAAgQEMDBkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1005, 'gQGR8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOXlXeDRnT0JlaUcxZXRCTU5BYzYAAgTp5DBkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1006, 'gQH78DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNERJTDRVT0JlaUcxZXRCTTFBY28AAgTp5DBkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1007, 'gQHH8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeFdzSDVMT0JlaUcxODhtTjFBY04AAgRUlTFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1008, 'gQHi7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyY1d3ZjRrT0JlaUcxMDRtT2hBY18AAgRQFTJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1009, 'gQEI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycWNibzVtT0JlaUcxMlFvT3hBY0QAAgQAGDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1010, 'gQEI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeEhzVzVmT0JlaUcxMGFxTzFBY0YAAgRWGTJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1011, 'gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLThYZTV3T0JlaUcxMHpxT3hBYzYAAgRvGTJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1012, 'gQGZ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNFk1UzU5T0JlaUcxM3RUTzFBY20AAgQpNzJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1013, 'gQEB8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydjQ5QTQ4T0JlaUcxNUdKT05BY04AAgS2bDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1014, 'gQHW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb2FxcDV6T0JlaUcxOWl6TzFBY1IAAgSeojJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1015, 'gQFc8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySzNXbTVxT0JlaUcxOExGT3hBY2wAAgR7qDJkAwS0AAAA', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `reg` VALUES (1016, 'gQF98TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNDVXcjR4T0JlaUcxOFZGT3hBY0EAAgSFqDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1017, 'gQF28DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyY1dJOTVqT0JlaUcxYklNT3hBY2wAAgQ4sDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1018, 'gQGE8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyY1BTeDRfT0JlaUcxYk5NT05BY0gAAgQ9sDJkAwS0AAAA', 'ociWS6nV9F09A0JfGeCfvLPqbvr8');
INSERT INTO `reg` VALUES (1019, 'gQG88DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMlVhSDVkT0JlaUcxOEZOT2hBYzcAAgR1sDJkAwS0AAAA', 'ociWS6nV9F09A0JfGeCfvLPqbvr8');
INSERT INTO `reg` VALUES (1020, 'gQFr8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeGQtTTU1T0JlaUcxOE9OT3hBY28AAgR_sDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1021, 'gQEH8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyekdhbzV4T0JlaUcxOFJOT05BY3kAAgSBsDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1022, 'gQEe8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyY3BoSDRIT0JlaUcxOWZOT3hBY0gAAgSbsDJkAwS0AAAA', 'ociWS6hE90h36YJqSzP6pA_zBJgM');
INSERT INTO `reg` VALUES (1023, 'gQF58TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOFc0OTVpT0JlaUcxOUFOT2hBY3IAAgSwsDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1024, 'gQGI8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNXJZWDU2T0JlaUcxOUJOT05BY1IAAgSxsDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1025, 'gQFB8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZTVJajVHT0JlaUcxOU9OT2hBY18AAgS_sDJkAwS0AAAA', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `reg` VALUES (1026, 'gQFM8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTTBrMDVCT0JlaUcxOVhOT3hBY2wAAgTHsDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1027, 'gQEm8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWGZCVDUwT0JlaUcxOVhOT3hBY2gAAgTHsDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1028, 'gQFn8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS0poODUyT0JlaUcxYUVOTzFBY0kAAgT0sDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1029, 'gQHT8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya3lIRzRRT0JlaUcxYUVOT2hBY0oAAgT0sDJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1030, 'gQHM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZGJGZjVFT0JlaUcxYVRPTzFBY3MAAgQDsjJkAwS0AAAA', 'ociWS6gP_ZJ_9v74dyJRV1t7HL5g');
INSERT INTO `reg` VALUES (1031, 'gQFY8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyN2tCWjQxT0JlaUcxYjJPTzFBY0YAAgQOsjJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1032, 'gQG68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyck5VazVQT0JlaUcxYjNPT3hBYzkAAgQPsjJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1033, 'gQGh8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaWRTNzUzT0JlaUcxOEJTT05BY3QAAgRxtTJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1034, 'gQGX8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV1gzSDU0T0JlaUcxOFJTT2hBY3AAAgSBtTJkAwS0AAAA', 'ociWS6hE90h36YJqSzP6pA_zBJgM');
INSERT INTO `reg` VALUES (1035, 'gQE88TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaFJZWTRWT0JlaUcxOUhTTzFBY3IAAgS3tTJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1036, 'gQED8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyelRSNDRVT0JlaUcxZElnT2hBYzIAAgS4zzJkAwS0AAAA', 'ociWS6hE90h36YJqSzP6pA_zBJgM');
INSERT INTO `reg` VALUES (1037, 'gQHY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydXhUUzRWT0JlaUcxNlZPUGhBY2MAAgQFcjNkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (1038, 'gQEM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaEduTDV4T0JlaUcxN2RPUDFBY0sAAgQZcjNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1039, 'gQHS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycXIzLTUwT0JlaUcxNWRWUDFBY2gAAgSZeDNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1040, 'gQGS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVmZYaTVXT0JlaUcxOGJFUGhBYzMAAgRXpzNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1041, 'gQHO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOXVJdDVXT0JlaUcxYlFHUDFBYzkAAgRAqjNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1042, 'gQFf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyME9ZeTRwT0JlaUcxYlNHUGhBY28AAgRCqjNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1043, 'gQFU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydEtTcDVUT0JlaUcxYi1HUHhBY3IAAgRKqjNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1044, 'gQHb8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyclBrYzRrT0JlaUcxZDk0UGhBY3gAAgSVwzNkAwS0AAAA', 'ociWS6gP_ZJ_9v74dyJRV1t7HL5g');
INSERT INTO `reg` VALUES (1045, 'gQGS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNUZuRDRsT0JlaUcxYzI1UGhBY3AAAgROxDNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1046, 'gQFN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMUNYSDRtT0JlaUcxY3k1UGhBY2YAAgRuxDNkAwS0AAAA', 'ociWS6nmlKEt2eGWNgHu7jlqHGFo');
INSERT INTO `reg` VALUES (1047, 'gQH08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOWE1LTV2T0JlaUcxZk1hUDFBYy0AAgQ8yjNkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1048, 'gQHi7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaUlJRzVwT0JlaUcxY213UGhBY1oAAgRi3zNkAwS0AAAA', 'ociWS6rBWGu91iaK-NbjGNbP7jLY');
INSERT INTO `reg` VALUES (1049, 'gQG18DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNDVwRzRDT0JlaUcxMXhwUXhBY28AAgStGDRkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (1050, 'gQGq8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVHJMQjRGT0JlaUcxMjBwUXhBY2sAAgTMGDRkAwS0AAAA', 'ociWS6mqBH6uevoMMi6FfBiBCZCE');
INSERT INTO `reg` VALUES (1051, 'gQG98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyM01pcTVDT0JlaUcxMkZ1UzFBY04AAgT1HTZkAwS0AAAA', 'ociWS6j17km6QToj5dcoy1kNB8YA');
INSERT INTO `reg` VALUES (1052, 'gQEc8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLXd1TjVYT0JlaUcxMUVEUzFBYzgAAgS0JjZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1053, 'gQE38TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYzU3WDRhT0JlaUcxMVNEUzFBYzkAAgTCJjZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1054, 'gQHG7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeFVkUzVzT0JlaUcxN2twUzFBY18AAgQgWTZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1055, 'gQHS7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySFR6TjVFT0JlaUcxN1pwU2hBY1IAAgRJWTZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1056, 'gQEM8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTkZHODRZT0JlaUcxZjRKUzFBY08AAgQQ7TZkAwS0AAAA', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `reg` VALUES (1057, 'gQHK8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYTd0STRGT0JlaUcxZFhLU2hBY1EAAgTH7TZkAwS0AAAA', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY');
INSERT INTO `reg` VALUES (1058, 'gQF88DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZjgzaTVET0JlaUcxZVRSU2hBY3MAAgQD9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1059, 'gQEP8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUnZvdjVoT0JlaUcxZVZSU2hBY0UAAgQF9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1060, 'gQGB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUTlrdDVtT0JlaUcxZVhSUzFBY0UAAgQH9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1061, 'gQGq8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyd2RHUDUtT0JlaUcxZVpSU05BYzIAAgQJ9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1062, 'gQF_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTl9UZzVRT0JlaUcxZS1SU05BY3AAAgQK9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1063, 'gQEF8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMDFLaDU0T0JlaUcxZV9SUzFBY0QAAgQL9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1064, 'gQGY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydE9zVzV3T0JlaUcxY3hTU3hBYzQAAgRt9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1065, 'gQEG8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUFg3YTRQT0JlaUcxZDdTU3hBY1UAAgST9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1066, 'gQHf8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWHdXbjRHT0JlaUcxZENTUzFBY00AAgSy9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1067, 'gQGN8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybE1VdDVhT0JlaUcxZEhTU2hBY1UAAgS39TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1068, 'gQGb8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTFNXeDRkT0JlaUcxZFpTU2hBYzUAAgTJ9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1069, 'gQHl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQWRRVzRCT0JlaUcxZTBTU05BY24AAgTM9TZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1070, 'gQHM7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV056ejRhT0JlaUcxN1BBVDFBY3UAAgQ-ZDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1071, 'gQER8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyODZzcTVmT0JlaUcxNllCVGhBY2cAAgQIZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1072, 'gQFD8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNVIzWjVoT0JlaUcxN1ZCVDFBY20AAgRFZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1073, 'gQH27zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTVd2dDU2T0JlaUcxN1lCVDFBY2wAAgRIZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1074, 'gQEx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySXVWQzU3T0JlaUcxN1pCVDFBY2UAAgRJZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1075, 'gQE-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOWJHbDVGT0JlaUcxNy1CVGhBY0YAAgRKZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1076, 'gQHE7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYnZBTDRnT0JlaUcxN19CVHhBY0cAAgRLZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1077, 'gQEO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ2JQRzRNT0JlaUcxNDBDVE5BY3YAAgRMZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1078, 'gQEK8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeWstcjVpT0JlaUcxNDFDVDFBY1UAAgRNZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1079, 'gQHa7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZWdBVDVjT0JlaUcxNDNDVHhBY2IAAgRPZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1080, 'gQEl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLXlJbTRkT0JlaUcxNDNDVDFBY2MAAgRPZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1081, 'gQFi8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWXNDZzRxT0JlaUcxNVJDVE5BY1AAAgTBZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1082, 'gQFz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTl8wZzRQT0JlaUcxNVNDVGhBY3YAAgTCZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1083, 'gQGP8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaVN0ODV1T0JlaUcxNVpDVDFBYzkAAgTJZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1084, 'gQF98DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRHpWaDVGT0JlaUcxNjVDVGhBY0sAAgTRZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1085, 'gQGL8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUlJGOTV3T0JlaUcxNjhDVE5BY3kAAgTUZTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1086, 'gQE38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycGFBQTQyT0JlaUcxNGFEVDFBY1UAAgRWZjdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1087, 'gQHw7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWDVpRTU4T0JlaUcxNGxEVE5BY3oAAgRhZjdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1088, 'gQGU8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybncxNDRvT0JlaUcxNUtFVE5BY1YAAgS6ZzdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1089, 'gQF18DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyX2s2WDVPT0JlaUcxNmZFVE5BY0kAAgTbZzdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1090, 'gQFo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOUZqZTUtT0JlaUcxNkJFVHhBY2YAAgTxZzdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1091, 'gQEA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRVdKVTROT0JlaUcxN3RFVHhBY1UAAgQpaDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1092, 'gQFz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMWpVQTRWT0JlaUcxNDZGVDFBY0IAAgRSaDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1093, 'gQEO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyczk5TDVkT0JlaUcxNGFGVDFBY2kAAgRWaDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1094, 'gQG58DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYU45YzRuT0JlaUcxNTZGVE5BY2wAAgSSaDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1095, 'gQGp8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySTNCSzRMT0JlaUcxNnRGVDFBY2cAAgTpaDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1096, 'gQFC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMUh6eDRET0JlaUcxNnVGVE5BY1UAAgTqaDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1097, 'gQFO8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyelhWSjU4T0JlaUcxNk1GVHhBYzkAAgT8aDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1098, 'gQGy7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeEt4UzRYT0JlaUcxN3VGVHhBY0IAAgQqaTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1099, 'gQGY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaXdUczRfT0JlaUcxN0tGVGhBY2YAAgQ6aTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1100, 'gQFJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyS0F6ODU0T0JlaUcxN1FGVDFBY3MAAgRAaTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1101, 'gQHp7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydk5paDVBT0JlaUcxN1RGVGhBYzIAAgRDaTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1102, 'gQGu8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOXRhXzVvT0JlaUcxNC1HVE5BY2MAAgSKaTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1103, 'gQH-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQl9RWDVMT0JlaUcxNTFHVDFBY20AAgSNaTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1104, 'gQHl8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyd25ZRTRkT0JlaUcxYU81VDFBY3MAAgT_hDdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1105, 'gQH28DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLWU5YzVST0JlaUcxYnk1VDFBY2wAAgQuhTdkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1106, 'gQHd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOEtDdjQwT0JlaUcxYkpIVGhBY04AAgQ5qzdkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (1107, 'gQF88DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeWtFSDRyT0JlaUcxYUxzVXhBY0gAAgT7mzhkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1108, 'gQFN8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQnV0WjQwT0JlaUcxOXNDVmhBYy0AAgSopTlkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (1109, 'gQGo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNjl2SzQ2T0JlaUcxMzJ2V05BY20AAgQOHzpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1110, 'gQEQ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRlByYjVJT0JlaUcxM2F2V2hBY2YAAgQWHzpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1111, 'gQGV8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyelJRLTVDT0JlaUcxM0d2VzFBYzgAAgQ2HzpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1112, 'gQGI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySDMyeTU2T0JlaUcxM0h2V05BY1cAAgQ3HzpkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1113, 'gQEh8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAya0ZzaTVlT0JlaUcxMlZZWDFBY2gAAgQFPDtkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1114, 'gQHe7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydmNTUDRrT0JlaUcxMldZWHhBY24AAgQGPDtkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1115, 'gQEC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ0hTYzRLT0JlaUcxMGVaWE5BY24AAgRaPDtkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1116, 'gQF18DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ01jVzRrT0JlaUcxZk9yWDFBYzQAAgQ_2ztkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1117, 'gQGa8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydGF4YzVRT0JlaUcxOXB4WXhBY1MAAgSloDxkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1118, 'gQEb8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRGNkRDVST0JlaUcxOXB4WXhBYzIAAgSloDxkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1119, 'gQFk8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaVotOTQ0T0JlaUcxM0xaWmhBY1EAAgQ7PT1kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1120, 'gQEO8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU0NaZDVPT0JlaUcxMXg4LWhBY0gAAgStBz5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1121, 'gQGw8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUTFVMDQwT0JlaUcxMXk4LTFBY0gAAgSuBz5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1122, 'gQGI8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ2E3XzRST0JlaUcxNzZxLWhBYzEAAgQSWj5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1123, 'gQED8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb1BuRjVkT0JlaUcxN2ZxLWhBYzEAAgQbWj5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1124, 'gQH78DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMjNUNzQ2T0JlaUcxN0FxLTFBYzIAAgQwWj5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1125, 'gQFz8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNW9SeDV3T0JlaUcxNjZyLTFBY2MAAgTSWj5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1126, 'gQEi8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMjZmbTQtT0JlaUcxNF9CLTFBY3gAAgSLZD5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1127, 'gQF28DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUUw3bzRZT0JlaUcxN2xFLTFBY0MAAgQhaD5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1128, 'gQF-8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNXA2QTQyT0JlaUcxNGJGLU5BY0EAAgRXaD5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1129, 'gQFn8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybFdrczU5T0JlaUcxNWFGLXhBY2MAAgSWaD5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1130, 'gQHM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZXg3WDQ4T0JlaUcxNVNGLU5BY0EAAgTCaD5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1131, 'gQE38DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyTGVDRDR2T0JlaUcxNmlHLXhBY20AAgTeaT5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1132, 'gQHd7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVU8tcjR6T0JlaUcxNHBILTFBY3EAAgRlaj5kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1133, 'gQH88DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQUlUbDVJT0JlaUcxYjZrLU5BY3AAAgQSlD5kAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (1134, 'gQF78DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYjRIeTRxT0JlaUcxMUtRX2hBY18AAgS6Mz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1135, 'gQHl7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycEhzYTVKT0JlaUcxNlZ0XzFBY3UAAgQFXT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1136, 'gQEJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMmxDbTVjT0JlaUcxN2R0XzFBY1MAAgQZXT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1137, 'gQHc7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb0ZYSjRWT0JlaUcxN2R0X2hBY04AAgQZXT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1138, 'gQHN7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybjk0cjVJT0JlaUcxNHB1X05BYzcAAgRlXT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1139, 'gQFP7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZWRVajRHT0JlaUcxNHB1X3hBY1MAAgRlXT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1140, 'gQE_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyU0FNdzVTT0JlaUcxNjN1X2hBY2gAAgTPXT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1141, 'gQFv8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeVQxTTRHT0JlaUcxNjN1X05BY2sAAgTPXT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1142, 'gQEQ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb2MyeDRkT0JlaUcxNk11X05BYzUAAgT8XT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1143, 'gQEW8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycS1kWDVhT0JlaUcxNk11XzFBY3AAAgT8XT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1144, 'gQGY7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVmVSazVXT0JlaUcxNll1X3hBY3oAAgQIXj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1145, 'gQH87zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYnBQUjQtT0JlaUcxNll1X2hBY1UAAgQIXj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1146, 'gQE78DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySC1pRTRST0JlaUcxNl91X05BY1MAAgQLXj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1147, 'gQGR8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaDY0MDQtT0JlaUcxNzJ1X2hBY1IAAgQOXj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1148, 'gQGG8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycTFGRTRaT0JlaUcxNUx2X05BY1kAAgS7Xj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1149, 'gQE68DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZDN0aTRJT0JlaUcxNUx2X05BY28AAgS7Xj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1150, 'gQFK8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNkVPTTVzT0JlaUcxNml2X2hBYzUAAgTfXj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1151, 'gQHp7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRlppbDRDT0JlaUcxNmx2X2hBY2QAAgThXj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1152, 'gQEn8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRDVXVDR3T0JlaUcxNk52X05BY18AAgT9Xj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1153, 'gQET8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyLWZUdDU4T0JlaUcxNlF2X2hBY1kAAgQAXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1154, 'gQEx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyREJxXzRRT0JlaUcxNzV2XzFBY2kAAgQRXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1155, 'gQFB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVTVCVzV1T0JlaUcxNzl2X05BY0IAAgQVXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1156, 'gQHM7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZVVtdDRIT0JlaUcxN3V2XzFBYzkAAgQqXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1157, 'gQEy7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyUWVqczR3T0JlaUcxN3V2X3hBY2UAAgQqXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1158, 'gQHc7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV0g1dzV6T0JlaUcxN3d2XzFBY0IAAgQsXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1159, 'gQEB8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMnZFUzQyT0JlaUcxN3l2XzFBY20AAgQuXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1160, 'gQG_7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaC1FVzV0T0JlaUcxNEF3XzFBY3QAAgRwXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1161, 'gQHH7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybkpCNzRMT0JlaUcxNEF3X05BY3cAAgRwXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1162, 'gQFQ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMDc0NzRRT0JlaUcxNEJ3X05BY0YAAgRxXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1163, 'gQHR7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVzlMRTQ1T0JlaUcxNFB3X3hBY0wAAgR-Xz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1164, 'gQGP8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyekFyaDVjT0JlaUcxNTd3XzFBYzYAAgSTXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1165, 'gQGM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV3NlVzVYT0JlaUcxNTd3X05BYzYAAgSTXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1166, 'gQFS8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmc4ajRQT0JlaUcxNW93XzFBY2QAAgSkXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1167, 'gQE48DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydTQ5cTVrT0JlaUcxNXR3X3hBYy0AAgSpXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1168, 'gQFx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRzJ3YzVLT0JlaUcxNVp3X05BYzgAAgTJXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1169, 'gQEQ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNmpxWDVOT0JlaUcxNmZ3X3hBYzcAAgTbXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1170, 'gQEV8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyME93NjVKT0JlaUcxNnF3X2hBY20AAgTmXz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1171, 'gQGx7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyY3JkNDVaT0JlaUcxNk93X3hBY3oAAgT_Xz9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1172, 'gQHu7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySlR6bjVUT0JlaUcxNzF3X3hBYzcAAgQNYD9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1173, 'gQEE8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZ3FMUTRUT0JlaUcxNzF3XzFBY3oAAgQNYD9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1174, 'gQHK7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycUhSdDRGT0JlaUcxNzV3X3hBY2kAAgQRYD9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1175, 'gQGJ8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyV1lSejRDT0JlaUcxNTN4X2hBY0QAAgSQYD9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1176, 'gQGj8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYU5DUTUtT0JlaUcxNVp4XzFBY08AAgTJYD9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1177, 'gQH97zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRC1kTDVkT0JlaUcxN2JCX3hBY3IAAgQXZT9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1178, 'gQEe8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyejJxLTRwT0JlaUcxNlVDX2hBY0wAAgQEZj9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1179, 'gQFy7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyNW13WjVZT0JlaUcxNENOX2hBY3YAAgRycD9kAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1180, 'gQF77zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybEh4VjRoT0JlaUcxa056MTFBY0gAAgR9YkFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1181, 'gQF_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyOVQ5eTVST0JlaUcxa1F6MU5BY3oAAgSAYkFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1182, 'gQHA8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyRzFtNzVhT0JlaUcxa1V6MTFBY2EAAgSEYkFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1183, 'gQG08DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVWlBWjUxT0JlaUcxa1h6MTFBY1oAAgSHYkFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1184, 'gQHN7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAySldlZDVJT0JlaUcxbkpMMXhBY0sAAgQ5b0FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1185, 'gQGg7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZmdVUjVoT0JlaUcxbk5MMXhBY0cAAgQ9b0FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1186, 'gQEC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyZWVMQjVYT0JlaUcxblBMMTFBY1QAAgQ-b0FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1187, 'gQFn8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyWDJkSTUyT0JlaUcxazFNMTFBY0kAAgRNb0FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1188, 'gQGi7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAycnJmQzVuT0JlaUcxbU9XMU5BY3oAAgT_eUFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1189, 'gQHW7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyeGNFbTVwT0JlaUcxbjZXMU5BY0cAAgQSekFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1190, 'gQE37zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc3VzNzVhT0JlaUcxbnJXMXhBY3UAAgQnekFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1191, 'gQHp7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybml5cTQtT0JlaUcxbHRYMXhBY0YAAgSpekFkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (1192, 'gQGn8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyejdWZDVRT0JlaUcxbzEzMXhBY3IAAgRNgkFkAwS0AAAA', 'ociWS6jH_wjSOXxF0norcSBsFke8');
INSERT INTO `reg` VALUES (1193, 'gQFC8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYk9UaDU2T0JlaUcxdkVIMXhBY3AAAgQ060FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1194, 'gQEd8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyekV1MDVOT0JlaUcxc0FJMU5BY3oAAgRw60FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1195, 'gQGM8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydk9MNzQ1T0JlaUcxc05JMTFBY0QAAgR960FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1196, 'gQFX8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyb3NSaTVjT0JlaUcxdUtJMXhBYzIAAgT660FkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1197, 'gQHV8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyQ0FYUjVOT0JlaUcxdmNJMTFBY0cAAgQY7EFkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1198, 'gQFw8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyaFlDNzVHT0JlaUcxamUyMmhBY3YAAgQaAkJkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1199, 'gQFx8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYldFXzR3T0JlaUcxaHlZMk5BYzgAAgSuO0JkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1200, 'gQED8TwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMHQ3MDQ0T0JlaUcxb2UxMnhBY1UAAgRagEJkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (1201, 'gQGo8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAydTNOMjV1T0JlaUcxdHBMNWhBY3cAAgSl7kVkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1202, 'gQE_8DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyMkJjZjRRT0JlaUcxdnBMNWhBY24AAgQl70VkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (1203, 'gQF28DwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAybjFiajVCT0JlaUcxaGxINmhBY3MAAgShKkZkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1204, 'gQH17zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyYjdFNzR4T0JlaUcxam9xN2hBY3IAAgQkGkdkAwS0AAAA', 'ociWS6ki2ki7j5sv44DWiwhva9H4');
INSERT INTO `reg` VALUES (1205, 'gQG97zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyVHFFQjRsT0JlaUcxbmtEN3hBY1MAAgQgZ0dkAwS0AAAA', NULL);
INSERT INTO `reg` VALUES (1206, 'gQGC7zwAAAAAAAAAAS5odHRwOi8vd2VpeGluLnFxLmNvbS9xLzAyc3JaTjRwT0JlaUcxbmtEN3hBY0kAAgQgZ0dkAwS0AAAA', NULL);

-- ----------------------------
-- Table structure for reg_yx_user
-- ----------------------------
DROP TABLE IF EXISTS `reg_yx_user`;
CREATE TABLE `reg_yx_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一键注册游戏账号表',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open_id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏密码',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `problem1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题一',
  `key1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案一',
  `problem2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题二',
  `key2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '答案二',
  `status` int(1) NULL DEFAULT NULL COMMENT '0开启，1关闭',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后保存时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reg_yx_user
-- ----------------------------
INSERT INTO `reg_yx_user` VALUES (1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 'aaa1', 'bbb', '张三', '2023-12-14', '1', '2', '3', '4', 0, '2023-04-10 14:03:29');
INSERT INTO `reg_yx_user` VALUES (2, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11156', '1234q', 'fafa1', '2023-03-31', '哈哈哈', '哈哈哈', '哈哈哈', '哈哈哈', 1, '2023-04-17 14:28:24');

-- ----------------------------
-- Table structure for sq_fl
-- ----------------------------
DROP TABLE IF EXISTS `sq_fl`;
CREATE TABLE `sq_fl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '社区分类表',
  `title_id` int(11) NULL DEFAULT NULL COMMENT '分类id 0为1级分类',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `lt_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sq_fl
-- ----------------------------
INSERT INTO `sq_fl` VALUES (1, 0, '玩家交流', NULL);
INSERT INTO `sq_fl` VALUES (2, 1, '游戏讨论', NULL);
INSERT INTO `sq_fl` VALUES (3, 0, '黑名单', NULL);
INSERT INTO `sq_fl` VALUES (4, 0, '版本讨论', NULL);
INSERT INTO `sq_fl` VALUES (5, 1, '兴趣爱好', NULL);
INSERT INTO `sq_fl` VALUES (6, 3, '传奇黑名单', NULL);
INSERT INTO `sq_fl` VALUES (7, 4, '好服交流', NULL);

-- ----------------------------
-- Table structure for tz_pl
-- ----------------------------
DROP TABLE IF EXISTS `tz_pl`;
CREATE TABLE `tz_pl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子回复表',
  `tz_id` int(11) NULL DEFAULT NULL COMMENT '帖子id',
  `pl_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open_id',
  `is_sh` int(1) NOT NULL DEFAULT 0 COMMENT '0未审核，1审核通过，2审核不通过',
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tz_pl
-- ----------------------------
INSERT INTO `tz_pl` VALUES (11, 16, '真好看', 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '2023-03-24 23:07:22');
INSERT INTO `tz_pl` VALUES (15, 16, '111', 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '2023-03-28 23:55:31');
INSERT INTO `tz_pl` VALUES (16, 18, '????????????????????????????????????', 'ociWS6ki2ki7j5sv44DWiwhva9H4', 0, '2023-04-01 20:49:39');
INSERT INTO `tz_pl` VALUES (17, 18, '666', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '2023-04-03 18:18:31');
INSERT INTO `tz_pl` VALUES (18, 19, '111333', 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 0, '2023-04-03 18:20:20');
INSERT INTO `tz_pl` VALUES (33, 19, '????', 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 0, '2023-04-10 22:41:09');

-- ----------------------------
-- Table structure for ul_coin_goods
-- ----------------------------
DROP TABLE IF EXISTS `ul_coin_goods`;
CREATE TABLE `ul_coin_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '金币商城物品表',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价值',
  `num` int(11) NULL DEFAULT NULL COMMENT '商品库存',
  `sold` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品已售',
  `sort` int(11) NULL DEFAULT NULL COMMENT '商品排序',
  `type` int(1) NULL DEFAULT 0 COMMENT '商品类型0实物  1虚拟',
  `show` int(1) NULL DEFAULT 0 COMMENT '是否展示0展示 1不展示',
  `delete_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_coin_goods
-- ----------------------------
INSERT INTO `ul_coin_goods` VALUES (1, '优酷视频会员（季卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaef5f0b0e.png', 11200.00, 1000, '0', 994, 1, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (2, '爱奇艺视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaee0a4569.png', 49600.00, 1000, '0', 995, 1, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (4, '优酷视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf03a88fc.png', 39600.00, 1000, '0', 993, 1, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (13, '简约办公杯男女士大容量不锈钢保温马克杯', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf3d98b31.png', 11888.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (14, '腾讯视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaebd6dc1d.png', 50600.00, 1000, '0', 997, 1, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (15, '大容量充电宝', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf57a7856.png', 29999.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (17, '天猫精灵IN糖智能音箱', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf6c4cefa.png', 38800.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (18, '爱奇艺视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaed140442.png', 6000.00, 1000, '0', 996, 1, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (19, '小米声波无线充电动牙刷', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf81a1cf6.png', 44800.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 6.00, 1000, '0', 999, 1, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (21, '雷蛇(Razer) 曼巴眼镜蛇精英版 有线鼠标', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf98d2128.jpg', 39800.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (22, '腾讯视频会员（季卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaead8280b.png', 13600.00, 1000, '0', 998, 1, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (23, '飞科便携电动剃须刀', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafbe27221.png', 80800.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (24, '雷蛇 Razer 萨诺狼蛛V2 电竞 RGB游戏键盘', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafd05c975.jpg', 95800.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (25, 'SKG 颈椎按摩器', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafe57d8f1.png', 119800.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (26, 'Apple/苹果 AirPods 3代无线蓝牙耳机', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaff5abc6b.png', 428888.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (27, 'Apple Watch Series 7 智能手表', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ab002e4c6c.png', 828800.00, 1000, '0', 0, 0, 0, NULL);
INSERT INTO `ul_coin_goods` VALUES (28, 'HUAWEI P40 Pro 5G 全网通 8GB+128GB', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ab01524eaa.jpg', 1158800.00, 1000, '0', 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for ul_coin_order
-- ----------------------------
DROP TABLE IF EXISTS `ul_coin_order`;
CREATE TABLE `ul_coin_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '金币商城订单表',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_user_id` int(11) NOT NULL COMMENT '下单用户id',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户open_id',
  `order_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下单用户姓名',
  `order_user_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下单用户头像',
  `coin_goods_id` int(11) NOT NULL COMMENT '下单商品id',
  `coin_goods_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下单商品名称',
  `coin_goods_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '下单商品图片',
  `order_type` int(1) NOT NULL DEFAULT 0 COMMENT '订单类型0实物1虚拟2抽奖',
  `order_statu` int(1) NOT NULL DEFAULT 0 COMMENT '订单状态0下单1待发货2已收货3待补充收货信息',
  `consignee_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `consignee_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人电话',
  `consignee_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人地址',
  `consignee_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `ptzh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '对应平台账号',
  `courier_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '快递单号',
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_coin_order
-- ----------------------------
INSERT INTO `ul_coin_order` VALUES (22, '84ca73ecdd798c91eb143260935170d5', 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '。H', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicicvKoFkwicxVVhD3vfpqibSQEc1ltMZeNLeQxW34cZZoazPeTiaIpXLX7HHiaEaJEHTmEBYCLl1NV6g/132', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043b534a1d.jpg', 0, 0, 'test', '13800000000', 'test', 'test', '', '', '2023-03-24 20:18:11');
INSERT INTO `ul_coin_order` VALUES (23, '7aba03ce36abe561609c56655bd74d58', 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '。H', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicicvKoFkwicxVVhD3vfpqibSQEc1ltMZeNLeQxW34cZZoazPeTiaIpXLX7HHiaEaJEHTmEBYCLl1NV6g/132', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043b534a1d.jpg', 0, 1, 'test', '13800000000', 'test', 'test', '', '', '2023-03-24 20:28:41');
INSERT INTO `ul_coin_order` VALUES (24, 'ec38af4bc4625fe69f21f25ea93a7b7e', 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '。H', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicicvKoFkwicxVVhD3vfpqibSQEc1ltMZeNLeQxW34cZZoazPeTiaIpXLX7HHiaEaJEHTmEBYCLl1NV6g/132', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043b534a1d.jpg', 0, 2, 'test', '13800000000', 'test', 'test', '', '', '2023-03-24 20:30:04');
INSERT INTO `ul_coin_order` VALUES (25, 'f7ba916c636afb208decd5561525122b', 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '。H', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicicvKoFkwicxVVhD3vfpqibSQEc1ltMZeNLeQxW34cZZoazPeTiaIpXLX7HHiaEaJEHTmEBYCLl1NV6g/132', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043d14ee0a.jpg', 1, 3, '', '13800000000', '', '', 'test', '', '2023-03-24 20:33:30');
INSERT INTO `ul_coin_order` VALUES (26, '833c08ceca3512afa3639f15f3374f6a', 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '。H', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicicvKoFkwicxVVhD3vfpqibSQEc1ltMZeNLeQxW34cZZoazPeTiaIpXLX7HHiaEaJEHTmEBYCLl1NV6g/132', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043d14ee0a.jpg', 1, 0, '', '13800000000', '', '', '123', '', '2023-03-24 20:34:42');
INSERT INTO `ul_coin_order` VALUES (27, '3b9e1e1d84a60cf76cd6dfbdf1ee9158', 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '。H', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicicvKoFkwicxVVhD3vfpqibSQEc1ltMZeNLeQxW34cZZoazPeTiaIpXLX7HHiaEaJEHTmEBYCLl1NV6g/132', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 1, '测试', '13800000000', '测试', '测试', '', '顺丰：123456', '2023-03-24 21:21:14');
INSERT INTO `ul_coin_order` VALUES (28, 'e06c6f931953d467789a8981e8537adc', 1, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '。H', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJicicvKoFkwicxVVhD3vfpqibSQEc1ltMZeNLeQxW34cZZoazPeTiaIpXLX7HHiaEaJEHTmEBYCLl1NV6g/132', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043b534a1d.jpg', 0, 0, '哈哈', '13312652970', '哈哈', '哈哈', '', '', '2023-03-24 22:51:46');
INSERT INTO `ul_coin_order` VALUES (29, '0863fa5e2b8d57c3af04568785ea814a', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043b534a1d.jpg', 0, 3, '1', '1', '11', '1', '', '', '2023-03-26 15:10:41');
INSERT INTO `ul_coin_order` VALUES (30, 'e68a9cc8e1881ae267cf3126db14f3dc', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043d14ee0a.jpg', 1, 0, '', '13000000000', '', '', '哈哈', '', '2023-03-26 17:57:08');
INSERT INTO `ul_coin_order` VALUES (31, '5ddfc53fbd88866eaa3e0a5dd0e2f896', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 0, '键盘', 'https://www.baidu.com/img/bd_logo1.png', 2, 3, '', '', '', '', '', '', '2023-03-26 21:36:53');
INSERT INTO `ul_coin_order` VALUES (32, '0f0910548a6f4699ab9cfd6451b7b6cf', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 0, '键盘', 'https://www.baidu.com/img/bd_logo1.png', 2, 3, '', '', '', '', '', '', '2023-03-26 21:40:34');
INSERT INTO `ul_coin_order` VALUES (33, '705dbe9eb1c5efa0351ddfccff967852', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230326/642065d370aed.jpg', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230314/641041eaa7603.jpg', 0, 0, '哈哈', '13800000000', '哈哈', '哈哈', '', '', '2023-03-27 12:54:30');
INSERT INTO `ul_coin_order` VALUES (34, '0bdac5841d4eb33ddd0bcd5de1619c32', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 0, 0, '', '', '', '', '', '', '2023-03-27 16:39:41');
INSERT INTO `ul_coin_order` VALUES (35, 'd55bcd041326e28cfd591611bf71341c', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:07:33');
INSERT INTO `ul_coin_order` VALUES (36, 'd55bcd041326e28cfd591611bf71341c', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:07:33');
INSERT INTO `ul_coin_order` VALUES (37, 'a3715f914bc475ddf1c53edfa3f590a2', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:08:15');
INSERT INTO `ul_coin_order` VALUES (38, 'a3715f914bc475ddf1c53edfa3f590a2', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:08:15');
INSERT INTO `ul_coin_order` VALUES (39, 'a3715f914bc475ddf1c53edfa3f590a2', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:08:15');
INSERT INTO `ul_coin_order` VALUES (40, 'e01305d67955335c84546405bb3ad8f0', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:12:05');
INSERT INTO `ul_coin_order` VALUES (41, 'adbe7cfcedf9c3bb50ad218cc2dac9ce', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:14:03');
INSERT INTO `ul_coin_order` VALUES (42, '9846009ce6654fbd408c64235b6f3bc9', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:23:58');
INSERT INTO `ul_coin_order` VALUES (43, '16d88c3adf05f68263cea179a4ba8cb2', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 1, '的观点', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f49478e8.png', 0, 0, '', '', '', '', '', '', '2023-03-27 17:25:07');
INSERT INTO `ul_coin_order` VALUES (44, '16d88c3adf05f68263cea179a4ba8cb2', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 1, '的观点', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f49478e8.png', 0, 0, '阿斯蒂芬', '18888888888', '阿诗丹顿多多', '', '', '', '2023-03-27 17:25:07');
INSERT INTO `ul_coin_order` VALUES (45, 'dab91625b01b44f384f244c668128db2', 29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 14, '测试', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2fd22dd.png', 0, 0, '哈哈', '13800000000', '哈哈', '111', '', '', '2023-03-27 17:39:22');
INSERT INTO `ul_coin_order` VALUES (46, '108f63ce56d520c71732912ce83c5121', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 14, '测试', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2fd22dd.png', 0, 0, '', '', '', '', '', '', '2023-03-27 18:02:07');
INSERT INTO `ul_coin_order` VALUES (47, 'a6bb740f8f2a68cc33ffbafe2d0ea4e8', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '进行', '18888888888', '阿诗丹顿多多', '', '', '', '2023-03-27 19:24:39');
INSERT INTO `ul_coin_order` VALUES (48, 'eba9497cbbf82a23cfdcb2faa49d8f47', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:24:50');
INSERT INTO `ul_coin_order` VALUES (49, 'eba9497cbbf82a23cfdcb2faa49d8f47', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '进行', '18888888888', '阿诗丹顿多多', '', '', '', '2023-03-27 19:24:50');
INSERT INTO `ul_coin_order` VALUES (50, '6832f9e0be405e3353118d4ffa5a9949', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:25:00');
INSERT INTO `ul_coin_order` VALUES (51, '6832f9e0be405e3353118d4ffa5a9949', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:25:00');
INSERT INTO `ul_coin_order` VALUES (52, '6832f9e0be405e3353118d4ffa5a9949', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:25:00');
INSERT INTO `ul_coin_order` VALUES (53, '2af440b4c71a1fc88b426c5ee2bb1e1b', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:25:10');
INSERT INTO `ul_coin_order` VALUES (54, '2af440b4c71a1fc88b426c5ee2bb1e1b', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:25:10');
INSERT INTO `ul_coin_order` VALUES (55, '2af440b4c71a1fc88b426c5ee2bb1e1b', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:25:10');
INSERT INTO `ul_coin_order` VALUES (56, '2af440b4c71a1fc88b426c5ee2bb1e1b', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:25:10');
INSERT INTO `ul_coin_order` VALUES (57, '7a275093f6794f9520f2b9408565c883', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:22');
INSERT INTO `ul_coin_order` VALUES (58, '7a275093f6794f9520f2b9408565c883', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:22');
INSERT INTO `ul_coin_order` VALUES (59, '7a275093f6794f9520f2b9408565c883', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:22');
INSERT INTO `ul_coin_order` VALUES (60, '7a275093f6794f9520f2b9408565c883', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:22');
INSERT INTO `ul_coin_order` VALUES (61, '7a275093f6794f9520f2b9408565c883', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:22');
INSERT INTO `ul_coin_order` VALUES (62, '53c0cc6639edccf8ff646cc226ed8286', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:49');
INSERT INTO `ul_coin_order` VALUES (63, '53c0cc6639edccf8ff646cc226ed8286', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:49');
INSERT INTO `ul_coin_order` VALUES (64, '53c0cc6639edccf8ff646cc226ed8286', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:49');
INSERT INTO `ul_coin_order` VALUES (65, '53c0cc6639edccf8ff646cc226ed8286', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:49');
INSERT INTO `ul_coin_order` VALUES (66, '53c0cc6639edccf8ff646cc226ed8286', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:49');
INSERT INTO `ul_coin_order` VALUES (67, '53c0cc6639edccf8ff646cc226ed8286', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:26:49');
INSERT INTO `ul_coin_order` VALUES (68, 'cabf0eb1fd2794ac3e0239bc2f67e6a9', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 14, '测试', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2fd22dd.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:33:33');
INSERT INTO `ul_coin_order` VALUES (69, 'cabf0eb1fd2794ac3e0239bc2f67e6a9', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 14, '测试', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2fd22dd.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:33:33');
INSERT INTO `ul_coin_order` VALUES (70, '8e28b4a3dc8dd9c6782b4766dd2efcd4', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:34:22');
INSERT INTO `ul_coin_order` VALUES (71, '1b74fea7004a7d987ec8c0e4ad21baf0', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:34:29');
INSERT INTO `ul_coin_order` VALUES (72, '1b74fea7004a7d987ec8c0e4ad21baf0', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:34:29');
INSERT INTO `ul_coin_order` VALUES (73, 'f6b33200ae8ab1a79e683eb36cf3767f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:44:19');
INSERT INTO `ul_coin_order` VALUES (74, '4c19fd20653d0629b9e9af97f5411f3e', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 22, '1111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:44:27');
INSERT INTO `ul_coin_order` VALUES (75, '8fbe5fadbf7f1aec1d548719aee0ac6a', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:44:32');
INSERT INTO `ul_coin_order` VALUES (76, 'b1092ece66746ac2bb89fa9498d49095', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:44:37');
INSERT INTO `ul_coin_order` VALUES (77, '6c42cc0b2600dafb95ce1d3401d43b15', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 14, '测试', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2fd22dd.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:44:44');
INSERT INTO `ul_coin_order` VALUES (78, 'e373e5669e5922ed2641ddb595f2399a', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 4, '1', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:44:51');
INSERT INTO `ul_coin_order` VALUES (79, '260722eb84136bf42789fa309a32f817', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 14, '测试', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2fd22dd.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:45:01');
INSERT INTO `ul_coin_order` VALUES (80, '24efa1634c9f8207e5cb46e8e378d60e', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 15, '哈啊哈', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 0, 0, '', '', '', '', '', '', '2023-03-27 19:45:16');
INSERT INTO `ul_coin_order` VALUES (81, 'edf4f5e0372ca8ccda7c4ad59b7ef2b0', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 0, 0, '大大怪', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 19:45:27');
INSERT INTO `ul_coin_order` VALUES (82, '47ad456167600320dfaf57cd62ddb428', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '111', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 0, 0, '小李', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 20:38:45');
INSERT INTO `ul_coin_order` VALUES (83, 'b7dc867b4adebf1d372d47f1c133dfa0', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 0, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 20:41:45');
INSERT INTO `ul_coin_order` VALUES (84, '0a50a793feaaff7138ed23ed040ae19f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 0, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 20:46:11');
INSERT INTO `ul_coin_order` VALUES (85, 'e37c8de1039f82d8eeca62db3579fdd2', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 0, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 20:47:57');
INSERT INTO `ul_coin_order` VALUES (86, 'dde2d6b87b2e9a7252c3d67cc1e41a83', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 0, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 20:50:10');
INSERT INTO `ul_coin_order` VALUES (87, 'a2f54e87426a74a8a5d9e135107f7395', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 0, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 20:52:25');
INSERT INTO `ul_coin_order` VALUES (88, '4dfd7ccd998fd9a4f5202e2cbd1d5ffb', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, '2', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 1, 0, '大大怪', '15388759413', '云南省昆明市', '', '', '', '2023-03-27 20:55:11');
INSERT INTO `ul_coin_order` VALUES (89, 'dcb7d810cc4c8ecb0f340a309b385b82', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2, 3, '', '', '', '', '', '', '2023-03-28 15:07:11');
INSERT INTO `ul_coin_order` VALUES (92, 'fa6dd7fe193a342b0c20d8bc35da0eaa', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-03-29 10:10:51');
INSERT INTO `ul_coin_order` VALUES (93, '825d2e4530a2afdfc528a85b8a13fac4', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-03-29 10:13:23');
INSERT INTO `ul_coin_order` VALUES (94, '89326587304714d4a06b30ae14bec3b3', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-03-29 10:13:57');
INSERT INTO `ul_coin_order` VALUES (95, '6865a1943ffc87e30f3ee4e161f47c38', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-03-29 10:16:35');
INSERT INTO `ul_coin_order` VALUES (96, '1b4b8273b266a42a131c07ca11d9643d', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230402/642947337d701.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-04-03 16:22:28');
INSERT INTO `ul_coin_order` VALUES (97, 'c1bca3a76300fdb40bfe641819713fbc', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230402/642947337d701.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-04-03 16:31:35');
INSERT INTO `ul_coin_order` VALUES (98, '2b5c2925f41b9b83e2b426237ef2b58c', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230402/642947337d701.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-04-03 16:35:01');
INSERT INTO `ul_coin_order` VALUES (99, '2d4545f4c2cda9516bb94cc28e8e53b2', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230402/642947337d701.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-04-03 16:39:20');
INSERT INTO `ul_coin_order` VALUES (100, 'ce734e300548ba5fb816e4c41cc484b9', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 2, 3, '', '', '', '', '', '', '2023-04-03 16:53:48');
INSERT INTO `ul_coin_order` VALUES (101, '220690a755bf9791fe77fd9738950543', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 2, 3, '', '', '', '', '', '', '2023-04-03 16:54:11');
INSERT INTO `ul_coin_order` VALUES (102, '76d581d5fa777e23dd8b4cd824864c31', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 2, 3, '', '', '', '', '', '', '2023-04-03 16:54:32');
INSERT INTO `ul_coin_order` VALUES (103, 'db299bd6a77e379617caf8f434d98f02', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 2, 3, '', '', '', '', '', '', '2023-04-03 16:54:59');
INSERT INTO `ul_coin_order` VALUES (104, 'bf633d8531ec2911539ec6239ea3ab5f', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 2, 3, '', '', '', '', '', '', '2023-04-03 16:55:02');
INSERT INTO `ul_coin_order` VALUES (105, '7596da988442fcb1fbc74ffb86b090e0', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 2, 3, '', '', '', '', '', '', '2023-04-03 16:55:20');
INSERT INTO `ul_coin_order` VALUES (106, 'b5405bee992b59b2d6d4e21f2b80ed2c', 24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 2, 3, '', '', '', '', '', '', '2023-04-03 16:55:24');
INSERT INTO `ul_coin_order` VALUES (107, '8745f1a9cdc2d06fa76dcf4b1982693a', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230404/642b8e70d6fb8.jpg', 24, '雷蛇 Razer 萨诺狼蛛V2 电竞 RGB游戏键盘', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafd05c975.jpg', 0, 0, '大大怪', '15388759413', '云南省昆明市', '', '', '', '2023-04-04 10:42:33');
INSERT INTO `ul_coin_order` VALUES (108, 'f763438e47693077abb6ef1fa8860bd1', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-04-07 15:03:02');
INSERT INTO `ul_coin_order` VALUES (109, 'ec48d27381e728123cd1e0739bb385ef', 32, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230402/6429111de753b.jpeg', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15862277000', '15862277000', '', '', '', '2023-04-10 00:37:58');
INSERT INTO `ul_coin_order` VALUES (110, 'd4ff45ba3804f3a6d9f82e6908a31370', 29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '13800000000', '', '', 'test', '', '2023-04-10 14:54:03');
INSERT INTO `ul_coin_order` VALUES (111, 'af7e6b9f1d0224692f9aebcdcd4120c2', 29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 0, '键盘', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 2, 3, '', '', '', '', '', '', '2023-04-10 20:18:33');
INSERT INTO `ul_coin_order` VALUES (112, '7e2dd38255bf9f8e6b2ae85eadf3c495', 32, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230402/6429111de753b.jpeg', 0, '雷蛇键盘', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d83887dad.png', 2, 3, '', '', '', '', '', '', '2023-04-11 11:37:35');
INSERT INTO `ul_coin_order` VALUES (113, '8d898b3cecbb915836e3bac1e204da52', 32, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230402/6429111de753b.jpeg', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15862277000', '', '', '123', '', '2023-04-12 15:08:43');
INSERT INTO `ul_coin_order` VALUES (122, 'e3be2763c31115c667c1438c64bb0e80', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 0, '雷蛇鼠标', 'http://cqadmin.bluechs.com/storage/upload/20230416/643bd1e0c38bd.png', 2, 3, '', '', '', '', '', '', '2023-04-18 10:19:22');
INSERT INTO `ul_coin_order` VALUES (123, 'd2f3ac6ff9d55420de7ab8a4501675ea', 29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230410/643400b0bc5f7.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '13800000000', '123', '', '', '', '2023-04-21 12:07:13');
INSERT INTO `ul_coin_order` VALUES (124, 'd2f3ac6ff9d55420de7ab8a4501675ea', 29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230410/643400b0bc5f7.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '13800000000', '123', '', '', '', '2023-04-21 12:07:13');
INSERT INTO `ul_coin_order` VALUES (125, '5f69afa935e3f859023acde5c9b43920', 29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '微信用户', 'http://cqadmin.bluechs.com/storage/upload/20230410/643400b0bc5f7.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '13800000000', '123', '', '', '', '2023-04-21 12:07:39');
INSERT INTO `ul_coin_order` VALUES (126, 'd4dd1f82be271ae05b1e9f8ebc8baa5f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 25, 'SKG 颈椎按摩器', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafe57d8f1.png', 0, 0, '好地方', '15724681241', '阿诗丹顿多多', '', '', '', '2023-04-24 11:02:14');
INSERT INTO `ul_coin_order` VALUES (127, 'd4dd1f82be271ae05b1e9f8ebc8baa5f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 25, 'SKG 颈椎按摩器', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafe57d8f1.png', 0, 0, '好地方', '15724681241', '阿诗丹顿多多', '', '', '', '2023-04-24 11:02:14');
INSERT INTO `ul_coin_order` VALUES (128, 'd4dd1f82be271ae05b1e9f8ebc8baa5f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 25, 'SKG 颈椎按摩器', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafe57d8f1.png', 0, 0, '好地方', '15724681241', '阿诗丹顿多多', '', '', '', '2023-04-24 11:02:14');
INSERT INTO `ul_coin_order` VALUES (129, 'd4dd1f82be271ae05b1e9f8ebc8baa5f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 25, 'SKG 颈椎按摩器', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafe57d8f1.png', 0, 0, '好地方', '15724681241', '阿诗丹顿多多', '', '', '', '2023-04-24 11:02:14');
INSERT INTO `ul_coin_order` VALUES (130, 'd4dd1f82be271ae05b1e9f8ebc8baa5f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 25, 'SKG 颈椎按摩器', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafe57d8f1.png', 0, 0, '好地方', '15724681241', '阿诗丹顿多多', '', '', '', '2023-04-24 11:02:14');
INSERT INTO `ul_coin_order` VALUES (131, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (132, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (133, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (134, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (135, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (136, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (137, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (138, 'b81d8f0b568ae059c16a2cb628d8648f', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388759413', '云南省昆明市', '', '', '', '2023-04-24 11:03:20');
INSERT INTO `ul_coin_order` VALUES (139, '779eb8eba7928178c0dd2c58eafbd218', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '12333333333', '阿诗丹顿多多', '', '', '', '2023-04-24 11:04:04');
INSERT INTO `ul_coin_order` VALUES (140, '904226a2deb8ae22503b8f9952aa2ddc', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 17, '天猫精灵IN糖智能音箱', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf6c4cefa.png', 0, 0, '小李', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:10');
INSERT INTO `ul_coin_order` VALUES (141, 'cb9ae34a95cca56c82cfda08d20d738d', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:26');
INSERT INTO `ul_coin_order` VALUES (142, 'bd09d774e361bcfa6779e0e0035ba1dc', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 18, '爱奇艺视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaed140442.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:36');
INSERT INTO `ul_coin_order` VALUES (143, '752c25dea147381d26f7c1a73102dd75', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 18, '爱奇艺视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaed140442.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:37');
INSERT INTO `ul_coin_order` VALUES (144, 'db9a538a58d108ac32ef58b044e91bea', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 18, '爱奇艺视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaed140442.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:43');
INSERT INTO `ul_coin_order` VALUES (145, 'db9a538a58d108ac32ef58b044e91bea', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 18, '爱奇艺视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaed140442.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:43');
INSERT INTO `ul_coin_order` VALUES (146, '781fe64bf78b97e4ba999ba810932dc3', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:48');
INSERT INTO `ul_coin_order` VALUES (147, '781fe64bf78b97e4ba999ba810932dc3', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:05:48');
INSERT INTO `ul_coin_order` VALUES (148, 'a78e13e02bce3b1976973ed9cf899e11', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:45:42');
INSERT INTO `ul_coin_order` VALUES (149, 'a78e13e02bce3b1976973ed9cf899e11', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:45:42');
INSERT INTO `ul_coin_order` VALUES (150, 'a78e13e02bce3b1976973ed9cf899e11', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:45:42');
INSERT INTO `ul_coin_order` VALUES (151, 'dd979a6d6bcd820228c98eb92e6d3b21', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:46:19');
INSERT INTO `ul_coin_order` VALUES (152, 'dd979a6d6bcd820228c98eb92e6d3b21', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:46:19');
INSERT INTO `ul_coin_order` VALUES (153, 'dd979a6d6bcd820228c98eb92e6d3b21', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:46:19');
INSERT INTO `ul_coin_order` VALUES (154, 'dd979a6d6bcd820228c98eb92e6d3b21', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 11:46:19');
INSERT INTO `ul_coin_order` VALUES (155, 'ac0ed435a52074c52c1edf497f3b8154', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 14, '腾讯视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaebd6dc1d.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 14:15:27');
INSERT INTO `ul_coin_order` VALUES (156, '9448f862ee8162c04326580ce1e1c42a', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 14, '腾讯视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaebd6dc1d.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 14:15:36');
INSERT INTO `ul_coin_order` VALUES (157, '076aed7adab7520d35fee25ae272edb1', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 14, '腾讯视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaebd6dc1d.png', 1, 0, '护理核心制度', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 14:16:15');
INSERT INTO `ul_coin_order` VALUES (158, 'f32d3c39d896182cb0f2d5ad7f92c389', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 14, '腾讯视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaebd6dc1d.png', 1, 0, '护理核心制度', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 14:16:23');
INSERT INTO `ul_coin_order` VALUES (159, 'faed442c17d31342ae19c5b91176c85a', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 14:21:33');
INSERT INTO `ul_coin_order` VALUES (160, 'bd1179fb0e23c5a7609c9a34b5047bf7', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 22, '腾讯视频会员（季卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaead8280b.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 14:21:52');
INSERT INTO `ul_coin_order` VALUES (161, 'be024cbe22307d1b7c39ab18f44b48d6', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 15, '大容量充电宝', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf57a7856.png', 0, 0, '哈哈哈哈', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-24 14:22:34');
INSERT INTO `ul_coin_order` VALUES (162, '1a96bf08d20bc8fc89e299d81f90dc91', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 14, '腾讯视频会员（年卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaebd6dc1d.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-25 08:38:18');
INSERT INTO `ul_coin_order` VALUES (163, '8399c86e351f674879a561083abe7351', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-25 13:41:45');
INSERT INTO `ul_coin_order` VALUES (164, '946864a5ad2adbf8480f93008d61c222', 27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 20, '腾讯视频会员（月卡）', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 1, 0, '', '15388657123', '阿诗丹顿多多', '', '', '', '2023-04-25 13:42:09');

-- ----------------------------
-- Table structure for ul_debug_log
-- ----------------------------
DROP TABLE IF EXISTS `ul_debug_log`;
CREATE TABLE `ul_debug_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志表',
  `uid` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `level` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time_title` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT 0,
  `app_name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `controller_name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `action_name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_debug_log
-- ----------------------------

-- ----------------------------
-- Table structure for ul_mall_cate
-- ----------------------------
DROP TABLE IF EXISTS `ul_mall_cate`;
CREATE TABLE `ul_mall_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实物商城分类表',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类名',
  `image` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分类图片 {image}',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT 2 COMMENT '状态 {radio} (1:禁用,2:启用)',
  `remark` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_mall_cate
-- ----------------------------
INSERT INTO `ul_mall_cate` VALUES (1, '手机1', 'http://cqadmin.bluechs.com/storage/upload/20230314/640ffeb2e483a.png', 0, 1, '', 1678717880, 1678769846, 0);

-- ----------------------------
-- Table structure for ul_mall_goods
-- ----------------------------
DROP TABLE IF EXISTS `ul_mall_goods`;
CREATE TABLE `ul_mall_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实物商城物品表',
  `cate_id` bigint(20) UNSIGNED NOT NULL COMMENT '分类ID',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `tag` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品标签',
  `logo` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品logo {image}',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片 {images}',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述 {editor}',
  `property` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性',
  `market_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `discount_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '折扣价',
  `sales` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `virtual_sales` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '虚拟销量',
  `stock` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `total_stock` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总库存',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 {radio} (0:正常,1:禁用)',
  `remark` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_mall_goods
-- ----------------------------
INSERT INTO `ul_mall_goods` VALUES (1, 1, '落地-风扇', '', 'http://cqadmin.bluechs.com/storage/upload/20230315/64114608da4ff.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/6411460c52682.jpg', '&lt;p&gt;76654757&lt;/p&gt;\n\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://admin.host/upload/20200515/198070421110fa01f2c2ac2f52481647.jpg&quot; style=&quot;height:689px; width:790px&quot; /&gt;&lt;/p&gt;\n\n&lt;p&gt;&lt;img alt=&quot;&quot; src=&quot;http://admin.host/upload/20200515/a07a742c15a78781e79f8a3317006c1d.jpg&quot; style=&quot;height:877px; width:790px&quot; /&gt;&lt;/p&gt;\n', '', 599.00, 368.00, 0, 594, 0, 0, 675, 1, '', 1678717880, 1678853649, 0);
INSERT INTO `ul_mall_goods` VALUES (2, 1, '电脑', '', 'http://cqadmin.bluechs.com/storage/upload/20230315/641145ec2e22f.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/641145f05381c.jpg', '&lt;p&gt;477&lt;/p&gt;\n', '', 0.00, 0.00, 0, 0, 115, 320, 0, 1, '', 1678717880, 1679899274, 0);

-- ----------------------------
-- Table structure for ul_mall_tag
-- ----------------------------
DROP TABLE IF EXISTS `ul_mall_tag`;
CREATE TABLE `ul_mall_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品状态',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品标签' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_mall_tag
-- ----------------------------
INSERT INTO `ul_mall_tag` VALUES (1, '便宜', 1657347818, 1657347818, 0);
INSERT INTO `ul_mall_tag` VALUES (2, '售后', 1657347825, 1657347825, 0);
INSERT INTO `ul_mall_tag` VALUES (3, '黑科技', 1657347836, 1657347836, 0);
INSERT INTO `ul_mall_tag` VALUES (4, '大厂', 1657347850, 1657347850, 0);

-- ----------------------------
-- Table structure for ul_migrations
-- ----------------------------
DROP TABLE IF EXISTS `ul_migrations`;
CREATE TABLE `ul_migrations`  (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_migrations
-- ----------------------------
INSERT INTO `ul_migrations` VALUES (20220419022952, 'SystemAdmin', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419030557, 'SystemAuth', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419031101, 'SystemAuthNode', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419031527, 'SystemConfig', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419032028, 'SystemMenu', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419032642, 'SystemNode', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419033507, 'SystemQuick', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419034810, 'SystemUploadfile', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419102226, 'DebugLog', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419102635, 'MallCate', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220419102916, 'MallGoods', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220709061205, 'MallTag', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);
INSERT INTO `ul_migrations` VALUES (20220905222557, 'TestGoods', '2023-03-13 22:31:02', '2023-03-13 22:31:02', 0);

-- ----------------------------
-- Table structure for ul_order_user
-- ----------------------------
DROP TABLE IF EXISTS `ul_order_user`;
CREATE TABLE `ul_order_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户端用户表',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信用户id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '微信用户' COMMENT '用户名',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '微信用户' COMMENT '微信昵称',
  `realname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `sfz` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png' COMMENT '用户头像',
  `coin_num` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '拥有金币数',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `lv` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'LV0' COMMENT '用户等级',
  `up_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级open_id',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `is_online` int(1) NOT NULL DEFAULT 1 COMMENT '0在线1离线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_order_user
-- ----------------------------
INSERT INTO `ul_order_user` VALUES (24, 'ociWS6j17km6QToj5dcoy1kNB8YA', '微信用户', '帅哥', NULL, '13312652970', NULL, 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 1094582.00, 1.00, 'LV0', 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 'haha', 1);
INSERT INTO `ul_order_user` VALUES (27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '大大怪', '大大怪', '考试小技巧', '15388759413', '530381199604193111', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 88835782.97, 801.00, 'LV20', NULL, '111111111', 1);
INSERT INTO `ul_order_user` VALUES (29, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '微信用户', '贺1222', '武俊华', '18869750163', '530425199008310315', 'http://cqadmin.bluechs.com/storage/upload/20230410/643400b0bc5f7.png', 1082.30, 10020.00, 'LV3', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (30, 'ociWS6o0HRLFc4_k8FO9ymwftM9w', '安静的稻草人', '安静的稻草人', NULL, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIW9VUnTZFwP0u6AaKmQ8iawibWPuHSggatiaCo9xWb1HsYfg1E6LHPeGTjMJiaUbnSXlI0D8QEdia3crQ/132', 0.00, 0.00, 'LV0', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (31, 'ociWS6ivPwEsFPbDMhiQWJN8pD04', '微信用户', '微信用户', NULL, NULL, NULL, 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 0.00, 0.00, 'LV0', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (32, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '微信用户', '星光', '娄光伟', '15862277000', '320382199507267334', 'http://cqadmin.bluechs.com/storage/upload/20230402/6429111de753b.jpeg', 1059.00, 5.00, 'LV0', NULL, '啊啊啊', 0);
INSERT INTO `ul_order_user` VALUES (33, 'ociWS6s7S2i8d92sSmL-1G7_GYvw', 'Aғᴛᴇʀᴀʟʟ.', 'Aғᴛᴇʀᴀʟʟ.', NULL, NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/TlibvguFMRNpakLAU2aeNayBZmmXvZ3j8wjGQbcVzOMqjyZGicFgXOpEZ4zeteY9bF2MnP5Dj0zpRxe4P6QXVOQQ/132', 0.00, 0.00, 'LV0', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (34, 'ociWS6jH_wjSOXxF0norcSBsFke8', '微信用户', '微信用户', NULL, NULL, NULL, 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 1019.00, 0.00, 'LV0', NULL, '', 1);
INSERT INTO `ul_order_user` VALUES (35, 'ociWS6tg9QIyLgxa8i5yCtdPV-yI', '微信用户', '微信用户', '娄光伟', NULL, '320382199507267334', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 120.00, 0.00, 'LV0', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (36, 'ociWS6nV9F09A0JfGeCfvLPqbvr8', '微信用户', '微信用户', '罗亮', NULL, '431023198811030011', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 100.00, 0.00, 'LV0', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (37, 'ociWS6hE90h36YJqSzP6pA_zBJgM', '微信用户', '爱你', NULL, NULL, NULL, 'http://cqadmin.bluechs.com/storage/upload/20230409/6432b3c8d4431.jpg', 7.00, 0.00, 'LV0', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (38, 'ociWS6gP_ZJ_9v74dyJRV1t7HL5g', '微信用户', '微信用户', NULL, NULL, NULL, 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 0.00, 0.00, 'LV0', 'ociWS6hE90h36YJqSzP6pA_zBJgM', NULL, 1);
INSERT INTO `ul_order_user` VALUES (39, 'ociWS6nmlKEt2eGWNgHu7jlqHGFo', '微信用户', '微信用户', NULL, NULL, NULL, 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 0.00, 0.00, 'LV0', NULL, NULL, 1);
INSERT INTO `ul_order_user` VALUES (40, 'ociWS6rBWGu91iaK-NbjGNbP7jLY', '微信用户', '微信用户', NULL, NULL, NULL, 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 2000.00, 0.00, 'LV0', NULL, NULL, 1);

-- ----------------------------
-- Table structure for ul_play
-- ----------------------------
DROP TABLE IF EXISTS `ul_play`;
CREATE TABLE `ul_play`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动表',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动简介',
  `play_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动图片',
  `play_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动跳转链接',
  `banner_statu` int(1) NOT NULL DEFAULT 0 COMMENT 'banner展示状态0展示1不展示',
  `play_statu` int(1) NOT NULL DEFAULT 0 COMMENT '活动展示状态0展示1不展示',
  `add_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_play
-- ----------------------------
INSERT INTO `ul_play` VALUES (1, '金币商城', '金币商城金币兑换豪礼，更有抽奖活动等你。好礼送不停。', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423ee8267731.jpg', '金币商城', 0, 0, '2023-03-22 11:26:16');
INSERT INTO `ul_play` VALUES (3, '雷蛇套装', '快来抽大奖吧，雷蛇套装等你来抢。', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423eefd8b32d.jpg', '实物抽奖', 0, 0, '2023-03-29 15:57:12');
INSERT INTO `ul_play` VALUES (4, '5CQ沙巴克争霸赛', '5CQ沙巴克争霸赛，超级赛事，等你来战。不定期举行赛事，更多大奖你来领。', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423f015d3c8d.jpg', '沙巴克', 0, 0, '2023-03-29 16:01:02');
INSERT INTO `ul_play` VALUES (5, '邀请好友一起玩', '邀请好友，让好友成为你的金币贡献者。', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423f048066b0.jpg', '邀请好友', 0, 0, '2023-03-29 16:01:46');

-- ----------------------------
-- Table structure for ul_sbk
-- ----------------------------
DROP TABLE IF EXISTS `ul_sbk`;
CREATE TABLE `ul_sbk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '沙巴克表',
  `support_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赞助方名称',
  `support_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赞助放logo',
  `support_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赞助方客户端下载链接',
  `matic_data` date NULL DEFAULT NULL COMMENT '比赛日期',
  `matic_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '比赛奖金',
  `broadcast_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播地址',
  `broadcast_statu` int(1) NULL DEFAULT 0 COMMENT '直播状态0未直播1直播中',
  `red_num` double(20, 2) NULL DEFAULT NULL COMMENT '红方投注总量',
  `blue_num` double(20, 2) NULL DEFAULT NULL COMMENT '蓝方投注总量',
  `shenhao_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '神豪榜奖金',
  `shenhao_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '神豪榜充值数',
  `shenhao_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '神豪榜用户名字',
  `pk_money` decimal(10, 2) NULL DEFAULT NULL COMMENT 'pk王奖金',
  `pk_kill` int(11) NULL DEFAULT NULL COMMENT 'pk王击杀数',
  `pk_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pk王用户名字',
  `king_money` decimal(11, 2) NULL DEFAULT NULL COMMENT '手气王奖金',
  `king_num` int(11) NULL DEFAULT NULL COMMENT '手气王中奖数',
  `king_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手气王用户名字',
  `rank_statu` int(1) NULL DEFAULT 0 COMMENT '榜单是否统计完毕0未统计1已统计',
  `match_statu` int(1) NULL DEFAULT 0 COMMENT '比赛状态0未开始1比赛中2已完毕',
  `sy_type` int(1) NOT NULL DEFAULT 0 COMMENT '投注输赢1为红方赢2为蓝方赢0为未评判',
  `add_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_sbk
-- ----------------------------
INSERT INTO `ul_sbk` VALUES (3, '传奇版本库', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f30b998799.png', 'https://www.youku.com/', '2023-04-08', 8888.00, 'https://www.bilibili.com/blackboard/live/live-activity-player.html?cid=6650029&amp;amp;amp;amp;amp;quality=0', 0, 100.00, 100.00, 888.00, 0.00, '未结算', 0.00, 0, '未结算', 888.00, 0, '未结算', 0, 0, 0, '2023-04-07 04:51:55');

-- ----------------------------
-- Table structure for ul_system_admin
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_admin`;
CREATE TABLE `ul_system_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_ids` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色权限ID',
  `head_img` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `username` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登录名',
  `password` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
  `phone` char(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '联系手机号',
  `remark` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `login_num` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录次数',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 {radio} (0:禁用,1:启用,)',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_admin
-- ----------------------------
INSERT INTO `ul_system_admin` VALUES (1, '', '/static/admin/images/head.jpg', 'admin', 'ac1e198122f74121a69b7bc9048561973a433daa', '', '', 69, 0, 1, 1678717880, 1682430312, 0);

-- ----------------------------
-- Table structure for ul_system_auth
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_auth`;
CREATE TABLE `ul_system_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT 0 COMMENT '状态 {radio} (1:禁用,2:启用)',
  `remark` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE,
  INDEX `title_2`(`title`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_auth
-- ----------------------------
INSERT INTO `ul_system_auth` VALUES (1, '管理员', 1, 1, '测试管理员', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_auth` VALUES (6, '游客权限', 0, 1, '', 1678717880, 1678717880, 0);

-- ----------------------------
-- Table structure for ul_system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_auth_node`;
CREATE TABLE `ul_system_auth_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_id` bigint(20) UNSIGNED NOT NULL COMMENT '角色ID',
  `node_id` bigint(20) UNSIGNED NOT NULL COMMENT '节点ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `auth_id`(`auth_id`) USING BTREE,
  INDEX `node_id`(`node_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色与节点关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_auth_node
-- ----------------------------
INSERT INTO `ul_system_auth_node` VALUES (1, 1, 1);
INSERT INTO `ul_system_auth_node` VALUES (2, 1, 2);
INSERT INTO `ul_system_auth_node` VALUES (3, 1, 3);
INSERT INTO `ul_system_auth_node` VALUES (4, 1, 4);
INSERT INTO `ul_system_auth_node` VALUES (5, 1, 5);
INSERT INTO `ul_system_auth_node` VALUES (6, 1, 6);
INSERT INTO `ul_system_auth_node` VALUES (7, 1, 7);
INSERT INTO `ul_system_auth_node` VALUES (8, 1, 8);
INSERT INTO `ul_system_auth_node` VALUES (9, 1, 9);
INSERT INTO `ul_system_auth_node` VALUES (10, 1, 10);
INSERT INTO `ul_system_auth_node` VALUES (11, 1, 11);
INSERT INTO `ul_system_auth_node` VALUES (12, 1, 12);
INSERT INTO `ul_system_auth_node` VALUES (13, 1, 13);
INSERT INTO `ul_system_auth_node` VALUES (14, 1, 14);
INSERT INTO `ul_system_auth_node` VALUES (15, 1, 15);
INSERT INTO `ul_system_auth_node` VALUES (16, 1, 16);
INSERT INTO `ul_system_auth_node` VALUES (17, 1, 17);
INSERT INTO `ul_system_auth_node` VALUES (18, 1, 18);
INSERT INTO `ul_system_auth_node` VALUES (19, 1, 19);
INSERT INTO `ul_system_auth_node` VALUES (20, 1, 20);
INSERT INTO `ul_system_auth_node` VALUES (21, 1, 21);
INSERT INTO `ul_system_auth_node` VALUES (22, 1, 22);
INSERT INTO `ul_system_auth_node` VALUES (23, 1, 23);
INSERT INTO `ul_system_auth_node` VALUES (24, 1, 24);
INSERT INTO `ul_system_auth_node` VALUES (25, 1, 25);
INSERT INTO `ul_system_auth_node` VALUES (26, 1, 26);
INSERT INTO `ul_system_auth_node` VALUES (27, 1, 27);
INSERT INTO `ul_system_auth_node` VALUES (28, 1, 28);
INSERT INTO `ul_system_auth_node` VALUES (29, 1, 29);
INSERT INTO `ul_system_auth_node` VALUES (30, 1, 30);
INSERT INTO `ul_system_auth_node` VALUES (31, 1, 31);
INSERT INTO `ul_system_auth_node` VALUES (32, 1, 32);
INSERT INTO `ul_system_auth_node` VALUES (33, 1, 33);
INSERT INTO `ul_system_auth_node` VALUES (34, 1, 34);
INSERT INTO `ul_system_auth_node` VALUES (35, 1, 35);
INSERT INTO `ul_system_auth_node` VALUES (36, 1, 36);
INSERT INTO `ul_system_auth_node` VALUES (37, 1, 37);
INSERT INTO `ul_system_auth_node` VALUES (38, 1, 38);
INSERT INTO `ul_system_auth_node` VALUES (39, 1, 39);
INSERT INTO `ul_system_auth_node` VALUES (40, 1, 40);
INSERT INTO `ul_system_auth_node` VALUES (41, 1, 41);
INSERT INTO `ul_system_auth_node` VALUES (42, 1, 42);
INSERT INTO `ul_system_auth_node` VALUES (43, 1, 43);
INSERT INTO `ul_system_auth_node` VALUES (44, 1, 44);
INSERT INTO `ul_system_auth_node` VALUES (45, 1, 45);
INSERT INTO `ul_system_auth_node` VALUES (46, 1, 46);
INSERT INTO `ul_system_auth_node` VALUES (47, 1, 47);
INSERT INTO `ul_system_auth_node` VALUES (48, 1, 48);
INSERT INTO `ul_system_auth_node` VALUES (49, 1, 49);
INSERT INTO `ul_system_auth_node` VALUES (50, 1, 50);
INSERT INTO `ul_system_auth_node` VALUES (51, 1, 51);
INSERT INTO `ul_system_auth_node` VALUES (52, 1, 52);
INSERT INTO `ul_system_auth_node` VALUES (53, 1, 53);
INSERT INTO `ul_system_auth_node` VALUES (54, 1, 54);
INSERT INTO `ul_system_auth_node` VALUES (55, 1, 55);
INSERT INTO `ul_system_auth_node` VALUES (56, 1, 56);
INSERT INTO `ul_system_auth_node` VALUES (57, 1, 57);
INSERT INTO `ul_system_auth_node` VALUES (58, 1, 58);
INSERT INTO `ul_system_auth_node` VALUES (59, 1, 59);
INSERT INTO `ul_system_auth_node` VALUES (60, 1, 60);
INSERT INTO `ul_system_auth_node` VALUES (61, 1, 61);
INSERT INTO `ul_system_auth_node` VALUES (62, 1, 62);
INSERT INTO `ul_system_auth_node` VALUES (63, 1, 63);
INSERT INTO `ul_system_auth_node` VALUES (64, 1, 64);
INSERT INTO `ul_system_auth_node` VALUES (65, 1, 65);
INSERT INTO `ul_system_auth_node` VALUES (66, 1, 66);
INSERT INTO `ul_system_auth_node` VALUES (67, 1, 69);
INSERT INTO `ul_system_auth_node` VALUES (68, 1, 70);
INSERT INTO `ul_system_auth_node` VALUES (69, 1, 71);
INSERT INTO `ul_system_auth_node` VALUES (70, 1, 72);
INSERT INTO `ul_system_auth_node` VALUES (71, 1, 73);
INSERT INTO `ul_system_auth_node` VALUES (72, 1, 74);
INSERT INTO `ul_system_auth_node` VALUES (73, 1, 75);
INSERT INTO `ul_system_auth_node` VALUES (74, 1, 76);
INSERT INTO `ul_system_auth_node` VALUES (75, 1, 77);
INSERT INTO `ul_system_auth_node` VALUES (76, 1, 78);
INSERT INTO `ul_system_auth_node` VALUES (77, 1, 79);
INSERT INTO `ul_system_auth_node` VALUES (78, 1, 80);
INSERT INTO `ul_system_auth_node` VALUES (79, 1, 81);
INSERT INTO `ul_system_auth_node` VALUES (80, 1, 82);
INSERT INTO `ul_system_auth_node` VALUES (81, 1, 83);
INSERT INTO `ul_system_auth_node` VALUES (82, 1, 84);

-- ----------------------------
-- Table structure for ul_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_config`;
CREATE TABLE `ul_system_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量值',
  `remark` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注信息',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `group`(`group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_config
-- ----------------------------
INSERT INTO `ul_system_config` VALUES (1, 'base_admin_install', 'system', '1', '系统初始化锁定，请勿修改，避免插入重复数据', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (2, 'alisms_access_key_id', 'sms', '填你的', '阿里大于公钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (3, 'alisms_access_key_secret', 'sms', '填你的', '阿里大鱼私钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (4, 'upload_type', 'upload', 'local_public', '当前上传方式 local_public,alioss,qnoss,txoss）', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (5, 'upload_allow_ext', 'upload', 'jpg,jpeg,png,gif,bmp,doc,docx,xls,xlsx,ppt,pptx,pdf,zip,rar,7z,txt,mp3,wma,wav,mid,m4a,mp4,avi,wmv,3gp,flv,webp,svg,ico', '允许上传的文件类型', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (6, 'upload_allow_size', 'upload', '102400000', '允许上传的大小', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (7, 'upload_allow_mime', 'upload', 'image/gif,image/jpeg,video/x-msvideo,text/plain,image/png', '允许上传的文件mime', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (8, 'upload_allow_type', 'upload', 'local_public,alioss,qnoss,txcos', '可用的上传文件方式', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (9, 'alioss_access_key_id', 'upload', '填你的', '阿里云oss公钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (10, 'alioss_access_key_secret', 'upload', '填你的', '阿里云oss私钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (11, 'alioss_endpoint', 'upload', '填你的', '阿里云oss数据中心', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (12, 'alioss_bucket', 'upload', '填你的', '阿里云oss空间名称', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (13, 'alioss_domain', 'upload', '填你的', '阿里云oss访问域名', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (14, 'logo_title', 'site', '5CQ', 'LOGO标题', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (15, 'logo_image', 'site', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421438b6832b.png', 'logo图片', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (16, 'site_name', 'site', '5CQ后台系统', '站点名称', 0, 1678717880, 1678843479);
INSERT INTO `ul_system_config` VALUES (17, 'site_ico', 'site', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421438b6832b.png', '浏览器图标', 0, 1678717880, 1679902912);
INSERT INTO `ul_system_config` VALUES (18, 'site_copyright', 'site', '无', '版权信息', 0, 1678717880, 1678843479);
INSERT INTO `ul_system_config` VALUES (19, 'site_beian', 'site', '滇ICP备2023001230号', '备案信息', 0, 1678717880, 1678843479);
INSERT INTO `ul_system_config` VALUES (20, 'site_version', 'site', '2.0.0', '版本信息', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (21, 'sms_type', 'sms', 'alisms', '短信类型', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (22, 'miniapp_appid', 'wechat', '填你的', '小程序公钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (23, 'miniapp_appsecret', 'wechat', '填你的', '小程序私钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (24, 'web_appid', 'wechat', '填你的', '公众号公钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (25, 'web_appsecret', 'wechat', '填你的', '公众号私钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (26, 'txcos_secret_id', 'upload', '填你的', '腾讯云cos密钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (27, 'txcos_secret_key', 'upload', '填你的', '腾讯云cos私钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (28, 'txcos_region', 'upload', '填你的', '存储桶地域', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (29, 'txcos_bucket', 'upload', '填你的', '存储桶名称', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (30, 'qnoss_access_key', 'upload', '填你的', '访问密钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (31, 'qnoss_secret_key', 'upload', '填你的', '安全密钥', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (32, 'qnoss_bucket', 'upload', '填你的', '存储空间', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (33, 'qnoss_domain', 'upload', '填你的', '访问域名', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (34, 'txcos_domain', 'upload', '填你的', '访问域名', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (35, 'txcos_appid', 'upload', '填你的', 'APPID', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (36, 'file', 'site', '', '', 0, 1678717880, 1678717880);
INSERT INTO `ul_system_config` VALUES (37, 'site_domain', 'site', 'http://cqadmin.bluechs.com/', '', 0, 1678717880, 1678843479);
INSERT INTO `ul_system_config` VALUES (38, 'site_default_password', 'site', '', '', 0, 1678843479, 1678843479);
INSERT INTO `ul_system_config` VALUES (39, 'site_js_insert', 'site', '', '', 0, 1678843479, 1678843479);

-- ----------------------------
-- Table structure for ul_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_menu`;
CREATE TABLE `ul_system_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父id',
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `auth_node` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '权限标志',
  `params` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接参数',
  `target` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '状态 {radio} (0:禁用,1:启用)',
  `remark` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `href`(`href`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 277 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_menu
-- ----------------------------
INSERT INTO `ul_system_menu` VALUES (227, 99999999, '后台首页', 'fa fa-home', 'index/welcome', '', '', '_self', 0, 1, '', 1678717880, 1681130183, 0);
INSERT INTO `ul_system_menu` VALUES (228, 0, '系统管理', 'fa fa-cog', '', '', '', '_self', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (234, 228, '菜单管理', 'fa fa-tree', 'system.menu/index', '', '', '_self', 10, 1, '', 1678717880, 1680016934, 0);
INSERT INTO `ul_system_menu` VALUES (244, 228, '管理员管理', 'fa fa-user', 'system.admin/index', '', '', '_self', 12, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (245, 228, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', '', '', '_self', 11, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (246, 228, '节点管理', 'fa fa-list', 'system.node/index', '', '', '_self', 9, 1, '', 1678717880, 1679901738, 1679901738);
INSERT INTO `ul_system_menu` VALUES (247, 228, '配置管理', 'fa fa-asterisk', 'system.config/index', '', '', '_self', 8, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (248, 228, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', '', '', '_self', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (249, 0, '商城管理', 'fa fa-list', '', '', '', '_self', 1, 1, '', 1678717880, 1679901748, 1679901748);
INSERT INTO `ul_system_menu` VALUES (250, 249, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', '', '', '_self', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (251, 249, '商品管理', 'fa fa-list', 'mall.goods/index', '', '', '_self', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (252, 228, '快捷入口', 'fa fa-list', 'system.quick/index', '', '', '_self', 0, 1, '', 1678717880, 1679902194, 1679902194);
INSERT INTO `ul_system_menu` VALUES (253, 228, '日志管理', 'fa fa-connectdevelop', 'debug.log/index', '', '', '_self', 0, 1, '', 1678717880, 1679901720, 1679901720);
INSERT INTO `ul_system_menu` VALUES (254, 249, '商品标签', 'fa fa-connectdevelop', 'mall.tag/index', '', '', '_self', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_menu` VALUES (255, 0, '运营管理', 'fa fa-list', '', '', '', '_self', 2, 1, '', 1678757632, 1678757717, 0);
INSERT INTO `ul_system_menu` VALUES (256, 255, '基础设置', 'fa fa-list', 'business.basic/index', '', '', '_self', 0, 0, '', 1678757734, 1679462408, 1679462408);
INSERT INTO `ul_system_menu` VALUES (257, 255, '参数配置', 'fa fa-list', 'business.config/index', '', '', '_self', 0, 1, '', 1678773469, 1678773823, 0);
INSERT INTO `ul_system_menu` VALUES (258, 0, '金币商城', 'fa fa-bank', '', '', '', '_self', 3, 1, '', 1678780397, 1681130106, 0);
INSERT INTO `ul_system_menu` VALUES (259, 258, '商品管理', 'fa fa-list', 'coin.goods/index', '', '', '_self', 0, 1, '', 1678780535, 1681130012, 0);
INSERT INTO `ul_system_menu` VALUES (260, 258, '订单管理', 'fa fa-bar-chart', 'coin.order/index', '', '', '_self', 0, 1, '', 1678843119, 1678843119, 0);
INSERT INTO `ul_system_menu` VALUES (261, 255, '活动管理', 'fa fa-bank', 'business.play/index', '', '', '_self', 0, 1, '', 1678851622, 1678851622, 0);
INSERT INTO `ul_system_menu` VALUES (262, 255, '沙巴克管理', 'fa fa-list', 'business.sbk/index', '', '', '_self', 0, 1, '', 1678854684, 1678854684, 0);
INSERT INTO `ul_system_menu` VALUES (263, 255, '用户等级管理', 'fa fa-list', 'business.userlevel/index', '', '', '_self', 0, 1, '', 1678856567, 1678856997, 0);
INSERT INTO `ul_system_menu` VALUES (264, 255, '游戏列表', 'fa fa-list', 'business.yxlb/index', '', '', '_self', 0, 1, '', 1679016334, 1679016334, 0);
INSERT INTO `ul_system_menu` VALUES (265, 255, '游戏分类', 'fa fa-list', 'business.yxfl/index', '', '', '_self', 0, 1, '', 1679462436, 1679462436, 0);
INSERT INTO `ul_system_menu` VALUES (266, 255, 'H5配置', 'fa fa-list', 'business.h5/index', '', '', '_self', 0, 1, '', 1679880842, 1679883326, 0);
INSERT INTO `ul_system_menu` VALUES (267, 266, '服务协议', 'fa fa-list', 'business.h5/fwxy', '', '', '_self', 0, 1, '', 1679882858, 1679883316, 1679883316);
INSERT INTO `ul_system_menu` VALUES (268, 255, '视频审核', 'fa fa-list', 'business.shipin/index', '', '', '_self', 0, 1, '', 1679897953, 1679897953, 0);
INSERT INTO `ul_system_menu` VALUES (269, 255, '红包管理', 'fa fa-list', 'business.hb/index', '', '', '_self', 0, 1, '', 1680014623, 1680014623, 0);
INSERT INTO `ul_system_menu` VALUES (270, 255, '卡密管理', 'fa fa-list', 'business.km/index', '', '', '_self', 0, 1, '', 1680749011, 1680764157, 1680764157);
INSERT INTO `ul_system_menu` VALUES (271, 255, '充值订单', 'fa fa-list', 'business.yxcz/index', '', '', '_self', 0, 1, '', 1680785296, 1680785296, 0);
INSERT INTO `ul_system_menu` VALUES (272, 0, '论坛管理', 'fa fa-list', '', '', '', '_self', 1, 1, '', 1681097833, 1681101072, 0);
INSERT INTO `ul_system_menu` VALUES (273, 272, '帖子管理', 'fa fa-list', 'luntan.tz/index', '', '', '_self', 0, 1, '', 1681097883, 1681097883, 0);
INSERT INTO `ul_system_menu` VALUES (274, 272, '评论管理', 'fa fa-list', 'luntan.pl/index', '', '', '_self', 0, 1, '', 1681101098, 1681101098, 0);
INSERT INTO `ul_system_menu` VALUES (275, 255, '用户管理', 'fa fa-list', 'business.user/index', '', '', '_self', 0, 1, '', 1681131326, 1681131326, 0);
INSERT INTO `ul_system_menu` VALUES (276, 255, '盒子栏目', 'fa fa-list', 'business.hz/index', '', '', '_self', 0, 1, '', 1681794180, 1681794180, 0);

-- ----------------------------
-- Table structure for ul_system_node
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_node`;
CREATE TABLE `ul_system_node`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `node` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点代码',
  `title` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点标题',
  `type` int(1) UNSIGNED NOT NULL COMMENT '节点类型（1：控制器，2：节点）',
  `is_auth` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启动RBAC权限控制',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_node
-- ----------------------------
INSERT INTO `ul_system_node` VALUES (1, 'system.admin', '管理员管理', 1, 1, 1657347263, 1657347263);
INSERT INTO `ul_system_node` VALUES (2, 'system.admin/index', '列表', 2, 1, 1657347263, 1657347263);
INSERT INTO `ul_system_node` VALUES (3, 'system.admin/add', '添加', 2, 1, 1657347263, 1657347263);
INSERT INTO `ul_system_node` VALUES (4, 'system.admin/edit', '编辑', 2, 1, 1657347263, 1657347263);
INSERT INTO `ul_system_node` VALUES (5, 'system.admin/password', '编辑', 2, 1, 1657347263, 1657347263);
INSERT INTO `ul_system_node` VALUES (6, 'system.admin/delete', '删除', 2, 1, 1657347263, 1657347263);
INSERT INTO `ul_system_node` VALUES (7, 'system.admin/modify', '属性修改', 2, 1, 1657347263, 1657347263);
INSERT INTO `ul_system_node` VALUES (8, 'system.admin/export', '导出', 2, 1, 1657347264, 1657347264);
INSERT INTO `ul_system_node` VALUES (9, 'system.auth', '角色权限管理', 1, 1, 1657347264, 1657347264);
INSERT INTO `ul_system_node` VALUES (10, 'system.auth/authorize', '授权', 2, 1, 1657347264, 1657347264);
INSERT INTO `ul_system_node` VALUES (11, 'system.auth/saveAuthorize', '授权保存', 2, 1, 1657347264, 1657347264);
INSERT INTO `ul_system_node` VALUES (12, 'system.auth/index', '列表', 2, 1, 1657347264, 1657347264);
INSERT INTO `ul_system_node` VALUES (13, 'system.auth/add', '添加', 2, 1, 1657347264, 1657347264);
INSERT INTO `ul_system_node` VALUES (14, 'system.auth/edit', '编辑', 2, 1, 1657347264, 1657347264);
INSERT INTO `ul_system_node` VALUES (15, 'system.auth/delete', '删除', 2, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (16, 'system.auth/export', '导出', 2, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (17, 'system.auth/modify', '属性修改', 2, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (18, 'system.config', '系统配置管理', 1, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (19, 'system.config/index', '列表', 2, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (20, 'system.config/save', '保存', 2, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (21, 'system.menu', '菜单管理', 1, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (22, 'system.menu/index', '列表', 2, 1, 1657347265, 1657347265);
INSERT INTO `ul_system_node` VALUES (23, 'system.menu/add', '添加', 2, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (24, 'system.menu/edit', '编辑', 2, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (25, 'system.menu/delete', '删除', 2, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (26, 'system.menu/modify', '属性修改', 2, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (27, 'system.menu/getMenuTips', '添加菜单提示', 2, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (28, 'system.menu/export', '导出', 2, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (29, 'system.node', '系统节点管理', 1, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (30, 'system.node/index', '列表', 2, 1, 1657347266, 1657347266);
INSERT INTO `ul_system_node` VALUES (31, 'system.node/refreshNode', '系统节点更新', 2, 1, 1657347267, 1657347267);
INSERT INTO `ul_system_node` VALUES (32, 'system.node/clearNode', '清除失效节点', 2, 1, 1657347267, 1657347267);
INSERT INTO `ul_system_node` VALUES (33, 'system.node/add', '添加', 2, 1, 1657347267, 1657347267);
INSERT INTO `ul_system_node` VALUES (34, 'system.node/edit', '编辑', 2, 1, 1657347267, 1657347267);
INSERT INTO `ul_system_node` VALUES (35, 'system.node/delete', '删除', 2, 1, 1657347267, 1657347267);
INSERT INTO `ul_system_node` VALUES (36, 'system.node/export', '导出', 2, 1, 1657347267, 1657347267);
INSERT INTO `ul_system_node` VALUES (37, 'system.node/modify', '属性修改', 2, 1, 1657347267, 1657347267);
INSERT INTO `ul_system_node` VALUES (38, 'system.uploadfile', '上传文件管理', 1, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (39, 'system.uploadfile/index', '列表', 2, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (40, 'system.uploadfile/add', '添加', 2, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (41, 'system.uploadfile/edit', '编辑', 2, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (42, 'system.uploadfile/delete', '删除', 2, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (43, 'system.uploadfile/export', '导出', 2, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (44, 'system.uploadfile/modify', '属性修改', 2, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (45, 'mall.cate', '商品分类管理', 1, 1, 1657347268, 1657347268);
INSERT INTO `ul_system_node` VALUES (46, 'mall.cate/index', '列表', 2, 1, 1657347269, 1657347269);
INSERT INTO `ul_system_node` VALUES (47, 'mall.cate/add', '添加', 2, 1, 1657347269, 1657347269);
INSERT INTO `ul_system_node` VALUES (48, 'mall.cate/edit', '编辑', 2, 1, 1657347269, 1657347269);
INSERT INTO `ul_system_node` VALUES (49, 'mall.cate/delete', '删除', 2, 1, 1657347269, 1657347269);
INSERT INTO `ul_system_node` VALUES (50, 'mall.cate/export', '导出', 2, 1, 1657347269, 1657347269);
INSERT INTO `ul_system_node` VALUES (51, 'mall.cate/modify', '属性修改', 2, 1, 1657347269, 1657347269);
INSERT INTO `ul_system_node` VALUES (52, 'mall.goods', '商城商品管理', 1, 1, 1657347269, 1657347269);
INSERT INTO `ul_system_node` VALUES (53, 'mall.goods/index', '列表', 2, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (54, 'mall.goods/stock', '入库', 2, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (55, 'mall.goods/add', '添加', 2, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (56, 'mall.goods/edit', '编辑', 2, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (57, 'mall.goods/delete', '删除', 2, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (58, 'mall.goods/export', '导出', 2, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (59, 'mall.goods/modify', '属性修改', 2, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (60, 'system.quick', '快捷入口管理', 1, 1, 1657347270, 1657347270);
INSERT INTO `ul_system_node` VALUES (61, 'system.quick/index', '列表', 2, 1, 1657347271, 1657347271);
INSERT INTO `ul_system_node` VALUES (62, 'system.quick/add', '添加', 2, 1, 1657347271, 1657347271);
INSERT INTO `ul_system_node` VALUES (63, 'system.quick/edit', '编辑', 2, 1, 1657347271, 1657347271);
INSERT INTO `ul_system_node` VALUES (64, 'system.quick/delete', '删除', 2, 1, 1657347271, 1657347271);
INSERT INTO `ul_system_node` VALUES (65, 'system.quick/export', '导出', 2, 1, 1657347271, 1657347271);
INSERT INTO `ul_system_node` VALUES (66, 'system.quick/modify', '属性修改', 2, 1, 1657347271, 1657347271);
INSERT INTO `ul_system_node` VALUES (69, 'debug.log', 'debug_log', 1, 1, 1657347271, 1657347271);
INSERT INTO `ul_system_node` VALUES (70, 'debug.log/index', '列表', 2, 1, 1657347272, 1657347272);
INSERT INTO `ul_system_node` VALUES (71, 'debug.log/add', '添加', 2, 1, 1657347272, 1657347272);
INSERT INTO `ul_system_node` VALUES (72, 'debug.log/edit', '编辑', 2, 1, 1657347272, 1657347272);
INSERT INTO `ul_system_node` VALUES (73, 'debug.log/delete', '删除', 2, 1, 1657347272, 1657347272);
INSERT INTO `ul_system_node` VALUES (74, 'debug.log/export', '导出', 2, 1, 1657347272, 1657347272);
INSERT INTO `ul_system_node` VALUES (75, 'debug.log/modify', '属性修改', 2, 1, 1657347272, 1657347272);
INSERT INTO `ul_system_node` VALUES (76, 'mall.tag', 'mall_tag', 1, 1, 1657347614, 1657347614);
INSERT INTO `ul_system_node` VALUES (77, 'mall.tag/index', '列表', 2, 1, 1657347614, 1657347614);
INSERT INTO `ul_system_node` VALUES (78, 'mall.tag/add', '添加', 2, 1, 1657347615, 1657347615);
INSERT INTO `ul_system_node` VALUES (79, 'mall.tag/edit', '编辑', 2, 1, 1657347615, 1657347615);
INSERT INTO `ul_system_node` VALUES (80, 'mall.tag/delete', '删除', 2, 1, 1657347615, 1657347615);
INSERT INTO `ul_system_node` VALUES (81, 'mall.tag/export', '导出', 2, 1, 1657347615, 1657347615);
INSERT INTO `ul_system_node` VALUES (82, 'mall.tag/modify', '属性修改', 2, 1, 1657347615, 1657347615);
INSERT INTO `ul_system_node` VALUES (83, 'business.basic', '运营配置基础配置', 1, 1, 1657347615, 1657347615);
INSERT INTO `ul_system_node` VALUES (84, 'business.basic/edit', '编辑', 2, 1, 1657347615, 1657347615);

-- ----------------------------
-- Table structure for ul_system_quick
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_quick`;
CREATE TABLE `ul_system_quick`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快捷入口名称',
  `icon` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `href` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快捷链接',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) UNSIGNED NOT NULL COMMENT '状态 {radio} (1:禁用,2:启用)',
  `remark` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统快捷入口表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_quick
-- ----------------------------
INSERT INTO `ul_system_quick` VALUES (1, '管理员管理', 'fa fa-user', 'system.admin/index', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_quick` VALUES (2, '角色管理', 'fa fa-bitbucket-square', 'system.auth/index', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_quick` VALUES (3, '菜单管理', 'fa fa-tree', 'system.menu/index', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_quick` VALUES (4, '节点管理', 'fa fa-list', 'system.node/index', 0, 1, '', 1678717880, 1679902133, 1679902133);
INSERT INTO `ul_system_quick` VALUES (5, '配置管理', 'fa fa-asterisk', 'system.config/index', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_quick` VALUES (6, '上传管理', 'fa fa-arrow-up', 'system.uploadfile/index', 0, 1, '', 1678717880, 1678717880, 0);
INSERT INTO `ul_system_quick` VALUES (7, '商品分类', 'fa fa-calendar-check-o', 'mall.cate/index', 0, 1, '', 1678717880, 1679902143, 1679902143);
INSERT INTO `ul_system_quick` VALUES (8, '商品管理', 'fa fa-list', 'mall.goods/index', 0, 1, '', 1678717880, 1679902139, 1679902139);

-- ----------------------------
-- Table structure for ul_system_uploadfile
-- ----------------------------
DROP TABLE IF EXISTS `ul_system_uploadfile`;
CREATE TABLE `ul_system_uploadfile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件存储表',
  `upload_type` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `original_name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件原名',
  `url` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `save_name` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '存储名称',
  `image_width` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `image_height` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `image_frames` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `mime_type` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `file_size` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `file_ext` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展名',
  `sha1` char(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `upload_type`(`upload_type`) USING BTREE,
  INDEX `original_name`(`original_name`) USING BTREE,
  INDEX `delete_time`(`delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 577 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传文件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_system_uploadfile
-- ----------------------------
INSERT INTO `ul_system_uploadfile` VALUES (1, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/640ffdf0a256c.png', 'upload/20230314/640ffdf0a256c.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678769648, 1678769648, 0);
INSERT INTO `ul_system_uploadfile` VALUES (2, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/640ffeb2e483a.png', 'upload/20230314/640ffeb2e483a.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678769842, 1678792292, 1678792292);
INSERT INTO `ul_system_uploadfile` VALUES (3, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/640fffc3471e8.png', 'upload/20230314/640fffc3471e8.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678770115, 1678770115, 0);
INSERT INTO `ul_system_uploadfile` VALUES (4, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/640fffd8db3ca.png', 'upload/20230314/640fffd8db3ca.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678770136, 1678770136, 0);
INSERT INTO `ul_system_uploadfile` VALUES (5, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/640ffffd20754.png', 'upload/20230314/640ffffd20754.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678770173, 1678770173, 0);
INSERT INTO `ul_system_uploadfile` VALUES (6, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410003bda0e9.png', 'upload/20230314/6410003bda0e9.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678770235, 1678770235, 0);
INSERT INTO `ul_system_uploadfile` VALUES (7, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100098505df.png', 'upload/20230314/64100098505df.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678770328, 1678770328, 0);
INSERT INTO `ul_system_uploadfile` VALUES (8, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641000a3b4b53.png', 'upload/20230314/641000a3b4b53.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678770339, 1680660711, 1680660711);
INSERT INTO `ul_system_uploadfile` VALUES (9, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641000aa26c10.png', 'upload/20230314/641000aa26c10.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678770346, 1678770346, 0);
INSERT INTO `ul_system_uploadfile` VALUES (10, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641000dd9f517.jpg', 'upload/20230314/641000dd9f517.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678770397, 1678770397, 0);
INSERT INTO `ul_system_uploadfile` VALUES (11, 'local_public', '等级医院.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641000e4429e1.png', 'upload/20230314/641000e4429e1.png', '', '', 0, 'image/png', 361138, 'png', '81a7a95c3e472569c071baad6bf7ebf181a2bb0d', 1678770404, 1678770404, 0);
INSERT INTO `ul_system_uploadfile` VALUES (12, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410017c25c90.png', 'upload/20230314/6410017c25c90.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678770556, 1678770556, 0);
INSERT INTO `ul_system_uploadfile` VALUES (13, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100180c2326.jpg', 'upload/20230314/64100180c2326.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678770560, 1678770560, 0);
INSERT INTO `ul_system_uploadfile` VALUES (14, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641001f9d2ae6.png', 'upload/20230314/641001f9d2ae6.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678770681, 1678770681, 0);
INSERT INTO `ul_system_uploadfile` VALUES (15, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641001fe99f77.png', 'upload/20230314/641001fe99f77.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678770686, 1678770686, 0);
INSERT INTO `ul_system_uploadfile` VALUES (16, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410039935c99.png', 'upload/20230314/6410039935c99.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678771097, 1678771097, 0);
INSERT INTO `ul_system_uploadfile` VALUES (17, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410039e85549.jpg', 'upload/20230314/6410039e85549.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678771102, 1678771102, 0);
INSERT INTO `ul_system_uploadfile` VALUES (18, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100525e9e41.jpg', 'upload/20230314/64100525e9e41.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678771493, 1678771493, 0);
INSERT INTO `ul_system_uploadfile` VALUES (19, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100532844f6.jpg', 'upload/20230314/64100532844f6.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678771506, 1678771506, 0);
INSERT INTO `ul_system_uploadfile` VALUES (20, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100582f36c4.png', 'upload/20230314/64100582f36c4.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678771587, 1678771587, 0);
INSERT INTO `ul_system_uploadfile` VALUES (21, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410058e7eaa5.png', 'upload/20230314/6410058e7eaa5.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678771598, 1678771598, 0);
INSERT INTO `ul_system_uploadfile` VALUES (22, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100670740ae.jpg', 'upload/20230314/64100670740ae.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678771824, 1678771824, 0);
INSERT INTO `ul_system_uploadfile` VALUES (23, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100675063be.jpg', 'upload/20230314/64100675063be.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678771829, 1678771829, 0);
INSERT INTO `ul_system_uploadfile` VALUES (24, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410071e5c515.jpg', 'upload/20230314/6410071e5c515.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678771998, 1678771998, 0);
INSERT INTO `ul_system_uploadfile` VALUES (25, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100722ccc61.jpg', 'upload/20230314/64100722ccc61.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678772002, 1678772002, 0);
INSERT INTO `ul_system_uploadfile` VALUES (26, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410084b0c819.png', 'upload/20230314/6410084b0c819.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772299, 1678772299, 0);
INSERT INTO `ul_system_uploadfile` VALUES (27, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410084ecb009.png', 'upload/20230314/6410084ecb009.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772302, 1678772302, 0);
INSERT INTO `ul_system_uploadfile` VALUES (28, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641008ccec474.jpg', 'upload/20230314/641008ccec474.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678772428, 1678772428, 0);
INSERT INTO `ul_system_uploadfile` VALUES (29, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641008d26df04.jpg', 'upload/20230314/641008d26df04.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678772434, 1678772434, 0);
INSERT INTO `ul_system_uploadfile` VALUES (30, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641008ef13f1f.png', 'upload/20230314/641008ef13f1f.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772463, 1678772463, 0);
INSERT INTO `ul_system_uploadfile` VALUES (31, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641008f3f1186.jpg', 'upload/20230314/641008f3f1186.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678772467, 1678772467, 0);
INSERT INTO `ul_system_uploadfile` VALUES (32, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410093a590df.png', 'upload/20230314/6410093a590df.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772538, 1678772538, 0);
INSERT INTO `ul_system_uploadfile` VALUES (33, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410093f5a9bf.jpg', 'upload/20230314/6410093f5a9bf.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678772543, 1678772543, 0);
INSERT INTO `ul_system_uploadfile` VALUES (34, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410096328853.png', 'upload/20230314/6410096328853.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772579, 1678772579, 0);
INSERT INTO `ul_system_uploadfile` VALUES (35, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100967aa5f4.png', 'upload/20230314/64100967aa5f4.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772583, 1678772583, 0);
INSERT INTO `ul_system_uploadfile` VALUES (36, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410098820eaa.png', 'upload/20230314/6410098820eaa.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772616, 1678772616, 0);
INSERT INTO `ul_system_uploadfile` VALUES (37, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100a7617c15.png', 'upload/20230314/64100a7617c15.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678772854, 1678772854, 0);
INSERT INTO `ul_system_uploadfile` VALUES (38, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64100a7ba8667.png', 'upload/20230314/64100a7ba8667.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678772859, 1678772859, 0);
INSERT INTO `ul_system_uploadfile` VALUES (39, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64101a4a8d891.png', 'upload/20230314/64101a4a8d891.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678776906, 1678776906, 0);
INSERT INTO `ul_system_uploadfile` VALUES (40, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64101a501b067.png', 'upload/20230314/64101a501b067.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678776912, 1678776912, 0);
INSERT INTO `ul_system_uploadfile` VALUES (41, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64101ab48d732.jpg', 'upload/20230314/64101ab48d732.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678777012, 1678777012, 0);
INSERT INTO `ul_system_uploadfile` VALUES (42, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64101ab8d0826.png', 'upload/20230314/64101ab8d0826.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678777016, 1678777016, 0);
INSERT INTO `ul_system_uploadfile` VALUES (43, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641021ec30acd.png', 'upload/20230314/641021ec30acd.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678778860, 1678778860, 0);
INSERT INTO `ul_system_uploadfile` VALUES (44, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641023766bb41.png', 'upload/20230314/641023766bb41.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779254, 1678779254, 0);
INSERT INTO `ul_system_uploadfile` VALUES (45, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410237be5483.png', 'upload/20230314/6410237be5483.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779259, 1678779259, 0);
INSERT INTO `ul_system_uploadfile` VALUES (46, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64102381a5035.jpg', 'upload/20230314/64102381a5035.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678779265, 1678779265, 0);
INSERT INTO `ul_system_uploadfile` VALUES (47, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64102387a0ec5.png', 'upload/20230314/64102387a0ec5.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779271, 1678779271, 0);
INSERT INTO `ul_system_uploadfile` VALUES (48, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410238cd927f.png', 'upload/20230314/6410238cd927f.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779276, 1678779276, 0);
INSERT INTO `ul_system_uploadfile` VALUES (49, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410239220409.png', 'upload/20230314/6410239220409.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779282, 1678779282, 0);
INSERT INTO `ul_system_uploadfile` VALUES (50, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641023977763a.png', 'upload/20230314/641023977763a.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779287, 1678779287, 0);
INSERT INTO `ul_system_uploadfile` VALUES (51, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410239c82da7.png', 'upload/20230314/6410239c82da7.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779292, 1678779292, 0);
INSERT INTO `ul_system_uploadfile` VALUES (52, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641023a19d5f0.png', 'upload/20230314/641023a19d5f0.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779297, 1678779297, 0);
INSERT INTO `ul_system_uploadfile` VALUES (53, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641023a65d84c.png', 'upload/20230314/641023a65d84c.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779302, 1678779302, 0);
INSERT INTO `ul_system_uploadfile` VALUES (54, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641023ab6d878.png', 'upload/20230314/641023ab6d878.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779307, 1678779307, 0);
INSERT INTO `ul_system_uploadfile` VALUES (55, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64102403a8d33.png', 'upload/20230314/64102403a8d33.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779395, 1678779395, 0);
INSERT INTO `ul_system_uploadfile` VALUES (56, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64102407d504f.png', 'upload/20230314/64102407d504f.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779399, 1678779399, 0);
INSERT INTO `ul_system_uploadfile` VALUES (57, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410240d8b88a.png', 'upload/20230314/6410240d8b88a.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779405, 1678779405, 0);
INSERT INTO `ul_system_uploadfile` VALUES (58, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410241250f26.png', 'upload/20230314/6410241250f26.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779410, 1678779410, 0);
INSERT INTO `ul_system_uploadfile` VALUES (59, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024168809e.png', 'upload/20230314/641024168809e.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779414, 1678779414, 0);
INSERT INTO `ul_system_uploadfile` VALUES (60, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410241c11235.png', 'upload/20230314/6410241c11235.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779420, 1678779420, 0);
INSERT INTO `ul_system_uploadfile` VALUES (61, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024226fc74.png', 'upload/20230314/641024226fc74.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779426, 1678779426, 0);
INSERT INTO `ul_system_uploadfile` VALUES (62, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024272de70.png', 'upload/20230314/641024272de70.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779431, 1678779431, 0);
INSERT INTO `ul_system_uploadfile` VALUES (63, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410242c35c29.png', 'upload/20230314/6410242c35c29.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779436, 1678779436, 0);
INSERT INTO `ul_system_uploadfile` VALUES (64, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024312bab8.png', 'upload/20230314/641024312bab8.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779441, 1678779441, 0);
INSERT INTO `ul_system_uploadfile` VALUES (65, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/64102435acfe5.png', 'upload/20230314/64102435acfe5.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779445, 1678779445, 0);
INSERT INTO `ul_system_uploadfile` VALUES (66, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410248b68f10.jpg', 'upload/20230314/6410248b68f10.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678779531, 1678779531, 0);
INSERT INTO `ul_system_uploadfile` VALUES (67, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410248fb9bcb.png', 'upload/20230314/6410248fb9bcb.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779535, 1678779535, 0);
INSERT INTO `ul_system_uploadfile` VALUES (68, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/64102494ad903.jpg', 'upload/20230314/64102494ad903.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678779540, 1678779540, 0);
INSERT INTO `ul_system_uploadfile` VALUES (69, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410249952785.png', 'upload/20230314/6410249952785.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779545, 1678779545, 0);
INSERT INTO `ul_system_uploadfile` VALUES (70, 'local_public', '123.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410249e2a6be.png', 'upload/20230314/6410249e2a6be.png', '', '', 0, 'image/png', 22083, 'png', 'f3ffd51c2e54a9b78befdd794f6e32e3655197c5', 1678779550, 1678779550, 0);
INSERT INTO `ul_system_uploadfile` VALUES (71, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024a353e0d.png', 'upload/20230314/641024a353e0d.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779555, 1678779555, 0);
INSERT INTO `ul_system_uploadfile` VALUES (72, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024a816b92.png', 'upload/20230314/641024a816b92.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779560, 1678779560, 0);
INSERT INTO `ul_system_uploadfile` VALUES (73, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024ac987d3.png', 'upload/20230314/641024ac987d3.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779564, 1678779564, 0);
INSERT INTO `ul_system_uploadfile` VALUES (74, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024b170a5d.png', 'upload/20230314/641024b170a5d.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779569, 1678779569, 0);
INSERT INTO `ul_system_uploadfile` VALUES (75, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024b627356.png', 'upload/20230314/641024b627356.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779574, 1678779574, 0);
INSERT INTO `ul_system_uploadfile` VALUES (76, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024bae6579.png', 'upload/20230314/641024bae6579.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779578, 1678779578, 0);
INSERT INTO `ul_system_uploadfile` VALUES (77, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641024d660a0a.png', 'upload/20230314/641024d660a0a.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678779606, 1678779606, 0);
INSERT INTO `ul_system_uploadfile` VALUES (78, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025cadbec4.png', 'upload/20230314/641025cadbec4.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1678779850, 1678779850, 0);
INSERT INTO `ul_system_uploadfile` VALUES (79, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025cf9283e.jpg', 'upload/20230314/641025cf9283e.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678779855, 1678779855, 0);
INSERT INTO `ul_system_uploadfile` VALUES (80, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025d5858af.png', 'upload/20230314/641025d5858af.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678779861, 1678779861, 0);
INSERT INTO `ul_system_uploadfile` VALUES (81, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025da91e03.png', 'upload/20230314/641025da91e03.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678779866, 1678779866, 0);
INSERT INTO `ul_system_uploadfile` VALUES (82, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025e072273.jpg', 'upload/20230314/641025e072273.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1678779872, 1678779872, 0);
INSERT INTO `ul_system_uploadfile` VALUES (83, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025e87ba0b.jpg', 'upload/20230314/641025e87ba0b.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678779880, 1678779880, 0);
INSERT INTO `ul_system_uploadfile` VALUES (84, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025ecac1af.jpg', 'upload/20230314/641025ecac1af.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678779884, 1678779884, 0);
INSERT INTO `ul_system_uploadfile` VALUES (85, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025f0bd2ab.jpg', 'upload/20230314/641025f0bd2ab.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678779888, 1678779888, 0);
INSERT INTO `ul_system_uploadfile` VALUES (86, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025f4d4cd4.jpg', 'upload/20230314/641025f4d4cd4.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678779892, 1678779892, 0);
INSERT INTO `ul_system_uploadfile` VALUES (87, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025f865614.jpg', 'upload/20230314/641025f865614.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678779896, 1678779896, 0);
INSERT INTO `ul_system_uploadfile` VALUES (88, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641025fc12cde.jpg', 'upload/20230314/641025fc12cde.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678779900, 1678779900, 0);
INSERT INTO `ul_system_uploadfile` VALUES (89, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641040e63b4db.jpg', 'upload/20230314/641040e63b4db.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678786790, 1678786790, 0);
INSERT INTO `ul_system_uploadfile` VALUES (90, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641041c5e923f.jpg', 'upload/20230314/641041c5e923f.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678787013, 1678787013, 0);
INSERT INTO `ul_system_uploadfile` VALUES (91, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641041eaa7603.jpg', 'upload/20230314/641041eaa7603.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678787050, 1678787050, 0);
INSERT INTO `ul_system_uploadfile` VALUES (92, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043b534a1d.jpg', 'upload/20230314/641043b534a1d.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678787509, 1678787509, 0);
INSERT INTO `ul_system_uploadfile` VALUES (93, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043beecf84.jpg', 'upload/20230314/641043beecf84.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678787518, 1678787518, 0);
INSERT INTO `ul_system_uploadfile` VALUES (94, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043c921135.jpg', 'upload/20230314/641043c921135.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678787529, 1678787529, 0);
INSERT INTO `ul_system_uploadfile` VALUES (95, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641043d14ee0a.jpg', 'upload/20230314/641043d14ee0a.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678787537, 1678787537, 0);
INSERT INTO `ul_system_uploadfile` VALUES (96, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641048abec121.jpg', 'upload/20230314/641048abec121.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678788779, 1678788779, 0);
INSERT INTO `ul_system_uploadfile` VALUES (97, 'local_public', '微信截图_20230314190709.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/6410558ef2b2c.png', 'upload/20230314/6410558ef2b2c.png', '', '', 0, 'image/png', 71016, 'png', 'fa63f0ea52d2ee64fa6b507aaef9887e288b4120', 1678792078, 1678792078, 0);
INSERT INTO `ul_system_uploadfile` VALUES (98, 'local_public', '微信图片_20220225164500.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230314/641055c4ef14b.jpg', 'upload/20230314/641055c4ef14b.jpg', '', '', 0, 'image/jpeg', 43843, 'jpg', '21f5294e09d995623fe16753056f5d47c68c9ce5', 1678792132, 1678792132, 0);
INSERT INTO `ul_system_uploadfile` VALUES (99, 'local_public', '微信截图_20230314190709.png', 'http://cqadmin.bluechs.com/storage/upload/20230314/641055dcb4c67.png', 'upload/20230314/641055dcb4c67.png', '', '', 0, 'image/png', 71016, 'png', 'fa63f0ea52d2ee64fa6b507aaef9887e288b4120', 1678792156, 1678792156, 0);
INSERT INTO `ul_system_uploadfile` VALUES (100, 'local_public', 'logo.ico', 'http://cqadmin.bluechs.com/storage/upload/20230315/64111ddf312a0.ico', 'upload/20230315/64111ddf312a0.ico', '', '', 0, 'image/x-icon', 51273, 'ico', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678843359, 1678843359, 0);
INSERT INTO `ul_system_uploadfile` VALUES (101, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/64114345e12c9.jpg', 'upload/20230315/64114345e12c9.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678852933, 1678852933, 0);
INSERT INTO `ul_system_uploadfile` VALUES (102, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/64114432a54a3.jpg', 'upload/20230315/64114432a54a3.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678853170, 1678853170, 0);
INSERT INTO `ul_system_uploadfile` VALUES (103, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/64114452224da.jpg', 'upload/20230315/64114452224da.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678853202, 1678853202, 0);
INSERT INTO `ul_system_uploadfile` VALUES (104, 'local_public', 'logo.png', 'http://cqadmin.bluechs.com/storage/upload/20230315/6411458bb7940.png', 'upload/20230315/6411458bb7940.png', '', '', 0, 'image/png', 51273, 'png', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1678853515, 1678853515, 0);
INSERT INTO `ul_system_uploadfile` VALUES (105, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/641145ec2e22f.jpg', 'upload/20230315/641145ec2e22f.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678853612, 1678853612, 0);
INSERT INTO `ul_system_uploadfile` VALUES (106, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/641145f05381c.jpg', 'upload/20230315/641145f05381c.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678853616, 1678853616, 0);
INSERT INTO `ul_system_uploadfile` VALUES (107, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/64114608da4ff.jpg', 'upload/20230315/64114608da4ff.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678853640, 1678853640, 0);
INSERT INTO `ul_system_uploadfile` VALUES (108, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/6411460c52682.jpg', 'upload/20230315/6411460c52682.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678853644, 1678853644, 0);
INSERT INTO `ul_system_uploadfile` VALUES (109, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230315/64114e400dee8.jpg', 'upload/20230315/64114e400dee8.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1678855744, 1678855744, 0);
INSERT INTO `ul_system_uploadfile` VALUES (110, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413ca3a82b33.jpg', 'upload/20230317/6413ca3a82b33.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1679018554, 1679018554, 0);
INSERT INTO `ul_system_uploadfile` VALUES (111, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413caabe98ab.jpg', 'upload/20230317/6413caabe98ab.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1679018667, 1679018667, 0);
INSERT INTO `ul_system_uploadfile` VALUES (112, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413cf17d3c46.png', 'upload/20230317/6413cf17d3c46.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679019799, 1679019799, 0);
INSERT INTO `ul_system_uploadfile` VALUES (113, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413cf67d209a.png', 'upload/20230317/6413cf67d209a.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679019879, 1679019879, 0);
INSERT INTO `ul_system_uploadfile` VALUES (114, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413cfa1dbb1c.png', 'upload/20230317/6413cfa1dbb1c.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679019937, 1679019937, 0);
INSERT INTO `ul_system_uploadfile` VALUES (115, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d09ac12e1.png', 'upload/20230317/6413d09ac12e1.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679020186, 1679020186, 0);
INSERT INTO `ul_system_uploadfile` VALUES (116, 'local_public', 'app定制开发.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d0a23432c.jpg', 'upload/20230317/6413d0a23432c.jpg', '', '', 0, 'image/jpeg', 57527, 'jpg', '372d0eb2095099a77ac1f9de5da37ecb742c7d12', 1679020194, 1679020194, 0);
INSERT INTO `ul_system_uploadfile` VALUES (117, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d0ee50cc8.png', 'upload/20230317/6413d0ee50cc8.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679020270, 1679020270, 0);
INSERT INTO `ul_system_uploadfile` VALUES (118, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d14ce3aa7.png', 'upload/20230317/6413d14ce3aa7.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679020364, 1679020364, 0);
INSERT INTO `ul_system_uploadfile` VALUES (119, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d158d5871.png', 'upload/20230317/6413d158d5871.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679020376, 1679020376, 0);
INSERT INTO `ul_system_uploadfile` VALUES (120, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d29ed8bb3.png', 'upload/20230317/6413d29ed8bb3.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679020702, 1679020702, 0);
INSERT INTO `ul_system_uploadfile` VALUES (121, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d6c77dde6.png', 'upload/20230317/6413d6c77dde6.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679021767, 1679021767, 0);
INSERT INTO `ul_system_uploadfile` VALUES (122, 'local_public', '111.png', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d6d8a1de9.png', 'upload/20230317/6413d6d8a1de9.png', '', '', 0, 'image/png', 518109, 'png', '32eb11852004f9f7659e2ab15b5b62ead4a689fa', 1679021784, 1679021784, 0);
INSERT INTO `ul_system_uploadfile` VALUES (123, 'local_public', 'logo.ico', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d731807c3.ico', 'upload/20230317/6413d731807c3.ico', '', '', 0, 'image/x-icon', 51273, 'ico', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1679021873, 1679021873, 0);
INSERT INTO `ul_system_uploadfile` VALUES (124, 'local_public', 'logo.ico', 'http://cqadmin.bluechs.com/storage/upload/20230317/6413d7416431d.ico', 'upload/20230317/6413d7416431d.ico', '', '', 0, 'image/x-icon', 51273, 'ico', 'e5a35cfe9caf4ba1ba09e1f0e047597580de720a', 1679021889, 1679021889, 0);
INSERT INTO `ul_system_uploadfile` VALUES (125, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230317/641426f950d99.jpg', 'upload/20230317/641426f950d99.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679042297, 1679042297, 0);
INSERT INTO `ul_system_uploadfile` VALUES (126, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230317/641427074f0b0.jpg', 'upload/20230317/641427074f0b0.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679042311, 1679042311, 0);
INSERT INTO `ul_system_uploadfile` VALUES (127, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230318/64150f1da85f4.jpg', 'upload/20230318/64150f1da85f4.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679101725, 1679101725, 0);
INSERT INTO `ul_system_uploadfile` VALUES (128, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230318/64150f5f2b086.jpg', 'upload/20230318/64150f5f2b086.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679101791, 1679101791, 0);
INSERT INTO `ul_system_uploadfile` VALUES (129, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230318/641510bb96909.jpg', 'upload/20230318/641510bb96909.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679102139, 1679102139, 0);
INSERT INTO `ul_system_uploadfile` VALUES (130, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415131d8750f.png', 'upload/20230318/6415131d8750f.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679102749, 1679102749, 0);
INSERT INTO `ul_system_uploadfile` VALUES (131, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415133046bf3.png', 'upload/20230318/6415133046bf3.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102768, 1679102768, 0);
INSERT INTO `ul_system_uploadfile` VALUES (132, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415135888aab.png', 'upload/20230318/6415135888aab.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102808, 1679102808, 0);
INSERT INTO `ul_system_uploadfile` VALUES (133, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415138365cb4.png', 'upload/20230318/6415138365cb4.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102851, 1679102851, 0);
INSERT INTO `ul_system_uploadfile` VALUES (134, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415138f2fa52.png', 'upload/20230318/6415138f2fa52.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102863, 1679102863, 0);
INSERT INTO `ul_system_uploadfile` VALUES (135, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415139c107b3.png', 'upload/20230318/6415139c107b3.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102876, 1679102876, 0);
INSERT INTO `ul_system_uploadfile` VALUES (136, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641513a5e735f.png', 'upload/20230318/641513a5e735f.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102885, 1679102885, 0);
INSERT INTO `ul_system_uploadfile` VALUES (137, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641513b39f8ac.png', 'upload/20230318/641513b39f8ac.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102899, 1679102899, 0);
INSERT INTO `ul_system_uploadfile` VALUES (138, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641513bee4886.png', 'upload/20230318/641513bee4886.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102910, 1679102910, 0);
INSERT INTO `ul_system_uploadfile` VALUES (139, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641513f6e81e9.png', 'upload/20230318/641513f6e81e9.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679102966, 1679102966, 0);
INSERT INTO `ul_system_uploadfile` VALUES (140, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641513fb35457.png', 'upload/20230318/641513fb35457.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102971, 1679102971, 0);
INSERT INTO `ul_system_uploadfile` VALUES (141, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641514002df4b.png', 'upload/20230318/641514002df4b.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102976, 1679102976, 0);
INSERT INTO `ul_system_uploadfile` VALUES (142, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641514059b5b5.png', 'upload/20230318/641514059b5b5.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679102981, 1679102981, 0);
INSERT INTO `ul_system_uploadfile` VALUES (143, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641514324635a.png', 'upload/20230318/641514324635a.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679103026, 1679103026, 0);
INSERT INTO `ul_system_uploadfile` VALUES (144, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415143b97f05.png', 'upload/20230318/6415143b97f05.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679103035, 1679103035, 0);
INSERT INTO `ul_system_uploadfile` VALUES (145, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/641514447602a.png', 'upload/20230318/641514447602a.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679103044, 1679103044, 0);
INSERT INTO `ul_system_uploadfile` VALUES (146, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415144bee95f.png', 'upload/20230318/6415144bee95f.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679103051, 1679103051, 0);
INSERT INTO `ul_system_uploadfile` VALUES (147, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230318/6415145301220.png', 'upload/20230318/6415145301220.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679103059, 1679103059, 0);
INSERT INTO `ul_system_uploadfile` VALUES (148, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230318/64152c745cf2e.jpg', 'upload/20230318/64152c745cf2e.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679109236, 1679109236, 0);
INSERT INTO `ul_system_uploadfile` VALUES (149, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230318/64152cc1510e8.jpg', 'upload/20230318/64152cc1510e8.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679109313, 1679109313, 0);
INSERT INTO `ul_system_uploadfile` VALUES (246, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230322/641ac0b220d1d.mp4', 'upload/20230322/641ac0b220d1d.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1679474866, 1679474866, 0);
INSERT INTO `ul_system_uploadfile` VALUES (247, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230322/641ac2840aa00.mp4', 'upload/20230322/641ac2840aa00.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1679475332, 1679475332, 0);
INSERT INTO `ul_system_uploadfile` VALUES (248, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1478a9077.png', 'upload/20230323/641c1478a9077.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1679561848, 1679561848, 0);
INSERT INTO `ul_system_uploadfile` VALUES (249, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c149ff37d5.jpg', 'upload/20230323/641c149ff37d5.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679561888, 1679561888, 0);
INSERT INTO `ul_system_uploadfile` VALUES (250, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c14ba73553.jpg', 'upload/20230323/641c14ba73553.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679561914, 1679561914, 0);
INSERT INTO `ul_system_uploadfile` VALUES (251, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c14cc1ee1e.png', 'upload/20230323/641c14cc1ee1e.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1679561932, 1679561932, 0);
INSERT INTO `ul_system_uploadfile` VALUES (252, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c14edae546.jpg', 'upload/20230323/641c14edae546.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679561965, 1679561965, 0);
INSERT INTO `ul_system_uploadfile` VALUES (253, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1500c7642.png', 'upload/20230323/641c1500c7642.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1679561984, 1679561984, 0);
INSERT INTO `ul_system_uploadfile` VALUES (254, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1515056bb.jpg', 'upload/20230323/641c1515056bb.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679562005, 1679562005, 0);
INSERT INTO `ul_system_uploadfile` VALUES (255, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c152d605ec.png', 'upload/20230323/641c152d605ec.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1679562029, 1679562029, 0);
INSERT INTO `ul_system_uploadfile` VALUES (256, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c154144c28.jpg', 'upload/20230323/641c154144c28.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679562049, 1679562049, 0);
INSERT INTO `ul_system_uploadfile` VALUES (257, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1575d01f5.jpg', 'upload/20230323/641c1575d01f5.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679562101, 1679562101, 0);
INSERT INTO `ul_system_uploadfile` VALUES (258, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c15859619e.png', 'upload/20230323/641c15859619e.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679562117, 1679562117, 0);
INSERT INTO `ul_system_uploadfile` VALUES (259, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c15a7575b8.jpg', 'upload/20230323/641c15a7575b8.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679562151, 1679562151, 0);
INSERT INTO `ul_system_uploadfile` VALUES (260, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c15b8e4428.jpg', 'upload/20230323/641c15b8e4428.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679562168, 1679562168, 0);
INSERT INTO `ul_system_uploadfile` VALUES (261, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c15cdeb805.png', 'upload/20230323/641c15cdeb805.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679562189, 1679562189, 0);
INSERT INTO `ul_system_uploadfile` VALUES (262, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c163c5b969.png', 'upload/20230323/641c163c5b969.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1679562300, 1679562300, 0);
INSERT INTO `ul_system_uploadfile` VALUES (263, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c16592e1a9.png', 'upload/20230323/641c16592e1a9.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1679562329, 1679562329, 0);
INSERT INTO `ul_system_uploadfile` VALUES (264, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c169db2d37.jpg', 'upload/20230323/641c169db2d37.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679562397, 1679562397, 0);
INSERT INTO `ul_system_uploadfile` VALUES (265, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1c272b25e.jpg', 'upload/20230323/641c1c272b25e.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679563815, 1679563815, 0);
INSERT INTO `ul_system_uploadfile` VALUES (266, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1c4962fde.jpg', 'upload/20230323/641c1c4962fde.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679563849, 1679563849, 0);
INSERT INTO `ul_system_uploadfile` VALUES (267, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1e9031b00.jpg', 'upload/20230323/641c1e9031b00.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679564432, 1679564432, 0);
INSERT INTO `ul_system_uploadfile` VALUES (268, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c1efee1e2a.jpg', 'upload/20230323/641c1efee1e2a.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679564542, 1679564542, 0);
INSERT INTO `ul_system_uploadfile` VALUES (269, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230323/641c22c6cf8e1.jpg', 'upload/20230323/641c22c6cf8e1.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679565510, 1679565510, 0);
INSERT INTO `ul_system_uploadfile` VALUES (270, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230324/641d479c323d7.png', 'upload/20230324/641d479c323d7.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679640476, 1679640476, 0);
INSERT INTO `ul_system_uploadfile` VALUES (271, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230324/641d47a49366b.png', 'upload/20230324/641d47a49366b.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1679640484, 1679640484, 0);
INSERT INTO `ul_system_uploadfile` VALUES (272, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230324/641d47ae6792d.png', 'upload/20230324/641d47ae6792d.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679640494, 1679640494, 0);
INSERT INTO `ul_system_uploadfile` VALUES (273, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230324/641d47b7397d2.jpg', 'upload/20230324/641d47b7397d2.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1679640503, 1679640503, 0);
INSERT INTO `ul_system_uploadfile` VALUES (274, 'local_public', 'mmexport1679410244113.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230324/641dbc706fd24.jpg', 'upload/20230324/641dbc706fd24.jpg', '', '', 0, 'image/jpeg', 278376, 'jpg', '8c5d597592d58e0c7411b5187810aa4e8181c709', 1679670384, 1679670384, 0);
INSERT INTO `ul_system_uploadfile` VALUES (275, 'local_public', 'Screenshot_20230322_214532.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230325/641e5020adc82.jpg', 'upload/20230325/641e5020adc82.jpg', '', '', 0, 'image/jpeg', 65859, 'jpg', 'd5c17e73a473e3b6ca2b59525e60994282a2e834', 1679708192, 1679708192, 0);
INSERT INTO `ul_system_uploadfile` VALUES (276, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642046a82544b.png', 'upload/20230326/642046a82544b.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679836840, 1679836840, 0);
INSERT INTO `ul_system_uploadfile` VALUES (277, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642047281fc3c.png', 'upload/20230326/642047281fc3c.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679836968, 1679836968, 0);
INSERT INTO `ul_system_uploadfile` VALUES (278, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204739c212c.png', 'upload/20230326/64204739c212c.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679836985, 1679836985, 0);
INSERT INTO `ul_system_uploadfile` VALUES (279, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642047525568c.png', 'upload/20230326/642047525568c.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679837010, 1679837010, 0);
INSERT INTO `ul_system_uploadfile` VALUES (280, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642047a48884c.png', 'upload/20230326/642047a48884c.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837092, 1679837092, 0);
INSERT INTO `ul_system_uploadfile` VALUES (281, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642047b7bbd45.png', 'upload/20230326/642047b7bbd45.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837111, 1679837111, 0);
INSERT INTO `ul_system_uploadfile` VALUES (282, 'local_public', '微信图片_20230326212832.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204892c4537.png', 'upload/20230326/64204892c4537.png', '', '', 0, 'image/png', 4997, 'png', '45226fa3d73cfcba6720d5687a3b6b78bfc23feb', 1679837330, 1679837330, 0);
INSERT INTO `ul_system_uploadfile` VALUES (283, 'local_public', '微信图片_20230326212832.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420489f4e4fe.png', 'upload/20230326/6420489f4e4fe.png', '', '', 0, 'image/png', 4997, 'png', '45226fa3d73cfcba6720d5687a3b6b78bfc23feb', 1679837343, 1679837343, 0);
INSERT INTO `ul_system_uploadfile` VALUES (284, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204954ec457.png', 'upload/20230326/64204954ec457.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837524, 1679837524, 0);
INSERT INTO `ul_system_uploadfile` VALUES (285, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420499c786b4.png', 'upload/20230326/6420499c786b4.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837596, 1679837596, 0);
INSERT INTO `ul_system_uploadfile` VALUES (286, 'local_public', '微信图片_20230326212832.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642049d6dda79.png', 'upload/20230326/642049d6dda79.png', '', '', 0, 'image/png', 4997, 'png', '45226fa3d73cfcba6720d5687a3b6b78bfc23feb', 1679837654, 1679837654, 0);
INSERT INTO `ul_system_uploadfile` VALUES (287, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642049f5eab4e.png', 'upload/20230326/642049f5eab4e.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837685, 1679837685, 0);
INSERT INTO `ul_system_uploadfile` VALUES (288, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204a8e79ab3.png', 'upload/20230326/64204a8e79ab3.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837838, 1679837838, 0);
INSERT INTO `ul_system_uploadfile` VALUES (289, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204ab082de1.png', 'upload/20230326/64204ab082de1.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837872, 1679837872, 0);
INSERT INTO `ul_system_uploadfile` VALUES (290, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204abaa6e64.png', 'upload/20230326/64204abaa6e64.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837882, 1679837882, 0);
INSERT INTO `ul_system_uploadfile` VALUES (291, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204ac8c1baf.png', 'upload/20230326/64204ac8c1baf.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837896, 1679837896, 0);
INSERT INTO `ul_system_uploadfile` VALUES (292, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204add99333.png', 'upload/20230326/64204add99333.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837917, 1679837917, 0);
INSERT INTO `ul_system_uploadfile` VALUES (293, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204b1af1699.png', 'upload/20230326/64204b1af1699.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679837978, 1679837978, 0);
INSERT INTO `ul_system_uploadfile` VALUES (294, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204c994e573.png', 'upload/20230326/64204c994e573.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679838361, 1679838361, 0);
INSERT INTO `ul_system_uploadfile` VALUES (295, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204cb4ebc94.png', 'upload/20230326/64204cb4ebc94.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679838388, 1679838388, 0);
INSERT INTO `ul_system_uploadfile` VALUES (296, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204d287ba2c.png', 'upload/20230326/64204d287ba2c.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679838504, 1679838504, 0);
INSERT INTO `ul_system_uploadfile` VALUES (297, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204d5cdf485.png', 'upload/20230326/64204d5cdf485.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679838556, 1679838556, 0);
INSERT INTO `ul_system_uploadfile` VALUES (298, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204dc02eb15.png', 'upload/20230326/64204dc02eb15.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679838656, 1679838656, 0);
INSERT INTO `ul_system_uploadfile` VALUES (299, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204df7ae7bb.png', 'upload/20230326/64204df7ae7bb.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679838711, 1679838711, 0);
INSERT INTO `ul_system_uploadfile` VALUES (300, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204e3d5af85.png', 'upload/20230326/64204e3d5af85.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679838781, 1679838781, 0);
INSERT INTO `ul_system_uploadfile` VALUES (301, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204e8acc1f2.png', 'upload/20230326/64204e8acc1f2.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679838858, 1679838858, 0);
INSERT INTO `ul_system_uploadfile` VALUES (302, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204eb11ac8e.png', 'upload/20230326/64204eb11ac8e.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679838897, 1679838897, 0);
INSERT INTO `ul_system_uploadfile` VALUES (303, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204eb90f658.png', 'upload/20230326/64204eb90f658.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679838905, 1679838905, 0);
INSERT INTO `ul_system_uploadfile` VALUES (304, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204ec981668.png', 'upload/20230326/64204ec981668.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679838921, 1679838921, 0);
INSERT INTO `ul_system_uploadfile` VALUES (305, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204ed7a1fc6.png', 'upload/20230326/64204ed7a1fc6.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679838935, 1679838935, 0);
INSERT INTO `ul_system_uploadfile` VALUES (306, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204ee31565c.png', 'upload/20230326/64204ee31565c.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679838947, 1679838947, 0);
INSERT INTO `ul_system_uploadfile` VALUES (307, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204f55f0a95.png', 'upload/20230326/64204f55f0a95.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839061, 1679839061, 0);
INSERT INTO `ul_system_uploadfile` VALUES (308, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204f764d603.png', 'upload/20230326/64204f764d603.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679839094, 1679839094, 0);
INSERT INTO `ul_system_uploadfile` VALUES (309, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204f88bba53.png', 'upload/20230326/64204f88bba53.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839112, 1679839112, 0);
INSERT INTO `ul_system_uploadfile` VALUES (310, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204fa1e51f1.png', 'upload/20230326/64204fa1e51f1.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839137, 1679839137, 0);
INSERT INTO `ul_system_uploadfile` VALUES (311, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204fca3d867.png', 'upload/20230326/64204fca3d867.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839178, 1679839178, 0);
INSERT INTO `ul_system_uploadfile` VALUES (312, 'local_public', '微信图片_20230326212832.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64204ff391619.png', 'upload/20230326/64204ff391619.png', '', '', 0, 'image/png', 4997, 'png', '45226fa3d73cfcba6720d5687a3b6b78bfc23feb', 1679839219, 1679839219, 0);
INSERT INTO `ul_system_uploadfile` VALUES (313, 'local_public', '微信图片_20230326212832.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420501c0b726.png', 'upload/20230326/6420501c0b726.png', '', '', 0, 'image/png', 4997, 'png', '45226fa3d73cfcba6720d5687a3b6b78bfc23feb', 1679839260, 1679839260, 0);
INSERT INTO `ul_system_uploadfile` VALUES (314, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420502fb605d.png', 'upload/20230326/6420502fb605d.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679839279, 1679839279, 0);
INSERT INTO `ul_system_uploadfile` VALUES (315, 'local_public', '微信图片_20230326212832.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420505ea1f11.png', 'upload/20230326/6420505ea1f11.png', '', '', 0, 'image/png', 4997, 'png', '45226fa3d73cfcba6720d5687a3b6b78bfc23feb', 1679839326, 1679839326, 0);
INSERT INTO `ul_system_uploadfile` VALUES (316, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/64205097df8ab.png', 'upload/20230326/64205097df8ab.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839383, 1679839383, 0);
INSERT INTO `ul_system_uploadfile` VALUES (317, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642050a152edf.png', 'upload/20230326/642050a152edf.png', '', '', 0, 'image/png', 16575, 'png', 'a676015dc53b4c77d4d5903947f5d553f251a87d', 1679839393, 1679839393, 0);
INSERT INTO `ul_system_uploadfile` VALUES (318, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642050c5da679.png', 'upload/20230326/642050c5da679.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839429, 1679839429, 0);
INSERT INTO `ul_system_uploadfile` VALUES (319, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420510d7f0fa.png', 'upload/20230326/6420510d7f0fa.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839501, 1679906603, 1679906603);
INSERT INTO `ul_system_uploadfile` VALUES (320, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642051a62c6b2.png', 'upload/20230326/642051a62c6b2.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839654, 1679906600, 1679906600);
INSERT INTO `ul_system_uploadfile` VALUES (321, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230326/642051c248bfe.png', 'upload/20230326/642051c248bfe.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679839682, 1679906598, 1679906598);
INSERT INTO `ul_system_uploadfile` VALUES (322, 'local_public', 'IMG_20230129_213108.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230326/64206037dec3e.jpg', 'upload/20230326/64206037dec3e.jpg', '', '', 0, 'image/jpeg', 7606807, 'jpg', '0653d2879e6c94166e5bbf69b44c1fa135a4bdee', 1679843383, 1679906595, 1679906595);
INSERT INTO `ul_system_uploadfile` VALUES (323, 'local_public', '1679843412618_wx_camera_1679709821435.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230326/64206053c4da6.jpg', 'upload/20230326/64206053c4da6.jpg', '', '', 0, 'image/jpeg', 203158, 'jpg', '4763cba340f89e62b45c515f557b676bb0a69213', 1679843411, 1679906593, 1679906593);
INSERT INTO `ul_system_uploadfile` VALUES (324, 'local_public', '1679843422259_wx_camera_1679709821435.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230326/6420605d7696f.jpg', 'upload/20230326/6420605d7696f.jpg', '', '', 0, 'image/jpeg', 203158, 'jpg', '4763cba340f89e62b45c515f557b676bb0a69213', 1679843421, 1679906590, 1679906590);
INSERT INTO `ul_system_uploadfile` VALUES (325, 'local_public', 'mmexport1679410244113.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230326/642065b8397ff.jpg', 'upload/20230326/642065b8397ff.jpg', '', '', 0, 'image/jpeg', 278376, 'jpg', '8c5d597592d58e0c7411b5187810aa4e8181c709', 1679844792, 1679906588, 1679906588);
INSERT INTO `ul_system_uploadfile` VALUES (326, 'local_public', 'wx_camera_1679709821435.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230326/642065d370aed.jpg', 'upload/20230326/642065d370aed.jpg', '', '', 0, 'image/jpeg', 952911, 'jpg', '5d5a350af263661e8b0ef22a4d25edeaf6fff278', 1679844819, 1679906586, 1679906586);
INSERT INTO `ul_system_uploadfile` VALUES (327, 'local_public', '1679847212797_641c22c6cf8e1.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230327/64206f2c68cef.jpg', 'upload/20230327/64206f2c68cef.jpg', '', '', 0, 'image/jpeg', 4157, 'jpg', 'd6f442b5c82e87a85a7f4a955102c64fb17f522d', 1679847212, 1679906584, 1679906584);
INSERT INTO `ul_system_uploadfile` VALUES (328, 'local_public', '1679847225947_Screenshot_20230326_230856_io.dcloud.HBuilder.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230327/64206f3991089.jpg', 'upload/20230327/64206f3991089.jpg', '', '', 0, 'image/jpeg', 65499, 'jpg', '886c0ccc13baf0301d4af1d16451ff550499d3fa', 1679847225, 1679906581, 1679906581);
INSERT INTO `ul_system_uploadfile` VALUES (329, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6420f6c055d16.png', 'upload/20230327/6420f6c055d16.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679881920, 1679906578, 1679906578);
INSERT INTO `ul_system_uploadfile` VALUES (330, 'local_public', '文字.ico', 'http://cqadmin.bluechs.com/storage/upload/20230327/642143428a702.ico', 'upload/20230327/642143428a702.ico', '', '', 0, 'image/x-icon', 27426, 'ico', '8bd5a01155cbf8fa6e0943faf52cc14b273fd0be', 1679901506, 1679901506, 0);
INSERT INTO `ul_system_uploadfile` VALUES (331, 'local_public', '144.ico', 'http://cqadmin.bluechs.com/storage/upload/20230327/642143719c417.ico', 'upload/20230327/642143719c417.ico', '', '', 0, 'image/x-icon', 36390, 'ico', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679901553, 1679901553, 0);
INSERT INTO `ul_system_uploadfile` VALUES (332, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421438b6832b.png', 'upload/20230327/6421438b6832b.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679901579, 1679901579, 0);
INSERT INTO `ul_system_uploadfile` VALUES (333, 'local_public', 'bannar.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214eade5d03.png', 'upload/20230327/64214eade5d03.png', '', '', 0, 'image/png', 473983, 'png', '89482092d84bb8a1ee6cd5ab549641367b535723', 1679904429, 1679904429, 0);
INSERT INTO `ul_system_uploadfile` VALUES (334, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214ecb7cf9f.png', 'upload/20230327/64214ecb7cf9f.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679904459, 1679904459, 0);
INSERT INTO `ul_system_uploadfile` VALUES (335, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214ed0a4984.png', 'upload/20230327/64214ed0a4984.png', '', '', 0, 'image/png', 12466, 'png', '56aad1abf55300772bad6b2394f50ee83b5a5926', 1679904464, 1679904464, 0);
INSERT INTO `ul_system_uploadfile` VALUES (336, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1619644.png', 'upload/20230327/64214f1619644.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904534, 1679904534, 0);
INSERT INTO `ul_system_uploadfile` VALUES (337, 'local_public', 'logo-1.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f1deb9f5.png', 'upload/20230327/64214f1deb9f5.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904541, 1679904541, 0);
INSERT INTO `ul_system_uploadfile` VALUES (338, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2621c05.png', 'upload/20230327/64214f2621c05.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904550, 1679904550, 0);
INSERT INTO `ul_system_uploadfile` VALUES (339, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f2fd22dd.png', 'upload/20230327/64214f2fd22dd.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904559, 1679904559, 0);
INSERT INTO `ul_system_uploadfile` VALUES (340, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f37b8d03.png', 'upload/20230327/64214f37b8d03.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904567, 1679904567, 0);
INSERT INTO `ul_system_uploadfile` VALUES (341, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f4157093.png', 'upload/20230327/64214f4157093.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904577, 1679904577, 0);
INSERT INTO `ul_system_uploadfile` VALUES (342, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f49478e8.png', 'upload/20230327/64214f49478e8.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904585, 1679904585, 0);
INSERT INTO `ul_system_uploadfile` VALUES (343, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5200a22.png', 'upload/20230327/64214f5200a22.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904594, 1679904594, 0);
INSERT INTO `ul_system_uploadfile` VALUES (344, 'local_public', 'favicon.ico', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5a63fa3.ico', 'upload/20230327/64214f5a63fa3.ico', '', '', 0, 'image/x-icon', 36390, 'ico', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904602, 1679904602, 0);
INSERT INTO `ul_system_uploadfile` VALUES (345, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f5da5b29.png', 'upload/20230327/64214f5da5b29.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904605, 1679904605, 0);
INSERT INTO `ul_system_uploadfile` VALUES (346, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f663feff.png', 'upload/20230327/64214f663feff.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904614, 1679904614, 0);
INSERT INTO `ul_system_uploadfile` VALUES (347, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f6df2d0e.png', 'upload/20230327/64214f6df2d0e.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904621, 1679904621, 0);
INSERT INTO `ul_system_uploadfile` VALUES (348, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f8804cb4.png', 'upload/20230327/64214f8804cb4.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904648, 1679904648, 0);
INSERT INTO `ul_system_uploadfile` VALUES (349, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f91d5a04.png', 'upload/20230327/64214f91d5a04.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904657, 1679904657, 0);
INSERT INTO `ul_system_uploadfile` VALUES (350, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f9f3c503.png', 'upload/20230327/64214f9f3c503.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904671, 1679904671, 0);
INSERT INTO `ul_system_uploadfile` VALUES (351, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214fa955d07.png', 'upload/20230327/64214fa955d07.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904681, 1679904681, 0);
INSERT INTO `ul_system_uploadfile` VALUES (352, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214fb6ca922.png', 'upload/20230327/64214fb6ca922.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904694, 1679904694, 0);
INSERT INTO `ul_system_uploadfile` VALUES (353, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214fc1876e4.png', 'upload/20230327/64214fc1876e4.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904705, 1679904705, 0);
INSERT INTO `ul_system_uploadfile` VALUES (354, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214fcba0679.png', 'upload/20230327/64214fcba0679.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904715, 1679904715, 0);
INSERT INTO `ul_system_uploadfile` VALUES (355, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214fd958db9.png', 'upload/20230327/64214fd958db9.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904729, 1679904729, 0);
INSERT INTO `ul_system_uploadfile` VALUES (356, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214fe52e7fc.png', 'upload/20230327/64214fe52e7fc.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904741, 1679904741, 0);
INSERT INTO `ul_system_uploadfile` VALUES (357, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214fef72a4b.png', 'upload/20230327/64214fef72a4b.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904751, 1679904751, 0);
INSERT INTO `ul_system_uploadfile` VALUES (358, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214ff92cf86.png', 'upload/20230327/64214ff92cf86.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904761, 1679904761, 0);
INSERT INTO `ul_system_uploadfile` VALUES (359, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/642150027584b.png', 'upload/20230327/642150027584b.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904770, 1679904770, 0);
INSERT INTO `ul_system_uploadfile` VALUES (360, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421500c0b7bf.png', 'upload/20230327/6421500c0b7bf.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904780, 1679904780, 0);
INSERT INTO `ul_system_uploadfile` VALUES (361, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/642150151e7f2.png', 'upload/20230327/642150151e7f2.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904789, 1679904789, 0);
INSERT INTO `ul_system_uploadfile` VALUES (362, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421501d66e7d.png', 'upload/20230327/6421501d66e7d.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904797, 1679904797, 0);
INSERT INTO `ul_system_uploadfile` VALUES (363, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215027213b7.png', 'upload/20230327/64215027213b7.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904807, 1679904807, 0);
INSERT INTO `ul_system_uploadfile` VALUES (364, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/642150301e525.png', 'upload/20230327/642150301e525.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904816, 1679904816, 0);
INSERT INTO `ul_system_uploadfile` VALUES (365, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215038b7617.png', 'upload/20230327/64215038b7617.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904824, 1679904824, 0);
INSERT INTO `ul_system_uploadfile` VALUES (366, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421504132074.png', 'upload/20230327/6421504132074.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904833, 1679904833, 0);
INSERT INTO `ul_system_uploadfile` VALUES (367, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421504adc69e.png', 'upload/20230327/6421504adc69e.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904842, 1679904842, 0);
INSERT INTO `ul_system_uploadfile` VALUES (368, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/642150545004d.png', 'upload/20230327/642150545004d.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904852, 1679904852, 0);
INSERT INTO `ul_system_uploadfile` VALUES (369, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421505dc2d6c.png', 'upload/20230327/6421505dc2d6c.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904861, 1679904861, 0);
INSERT INTO `ul_system_uploadfile` VALUES (370, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215066b6c16.png', 'upload/20230327/64215066b6c16.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904870, 1679904870, 0);
INSERT INTO `ul_system_uploadfile` VALUES (371, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215070663ea.png', 'upload/20230327/64215070663ea.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904880, 1679904880, 0);
INSERT INTO `ul_system_uploadfile` VALUES (372, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421507a3246e.png', 'upload/20230327/6421507a3246e.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904890, 1679904890, 0);
INSERT INTO `ul_system_uploadfile` VALUES (373, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/642150833d9cb.png', 'upload/20230327/642150833d9cb.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904899, 1679904899, 0);
INSERT INTO `ul_system_uploadfile` VALUES (374, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421508bd760e.png', 'upload/20230327/6421508bd760e.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904907, 1679904907, 0);
INSERT INTO `ul_system_uploadfile` VALUES (375, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/642150949a7d6.png', 'upload/20230327/642150949a7d6.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679904916, 1679904916, 0);
INSERT INTO `ul_system_uploadfile` VALUES (376, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64215911963d6.png', 'upload/20230327/64215911963d6.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1679907089, 1679907089, 0);
INSERT INTO `ul_system_uploadfile` VALUES (377, 'local_public', '144.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/64217db2443f2.png', 'upload/20230327/64217db2443f2.png', '', '', 0, 'image/png', 36390, 'png', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1679916466, 1679916466, 0);
INSERT INTO `ul_system_uploadfile` VALUES (378, 'local_public', 'four.png', 'http://cqadmin.bluechs.com/storage/upload/20230327/642180ae01f61.png', 'upload/20230327/642180ae01f61.png', '', '', 0, 'image/png', 118379, 'png', '764463348840809a2ab76e3fe8a65ce25f327cb8', 1679917230, 1679917230, 0);
INSERT INTO `ul_system_uploadfile` VALUES (379, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230327/64219b3d8dd57.mp4', 'upload/20230327/64219b3d8dd57.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1679924029, 1679924029, 0);
INSERT INTO `ul_system_uploadfile` VALUES (380, 'local_public', 'blob', 'http://cqadmin.bluechs.com/storage/upload/20230327/6421af95c6412', 'upload/20230327/6421af95c6412', '', '', 0, 'application/octet-stream', 6528, '', '80db69d83751fba1765c2f9519052591c3af4142', 1679929237, 1679929237, 0);
INSERT INTO `ul_system_uploadfile` VALUES (381, 'local_public', 'blob', 'http://cqadmin.bluechs.com/storage/upload/20230328/642264d4d6447', 'upload/20230328/642264d4d6447', '', '', 0, 'application/octet-stream', 750, '', 'b15b6fe1f3559b86c7a9f369567ce392c2f1b3b6', 1679975636, 1679975636, 0);
INSERT INTO `ul_system_uploadfile` VALUES (382, 'local_public', 'blob', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422654cc737b', 'upload/20230328/6422654cc737b', '', '', 0, 'application/octet-stream', 6528, '', '80db69d83751fba1765c2f9519052591c3af4142', 1679975756, 1679975756, 0);
INSERT INTO `ul_system_uploadfile` VALUES (383, 'local_public', 'blob', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422658939ea8', 'upload/20230328/6422658939ea8', '', '', 0, 'application/octet-stream', 1425, '', 'af073b06d832e11459bd0a9612a539f5dc47a003', 1679975817, 1679975817, 0);
INSERT INTO `ul_system_uploadfile` VALUES (384, 'local_public', '签到.svg', 'http://cqadmin.bluechs.com/storage/upload/20230328/64226911f21d2.svg', 'upload/20230328/64226911f21d2.svg', '', '', 0, 'image/svg+xml', 1425, 'svg', 'af073b06d832e11459bd0a9612a539f5dc47a003', 1679976721, 1679976721, 0);
INSERT INTO `ul_system_uploadfile` VALUES (385, 'local_public', '签到.svg', 'http://cqadmin.bluechs.com/storage/upload/20230328/64226a6182fe7.svg', 'upload/20230328/64226a6182fe7.svg', '', '', 0, 'image/svg+xml', 1425, 'svg', 'af073b06d832e11459bd0a9612a539f5dc47a003', 1679977057, 1679977057, 0);
INSERT INTO `ul_system_uploadfile` VALUES (386, 'local_public', '签到.svg', 'http://cqadmin.bluechs.com/storage/upload/20230328/64226a9bc0559.svg', 'upload/20230328/64226a9bc0559.svg', '', '', 0, 'image/svg+xml', 1425, 'svg', 'af073b06d832e11459bd0a9612a539f5dc47a003', 1679977115, 1679977115, 0);
INSERT INTO `ul_system_uploadfile` VALUES (387, 'local_public', 'a9d3fd1f4134970af7f8c29092cad1c8a6865d82.webp', 'http://cqadmin.bluechs.com/storage/upload/20230328/64226b941b426.webp', 'upload/20230328/64226b941b426.webp', '', '', 0, 'image/webp', 6528, 'webp', '80db69d83751fba1765c2f9519052591c3af4142', 1679977364, 1679977364, 0);
INSERT INTO `ul_system_uploadfile` VALUES (388, 'local_public', '640c80af4a5444b0afb5f218ee89233f.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/64226bbb74253.png', 'upload/20230328/64226bbb74253.png', '', '', 0, 'image/png', 69812, 'png', '72384a7b64a927275394ef0ff4e4d9de53180458', 1679977403, 1679977403, 0);
INSERT INTO `ul_system_uploadfile` VALUES (389, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7dee9ae6.png', 'upload/20230328/6422d7dee9ae6.png', '', '', 0, 'image/png', 18980, 'png', '5fd2bcc77d542f4da2e5c7e8fd05b4140bc4f4d6', 1680005086, 1680005086, 0);
INSERT INTO `ul_system_uploadfile` VALUES (390, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7e493702.png', 'upload/20230328/6422d7e493702.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005092, 1680005092, 0);
INSERT INTO `ul_system_uploadfile` VALUES (391, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7e93ea0b.png', 'upload/20230328/6422d7e93ea0b.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005097, 1680005097, 0);
INSERT INTO `ul_system_uploadfile` VALUES (392, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7ef0987e.png', 'upload/20230328/6422d7ef0987e.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005103, 1680005103, 0);
INSERT INTO `ul_system_uploadfile` VALUES (393, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7f3debc6.png', 'upload/20230328/6422d7f3debc6.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005107, 1680005107, 0);
INSERT INTO `ul_system_uploadfile` VALUES (394, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7f8a0d53.png', 'upload/20230328/6422d7f8a0d53.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005112, 1680005112, 0);
INSERT INTO `ul_system_uploadfile` VALUES (395, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d7fd64383.png', 'upload/20230328/6422d7fd64383.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005117, 1680005117, 0);
INSERT INTO `ul_system_uploadfile` VALUES (396, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d80275b01.png', 'upload/20230328/6422d80275b01.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005122, 1680005122, 0);
INSERT INTO `ul_system_uploadfile` VALUES (397, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d806cacc0.png', 'upload/20230328/6422d806cacc0.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005126, 1680005126, 0);
INSERT INTO `ul_system_uploadfile` VALUES (398, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d80b457df.png', 'upload/20230328/6422d80b457df.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005131, 1680005131, 0);
INSERT INTO `ul_system_uploadfile` VALUES (399, 'local_public', '微信截图_20230318092531.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d81719794.png', 'upload/20230328/6422d81719794.png', '', '', 0, 'image/png', 18980, 'png', '5fd2bcc77d542f4da2e5c7e8fd05b4140bc4f4d6', 1680005143, 1680005143, 0);
INSERT INTO `ul_system_uploadfile` VALUES (400, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d81b91f23.png', 'upload/20230328/6422d81b91f23.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005147, 1680005147, 0);
INSERT INTO `ul_system_uploadfile` VALUES (401, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d82030035.png', 'upload/20230328/6422d82030035.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005152, 1680005152, 0);
INSERT INTO `ul_system_uploadfile` VALUES (402, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d825346a5.png', 'upload/20230328/6422d825346a5.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005157, 1680005157, 0);
INSERT INTO `ul_system_uploadfile` VALUES (403, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d82a18ab4.png', 'upload/20230328/6422d82a18ab4.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005162, 1680005162, 0);
INSERT INTO `ul_system_uploadfile` VALUES (404, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d82f7ab0f.png', 'upload/20230328/6422d82f7ab0f.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005167, 1680005167, 0);
INSERT INTO `ul_system_uploadfile` VALUES (405, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d834035e7.png', 'upload/20230328/6422d834035e7.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005172, 1680005172, 0);
INSERT INTO `ul_system_uploadfile` VALUES (406, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d83887dad.png', 'upload/20230328/6422d83887dad.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005176, 1680005176, 0);
INSERT INTO `ul_system_uploadfile` VALUES (407, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422d83cf3f72.png', 'upload/20230328/6422d83cf3f72.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1680005181, 1680005181, 0);
INSERT INTO `ul_system_uploadfile` VALUES (408, 'local_public', '签到.svg', 'http://cqadmin.bluechs.com/storage/upload/20230328/6422f93425db8.svg', 'upload/20230328/6422f93425db8.svg', '', '', 0, 'image/svg+xml', 1425, 'svg', 'af073b06d832e11459bd0a9612a539f5dc47a003', 1680013620, 1680013620, 0);
INSERT INTO `ul_system_uploadfile` VALUES (409, 'local_public', 'FpMj8Hcu_o18e1JOYuLjFxs-IG-X.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423ee8267731.jpg', 'upload/20230329/6423ee8267731.jpg', '', '', 0, 'image/jpeg', 158463, 'jpg', '9323f0772efe8d7c7b524e62e2e3171b3e206f97', 1680076418, 1680076418, 0);
INSERT INTO `ul_system_uploadfile` VALUES (410, 'local_public', 'FjjqdbvxbWmPM6ltvuEI6SoKBlOV.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423eefd8b32d.jpg', 'upload/20230329/6423eefd8b32d.jpg', '', '', 0, 'image/jpeg', 123858, 'jpg', '38ea75bbf16d698f33a96dbee108e92a0a065395', 1680076541, 1680076541, 0);
INSERT INTO `ul_system_uploadfile` VALUES (411, 'local_public', 'Fr1Hz4HGkIgE1HpGO9cLcVJjzoAK.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423efdc3ca57.jpg', 'upload/20230329/6423efdc3ca57.jpg', '', '', 0, 'image/jpeg', 167066, 'jpg', 'bd47cf81c6908804d47a463bd70b715263ce800a', 1680076764, 1680076764, 0);
INSERT INTO `ul_system_uploadfile` VALUES (412, 'local_public', 'Fr1Hz4HGkIgE1HpGO9cLcVJjzoAK.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423f015d3c8d.jpg', 'upload/20230329/6423f015d3c8d.jpg', '', '', 0, 'image/jpeg', 167066, 'jpg', 'bd47cf81c6908804d47a463bd70b715263ce800a', 1680076821, 1680076821, 0);
INSERT INTO `ul_system_uploadfile` VALUES (413, 'local_public', 'Fibr5u1nC8aHy7W96eY0ED-tJc-7.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230329/6423f048066b0.jpg', 'upload/20230329/6423f048066b0.jpg', '', '', 0, 'image/jpeg', 125310, 'jpg', '26ebe6ed670bc687cbb5bde9e634103fad25cfbb', 1680076872, 1680076872, 0);
INSERT INTO `ul_system_uploadfile` VALUES (414, 'local_public', 'logo1.png', 'http://120.77.82.230/storage/upload/20230329/64240e6d4735e.png', 'upload/20230329/64240e6d4735e.png', '', '', 0, 'image/png', 82075, 'png', '5a5b8559e15fea98b5b710e205a8c1ffd64e0e30', 1680084589, 1680084589, 0);
INSERT INTO `ul_system_uploadfile` VALUES (415, 'local_public', 'logo1.png', 'http://120.77.82.230/storage/upload/20230329/64240e7173f59.png', 'upload/20230329/64240e7173f59.png', '', '', 0, 'image/png', 82075, 'png', '5a5b8559e15fea98b5b710e205a8c1ffd64e0e30', 1680084593, 1680084593, 0);
INSERT INTO `ul_system_uploadfile` VALUES (416, 'local_public', 'logo1.png', 'http://120.77.82.230/storage/upload/20230329/64240e75975db.png', 'upload/20230329/64240e75975db.png', '', '', 0, 'image/png', 82075, 'png', '5a5b8559e15fea98b5b710e205a8c1ffd64e0e30', 1680084597, 1680084597, 0);
INSERT INTO `ul_system_uploadfile` VALUES (417, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230330/64250d39627da.png', 'upload/20230330/64250d39627da.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1680149817, 1680149817, 0);
INSERT INTO `ul_system_uploadfile` VALUES (418, 'local_public', 'petal_20230316_235358.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642556a4822ae.mp4', 'upload/20230330/642556a4822ae.mp4', '', '', 0, 'video/mp4', 19162486, 'mp4', '7014552e9186e7e862ddb54d57ba05c01eb9144d', 1680168612, 1680168612, 0);
INSERT INTO `ul_system_uploadfile` VALUES (419, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642556c87afc6.mp4', 'upload/20230330/642556c87afc6.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680168648, 1680168648, 0);
INSERT INTO `ul_system_uploadfile` VALUES (420, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/64255721d9d3e.mp4', 'upload/20230330/64255721d9d3e.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680168737, 1680168737, 0);
INSERT INTO `ul_system_uploadfile` VALUES (421, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642557281aeb6.mp4', 'upload/20230330/642557281aeb6.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680168744, 1680168744, 0);
INSERT INTO `ul_system_uploadfile` VALUES (422, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/64255730791ec.mp4', 'upload/20230330/64255730791ec.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680168752, 1680168752, 0);
INSERT INTO `ul_system_uploadfile` VALUES (423, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/64255751bac4b.mp4', 'upload/20230330/64255751bac4b.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680168785, 1680168785, 0);
INSERT INTO `ul_system_uploadfile` VALUES (424, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/64255764201bd.mp4', 'upload/20230330/64255764201bd.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680168804, 1680168804, 0);
INSERT INTO `ul_system_uploadfile` VALUES (425, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642557918dd2a.mp4', 'upload/20230330/642557918dd2a.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680168849, 1680168849, 0);
INSERT INTO `ul_system_uploadfile` VALUES (426, 'local_public', 'petal_20230316_235358.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/6425582c9a54c.mp4', 'upload/20230330/6425582c9a54c.mp4', '', '', 0, 'video/mp4', 19162486, 'mp4', '7014552e9186e7e862ddb54d57ba05c01eb9144d', 1680169004, 1680169004, 0);
INSERT INTO `ul_system_uploadfile` VALUES (427, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/64255895ba908.mp4', 'upload/20230330/64255895ba908.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680169109, 1680169109, 0);
INSERT INTO `ul_system_uploadfile` VALUES (428, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642558afcb80b.mp4', 'upload/20230330/642558afcb80b.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680169135, 1680169135, 0);
INSERT INTO `ul_system_uploadfile` VALUES (429, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642558c20322d.mp4', 'upload/20230330/642558c20322d.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680169154, 1680169154, 0);
INSERT INTO `ul_system_uploadfile` VALUES (430, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642558d5d6382.mp4', 'upload/20230330/642558d5d6382.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680169173, 1680169173, 0);
INSERT INTO `ul_system_uploadfile` VALUES (431, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/642558f6f01c6.mp4', 'upload/20230330/642558f6f01c6.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680169207, 1680169207, 0);
INSERT INTO `ul_system_uploadfile` VALUES (432, 'local_public', 'mda-nb53nchp3rum2e9r.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/64255a27698bc.mp4', 'upload/20230330/64255a27698bc.mp4', '', '', 0, 'video/mp4', 8544949, 'mp4', '321f370f468ceacc778cd93ca66d7bb7446c3cf1', 1680169511, 1680169511, 0);
INSERT INTO `ul_system_uploadfile` VALUES (433, 'local_public', 'petal_20230316_235358.mp4', 'http://cqadmin.bluechs.com/storage/upload/20230330/64255b199e604.mp4', 'upload/20230330/64255b199e604.mp4', '', '', 0, 'video/mp4', 19162486, 'mp4', '7014552e9186e7e862ddb54d57ba05c01eb9144d', 1680169753, 1680169753, 0);
INSERT INTO `ul_system_uploadfile` VALUES (434, 'local_public', 'wx_camera_1679719570492.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230401/6428283154138.jpg', 'upload/20230401/6428283154138.jpg', '', '', 0, 'image/jpeg', 1540752, 'jpg', '10452b5dfbe7fc5d1d788a7fbccfafd581a6e2e8', 1680353329, 1680353329, 0);
INSERT INTO `ul_system_uploadfile` VALUES (435, 'local_public', 'AE860B98-A33E-4FE8-9B9B-EA5BF8D14DD4.jpeg', 'http://cqadmin.bluechs.com/storage/upload/20230402/6429111de753b.jpeg', 'upload/20230402/6429111de753b.jpeg', '', '', 0, 'image/jpeg', 90228, 'jpeg', 'cbc2641b85367c0515038b5397edd3074011a98e', 1680412957, 1680412957, 0);
INSERT INTO `ul_system_uploadfile` VALUES (436, 'local_public', 're 副本.png', 'http://cqadmin.bluechs.com/storage/upload/20230402/642947337d701.png', 'upload/20230402/642947337d701.png', '', '', 0, 'image/png', 114104, 'png', 'cb67ca2772af1e8a7f5e2ce1d57b299b858b2006', 1680426803, 1680426803, 0);
INSERT INTO `ul_system_uploadfile` VALUES (437, 'local_public', 'qq30.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aadf5634b2.png', 'upload/20230403/642aadf5634b2.png', '', '', 0, 'image/png', 17303, 'png', '0afa0fa312ad0cbb65260480a519e705ddb3b92c', 1680518645, 1680518645, 0);
INSERT INTO `ul_system_uploadfile` VALUES (438, 'local_public', 'qq90.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaead8280b.png', 'upload/20230403/642aaead8280b.png', '', '', 0, 'image/png', 17373, 'png', '044fa81bd186612096c3775d542cbb2a722061be', 1680518829, 1680518829, 0);
INSERT INTO `ul_system_uploadfile` VALUES (439, 'local_public', '365qq.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaebd6dc1d.png', 'upload/20230403/642aaebd6dc1d.png', '', '', 0, 'image/png', 17511, 'png', '81251e5c13b0cd69ad52622063ced3339403e202', 1680518845, 1680518845, 0);
INSERT INTO `ul_system_uploadfile` VALUES (440, 'local_public', 'iqiyi30.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaed140442.png', 'upload/20230403/642aaed140442.png', '', '', 0, 'image/png', 19522, 'png', '5115c139487de21047c445a966775e495e5e53fd', 1680518865, 1680518865, 0);
INSERT INTO `ul_system_uploadfile` VALUES (441, 'local_public', 'iqiyi365.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaee0a4569.png', 'upload/20230403/642aaee0a4569.png', '', '', 0, 'image/png', 19729, 'png', 'b49761db1e185814b667cadd0db409e3bac5c4cd', 1680518880, 1680518880, 0);
INSERT INTO `ul_system_uploadfile` VALUES (442, 'local_public', 'youku90.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaef5f0b0e.png', 'upload/20230403/642aaef5f0b0e.png', '', '', 0, 'image/png', 17522, 'png', 'c088353a2f7356e0168ad7d2596ae6f52e8ae04a', 1680518901, 1680518901, 0);
INSERT INTO `ul_system_uploadfile` VALUES (443, 'local_public', 'youku365.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf03a88fc.png', 'upload/20230403/642aaf03a88fc.png', '', '', 0, 'image/png', 17679, 'png', 'aef85d58bdda2c036fc9e0e18379d62b03866ebb', 1680518915, 1680518915, 0);
INSERT INTO `ul_system_uploadfile` VALUES (444, 'local_public', 'Fh7Uf_K9ptk8cUJ6ZlAOT8IdF5FZ.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf3d98b31.png', 'upload/20230403/642aaf3d98b31.png', '', '', 0, 'image/png', 43215, 'png', '1ed47ff2bda6d93c71427a66500e4fc21d179159', 1680518973, 1680518973, 0);
INSERT INTO `ul_system_uploadfile` VALUES (445, 'local_public', 'FooheZBfVVD5kvt9RDi9HmZ9Uy0K.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf57a7856.png', 'upload/20230403/642aaf57a7856.png', '', '', 0, 'image/png', 38830, 'png', '8a2179905f5550f992fb7d4438bd1e667d532d0a', 1680518999, 1680518999, 0);
INSERT INTO `ul_system_uploadfile` VALUES (446, 'local_public', 'Fq_sTfQzszRLI5yaqmmDCowY_peS.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf6c4cefa.png', 'upload/20230403/642aaf6c4cefa.png', '', '', 0, 'image/png', 132760, 'png', 'afec4df433b3344b239c9aaa69830a8c18fe9792', 1680519020, 1680519020, 0);
INSERT INTO `ul_system_uploadfile` VALUES (447, 'local_public', 'FlGIXrvC2h6hA9WyvKxQJRRnvje2.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf81a1cf6.png', 'upload/20230403/642aaf81a1cf6.png', '', '', 0, 'image/png', 79877, 'png', '51885ebbc2da1ea103d5b2bcac50251467be37b6', 1680519041, 1680519041, 0);
INSERT INTO `ul_system_uploadfile` VALUES (448, 'local_public', 'FmiJkvaN5eYwawElEufo7UJnZeHS.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaf98d2128.jpg', 'upload/20230403/642aaf98d2128.jpg', '', '', 0, 'image/jpeg', 7890, 'jpg', '688992f68de5e6306b012512e7e8ed426765e1d2', 1680519064, 1680519064, 0);
INSERT INTO `ul_system_uploadfile` VALUES (449, 'local_public', 'Ftb9wNVY0DhT0aAXMszPrQ7cfi1B.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafbe27221.png', 'upload/20230403/642aafbe27221.png', '', '', 0, 'image/png', 99346, 'png', 'd6fdc0d558d03853d1a01732cccfad0edc7e2d41', 1680519102, 1680519102, 0);
INSERT INTO `ul_system_uploadfile` VALUES (450, 'local_public', 'FpRGhdJ1GDQIlGz670xS6fiyKDMA.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafd05c975.jpg', 'upload/20230403/642aafd05c975.jpg', '', '', 0, 'image/jpeg', 9005, 'jpg', '944685d275183408946cfaef4c52e9f8b2283300', 1680519120, 1680519120, 0);
INSERT INTO `ul_system_uploadfile` VALUES (451, 'local_public', 'FiXBmwbTlK5rALdCm0WPTefOF44p.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aafe57d8f1.png', 'upload/20230403/642aafe57d8f1.png', '', '', 0, 'image/png', 90585, 'png', '25c19b06d394ae6b00b7429b458f4de7ce178e29', 1680519141, 1680519141, 0);
INSERT INTO `ul_system_uploadfile` VALUES (452, 'local_public', 'FtWT8Ae3o4qCXUnUffRK3NqmQZ1N.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642aaff5abc6b.png', 'upload/20230403/642aaff5abc6b.png', '', '', 0, 'image/png', 36935, 'png', 'd593f007b7a38a825d49d47df44adcdaa6419d4d', 1680519157, 1680519157, 0);
INSERT INTO `ul_system_uploadfile` VALUES (453, 'local_public', 'FkPmTjsueEZUD-0XhI99OR2CaqgT.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ab002e4c6c.png', 'upload/20230403/642ab002e4c6c.png', '', '', 0, 'image/png', 49316, 'png', '43e64e3b2e7846540fed17848f7d391d826aa813', 1680519170, 1680519170, 0);
INSERT INTO `ul_system_uploadfile` VALUES (454, 'local_public', 'Fl9xsM5LrCFTbUG3otSKt5unTnZW.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ab01524eaa.jpg', 'upload/20230403/642ab01524eaa.jpg', '', '', 0, 'image/jpeg', 4121, 'jpg', '5f71b0ce4bac21536d41b7a2d48ab79ba74e7656', 1680519189, 1680519189, 0);
INSERT INTO `ul_system_uploadfile` VALUES (455, 'local_public', 'rank_0.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ab5f263039.png', 'upload/20230403/642ab5f263039.png', '', '', 0, 'image/png', 1104, 'png', 'd2a9e9d79fbee472cbeaa4d6be5bbd485dc968d6', 1680520690, 1680520690, 0);
INSERT INTO `ul_system_uploadfile` VALUES (456, 'local_public', 'rank_1.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ab66145745.png', 'upload/20230403/642ab66145745.png', '', '', 0, 'image/png', 768, 'png', 'ef8abcab3267d4990eb3d22d06d910de2658b0af', 1680520801, 1680520801, 0);
INSERT INTO `ul_system_uploadfile` VALUES (457, 'local_public', 'four.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ac49d7a6b3.png', 'upload/20230403/642ac49d7a6b3.png', '', '', 0, 'image/png', 118379, 'png', '764463348840809a2ab76e3fe8a65ce25f327cb8', 1680524445, 1680524445, 0);
INSERT INTO `ul_system_uploadfile` VALUES (458, 'local_public', 'lily-5886728__340.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ac51bc6c82.jpg', 'upload/20230403/642ac51bc6c82.jpg', '', '', 0, 'image/jpeg', 25976, 'jpg', '54178a3f7353e2e2e0d16369117e970b939b2fb3', 1680524571, 1680524571, 0);
INSERT INTO `ul_system_uploadfile` VALUES (459, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ac5248f4d8.png', 'upload/20230403/642ac5248f4d8.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1680524580, 1680524580, 0);
INSERT INTO `ul_system_uploadfile` VALUES (460, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ac531caac6.png', 'upload/20230403/642ac531caac6.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1680524593, 1680524593, 0);
INSERT INTO `ul_system_uploadfile` VALUES (461, 'local_public', 'logo_sc.png', 'http://cqadmin.bluechs.com/storage/upload/20230403/642ad7a637619.png', 'upload/20230403/642ad7a637619.png', '', '', 0, 'image/png', 283842, 'png', '5fd8d9aa78e72f163ec3e43751f8f16579f433ed', 1680529318, 1680529318, 0);
INSERT INTO `ul_system_uploadfile` VALUES (462, 'local_public', '184457c32af9cb3c689358624dab4a5.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230404/642b8e70d6fb8.jpg', 'upload/20230404/642b8e70d6fb8.jpg', '', '', 0, 'image/jpeg', 377140, 'jpg', '6cea3cda8b23ffb50c206e3564d60ace26903f24', 1680576112, 1680576112, 0);
INSERT INTO `ul_system_uploadfile` VALUES (463, 'local_public', '10.png', 'http://cqadmin.bluechs.com/storage/upload/20230405/642cd7090e05f.png', 'upload/20230405/642cd7090e05f.png', '', '', 0, 'image/png', 1927, 'png', '953010686c9c054aeb781f095cdfd5af16c20e55', 1680660233, 1680660233, 0);
INSERT INTO `ul_system_uploadfile` VALUES (464, 'local_public', 'lily-5886728__340.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230405/642d47a928c4f.jpg', 'upload/20230405/642d47a928c4f.jpg', '', '', 0, 'image/jpeg', 25976, 'jpg', '54178a3f7353e2e2e0d16369117e970b939b2fb3', 1680689065, 1680689065, 0);
INSERT INTO `ul_system_uploadfile` VALUES (465, 'local_public', '10.png', 'http://cqadmin.bluechs.com/storage/upload/20230406/642e8756a72d2.png', 'upload/20230406/642e8756a72d2.png', '', '', 0, 'image/png', 1927, 'png', '953010686c9c054aeb781f095cdfd5af16c20e55', 1680770902, 1680770902, 0);
INSERT INTO `ul_system_uploadfile` VALUES (466, 'local_public', 'rank_0.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f29f389ad1.png', 'upload/20230407/642f29f389ad1.png', '', '', 0, 'image/png', 1104, 'png', 'd2a9e9d79fbee472cbeaa4d6be5bbd485dc968d6', 1680812531, 1680812531, 0);
INSERT INTO `ul_system_uploadfile` VALUES (467, 'local_public', 'rank_0.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f29fc40de5.png', 'upload/20230407/642f29fc40de5.png', '', '', 0, 'image/png', 1104, 'png', 'd2a9e9d79fbee472cbeaa4d6be5bbd485dc968d6', 1680812540, 1680812540, 0);
INSERT INTO `ul_system_uploadfile` VALUES (468, 'local_public', 'rank_1.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2a3d4c7df.png', 'upload/20230407/642f2a3d4c7df.png', '', '', 0, 'image/png', 768, 'png', 'ef8abcab3267d4990eb3d22d06d910de2658b0af', 1680812605, 1680812605, 0);
INSERT INTO `ul_system_uploadfile` VALUES (469, 'local_public', 'rank_2.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2a5252174.png', 'upload/20230407/642f2a5252174.png', '', '', 0, 'image/png', 696, 'png', 'bf7fe2184ae181328d5c8c14bd76dc3462d901fa', 1680812626, 1680812626, 0);
INSERT INTO `ul_system_uploadfile` VALUES (470, 'local_public', 'rank_3.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2a60079e4.png', 'upload/20230407/642f2a60079e4.png', '', '', 0, 'image/png', 719, 'png', '0f4f1920491bed74781544ae2ef89ad86fcea385', 1680812640, 1680812640, 0);
INSERT INTO `ul_system_uploadfile` VALUES (471, 'local_public', 'rank_4.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2ab1a5e33.png', 'upload/20230407/642f2ab1a5e33.png', '', '', 0, 'image/png', 664, 'png', 'c71c7c3a50399ceb3a83f1595eec949c3a3a40fc', 1680812721, 1680812721, 0);
INSERT INTO `ul_system_uploadfile` VALUES (472, 'local_public', 'rank_5.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2acb870b4.png', 'upload/20230407/642f2acb870b4.png', '', '', 0, 'image/png', 707, 'png', 'c1d85b20a85e9b1d6dafbdd7685fb48c49f49c4d', 1680812747, 1680812747, 0);
INSERT INTO `ul_system_uploadfile` VALUES (473, 'local_public', 'rank_6.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2ae0a43dc.png', 'upload/20230407/642f2ae0a43dc.png', '', '', 0, 'image/png', 714, 'png', 'cfebb0b185d4715f860b146bbd04df321726f794', 1680812768, 1680812768, 0);
INSERT INTO `ul_system_uploadfile` VALUES (474, 'local_public', 'rank_7.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2aee50798.png', 'upload/20230407/642f2aee50798.png', '', '', 0, 'image/png', 651, 'png', '57cf422b901543aecae85a8708a492cd8bf63a7e', 1680812782, 1680812782, 0);
INSERT INTO `ul_system_uploadfile` VALUES (475, 'local_public', 'rank_8.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2afc3f304.png', 'upload/20230407/642f2afc3f304.png', '', '', 0, 'image/png', 742, 'png', '4d1fcf801e78bab985b7e862f81b71e52e878a31', 1680812796, 1680812796, 0);
INSERT INTO `ul_system_uploadfile` VALUES (476, 'local_public', 'rank_9.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b0e8b60c.png', 'upload/20230407/642f2b0e8b60c.png', '', '', 0, 'image/png', 712, 'png', 'ae37763bc1b0e8dd26ac528f6165bde35289f11f', 1680812814, 1680812814, 0);
INSERT INTO `ul_system_uploadfile` VALUES (477, 'local_public', 'rank_10.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b1f040a0.png', 'upload/20230407/642f2b1f040a0.png', '', '', 0, 'image/png', 736, 'png', 'b016e20129a46aed39260e289448194fa1d2ccb4', 1680812831, 1680812831, 0);
INSERT INTO `ul_system_uploadfile` VALUES (478, 'local_public', 'rank_11.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b30d6761.png', 'upload/20230407/642f2b30d6761.png', '', '', 0, 'image/png', 604, 'png', '6d74d01d55e9402a49aea9c368f0066a172765c3', 1680812848, 1680812848, 0);
INSERT INTO `ul_system_uploadfile` VALUES (479, 'local_public', 'rank_12.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b4d60760.png', 'upload/20230407/642f2b4d60760.png', '', '', 0, 'image/png', 714, 'png', 'eed0d3fb30e0dc4ba0d8ab95bd05ad9eeee5aa1a', 1680812877, 1680812877, 0);
INSERT INTO `ul_system_uploadfile` VALUES (480, 'local_public', 'rank_13.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b5a848d9.png', 'upload/20230407/642f2b5a848d9.png', '', '', 0, 'image/png', 737, 'png', '966562abfd4fdfb032aa49d9e249a81c748174b9', 1680812890, 1680812890, 0);
INSERT INTO `ul_system_uploadfile` VALUES (481, 'local_public', 'rank_14.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b728dbd0.png', 'upload/20230407/642f2b728dbd0.png', '', '', 0, 'image/png', 688, 'png', 'dfd04ff8bf0baa84c91a2af5638b6e81c93ab5df', 1680812914, 1680812914, 0);
INSERT INTO `ul_system_uploadfile` VALUES (482, 'local_public', 'rank_15.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b7e5dfc6.png', 'upload/20230407/642f2b7e5dfc6.png', '', '', 0, 'image/png', 718, 'png', '375e644820d0fde3dcbf6bbdf71e3f2783a5a04f', 1680812926, 1680812926, 0);
INSERT INTO `ul_system_uploadfile` VALUES (483, 'local_public', 'rank_16.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b8a9b094.png', 'upload/20230407/642f2b8a9b094.png', '', '', 0, 'image/png', 732, 'png', '6a13b240e83b4c464feba82d4da6b89d5f17f32c', 1680812938, 1680812938, 0);
INSERT INTO `ul_system_uploadfile` VALUES (484, 'local_public', 'rank_17.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b990f5d6.png', 'upload/20230407/642f2b990f5d6.png', '', '', 0, 'image/png', 737, 'png', '0c5977f79eccb66a0a4017c5f9b7fb6f4151293c', 1680812953, 1680812953, 0);
INSERT INTO `ul_system_uploadfile` VALUES (485, 'local_public', 'rank_18.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bb604a1d.png', 'upload/20230407/642f2bb604a1d.png', '', '', 0, 'image/png', 804, 'png', 'fad67047a6c5d297c7e7840dc37025564eafd710', 1680812982, 1680812982, 0);
INSERT INTO `ul_system_uploadfile` VALUES (486, 'local_public', 'rank_19.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bc24c885.png', 'upload/20230407/642f2bc24c885.png', '', '', 0, 'image/png', 781, 'png', '6fd840e36945191d6fb47b51ed9d4d5eae4f7d05', 1680812994, 1680812994, 0);
INSERT INTO `ul_system_uploadfile` VALUES (487, 'local_public', 'rank_20.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bcef3296.png', 'upload/20230407/642f2bcef3296.png', '', '', 0, 'image/png', 826, 'png', '7929952448fafea9fdb98f2b053054a6f0665583', 1680813006, 1680813006, 0);
INSERT INTO `ul_system_uploadfile` VALUES (488, 'local_public', 'rank_21.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bd9ea3f9.png', 'upload/20230407/642f2bd9ea3f9.png', '', '', 0, 'image/png', 753, 'png', 'b5e4a29563f95b8f6701b424aecb1187a9f99a67', 1680813017, 1680813017, 0);
INSERT INTO `ul_system_uploadfile` VALUES (489, 'local_public', 'rank_22.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bea79aeb.png', 'upload/20230407/642f2bea79aeb.png', '', '', 0, 'image/png', 765, 'png', '2c4ed5e3358bf8b2e97cab2c2d03076f47eea74f', 1680813034, 1680813034, 0);
INSERT INTO `ul_system_uploadfile` VALUES (490, 'local_public', 'rank_23.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bfa195e4.png', 'upload/20230407/642f2bfa195e4.png', '', '', 0, 'image/png', 826, 'png', '99cc06c6022ca536115f1d4254753e1ee0fd04fd', 1680813050, 1680813050, 0);
INSERT INTO `ul_system_uploadfile` VALUES (491, 'local_public', 'rank_24.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c0687313.png', 'upload/20230407/642f2c0687313.png', '', '', 0, 'image/png', 791, 'png', 'ed8b5373bbd648db72f9537007f568657c5f5927', 1680813062, 1680813062, 0);
INSERT INTO `ul_system_uploadfile` VALUES (492, 'local_public', 'rank_25.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c12edcc0.png', 'upload/20230407/642f2c12edcc0.png', '', '', 0, 'image/png', 818, 'png', '971c604fd86fb17db33f55d574d6d2bee374ca6c', 1680813074, 1680813074, 0);
INSERT INTO `ul_system_uploadfile` VALUES (493, 'local_public', 'rank_26.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c1f3c9fc.png', 'upload/20230407/642f2c1f3c9fc.png', '', '', 0, 'image/png', 821, 'png', '039afabcd3aa98e37ecfe0bed509983d34d5632f', 1680813087, 1680813087, 0);
INSERT INTO `ul_system_uploadfile` VALUES (494, 'local_public', 'rank_27.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c332177b.png', 'upload/20230407/642f2c332177b.png', '', '', 0, 'image/png', 791, 'png', 'd45cf4b5b1ace0c5ae4714698a1c6e0bd35ae4b3', 1680813107, 1680813107, 0);
INSERT INTO `ul_system_uploadfile` VALUES (495, 'local_public', 'rank_28.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c4131846.png', 'upload/20230407/642f2c4131846.png', '', '', 0, 'image/png', 845, 'png', '35dad5523011eb9e7e3554bb42e08f0a85ca7e5c', 1680813121, 1680813121, 0);
INSERT INTO `ul_system_uploadfile` VALUES (496, 'local_public', 'rank_29.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c5148955.png', 'upload/20230407/642f2c5148955.png', '', '', 0, 'image/png', 819, 'png', 'ad0a9272c06657fe72b0b96fde49417058eef3fd', 1680813137, 1680813137, 0);
INSERT INTO `ul_system_uploadfile` VALUES (497, 'local_public', 'rank_30.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c5cba77c.png', 'upload/20230407/642f2c5cba77c.png', '', '', 0, 'image/png', 844, 'png', '623ddec1d0131ebd79c113249e49289f4be9814b', 1680813148, 1680813148, 0);
INSERT INTO `ul_system_uploadfile` VALUES (498, 'local_public', 'rank_31.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c688821c.png', 'upload/20230407/642f2c688821c.png', '', '', 0, 'image/png', 775, 'png', '215398ab8209dec34be2f2fcb6a497e1b363837f', 1680813160, 1680813160, 0);
INSERT INTO `ul_system_uploadfile` VALUES (499, 'local_public', 'rank_32.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c754510f.png', 'upload/20230407/642f2c754510f.png', '', '', 0, 'image/png', 828, 'png', '95dc770bea760c0743f8487cefa8b86f8382cd46', 1680813173, 1680813173, 0);
INSERT INTO `ul_system_uploadfile` VALUES (500, 'local_public', 'rank_33.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c83ca9d5.png', 'upload/20230407/642f2c83ca9d5.png', '', '', 0, 'image/png', 985, 'png', 'e9d0f0e7c4596d878f356f0466ab495737d2b1c3', 1680813187, 1680813187, 0);
INSERT INTO `ul_system_uploadfile` VALUES (501, 'local_public', 'rank_34.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c918ca30.png', 'upload/20230407/642f2c918ca30.png', '', '', 0, 'image/png', 1011, 'png', '31ab4b2dc68227b691e5597d9a4a1e02721d7553', 1680813201, 1680813201, 0);
INSERT INTO `ul_system_uploadfile` VALUES (502, 'local_public', 'rank_35.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c9f9c54b.png', 'upload/20230407/642f2c9f9c54b.png', '', '', 0, 'image/png', 1035, 'png', '51345404b39a4467c9944087b439d4bce05407e2', 1680813215, 1680813215, 0);
INSERT INTO `ul_system_uploadfile` VALUES (503, 'local_public', 'rank_36.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cac7e7a2.png', 'upload/20230407/642f2cac7e7a2.png', '', '', 0, 'image/png', 1046, 'png', '9901445b51c4a74c016cd92a04f2e22c16d7dbed', 1680813228, 1680813228, 0);
INSERT INTO `ul_system_uploadfile` VALUES (504, 'local_public', 'rank_37.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cbb91208.png', 'upload/20230407/642f2cbb91208.png', '', '', 0, 'image/png', 1005, 'png', 'cb34c2a5a3370a8caa2f8777333af0ad6d0de85d', 1680813243, 1680813243, 0);
INSERT INTO `ul_system_uploadfile` VALUES (505, 'local_public', 'rank_38.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cc70c12b.png', 'upload/20230407/642f2cc70c12b.png', '', '', 0, 'image/png', 1072, 'png', 'e7bdd56e24476ebe96fe7a7c55ef189746654cf2', 1680813255, 1680813255, 0);
INSERT INTO `ul_system_uploadfile` VALUES (506, 'local_public', 'rank_39.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cd88d946.png', 'upload/20230407/642f2cd88d946.png', '', '', 0, 'image/png', 1032, 'png', 'ec7612b7caff99878de604aab41af4cd99eaee23', 1680813272, 1680813272, 0);
INSERT INTO `ul_system_uploadfile` VALUES (507, 'local_public', 'rank_40.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2ce8d0948.png', 'upload/20230407/642f2ce8d0948.png', '', '', 0, 'image/png', 1031, 'png', '1bfc9b5fce472aec605a75f49ded8c1987bc19a4', 1680813288, 1680813288, 0);
INSERT INTO `ul_system_uploadfile` VALUES (508, 'local_public', 'rank_41.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cf4cb46d.png', 'upload/20230407/642f2cf4cb46d.png', '', '', 0, 'image/png', 929, 'png', '5d70e78550c17eb633e011cba0338b45008ad1c6', 1680813300, 1680813300, 0);
INSERT INTO `ul_system_uploadfile` VALUES (509, 'local_public', 'rank_42.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d007a3f1.png', 'upload/20230407/642f2d007a3f1.png', '', '', 0, 'image/png', 995, 'png', '75cda333d21d0515a3268b5cc5ddc4e889cf8d20', 1680813312, 1680813312, 0);
INSERT INTO `ul_system_uploadfile` VALUES (510, 'local_public', 'rank_43.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d0e7f862.png', 'upload/20230407/642f2d0e7f862.png', '', '', 0, 'image/png', 1015, 'png', 'ce54e1e90e331ed38bb4f19391523de4d53dddee', 1680813326, 1680813326, 0);
INSERT INTO `ul_system_uploadfile` VALUES (511, 'local_public', 'rank_44.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d1de331f.png', 'upload/20230407/642f2d1de331f.png', '', '', 0, 'image/png', 943, 'png', 'df755c6b2de6f36ee25a192bd66862d20ff177c2', 1680813341, 1680813341, 0);
INSERT INTO `ul_system_uploadfile` VALUES (512, 'local_public', 'rank_45.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d2d6d4c9.png', 'upload/20230407/642f2d2d6d4c9.png', '', '', 0, 'image/png', 1010, 'png', 'e5fad74f264c069d053e699c08c8e4815b63ea02', 1680813357, 1680813357, 0);
INSERT INTO `ul_system_uploadfile` VALUES (513, 'local_public', 'rank_46.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d3e3ffcf.png', 'upload/20230407/642f2d3e3ffcf.png', '', '', 0, 'image/png', 1022, 'png', '7cb49b2a63ba465ae24610c98ca8278c95fae2be', 1680813374, 1680813374, 0);
INSERT INTO `ul_system_uploadfile` VALUES (514, 'local_public', 'rank_47.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d4c9a0c5.png', 'upload/20230407/642f2d4c9a0c5.png', '', '', 0, 'image/png', 972, 'png', '309c1694c18913be8ab44eeaf20de2e5d4146a3a', 1680813388, 1680813388, 0);
INSERT INTO `ul_system_uploadfile` VALUES (515, 'local_public', 'rank_48.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d5bd1eaa.png', 'upload/20230407/642f2d5bd1eaa.png', '', '', 0, 'image/png', 1044, 'png', 'b0c5457ad828f5d15512754b9816f9bd456a96d0', 1680813403, 1680813403, 0);
INSERT INTO `ul_system_uploadfile` VALUES (516, 'local_public', 'rank_49.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d6a7a150.png', 'upload/20230407/642f2d6a7a150.png', '', '', 0, 'image/png', 1032, 'png', '284b44d605a986553ac19d7935a4aaa6ca45b560', 1680813418, 1680813418, 0);
INSERT INTO `ul_system_uploadfile` VALUES (517, 'local_public', 'rank_50.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d7c65c9a.png', 'upload/20230407/642f2d7c65c9a.png', '', '', 0, 'image/png', 1067, 'png', '3dd305fffab2fa241f07a91485b04451e1746a40', 1680813436, 1680813436, 0);
INSERT INTO `ul_system_uploadfile` VALUES (518, 'local_public', 'logo_sc.png', 'http://cqadmin.bluechs.com/storage/upload/20230407/642f30b998799.png', 'upload/20230407/642f30b998799.png', '', '', 0, 'image/png', 283842, 'png', '5fd8d9aa78e72f163ec3e43751f8f16579f433ed', 1680814265, 1680814265, 0);
INSERT INTO `ul_system_uploadfile` VALUES (519, 'local_public', 'mmexport1680851319507.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230409/6432b3c8d4431.jpg', 'upload/20230409/6432b3c8d4431.jpg', '', '', 0, 'image/jpeg', 762349, 'jpg', '2bc9553093f09a2eabcc16e8c9d853f8bd012e8c', 1681044424, 1681044424, 0);
INSERT INTO `ul_system_uploadfile` VALUES (520, 'local_public', '01810.PNG', 'http://cqadmin.bluechs.com/storage/upload/20230410/64339f20ef967.PNG', 'upload/20230410/64339f20ef967.PNG', '', '', 0, 'image/png', 28761, 'png', '14ff58f293d16856e4b5396848d0f487796b5398', 1681104672, 1681104672, 0);
INSERT INTO `ul_system_uploadfile` VALUES (521, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230410/643400b0bc5f7.png', 'upload/20230410/643400b0bc5f7.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1681129648, 1681129648, 0);
INSERT INTO `ul_system_uploadfile` VALUES (522, 'local_public', 'four.png', 'http://cqadmin.bluechs.com/storage/upload/20230411/643533eb57265.png', 'upload/20230411/643533eb57265.png', '', '', 0, 'image/png', 118379, 'png', '764463348840809a2ab76e3fe8a65ce25f327cb8', 1681208299, 1681208299, 0);
INSERT INTO `ul_system_uploadfile` VALUES (523, 'local_public', 'four.png', 'http://cqadmin.bluechs.com/storage/upload/20230411/6435345622337.png', 'upload/20230411/6435345622337.png', '', '', 0, 'image/png', 118379, 'png', '764463348840809a2ab76e3fe8a65ce25f327cb8', 1681208406, 1681208406, 0);
INSERT INTO `ul_system_uploadfile` VALUES (524, 'local_public', 'lily-5886728__340.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230411/6435345e46ac2.jpg', 'upload/20230411/6435345e46ac2.jpg', '', '', 0, 'image/jpeg', 25976, 'jpg', '54178a3f7353e2e2e0d16369117e970b939b2fb3', 1681208414, 1681208414, 0);
INSERT INTO `ul_system_uploadfile` VALUES (525, 'local_public', 'c7e0b8b0-d495-47a2-95fb-9b5ef6351046.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230412/6436565c154fe.jpg', 'upload/20230412/6436565c154fe.jpg', '', '', 0, 'image/jpeg', 9604, 'jpg', '829c26a6dd8bedf806e1859d823dcc5863db610c', 1681282652, 1681282652, 0);
INSERT INTO `ul_system_uploadfile` VALUES (526, 'local_public', '6422d7e493702.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ebc2c11f3.png', 'upload/20230413/6436ebc2c11f3.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1681320898, 1681320898, 0);
INSERT INTO `ul_system_uploadfile` VALUES (527, 'local_public', 'bg_sb.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ec0e17e21.png', 'upload/20230413/6436ec0e17e21.png', '', '', 0, 'image/png', 4658, 'png', 'c4dc7f522c7ade01300c55a034c9da9927a8683c', 1681320974, 1681320974, 0);
INSERT INTO `ul_system_uploadfile` VALUES (528, 'local_public', 'bg_jp.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ec11aa759.png', 'upload/20230413/6436ec11aa759.png', '', '', 0, 'image/png', 11758, 'png', 'd3dabc1fd650763bd7adac28250a0de23a71f14b', 1681320977, 1681320977, 0);
INSERT INTO `ul_system_uploadfile` VALUES (529, 'local_public', 'bg_sb.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ed4968468.png', 'upload/20230413/6436ed4968468.png', '', '', 0, 'image/png', 4658, 'png', 'c4dc7f522c7ade01300c55a034c9da9927a8683c', 1681321289, 1681321289, 0);
INSERT INTO `ul_system_uploadfile` VALUES (530, 'local_public', 'bg_jp.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ed4d38d1a.png', 'upload/20230413/6436ed4d38d1a.png', '', '', 0, 'image/png', 11758, 'png', 'd3dabc1fd650763bd7adac28250a0de23a71f14b', 1681321293, 1681321293, 0);
INSERT INTO `ul_system_uploadfile` VALUES (531, 'local_public', 'bg_jp.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ed51829a4.png', 'upload/20230413/6436ed51829a4.png', '', '', 0, 'image/png', 11758, 'png', 'd3dabc1fd650763bd7adac28250a0de23a71f14b', 1681321297, 1681321297, 0);
INSERT INTO `ul_system_uploadfile` VALUES (532, 'local_public', 'bg_sb.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ed5489e73.png', 'upload/20230413/6436ed5489e73.png', '', '', 0, 'image/png', 4658, 'png', 'c4dc7f522c7ade01300c55a034c9da9927a8683c', 1681321300, 1681321300, 0);
INSERT INTO `ul_system_uploadfile` VALUES (533, 'local_public', '6422d82f7ab0f.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436ed5a4875c.png', 'upload/20230413/6436ed5a4875c.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1681321306, 1681321306, 0);
INSERT INTO `ul_system_uploadfile` VALUES (534, 'local_public', 'bg_jp.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436eda76782f.png', 'upload/20230413/6436eda76782f.png', '', '', 0, 'image/png', 11758, 'png', 'd3dabc1fd650763bd7adac28250a0de23a71f14b', 1681321383, 1681321383, 0);
INSERT INTO `ul_system_uploadfile` VALUES (535, 'local_public', 'bg_sb.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6436edac23eae.png', 'upload/20230413/6436edac23eae.png', '', '', 0, 'image/png', 4658, 'png', 'c4dc7f522c7ade01300c55a034c9da9927a8683c', 1681321388, 1681321388, 0);
INSERT INTO `ul_system_uploadfile` VALUES (536, 'local_public', 'bannar.png', 'http://cqadmin.bluechs.com/storage/upload/20230413/6437614a2e88f.png', 'upload/20230413/6437614a2e88f.png', '', '', 0, 'image/png', 473983, 'png', '89482092d84bb8a1ee6cd5ab549641367b535723', 1681350986, 1681350986, 0);
INSERT INTO `ul_system_uploadfile` VALUES (537, 'local_public', 'lily-5886728__340.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230413/64376156076a6.jpg', 'upload/20230413/64376156076a6.jpg', '', '', 0, 'image/jpeg', 25976, 'jpg', '54178a3f7353e2e2e0d16369117e970b939b2fb3', 1681350998, 1681350998, 0);
INSERT INTO `ul_system_uploadfile` VALUES (538, 'local_public', '6436eda76782f.png', 'http://cqadmin.bluechs.com/storage/upload/20230416/643bcfeaae016.png', 'upload/20230416/643bcfeaae016.png', '', '', 0, 'image/png', 11758, 'png', 'd3dabc1fd650763bd7adac28250a0de23a71f14b', 1681641450, 1681641450, 0);
INSERT INTO `ul_system_uploadfile` VALUES (539, 'local_public', '6436eda76782f.png', 'http://cqadmin.bluechs.com/storage/upload/20230416/643bd1e0c38bd.png', 'upload/20230416/643bd1e0c38bd.png', '', '', 0, 'image/png', 11758, 'png', 'd3dabc1fd650763bd7adac28250a0de23a71f14b', 1681641952, 1681641952, 0);
INSERT INTO `ul_system_uploadfile` VALUES (540, 'local_public', 'active.png', 'http://cqadmin.bluechs.com/storage/upload/20230416/643bd23be46d3.png', 'upload/20230416/643bd23be46d3.png', '', '', 0, 'image/png', 11787, 'png', '6af49297dba930daaa20c218e7b8f2f27e5b2362', 1681642043, 1681642043, 0);
INSERT INTO `ul_system_uploadfile` VALUES (541, 'local_public', 'prize.png', 'http://cqadmin.bluechs.com/storage/upload/20230416/643bd2b6c8307.png', 'upload/20230416/643bd2b6c8307.png', '', '', 0, 'image/png', 10740, 'png', '3aca5fce472595abbfdabe357363dc57b679e8a3', 1681642166, 1681642166, 0);
INSERT INTO `ul_system_uploadfile` VALUES (542, 'local_public', '6422d82f7ab0f.png', 'http://cqadmin.bluechs.com/storage/upload/20230416/643bd2edb3866.png', 'upload/20230416/643bd2edb3866.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1681642221, 1681642221, 0);
INSERT INTO `ul_system_uploadfile` VALUES (543, 'local_public', '金币兑换.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643df0ec9cdf7.png', 'upload/20230418/643df0ec9cdf7.png', '', '', 0, 'image/png', 7955, 'png', '2ae117603ffa30342433b7ef7de54a3d7035999e', 1681780972, 1681780972, 0);
INSERT INTO `ul_system_uploadfile` VALUES (544, 'local_public', '微信截图_20230318092557.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643df23f17af0.png', 'upload/20230418/643df23f17af0.png', '', '', 0, 'image/png', 15301, 'png', '595290fac89ad53094a489f77d3935860b3f5df6', 1681781311, 1681781311, 0);
INSERT INTO `ul_system_uploadfile` VALUES (545, 'local_public', '01810.PNG', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e05f04124c.PNG', 'upload/20230418/643e05f04124c.PNG', '', '', 0, 'image/png', 28761, 'png', '14ff58f293d16856e4b5396848d0f487796b5398', 1681786352, 1681786352, 0);
INSERT INTO `ul_system_uploadfile` VALUES (546, 'local_public', 'favicon.ico', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e3e995428c.ico', 'upload/20230418/643e3e995428c.ico', '', '', 0, 'image/x-icon', 36390, 'ico', '79915527ea1fdd66cc39f2b0de175b4d038ffce1', 1681800857, 1681800857, 0);
INSERT INTO `ul_system_uploadfile` VALUES (547, 'local_public', 'four.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e3e9d2f4fa.png', 'upload/20230418/643e3e9d2f4fa.png', '', '', 0, 'image/png', 118379, 'png', '764463348840809a2ab76e3fe8a65ce25f327cb8', 1681800861, 1681800861, 0);
INSERT INTO `ul_system_uploadfile` VALUES (548, 'local_public', 'four.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e3ede55655.png', 'upload/20230418/643e3ede55655.png', '', '', 0, 'image/png', 118379, 'png', '764463348840809a2ab76e3fe8a65ce25f327cb8', 1681800926, 1681800926, 0);
INSERT INTO `ul_system_uploadfile` VALUES (549, 'local_public', 'hezi1.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e3ee1cd0e2.png', 'upload/20230418/643e3ee1cd0e2.png', '', '', 0, 'image/png', 178535, 'png', 'c046c0725a278deb008acd7d73dedd6074c1abbb', 1681800929, 1681800929, 0);
INSERT INTO `ul_system_uploadfile` VALUES (550, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e40bb4e2b5.png', 'upload/20230418/643e40bb4e2b5.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1681801403, 1681801403, 0);
INSERT INTO `ul_system_uploadfile` VALUES (551, 'local_public', 'bannar.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e40c013c0f.png', 'upload/20230418/643e40c013c0f.png', '', '', 0, 'image/png', 473983, 'png', '89482092d84bb8a1ee6cd5ab549641367b535723', 1681801408, 1681801408, 0);
INSERT INTO `ul_system_uploadfile` VALUES (552, 'local_public', 'hezi.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e40c4a0582.png', 'upload/20230418/643e40c4a0582.png', '', '', 0, 'image/png', 178535, 'png', '72298898d9b442bf1bead46aff45e1aed7e80caf', 1681801412, 1681801412, 0);
INSERT INTO `ul_system_uploadfile` VALUES (553, 'local_public', 'hezi1.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e40c812c46.png', 'upload/20230418/643e40c812c46.png', '', '', 0, 'image/png', 178535, 'png', 'c046c0725a278deb008acd7d73dedd6074c1abbb', 1681801416, 1681801416, 0);
INSERT INTO `ul_system_uploadfile` VALUES (554, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e41b5bc18a.png', 'upload/20230418/643e41b5bc18a.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1681801653, 1681801653, 0);
INSERT INTO `ul_system_uploadfile` VALUES (555, 'local_public', 'bannar.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e41b9bb785.png', 'upload/20230418/643e41b9bb785.png', '', '', 0, 'image/png', 473983, 'png', '89482092d84bb8a1ee6cd5ab549641367b535723', 1681801657, 1681801657, 0);
INSERT INTO `ul_system_uploadfile` VALUES (556, 'local_public', 'hezi.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e41bd3a25c.png', 'upload/20230418/643e41bd3a25c.png', '', '', 0, 'image/png', 178535, 'png', '72298898d9b442bf1bead46aff45e1aed7e80caf', 1681801661, 1681801661, 0);
INSERT INTO `ul_system_uploadfile` VALUES (557, 'local_public', 'hezi1.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e41c089d2c.png', 'upload/20230418/643e41c089d2c.png', '', '', 0, 'image/png', 178535, 'png', 'c046c0725a278deb008acd7d73dedd6074c1abbb', 1681801664, 1681801664, 0);
INSERT INTO `ul_system_uploadfile` VALUES (558, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e43b22780e.png', 'upload/20230418/643e43b22780e.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1681802162, 1681802162, 0);
INSERT INTO `ul_system_uploadfile` VALUES (559, 'local_public', 'bannar.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e43b5c8727.png', 'upload/20230418/643e43b5c8727.png', '', '', 0, 'image/png', 473983, 'png', '89482092d84bb8a1ee6cd5ab549641367b535723', 1681802165, 1681802165, 0);
INSERT INTO `ul_system_uploadfile` VALUES (560, 'local_public', 'hezi.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e43b9234f3.png', 'upload/20230418/643e43b9234f3.png', '', '', 0, 'image/png', 178535, 'png', '72298898d9b442bf1bead46aff45e1aed7e80caf', 1681802169, 1681802169, 0);
INSERT INTO `ul_system_uploadfile` VALUES (561, 'local_public', 'hezi1.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e43bc81b60.png', 'upload/20230418/643e43bc81b60.png', '', '', 0, 'image/png', 178535, 'png', 'c046c0725a278deb008acd7d73dedd6074c1abbb', 1681802172, 1681802172, 0);
INSERT INTO `ul_system_uploadfile` VALUES (562, 'local_public', 'lily-5886728__340.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e471e2148f.jpg', 'upload/20230418/643e471e2148f.jpg', '', '', 0, 'image/jpeg', 25976, 'jpg', '54178a3f7353e2e2e0d16369117e970b939b2fb3', 1681803038, 1681803038, 0);
INSERT INTO `ul_system_uploadfile` VALUES (563, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f4502d80a0.png', 'upload/20230419/643f4502d80a0.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1681868034, 1681868034, 0);
INSERT INTO `ul_system_uploadfile` VALUES (564, 'local_public', '32.png', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f45d38de1c.png', 'upload/20230419/643f45d38de1c.png', '', '', 0, 'image/png', 3886, 'png', '1dbb9c10e27e204df9c26e89eebda25f4aab7225', 1681868243, 1681868243, 0);
INSERT INTO `ul_system_uploadfile` VALUES (565, 'local_public', 'hezi.png', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f4658e907d.png', 'upload/20230419/643f4658e907d.png', '', '', 0, 'image/png', 178535, 'png', '72298898d9b442bf1bead46aff45e1aed7e80caf', 1681868376, 1681868376, 0);
INSERT INTO `ul_system_uploadfile` VALUES (566, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f71d2f163a.jpg', 'upload/20230419/643f71d2f163a.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1681879506, 1681879506, 0);
INSERT INTO `ul_system_uploadfile` VALUES (567, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f71f53de91.jpg', 'upload/20230419/643f71f53de91.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1681879541, 1681879541, 0);
INSERT INTO `ul_system_uploadfile` VALUES (568, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f7247546a2.jpg', 'upload/20230419/643f7247546a2.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1681879623, 1681879623, 0);
INSERT INTO `ul_system_uploadfile` VALUES (569, 'local_public', 'oav6c4to-NCFJDCO2EDS71LFd9Pw.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f7278e97d4.jpg', 'upload/20230419/643f7278e97d4.jpg', '', '', 0, 'image/jpeg', 5723, 'jpg', 'efcd115a0c1c3c064413ebe6fc5e8a525fabdbc4', 1681879672, 1681879672, 0);
INSERT INTO `ul_system_uploadfile` VALUES (570, 'local_public', 'FlBbhcfxPtnHFF8gphMeNHrsWDyg.png', 'http://cqadmin.bluechs.com/storage/upload/20230419/643f8c9a386d0.png', 'upload/20230419/643f8c9a386d0.png', '', '', 0, 'image/png', 431838, 'png', '505b85c7f13ed9c7145f20a6131e347aec583ca0', 1681886362, 1681886362, 0);
INSERT INTO `ul_system_uploadfile` VALUES (571, 'local_public', 'QQ截图20230421121812.png', 'http://cqadmin.bluechs.com/storage/upload/20230421/64420e6323baa.png', 'upload/20230421/64420e6323baa.png', '', '', 0, 'image/png', 285941, 'png', '16bee5522e578d6fef3547e2b79e817a410c45d9', 1682050659, 1682050659, 0);
INSERT INTO `ul_system_uploadfile` VALUES (572, 'local_public', '1.gif', 'http://cqadmin.bluechs.com/storage/upload/20230421/64420e891b6dc.gif', 'upload/20230421/64420e891b6dc.gif', '', '', 0, 'image/gif', 591938, 'gif', 'ee422c4c8f1d7109947ec021c2fa71acf01cd6f1', 1682050697, 1682050697, 0);
INSERT INTO `ul_system_uploadfile` VALUES (573, 'local_public', '2.gif', 'http://cqadmin.bluechs.com/storage/upload/20230421/64420e8bba08c.gif', 'upload/20230421/64420e8bba08c.gif', '', '', 0, 'image/gif', 598190, 'gif', '5e864f4e8a55b8c4519f6f8e6e18d5bfb9766816', 1682050699, 1682050699, 0);
INSERT INTO `ul_system_uploadfile` VALUES (574, 'local_public', '9月份工作计划表.xlsx', 'http://cqadmin.bluechs.com/storage/upload/20230421/64423a18e9e62.xlsx', 'upload/20230421/64423a18e9e62.xlsx', '', '', 0, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', 16772, 'xlsx', '4f44a8be38329962a52937f653b4a3ea7661f454', 1682061848, 1682061894, 1682061894);
INSERT INTO `ul_system_uploadfile` VALUES (575, 'local_public', 'gj808.zip', 'http://cqadmin.bluechs.com/storage/upload/20230421/64423d36e8dd8.zip', 'upload/20230421/64423d36e8dd8.zip', '', '', 0, 'application/zip', 18693575, 'zip', '3bec6c65aa331e54943abe9e969d63089fbbd83e', 1682062647, 1682062661, 1682062661);
INSERT INTO `ul_system_uploadfile` VALUES (576, 'local_public', 'QQ截图20230425022524.png', 'http://cqadmin.bluechs.com/storage/upload/20230425/644769d0e71f8.png', 'upload/20230425/644769d0e71f8.png', '', '', 0, 'image/png', 1594738, 'png', '9a17bd7f13aac11d0994f08be63f4a7d39461293', 1682401744, 1682401744, 0);

-- ----------------------------
-- Table structure for ul_test_goods
-- ----------------------------
DROP TABLE IF EXISTS `ul_test_goods`;
CREATE TABLE `ul_test_goods`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID {relation} (table:mall_cate,relationBindSelect:title)',
  `title` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
  `logo` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品logo {image}',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片 {images}',
  `describe` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述 {editor}',
  `total_stock` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '总库存',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `status` int(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 {radio} (0:正常,1:禁用)',
  `cert_file` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '合格证 {file}',
  `verfiy_file` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '检测报告 {files}',
  `remark` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注说明',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `delete_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `publish_time` int(10) UNSIGNED NOT NULL COMMENT '发布日期 {date} (date)',
  `sale_time` bigint(20) UNSIGNED NOT NULL COMMENT '售卖日期 {date} (datetime)',
  `intro` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介 {textarea}',
  `time_status` int(5) UNSIGNED NOT NULL COMMENT '秒杀状态 {select} (0:未参加,1:已开始,3:已结束)',
  `is_recommend` int(4) NOT NULL COMMENT '是否推荐 {switch} (0:不推荐,1:推荐)',
  `shop_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类型 {checkbox} (taobao:淘宝,jd:京东)',
  `tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品标签 {table} (table:mall_tag,type:checkbox,valueField:id,fieldName:title)',
  `tag_backup` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品标签（单选） {table} (table:mall_tag,type:radio,valueField:id,fieldName:title)',
  `from_area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产地 {city} (name-province:0,code:0)',
  `store_city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '山东省/临沂市' COMMENT '仓库 {city} (level:city)',
  `tag_input` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品标签 （输入） {tag}',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '价格',
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '详情',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `cate_id`(`cate_id`) USING BTREE,
  FULLTEXT INDEX `detail`(`detail`)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品列表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_test_goods
-- ----------------------------

-- ----------------------------
-- Table structure for ul_user_level
-- ----------------------------
DROP TABLE IF EXISTS `ul_user_level`;
CREATE TABLE `ul_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户等级表',
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `level` int(2) NULL DEFAULT NULL COMMENT '等级',
  `tb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `level_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级所需时长',
  `coin_up` int(11) NULL DEFAULT NULL COMMENT '每日领取金币上限',
  `coin_scale` int(11) NULL DEFAULT NULL COMMENT '领取金币比例',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_user_level
-- ----------------------------
INSERT INTO `ul_user_level` VALUES (1, 'LV0', 0, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f29fc40de5.png', '0', 200, 100);
INSERT INTO `ul_user_level` VALUES (2, 'LV1', 1, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2a3d4c7df.png', '1', 400, 102);
INSERT INTO `ul_user_level` VALUES (3, 'LV2', 2, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2a5252174.png', '2', 600, 104);
INSERT INTO `ul_user_level` VALUES (4, 'LV3', 3, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2a60079e4.png', '3', 800, 106);
INSERT INTO `ul_user_level` VALUES (5, 'LV4', 4, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2ab1a5e33.png', '4', 1000, 108);
INSERT INTO `ul_user_level` VALUES (6, 'LV5', 5, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2acb870b4.png', '5', 1200, 110);
INSERT INTO `ul_user_level` VALUES (7, 'LV6', 6, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2ae0a43dc.png', '6', 1400, 112);
INSERT INTO `ul_user_level` VALUES (8, 'LV7', 7, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2aee50798.png', '7', 1600, 114);
INSERT INTO `ul_user_level` VALUES (9, 'LV8', 8, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2afc3f304.png', '8', 1800, 116);
INSERT INTO `ul_user_level` VALUES (10, 'LV9', 9, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b0e8b60c.png', '9', 2000, 118);
INSERT INTO `ul_user_level` VALUES (11, 'LV10', 10, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b1f040a0.png', '10', 2200, 120);
INSERT INTO `ul_user_level` VALUES (12, 'LV11', 11, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b30d6761.png', '12', 2400, 122);
INSERT INTO `ul_user_level` VALUES (13, 'LV12', 12, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b4d60760.png', '24', 2600, 124);
INSERT INTO `ul_user_level` VALUES (14, 'LV13', 13, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b5a848d9.png', '36', 2800, 126);
INSERT INTO `ul_user_level` VALUES (15, 'LV14', 14, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b728dbd0.png', '48', 3000, 128);
INSERT INTO `ul_user_level` VALUES (16, 'LV15', 15, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b7e5dfc6.png', '60', 3200, 130);
INSERT INTO `ul_user_level` VALUES (17, 'LV16', 16, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b8a9b094.png', '72', 3400, 132);
INSERT INTO `ul_user_level` VALUES (18, 'LV17', 17, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2b990f5d6.png', '96', 3600, 134);
INSERT INTO `ul_user_level` VALUES (19, 'LV18', 18, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bb604a1d.png', '120', 3800, 136);
INSERT INTO `ul_user_level` VALUES (20, 'LV19', 19, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bc24c885.png', '144', 4000, 138);
INSERT INTO `ul_user_level` VALUES (21, 'LV20', 20, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bcef3296.png', '168', 4200, 140);
INSERT INTO `ul_user_level` VALUES (22, 'LV21', 21, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bd9ea3f9.png', '192', 4400, 142);
INSERT INTO `ul_user_level` VALUES (23, 'LV22', 22, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bea79aeb.png', '240', 4600, 144);
INSERT INTO `ul_user_level` VALUES (24, 'LV23', 23, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2bfa195e4.png', '3600', 4800, 146);
INSERT INTO `ul_user_level` VALUES (25, 'LV24', 24, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c0687313.png', '580', 5000, 148);
INSERT INTO `ul_user_level` VALUES (26, 'LV25', 25, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c12edcc0.png', '720', 5200, 150);
INSERT INTO `ul_user_level` VALUES (27, 'LV26', 26, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c1f3c9fc.png', '960', 5400, 152);
INSERT INTO `ul_user_level` VALUES (28, 'LV27', 27, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c332177b.png', '1200', 5600, 154);
INSERT INTO `ul_user_level` VALUES (29, 'LV28', 28, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c4131846.png', '1440', 5800, 156);
INSERT INTO `ul_user_level` VALUES (30, 'LV29', 29, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c5148955.png', '1680', 6000, 158);
INSERT INTO `ul_user_level` VALUES (31, 'LV30', 30, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c5cba77c.png', '2040', 6200, 160);
INSERT INTO `ul_user_level` VALUES (32, 'LV31', 31, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c688821c.png', '2400', 6400, 162);
INSERT INTO `ul_user_level` VALUES (33, 'LV32', 32, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c754510f.png', '2760', 6600, 164);
INSERT INTO `ul_user_level` VALUES (34, 'LV33', 33, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c83ca9d5.png', '3120', 6800, 166);
INSERT INTO `ul_user_level` VALUES (35, 'LV34', 34, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c918ca30.png', '3480', 7000, 168);
INSERT INTO `ul_user_level` VALUES (36, 'LV35', 35, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2c9f9c54b.png', '3840', 7200, 170);
INSERT INTO `ul_user_level` VALUES (37, 'LV36', 36, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cac7e7a2.png', '4200', 7400, 172);
INSERT INTO `ul_user_level` VALUES (38, 'LV37', 37, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cbb91208.png', '4560', 7600, 174);
INSERT INTO `ul_user_level` VALUES (39, 'LV38', 38, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cc70c12b.png', '4920', 7800, 176);
INSERT INTO `ul_user_level` VALUES (40, 'LV39', 39, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cd88d946.png', '5280', 8000, 178);
INSERT INTO `ul_user_level` VALUES (41, 'LV40', 40, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2ce8d0948.png', '5800', 8200, 180);
INSERT INTO `ul_user_level` VALUES (42, 'LV41', 41, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2cf4cb46d.png', '6420', 8400, 182);
INSERT INTO `ul_user_level` VALUES (43, 'LV42', 42, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d007a3f1.png', '7040', 8800, 184);
INSERT INTO `ul_user_level` VALUES (44, 'LV43', 43, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d0e7f862.png', '7660', 9200, 186);
INSERT INTO `ul_user_level` VALUES (45, 'LV44', 44, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d1de331f.png', '8280', 9600, 188);
INSERT INTO `ul_user_level` VALUES (46, 'LV45', 45, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d2d6d4c9.png', '8900', 10000, 190);
INSERT INTO `ul_user_level` VALUES (47, 'LV46', 46, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d3e3ffcf.png', '9520', 10400, 192);
INSERT INTO `ul_user_level` VALUES (48, 'LV47', 47, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d4c9a0c5.png', '10140', 10800, 194);
INSERT INTO `ul_user_level` VALUES (49, 'LV48', 48, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d5bd1eaa.png', '10760', 11200, 196);
INSERT INTO `ul_user_level` VALUES (50, 'LV49', 49, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d6a7a150.png', '11380', 11600, 198);
INSERT INTO `ul_user_level` VALUES (51, 'LV50', 50, 'http://cqadmin.bluechs.com/storage/upload/20230407/642f2d7c65c9a.png', '12000', 12000, 200);

-- ----------------------------
-- Table structure for ul_user_report
-- ----------------------------
DROP TABLE IF EXISTS `ul_user_report`;
CREATE TABLE `ul_user_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户签到表',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `report_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '签到时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_user_report
-- ----------------------------
INSERT INTO `ul_user_report` VALUES (62, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-03-24 10:18:13');
INSERT INTO `ul_user_report` VALUES (63, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-03-25 10:18:13');
INSERT INTO `ul_user_report` VALUES (66, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-18 12:12:09');
INSERT INTO `ul_user_report` VALUES (67, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-19 12:12:09');
INSERT INTO `ul_user_report` VALUES (68, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-20 12:12:09');
INSERT INTO `ul_user_report` VALUES (69, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-21 12:12:09');
INSERT INTO `ul_user_report` VALUES (70, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-22 12:12:09');
INSERT INTO `ul_user_report` VALUES (71, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-23 12:12:09');
INSERT INTO `ul_user_report` VALUES (72, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-24 12:12:09');
INSERT INTO `ul_user_report` VALUES (73, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-25 12:12:09');
INSERT INTO `ul_user_report` VALUES (74, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-26 12:12:09');
INSERT INTO `ul_user_report` VALUES (75, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-03-26 20:04:42');
INSERT INTO `ul_user_report` VALUES (76, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-27 00:09:59');
INSERT INTO `ul_user_report` VALUES (77, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-03-28 12:33:15');
INSERT INTO `ul_user_report` VALUES (78, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-28 14:07:21');
INSERT INTO `ul_user_report` VALUES (79, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-03-28 15:35:00');
INSERT INTO `ul_user_report` VALUES (80, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-03-29 00:12:26');
INSERT INTO `ul_user_report` VALUES (81, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-03-29 00:33:07');
INSERT INTO `ul_user_report` VALUES (82, 'ociWS6jH_wjSOXxF0norcSBsFke8', '2023-03-29 13:22:32');
INSERT INTO `ul_user_report` VALUES (83, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-03-29 14:55:24');
INSERT INTO `ul_user_report` VALUES (84, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-03-30 17:28:06');
INSERT INTO `ul_user_report` VALUES (85, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-03-31 13:14:37');
INSERT INTO `ul_user_report` VALUES (86, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-01 16:32:25');
INSERT INTO `ul_user_report` VALUES (87, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-01 20:43:14');
INSERT INTO `ul_user_report` VALUES (88, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-02 13:08:27');
INSERT INTO `ul_user_report` VALUES (89, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-02 16:19:13');
INSERT INTO `ul_user_report` VALUES (90, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-02 16:52:54');
INSERT INTO `ul_user_report` VALUES (91, 'ociWS6jH_wjSOXxF0norcSBsFke8', '2023-04-02 17:35:10');
INSERT INTO `ul_user_report` VALUES (92, 'ociWS6jH_wjSOXxF0norcSBsFke8', '2023-04-03 15:46:14');
INSERT INTO `ul_user_report` VALUES (93, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-03 15:57:10');
INSERT INTO `ul_user_report` VALUES (94, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-03 18:14:18');
INSERT INTO `ul_user_report` VALUES (95, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-03 21:48:08');
INSERT INTO `ul_user_report` VALUES (96, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-04-04 15:25:32');
INSERT INTO `ul_user_report` VALUES (97, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-04 20:04:39');
INSERT INTO `ul_user_report` VALUES (98, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-05 15:12:05');
INSERT INTO `ul_user_report` VALUES (99, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-05 18:12:21');
INSERT INTO `ul_user_report` VALUES (100, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-05 18:19:26');
INSERT INTO `ul_user_report` VALUES (101, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-06 09:41:53');
INSERT INTO `ul_user_report` VALUES (102, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-07 03:56:08');
INSERT INTO `ul_user_report` VALUES (103, 'ociWS6tg9QIyLgxa8i5yCtdPV-yI', '2023-04-07 05:08:29');
INSERT INTO `ul_user_report` VALUES (104, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-08 00:15:41');
INSERT INTO `ul_user_report` VALUES (105, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-09 00:19:02');
INSERT INTO `ul_user_report` VALUES (106, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-04-09 09:06:13');
INSERT INTO `ul_user_report` VALUES (107, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-09 09:06:33');
INSERT INTO `ul_user_report` VALUES (108, 'ociWS6nV9F09A0JfGeCfvLPqbvr8', '2023-04-09 20:35:19');
INSERT INTO `ul_user_report` VALUES (109, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-10 00:41:34');
INSERT INTO `ul_user_report` VALUES (110, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-10 13:27:23');
INSERT INTO `ul_user_report` VALUES (111, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-10 15:57:36');
INSERT INTO `ul_user_report` VALUES (112, 'ociWS6rBWGu91iaK-NbjGNbP7jLY', '2023-04-10 18:07:20');
INSERT INTO `ul_user_report` VALUES (114, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-11 11:00:54');
INSERT INTO `ul_user_report` VALUES (115, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-11 11:36:09');
INSERT INTO `ul_user_report` VALUES (116, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-12 14:31:16');
INSERT INTO `ul_user_report` VALUES (117, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-04-13 12:11:47');
INSERT INTO `ul_user_report` VALUES (118, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-15 12:26:16');
INSERT INTO `ul_user_report` VALUES (119, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-16 05:35:24');
INSERT INTO `ul_user_report` VALUES (120, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-16 19:22:09');
INSERT INTO `ul_user_report` VALUES (121, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-17 09:28:10');
INSERT INTO `ul_user_report` VALUES (122, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-19 11:37:14');
INSERT INTO `ul_user_report` VALUES (123, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2023-04-20 12:23:54');
INSERT INTO `ul_user_report` VALUES (124, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-20 15:24:22');
INSERT INTO `ul_user_report` VALUES (125, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-21 11:45:04');
INSERT INTO `ul_user_report` VALUES (126, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-21 12:36:28');
INSERT INTO `ul_user_report` VALUES (127, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-21 19:02:37');
INSERT INTO `ul_user_report` VALUES (128, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '2023-04-22 14:28:34');
INSERT INTO `ul_user_report` VALUES (129, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '2023-04-23 18:28:46');
INSERT INTO `ul_user_report` VALUES (130, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '2023-04-25 08:10:37');

-- ----------------------------
-- Table structure for ul_yxlb
-- ----------------------------
DROP TABLE IF EXISTS `ul_yxlb`;
CREATE TABLE `ul_yxlb`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏列表',
  `yx_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `yx_banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏banner',
  `yxlogo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏图标',
  `yxgs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏公司',
  `yxgw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏官网',
  `zylx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职业类型',
  `yxyy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏语言',
  `yxbb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏版本',
  `yxdx` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏大小',
  `xzlj` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载链接',
  `xzcs` int(11) NULL DEFAULT NULL COMMENT '下载次数',
  `yxjj` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '游戏简介',
  `xq` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '详情',
  `pf` decimal(10, 1) NOT NULL DEFAULT 5.0 COMMENT '评分',
  `is_rm` int(1) NULL DEFAULT 0 COMMENT '是否热门0是1否',
  `is_tj` int(1) NULL DEFAULT 0 COMMENT '是否推荐0推荐1不推荐',
  `is_sy` int(1) NULL DEFAULT 1 COMMENT '是否首页0是1否',
  `is_ts` int(1) NOT NULL DEFAULT 1 COMMENT '是否特色好服0是1否',
  `yxjt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏截图',
  `yxbq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏标签',
  `kfsj` datetime NULL DEFAULT NULL COMMENT '开服时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ul_yxlb
-- ----------------------------
INSERT INTO `ul_yxlb` VALUES (1, '2', 'http://cqadmin.bluechs.com/storage/upload/20230413/64376156076a6.jpg', 'http://cqadmin.bluechs.com/storage/upload/20230327/64214f9f3c503.png', '1', NULL, '单职业', '简体中文', '1', '1', 'http://cqadmin.bluechs.com/5cq/CQ5.zip', 47, '全新冰雪复古传奇单职业版本《盟重英雄》1:1发', '<p><img alt=\"\" src=\"http://cqadmin.bluechs.com/storage/upload/20230317/6413d29ed8bb3.png\" style=\"height:726px; width:1200px\" /></p>\n', 5.0, 0, 1, 0, 1, NULL, NULL, NULL, '2023-04-20 10:38:35');
INSERT INTO `ul_yxlb` VALUES (25, '传奇1.76怀旧版-巅峰霸业', 'http://cqadmin.bluechs.com/storage/upload/20230413/6437614a2e88f.png', 'http://cqadmin.bluechs.com/storage/upload/20230412/6436565c154fe.jpg', 'Hainan Chuangxiang Network Technology Co., Ltd', NULL, '复古', '简体中文', '1.1.0', '305.66', 'https://apps.apple.com/cn/app/%E4%BC%A0%E5%A5%871-76%E6%80%80%E6%97%A7%E7%89%88-%E5%B7%85%E5%B3%B0%E9%9C%B8%E4%B8%9A/id1609915481', 100041, '游戏升级玩法无比轻松，战斗超爽，自由打金无比爽', '<p>《传奇1.76怀旧版-永恒屠龙》是一款相当爽的传奇游戏，游戏升级玩法无比轻松，战斗超爽，自由打金无比爽，刀刀秒杀开局局送您各种福利玩法相当自由，各种怪物能爆出超多的福利和装备，秒杀各种怪兽，刀刀光柱，击杀超爽玩法轻松自由，满级贵族上线就能享受，各种光柱玩起来也是无比轻松，喜欢的小伙伴们来点击下载试试吧！</p>\n', 5.0, 0, 0, 0, 1, NULL, NULL, NULL, '2023-04-20 10:38:37');
INSERT INTO `ul_yxlb` VALUES (28, '１．８０清风合击', 'http://cqadmin.bluechs.com/storage/upload/20230421/64420e6323baa.png', 'http://cqadmin.bluechs.com/storage/upload/20230418/643e43b22780e.png', '玩传奇', 'http://www.5cq.com', '复古', '简体中文', '10.0.0', '100', 'https://hao.9bbk.com/2022/108/', 1006, '三职业完美平衡，游戏玩法请查看QQ群文件,有详细的攻略,助您更好的了解我们游戏！', '<p>1.80清风合击星王+1传奇服务端-山谷老人-陵墓宝阁-清风神殿-传奇版本库<br />\n版本介绍：180清风合击传奇，游戏比例:1=500，元宝回收1=1000。<br />\n版本介绍：每天4个新区，8天一个阶段，32天一个总区。<br />\n版本介绍：永久回收元宝功能、散人必选，重金宣传，人气火爆！<br />\n版本介绍：不能任何第三方加速、顶药等辅助，所有职业和装备属性，经历精心测试反复调试！<br />\n版本介绍：三职业完美平衡，游戏玩法请查看QQ群文件,有详细的攻略,助您更好的了解我们游戏！<br />\n地图介绍：清风神塔地图分15层，进入越上面一层BOSS越强，1-14层，每20分钟刷新三只教主，1-5需要48级 6-14需要50级，15需要52级，进入条件需要等级48+588元宝+龙的传人。<br />\n版本介绍：散人玩家升级方式：1.去幻境1.2.3.4地图，带上双倍或四倍勋章10分钟到达40级。2.初级地图打祖玛装备、赤月装备、新衣服等、回收高额经验。3.使用聚灵珠，存满后无论自己吃还是出给其它玩家都不错。<br />\n版本介绍：1.本服幸运9即可触发最高威力，运10可达到峰值！2.幸运链可在各大小随机BOSS爆出，也可在综合NPC升，运9不难！3.极品最高+3，各大小BOSS随机爆出，+3以上祖玛很受玩家欢迎。</p>\n', 5.0, 0, 0, 1, 0, 'http://cqadmin.bluechs.com/storage/upload/20230421/64420e891b6dc.gif|http://cqadmin.bluechs.com/storage/upload/20230421/64420e8bba08c.gif', '激情四射,玩法多样,复古地图', '2023-04-19 15:15:27', '2023-04-22 14:28:20');

-- ----------------------------
-- Table structure for yxcz
-- ----------------------------
DROP TABLE IF EXISTS `yxcz`;
CREATE TABLE `yxcz`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏充值记录表',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open_id',
  `yxmc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `yxgw` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏官网',
  `czje` decimal(10, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `hbmc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币名称',
  `czzh` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '冲值帐号',
  `czqf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值区服',
  `QQ` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系QQ',
  `is_cz` int(1) NOT NULL DEFAULT 0 COMMENT '0未充值1已充值',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '提交时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yxcz
-- ----------------------------
INSERT INTO `yxcz` VALUES (11, 'ociWS6j17km6QToj5dcoy1kNB8YA', '测试', '1', 1.00, '1', '1', '1', '1', 1, '2023-03-26 14:47:09');
INSERT INTO `yxcz` VALUES (12, 'ociWS6j17km6QToj5dcoy1kNB8YA', '2', '参数', 1.00, '1', '1', '1', '1', 0, '2023-03-27 09:04:05');
INSERT INTO `yxcz` VALUES (13, 'ociWS6j17km6QToj5dcoy1kNB8YA', '测试', '哈哈', 1.00, '哈哈', '哈哈', '哈哈', '11', 1, '2023-03-27 16:49:16');
INSERT INTO `yxcz` VALUES (14, 'ociWS6j17km6QToj5dcoy1kNB8YA', '测试', '哈哈', 100.00, '哈哈', '哈哈', '哈哈', '11', 1, '2023-03-27 16:49:22');
INSERT INTO `yxcz` VALUES (15, 'ociWS6j17km6QToj5dcoy1kNB8YA', '测试', 'haha', 1.00, '11', '1', '1', '1', 0, '2023-03-28 16:49:30');
INSERT INTO `yxcz` VALUES (16, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', '地下城与勇士', '1', 1.00, '1', '1', '1', '1', 0, '2023-04-06 20:16:26');
INSERT INTO `yxcz` VALUES (17, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '1', '1', 1.00, '1', '1', '1', '1', 1, '2023-04-10 00:10:26');
INSERT INTO `yxcz` VALUES (18, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', '8', '8', 8.00, '8', '8', '8', '8', 1, '2023-04-10 00:40:40');
INSERT INTO `yxcz` VALUES (19, 'ociWS6j17km6QToj5dcoy1kNB8YA', 'test', 'test', 0.00, 'test', 'test', 'test', 'test', 0, '2023-04-16 19:09:26');
INSERT INTO `yxcz` VALUES (20, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 'test', 'test', 0.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 10:27:12');
INSERT INTO `yxcz` VALUES (21, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 'test', 'test', 0.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 10:27:26');
INSERT INTO `yxcz` VALUES (22, 'ociWS6j17km6QToj5dcoy1kNB8YA', 'test', 'test', 0.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 10:27:29');
INSERT INTO `yxcz` VALUES (23, 'ociWS6j17km6QToj5dcoy1kNB8YA', 'test', 'test', 1.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 10:28:01');
INSERT INTO `yxcz` VALUES (24, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 'test', 'test', 100.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 10:28:04');
INSERT INTO `yxcz` VALUES (25, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 1111.00, '11', '11', '11', '1574865815', 0, '2023-04-20 13:29:45');
INSERT INTO `yxcz` VALUES (26, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11111.00, '11', '11', '11', '1574865815', 0, '2023-04-20 13:29:55');
INSERT INTO `yxcz` VALUES (27, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '1122222222', 0, '2023-04-20 13:30:24');
INSERT INTO `yxcz` VALUES (28, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '1122222222', 0, '2023-04-20 13:30:30');
INSERT INTO `yxcz` VALUES (29, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '111', '11', '11', '1574865815', 0, '2023-04-20 13:32:40');
INSERT INTO `yxcz` VALUES (30, 'ociWS6j17km6QToj5dcoy1kNB8YA', 'test', 'test', 1111111.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 13:39:13');
INSERT INTO `yxcz` VALUES (31, 'ociWS6j17km6QToj5dcoy1kNB8YA', 'test', 'test', 201.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 13:44:03');
INSERT INTO `yxcz` VALUES (32, 'ociWS6j17km6QToj5dcoy1kNB8YA', 'test', 'test', 199.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 13:47:37');
INSERT INTO `yxcz` VALUES (33, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 2000.00, '11', '11', '11', '11111111111', 0, '2023-04-20 13:47:59');
INSERT INTO `yxcz` VALUES (34, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '222', '11', 11.00, '11', '11', '11', '1574865815', 0, '2023-04-20 13:50:06');
INSERT INTO `yxcz` VALUES (35, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '11111111111', 0, '2023-04-20 13:51:38');
INSERT INTO `yxcz` VALUES (36, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '11111111111', 0, '2023-04-20 13:51:42');
INSERT INTO `yxcz` VALUES (37, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 'test', 'test', 100.00, 'test', 'test', 'test', 'test', 0, '2023-04-20 14:02:49');
INSERT INTO `yxcz` VALUES (38, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '1574865815', 0, '2023-04-20 16:15:31');
INSERT INTO `yxcz` VALUES (39, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '15523452345', 0, '2023-04-20 16:16:08');
INSERT INTO `yxcz` VALUES (40, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '15523452345', 0, '2023-04-20 16:16:09');
INSERT INTO `yxcz` VALUES (41, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '15523452345', 0, '2023-04-20 16:16:10');
INSERT INTO `yxcz` VALUES (42, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '11', '11', 11.00, '11', '11', '11', '15523452345', 0, '2023-04-20 16:16:10');
INSERT INTO `yxcz` VALUES (43, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '111', '11', 11.00, '11', '111', '11', '11111111111', 0, '2023-04-20 16:20:54');
INSERT INTO `yxcz` VALUES (44, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '111', '11', 11.00, '11', '111', '11', '11111111111', 0, '2023-04-20 16:21:06');
INSERT INTO `yxcz` VALUES (45, 'ociWS6ki2ki7j5sv44DWiwhva9H4', '１．８０清风合击', 'http://www.5cq.com', 10.00, '11', '11', '11', '1574865815', 0, '2023-04-25 14:17:53');

-- ----------------------------
-- Table structure for yxfl
-- ----------------------------
DROP TABLE IF EXISTS `yxfl`;
CREATE TABLE `yxfl`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏分类表',
  `fl_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yxfl
-- ----------------------------
INSERT INTO `yxfl` VALUES (1, '单职业');
INSERT INTO `yxfl` VALUES (2, '三职业');
INSERT INTO `yxfl` VALUES (3, '复古');
INSERT INTO `yxfl` VALUES (4, '微变');
INSERT INTO `yxfl` VALUES (5, '沉默');

-- ----------------------------
-- Table structure for yxpf
-- ----------------------------
DROP TABLE IF EXISTS `yxpf`;
CREATE TABLE `yxpf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏评分表',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'open_id',
  `yx_id` int(11) NULL DEFAULT NULL COMMENT '游戏id',
  `soc` int(255) NULL DEFAULT NULL COMMENT '分值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yxpf
-- ----------------------------
INSERT INTO `yxpf` VALUES (2, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 1, 5);
INSERT INTO `yxpf` VALUES (3, 'ociWS6mqBH6uevoMMi6FfBiBCZCE', 28, 5);
INSERT INTO `yxpf` VALUES (4, 'ociWS6j17km6QToj5dcoy1kNB8YA', 28, 4);
INSERT INTO `yxpf` VALUES (5, 'ociWS6o0HRLFc4_k8FO9ymwftM9w', 28, 5);
INSERT INTO `yxpf` VALUES (6, 'ociWS6ki2ki7j5sv44DWiwhva9H4', 28, 3);
INSERT INTO `yxpf` VALUES (7, 'ociWS6tFN80AJ9D-BnBKTNAtK3mY', 28, 3);

-- ----------------------------
-- Table structure for yxsc
-- ----------------------------
DROP TABLE IF EXISTS `yxsc`;
CREATE TABLE `yxsc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '游戏时长表',
  `open_id` int(11) NULL DEFAULT NULL COMMENT 'open_id',
  `yxsc` int(11) NOT NULL DEFAULT 0 COMMENT '每日游戏时长',
  `yx_id` int(11) NOT NULL DEFAULT 0 COMMENT '游戏id',
  `hf_sc` int(11) NOT NULL DEFAULT 0 COMMENT '好服推荐游戏时长',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yxsc
-- ----------------------------
INSERT INTO `yxsc` VALUES (3, 0, 373, 0, 3, '2023-04-10 21:20:41');
INSERT INTO `yxsc` VALUES (7, 0, 0, 28, 5, '2023-04-18 11:42:33');
INSERT INTO `yxsc` VALUES (9, 0, 184, 0, 0, '2023-04-18 16:04:01');
INSERT INTO `yxsc` VALUES (10, 0, 0, 1, 1, '2023-04-19 10:28:47');
INSERT INTO `yxsc` VALUES (11, 0, 420, 0, 0, '2023-04-20 16:27:20');
INSERT INTO `yxsc` VALUES (12, 0, 240, 0, 0, '2023-04-21 13:44:32');

SET FOREIGN_KEY_CHECKS = 1;
