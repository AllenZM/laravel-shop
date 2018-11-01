/*
 Navicat Premium Data Transfer

 Source Server         : homestead
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : 127.0.0.1:2200
 Source Schema         : laravel-shop

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 01/11/2018 11:46:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lnmp_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_menu`;
CREATE TABLE `lnmp_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父ID',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '图标',
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '路径',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台菜单表';

-- ----------------------------
-- Records of lnmp_admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, '2018-06-27 21:45:17');
INSERT INTO `lnmp_admin_menu` VALUES (2, 0, 10, '系统管理', 'fa-tasks', NULL, NULL, '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (3, 2, 11, '管理员管理', 'fa-users', 'auth/users', NULL, '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (4, 2, 12, '角色管理', 'fa-user', 'auth/roles', NULL, '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (5, 2, 13, '权限管理', 'fa-ban', 'auth/permissions', NULL, '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (6, 2, 14, '菜单管理', 'fa-bars', 'auth/menu', NULL, '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (7, 2, 15, '操作日志', 'fa-history', 'auth/logs', NULL, '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (8, 0, 2, '用户管理', 'fa-users', '/users', '2018-06-27 21:44:06', '2018-06-27 21:45:17');
INSERT INTO `lnmp_admin_menu` VALUES (9, 0, 3, '产品管理', 'fa-cubes', NULL, '2018-06-27 23:38:52', '2018-06-27 23:39:53');
INSERT INTO `lnmp_admin_menu` VALUES (10, 9, 5, '商品管理', 'fa-cube', '/products', '2018-06-27 23:40:36', '2018-10-21 22:22:27');
INSERT INTO `lnmp_admin_menu` VALUES (11, 9, 8, '订单管理', 'fa-rmb', '/orders', '2018-06-29 12:39:25', '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (12, 9, 9, '优惠券管理', 'fa-tags', '/coupon_codes', '2018-07-05 01:08:59', '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_menu` VALUES (13, 9, 4, '商品类目', 'fa-align-justify', '/categories', '2018-10-21 22:18:34', '2018-10-21 22:22:27');
INSERT INTO `lnmp_admin_menu` VALUES (14, 9, 6, '众筹商品', 'fa-flag-checkered', '/crowdfunding_products', '2018-10-22 15:28:00', '2018-10-22 15:28:16');
INSERT INTO `lnmp_admin_menu` VALUES (15, 9, 7, '秒杀商品', 'fa-bolt', '/seckill_products', '2018-10-31 13:08:50', '2018-10-31 13:09:11');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_operation_log`;
CREATE TABLE `lnmp_admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '路径',
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '动作',
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'IP',
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '操作内容',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=826 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台操作日志表';

-- ----------------------------
-- Records of lnmp_admin_operation_log
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_operation_log` VALUES (1, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-27 21:07:11', '2018-06-27 21:07:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (2, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:07:23', '2018-06-27 21:07:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (3, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:07:26', '2018-06-27 21:07:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (4, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:07:28', '2018-06-27 21:07:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (5, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:07:29', '2018-06-27 21:07:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (6, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:08:39', '2018-06-27 21:08:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (7, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:08:44', '2018-06-27 21:08:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (8, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:09:03', '2018-06-27 21:09:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (9, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:09:23', '2018-06-27 21:09:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:10:11', '2018-06-27 21:10:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (11, 1, 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:10:41', '2018-06-27 21:10:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (12, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-27 21:10:55', '2018-06-27 21:10:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (13, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:11:17', '2018-06-27 21:11:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (14, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:11:20', '2018-06-27 21:11:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (15, 1, 'admin/auth/users/1', 'PUT', '192.168.10.1', '{\"username\":\"admin\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"password\":\"$2y$10$7UkH\\/26nTrP.A4mISm337ejsUXvNHrUruIudcbUQ0a1Ub5eHng3g.\",\"password_confirmation\":\"$2y$10$7UkH\\/26nTrP.A4mISm337ejsUXvNHrUruIudcbUQ0a1Ub5eHng3g.\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/users\"}', '2018-06-27 21:11:52', '2018-06-27 21:11:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (16, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2018-06-27 21:11:52', '2018-06-27 21:11:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (17, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2018-06-27 21:11:57', '2018-06-27 21:11:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (18, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:12:02', '2018-06-27 21:12:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (19, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2018-06-27 21:12:57', '2018-06-27 21:12:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (20, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2018-06-27 21:13:00', '2018-06-27 21:13:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (21, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2018-06-27 21:13:00', '2018-06-27 21:13:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (22, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2018-06-27 21:13:01', '2018-06-27 21:13:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (23, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2018-06-27 21:13:01', '2018-06-27 21:13:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (24, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '[]', '2018-06-27 21:13:06', '2018-06-27 21:13:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (25, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:13:08', '2018-06-27 21:13:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (26, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2018-06-27 21:13:13', '2018-06-27 21:13:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (27, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:13:16', '2018-06-27 21:13:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (28, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:13:42', '2018-06-27 21:13:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (29, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:13:50', '2018-06-27 21:13:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (30, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:14:06', '2018-06-27 21:14:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (31, 1, 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:14:32', '2018-06-27 21:14:32');
INSERT INTO `lnmp_admin_operation_log` VALUES (32, 1, 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:14:43', '2018-06-27 21:14:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (33, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:14:43', '2018-06-27 21:14:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:14:49', '2018-06-27 21:14:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (35, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:14:57', '2018-06-27 21:14:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (36, 1, 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:15:20', '2018-06-27 21:15:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (37, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:15:21', '2018-06-27 21:15:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (38, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:15:24', '2018-06-27 21:15:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (39, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:15:40', '2018-06-27 21:15:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (40, 1, 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:15:54', '2018-06-27 21:15:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (41, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:15:54', '2018-06-27 21:15:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (42, 1, 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:15:57', '2018-06-27 21:15:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (43, 1, 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:16:11', '2018-06-27 21:16:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (44, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:16:12', '2018-06-27 21:16:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (45, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:16:16', '2018-06-27 21:16:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (46, 1, 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:16:29', '2018-06-27 21:16:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (47, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:16:30', '2018-06-27 21:16:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (48, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:16:36', '2018-06-27 21:16:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (49, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:16:40', '2018-06-27 21:16:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (50, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:16:43', '2018-06-27 21:16:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (51, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:16:46', '2018-06-27 21:16:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (52, 1, 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:16:49', '2018-06-27 21:16:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (53, 1, 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:17:00', '2018-06-27 21:17:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (54, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:17:00', '2018-06-27 21:17:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (55, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:17:04', '2018-06-27 21:17:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (56, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:17:05', '2018-06-27 21:17:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (57, 1, 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:17:13', '2018-06-27 21:17:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (58, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:17:13', '2018-06-27 21:17:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (59, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:17:16', '2018-06-27 21:17:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (60, 1, 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u65e5\\u5fd7\\u7ba1\\u7406\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:17:24', '2018-06-27 21:17:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (61, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:17:24', '2018-06-27 21:17:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (62, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:17:33', '2018-06-27 21:17:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (63, 1, 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 21:17:48', '2018-06-27 21:17:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (64, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:17:49', '2018-06-27 21:17:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (65, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:17:52', '2018-06-27 21:17:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (66, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:18:18', '2018-06-27 21:18:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (67, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:18:54', '2018-06-27 21:18:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (68, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-27 21:23:57', '2018-06-27 21:23:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (69, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:42:56', '2018-06-27 21:42:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (70, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\"}', '2018-06-27 21:44:06', '2018-06-27 21:44:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (71, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:44:07', '2018-06-27 21:44:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (72, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:44:14', '2018-06-27 21:44:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (73, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:44:20', '2018-06-27 21:44:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (74, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:44:50', '2018-06-27 21:44:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (75, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:44:59', '2018-06-27 21:44:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (76, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2018-06-27 21:45:12', '2018-06-27 21:45:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (77, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:12', '2018-06-27 21:45:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (78, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"4fbJKpHRADZhlP6jvWCmJSNgu3qFWp66XXLBPPrn\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2018-06-27 21:45:16', '2018-06-27 21:45:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (79, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:17', '2018-06-27 21:45:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (80, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 21:45:19', '2018-06-27 21:45:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (81, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:22', '2018-06-27 21:45:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (82, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:25', '2018-06-27 21:45:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (83, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:26', '2018-06-27 21:45:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (84, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:27', '2018-06-27 21:45:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (85, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:28', '2018-06-27 21:45:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (86, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2018-06-27 21:45:50', '2018-06-27 21:45:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (87, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2018-06-27 21:45:53', '2018-06-27 21:45:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (88, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 21:45:55', '2018-06-27 21:45:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (89, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 22:34:13', '2018-06-27 22:34:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (90, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:34:56', '2018-06-27 22:34:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (91, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:01', '2018-06-27 22:35:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (92, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:22', '2018-06-27 22:35:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (93, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:28', '2018-06-27 22:35:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (94, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:31', '2018-06-27 22:35:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (95, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:35', '2018-06-27 22:35:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (96, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:38', '2018-06-27 22:35:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (97, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:40', '2018-06-27 22:35:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (98, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:35:42', '2018-06-27 22:35:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (99, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:36:05', '2018-06-27 22:36:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (100, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:36:14', '2018-06-27 22:36:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (101, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:36:25', '2018-06-27 22:36:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (102, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:36:28', '2018-06-27 22:36:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (103, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:36:31', '2018-06-27 22:36:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (104, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:37:13', '2018-06-27 22:37:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (105, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:37:18', '2018-06-27 22:37:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (106, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:37:20', '2018-06-27 22:37:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (107, 1, 'admin/auth/permissions/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:37:28', '2018-06-27 22:37:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (108, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:37:42', '2018-06-27 22:37:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (109, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2018-06-27 22:50:29', '2018-06-27 22:50:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (110, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:51:39', '2018-06-27 22:51:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (111, 1, 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:51:45', '2018-06-27 22:51:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (112, 1, 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"users\",\"name\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users\",\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-06-27 22:52:07', '2018-06-27 22:52:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (113, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-06-27 22:52:08', '2018-06-27 22:52:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (114, 1, 'admin/auth/permissions/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:52:20', '2018-06-27 22:52:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (115, 1, 'admin/auth/permissions/1', 'PUT', '192.168.10.1', '{\"slug\":\"*\",\"name\":\"\\u6240\\u6709\\u6743\\u9650\",\"http_method\":[null],\"http_path\":\"*\",\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-06-27 22:52:42', '2018-06-27 22:52:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (116, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-06-27 22:52:43', '2018-06-27 22:52:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (117, 1, 'admin/auth/permissions/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:52:52', '2018-06-27 22:52:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (118, 1, 'admin/auth/permissions/3', 'PUT', '192.168.10.1', '{\"slug\":\"auth.login\",\"name\":\"\\u767b\\u5f55\",\"http_method\":[null],\"http_path\":\"\\/auth\\/login\\r\\n\\/auth\\/logout\",\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-06-27 22:53:10', '2018-06-27 22:53:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (119, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-06-27 22:53:10', '2018-06-27 22:53:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (120, 1, 'admin/auth/permissions/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:53:15', '2018-06-27 22:53:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (121, 1, 'admin/auth/permissions/2', 'PUT', '192.168.10.1', '{\"slug\":\"dashboard\",\"name\":\"\\u9996\\u9875\",\"http_method\":[\"GET\",null],\"http_path\":\"\\/\",\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-06-27 22:53:29', '2018-06-27 22:53:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (122, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-06-27 22:53:29', '2018-06-27 22:53:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (123, 1, 'admin/auth/permissions/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:53:39', '2018-06-27 22:53:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (124, 1, 'admin/auth/permissions/4', 'PUT', '192.168.10.1', '{\"slug\":\"auth.setting\",\"name\":\"\\u7528\\u6237\\u8bbe\\u7f6e\",\"http_method\":[\"GET\",\"PUT\",null],\"http_path\":\"\\/auth\\/setting\",\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-06-27 22:53:46', '2018-06-27 22:53:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (125, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-06-27 22:53:46', '2018-06-27 22:53:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (126, 1, 'admin/auth/permissions/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:54:03', '2018-06-27 22:54:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (127, 1, 'admin/auth/permissions/5', 'PUT', '192.168.10.1', '{\"slug\":\"auth.management\",\"name\":\"\\u8eab\\u4efd\\u9a8c\\u8bc1\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/auth\\/roles\\r\\n\\/auth\\/permissions\\r\\n\\/auth\\/menu\\r\\n\\/auth\\/logs\",\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-06-27 22:54:13', '2018-06-27 22:54:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (128, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-06-27 22:54:14', '2018-06-27 22:54:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (129, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:54:22', '2018-06-27 22:54:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (130, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:54:24', '2018-06-27 22:54:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (131, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:54:26', '2018-06-27 22:54:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (132, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:54:28', '2018-06-27 22:54:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (133, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:54:45', '2018-06-27 22:54:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (134, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:54:49', '2018-06-27 22:54:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (135, 1, 'admin/auth/roles/1', 'PUT', '192.168.10.1', '{\"slug\":\"administrator\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"permissions\":[\"1\",null],\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/roles\"}', '2018-06-27 22:55:04', '2018-06-27 22:55:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (136, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '[]', '2018-06-27 22:55:04', '2018-06-27 22:55:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (137, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:55:07', '2018-06-27 22:55:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (138, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:55:09', '2018-06-27 22:55:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (139, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:55:11', '2018-06-27 22:55:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (140, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:55:13', '2018-06-27 22:55:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (141, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:55:14', '2018-06-27 22:55:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (142, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:56:17', '2018-06-27 22:56:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (143, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 22:56:18', '2018-06-27 22:56:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (144, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 23:10:50', '2018-06-27 23:10:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (145, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:10:55', '2018-06-27 23:10:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (146, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:10:57', '2018-06-27 23:10:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (147, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:13:20', '2018-06-27 23:13:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (148, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:13:22', '2018-06-27 23:13:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (149, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:17:57', '2018-06-27 23:17:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (150, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:18:01', '2018-06-27 23:18:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (151, 1, 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:18:03', '2018-06-27 23:18:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (152, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:18:54', '2018-06-27 23:18:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (153, 1, 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:20:33', '2018-06-27 23:20:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (154, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:20:40', '2018-06-27 23:20:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (155, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:33:42', '2018-06-27 23:33:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (156, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-27 23:34:15', '2018-06-27 23:34:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (157, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:34:22', '2018-06-27 23:34:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (158, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:35:31', '2018-06-27 23:35:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (159, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:35:34', '2018-06-27 23:35:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (160, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:35:37', '2018-06-27 23:35:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (161, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2018-06-27 23:36:11', '2018-06-27 23:36:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (162, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:37:28', '2018-06-27 23:37:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (163, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:37:38', '2018-06-27 23:37:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (164, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:37:41', '2018-06-27 23:37:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (165, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\"}', '2018-06-27 23:38:51', '2018-06-27 23:38:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (166, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 23:38:52', '2018-06-27 23:38:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (167, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:39:01', '2018-06-27 23:39:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (168, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:39:09', '2018-06-27 23:39:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (169, 1, 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:39:19', '2018-06-27 23:39:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (170, 1, 'admin/auth/menu/9', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u4ea7\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":null,\"roles\":[null],\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-27 23:39:40', '2018-06-27 23:39:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (171, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 23:39:40', '2018-06-27 23:39:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (172, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2018-06-27 23:39:53', '2018-06-27 23:39:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (173, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:39:54', '2018-06-27 23:39:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (174, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cube\",\"uri\":\"\\/products\",\"roles\":[null],\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\"}', '2018-06-27 23:40:36', '2018-06-27 23:40:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (175, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 23:40:36', '2018-06-27 23:40:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (176, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-27 23:40:44', '2018-06-27 23:40:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (177, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:40:50', '2018-06-27 23:40:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (178, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:53:16', '2018-06-27 23:53:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (179, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:53:50', '2018-06-27 23:53:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (180, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:53:53', '2018-06-27 23:53:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (181, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:53:56', '2018-06-27 23:53:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (182, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:54:11', '2018-06-27 23:54:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (183, 1, 'admin/auth/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:54:14', '2018-06-27 23:54:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (184, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:54:24', '2018-06-27 23:54:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (185, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:54:27', '2018-06-27 23:54:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (186, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2018-06-27 23:54:38', '2018-06-27 23:54:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (187, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:54:44', '2018-06-27 23:54:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (188, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-27 23:54:47', '2018-06-27 23:54:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (189, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2018-06-27 23:55:48', '2018-06-27 23:55:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (190, 1, 'admin/products', 'POST', '192.168.10.1', '{\"title\":\"Apple iPhone X (A1865) 64GB \\u94f6\\u8272 \\u79fb\\u52a8\\u8054\\u901a\\u7535\\u4fe14G\\u624b\\u673a\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"0\",\"skus\":{\"new_1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"200\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7599.00\",\"stock\":\"220\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\"}', '2018-06-28 00:04:08', '2018-06-28 00:04:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (191, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 00:04:08', '2018-06-28 00:04:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (192, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 00:04:16', '2018-06-28 00:04:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (193, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 00:04:30', '2018-06-28 00:04:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (194, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 00:05:04', '2018-06-28 00:05:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (195, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"Apple iPhone X (A1865) 64GB 256G \\u79fb\\u52a8\\u8054\\u901a\\u7535\\u4fe14G\\u624b\\u673a\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"200\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products\"}', '2018-06-28 00:06:04', '2018-06-28 00:06:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (196, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 00:06:04', '2018-06-28 00:06:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (197, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 00:06:09', '2018-06-28 00:06:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (198, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 00:06:14', '2018-06-28 00:06:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (199, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 01:25:37', '2018-06-28 01:25:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (200, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 01:25:57', '2018-06-28 01:25:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (201, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-28 01:43:42', '2018-06-28 01:43:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (202, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 01:43:48', '2018-06-28 01:43:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (203, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 01:43:51', '2018-06-28 01:43:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (204, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"Apple iPhone X (A1865) 64GB 256G \\u79fb\\u52a8\\u8054\\u901a\\u7535\\u4fe14G\\u624b\\u673a\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"200\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products\"}', '2018-06-28 01:43:57', '2018-06-28 01:43:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (205, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 01:43:57', '2018-06-28 01:43:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (206, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 01:48:10', '2018-06-28 01:48:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (207, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"Apple iPhone X\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"200\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"yfl17QOkrrbsjPodpiMnZtQ4DK1m0Enx80hxDdTv\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products\"}', '2018-06-28 01:51:16', '2018-06-28 01:51:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (208, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 01:51:17', '2018-06-28 01:51:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (209, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 02:26:01', '2018-06-28 02:26:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (210, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:26:08', '2018-06-28 02:26:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (211, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2018-06-28 02:26:12', '2018-06-28 02:26:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (212, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2018-06-28 02:26:15', '2018-06-28 02:26:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (213, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}', '2018-06-28 02:26:19', '2018-06-28 02:26:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (214, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-28 02:37:40', '2018-06-28 02:37:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (215, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:37:46', '2018-06-28 02:37:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (216, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 02:38:46', '2018-06-28 02:38:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (217, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 02:41:58', '2018-06-28 02:41:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (218, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:42:02', '2018-06-28 02:42:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (219, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2018-06-28 02:43:47', '2018-06-28 02:43:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (220, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2018-06-28 02:43:55', '2018-06-28 02:43:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (221, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"1\",\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:44:00', '2018-06-28 02:44:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (222, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:44:12', '2018-06-28 02:44:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (223, 1, 'admin/auth/users', 'GET', '192.168.10.1', '[]', '2018-06-28 02:45:04', '2018-06-28 02:45:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (224, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:45:10', '2018-06-28 02:45:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (225, 1, 'admin/products/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:45:23', '2018-06-28 02:45:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (226, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:45:34', '2018-06-28 02:45:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (227, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-28 02:45:46', '2018-06-28 02:45:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (228, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2018-06-28 11:34:08', '2018-06-28 11:34:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (229, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"Apple iPhone X\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"0\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"200\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"ZtlFkPbzWN0LqH6yob9dFdBtLxgtoBuHW2J1db7a\",\"_method\":\"PUT\"}', '2018-06-28 11:34:16', '2018-06-28 11:34:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (230, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-28 11:34:17', '2018-06-28 11:34:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (231, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-29 00:25:08', '2018-06-29 00:25:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (232, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-29 00:25:13', '2018-06-29 00:25:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (233, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 00:25:17', '2018-06-29 00:25:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (234, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 00:25:19', '2018-06-29 00:25:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (235, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 00:25:22', '2018-06-29 00:25:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (236, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"Apple iPhone X\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"200\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"Eg9xqAPEYEoZ5tlwAFDf2TVxLlM37HRZJICjv0Zc\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products\"}', '2018-06-29 00:25:30', '2018-06-29 00:25:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (237, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-29 00:25:31', '2018-06-29 00:25:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (238, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-29 12:38:40', '2018-06-29 12:38:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (239, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:38:44', '2018-06-29 12:38:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (240, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:38:47', '2018-06-29 12:38:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (241, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:38:49', '2018-06-29 12:38:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (242, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":null,\"roles\":[null],\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\"}', '2018-06-29 12:39:25', '2018-06-29 12:39:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (243, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-29 12:39:25', '2018-06-29 12:39:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (244, 1, 'admin/auth/menu/11/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:39:42', '2018-06-29 12:39:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (245, 1, 'admin/auth/menu/11', 'PUT', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/orders\",\"roles\":[null],\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/menu\"}', '2018-06-29 12:39:55', '2018-06-29 12:39:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (246, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-06-29 12:39:55', '2018-06-29 12:39:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (247, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-29 12:40:21', '2018-06-29 12:40:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (248, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:40:25', '2018-06-29 12:40:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (249, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:40:28', '2018-06-29 12:40:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (250, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:40:37', '2018-06-29 12:40:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (251, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 12:46:46', '2018-06-29 12:46:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (252, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 12:47:38', '2018-06-29 12:47:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (253, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 12:48:02', '2018-06-29 12:48:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (254, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 12:48:34', '2018-06-29 12:48:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (255, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:48:40', '2018-06-29 12:48:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (256, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:48:44', '2018-06-29 12:48:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (257, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:48:48', '2018-06-29 12:48:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (258, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:48:51', '2018-06-29 12:48:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (259, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:48:55', '2018-06-29 12:48:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (260, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-06-29 12:49:57', '2018-06-29 12:49:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (261, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:50:00', '2018-06-29 12:50:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (262, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:50:02', '2018-06-29 12:50:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (263, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 12:50:04', '2018-06-29 12:50:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (264, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 13:10:19', '2018-06-29 13:10:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (265, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 13:10:56', '2018-06-29 13:10:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (266, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:11:18', '2018-06-29 13:11:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (267, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:12:07', '2018-06-29 13:12:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (268, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:12:13', '2018-06-29 13:12:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (269, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:12:27', '2018-06-29 13:12:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (270, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:14:01', '2018-06-29 13:14:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (271, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:14:33', '2018-06-29 13:14:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (272, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 13:15:14', '2018-06-29 13:15:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (273, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:15:19', '2018-06-29 13:15:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (274, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"22222222222\"}', '2018-06-29 13:15:36', '2018-06-29 13:15:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (275, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 13:18:08', '2018-06-29 13:18:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (276, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"22222222222\"}', '2018-06-29 13:18:12', '2018-06-29 13:18:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (277, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"22222222222\"}', '2018-06-29 13:21:31', '2018-06-29 13:21:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (278, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 13:21:39', '2018-06-29 13:21:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (279, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 13:22:00', '2018-06-29 13:22:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (280, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 13:22:02', '2018-06-29 13:22:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (281, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:00:22', '2018-06-29 14:00:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (282, 1, 'admin/orders/ship/9', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:00:24', '2018-06-29 14:00:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (283, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-06-29 14:01:18', '2018-06-29 14:01:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (284, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 14:01:21', '2018-06-29 14:01:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (285, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:02:18', '2018-06-29 14:02:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (286, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:02:59', '2018-06-29 14:02:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (287, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-06-29 14:03:13', '2018-06-29 14:03:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (288, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 14:03:16', '2018-06-29 14:03:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (289, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:03:57', '2018-06-29 14:03:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (290, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:03:58', '2018-06-29 14:03:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (291, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:04:00', '2018-06-29 14:04:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (292, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:05:05', '2018-06-29 14:05:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (293, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:07:06', '2018-06-29 14:07:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (294, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:07:09', '2018-06-29 14:07:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (295, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:07:11', '2018-06-29 14:07:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (296, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:07:12', '2018-06-29 14:07:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (297, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:07:14', '2018-06-29 14:07:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (298, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:08:09', '2018-06-29 14:08:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (299, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:08:12', '2018-06-29 14:08:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (300, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:08:27', '2018-06-29 14:08:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (301, 1, 'admin/orders/ship', 'GET', '192.168.10.1', '[]', '2018-06-29 14:10:18', '2018-06-29 14:10:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (302, 1, 'admin/orders/ship', 'GET', '192.168.10.1', '[]', '2018-06-29 14:10:48', '2018-06-29 14:10:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (303, 1, 'admin/orders/ship', 'GET', '192.168.10.1', '[]', '2018-06-29 14:11:26', '2018-06-29 14:11:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (304, 1, 'admin/orders/ship', 'GET', '192.168.10.1', '[]', '2018-06-29 14:12:10', '2018-06-29 14:12:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (305, 1, 'admin/orders/ship', 'GET', '192.168.10.1', '[]', '2018-06-29 14:12:37', '2018-06-29 14:12:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (306, 1, 'admin/orders/ship', 'GET', '192.168.10.1', '[]', '2018-06-29 14:12:59', '2018-06-29 14:12:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (307, 1, 'admin/orders/9/ship', 'GET', '192.168.10.1', '[]', '2018-06-29 14:13:35', '2018-06-29 14:13:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (308, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:14:12', '2018-06-29 14:14:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (309, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:14:14', '2018-06-29 14:14:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (310, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:14:42', '2018-06-29 14:14:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (311, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:15:16', '2018-06-29 14:15:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (312, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:16:02', '2018-06-29 14:16:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (313, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:16:50', '2018-06-29 14:16:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (314, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:17:07', '2018-06-29 14:17:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (315, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:17:08', '2018-06-29 14:17:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (316, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:17:12', '2018-06-29 14:17:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (317, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:17:12', '2018-06-29 14:17:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (318, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:17:15', '2018-06-29 14:17:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (319, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:18:07', '2018-06-29 14:18:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (320, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:18:10', '2018-06-29 14:18:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (321, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:18:11', '2018-06-29 14:18:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (322, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:19:50', '2018-06-29 14:19:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (323, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":null,\"express_no\":null}', '2018-06-29 14:19:52', '2018-06-29 14:19:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (324, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:19:53', '2018-06-29 14:19:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (325, 1, 'admin/orders/9/ship', 'POST', '192.168.10.1', '{\"_token\":\"PBLbzJfMyyvcAmJKklbbWkBeddjuTSs0McAOXyFL\",\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"072086999626\"}', '2018-06-29 14:20:39', '2018-06-29 14:20:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (326, 1, 'admin/orders/9', 'GET', '192.168.10.1', '[]', '2018-06-29 14:20:39', '2018-06-29 14:20:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (327, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 14:20:50', '2018-06-29 14:20:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (328, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-06-29 18:11:24', '2018-06-29 18:11:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (329, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 18:11:28', '2018-06-29 18:11:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (330, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 18:11:31', '2018-06-29 18:11:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (331, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 18:11:33', '2018-06-29 18:11:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (332, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 18:11:35', '2018-06-29 18:11:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (333, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 18:11:57', '2018-06-29 18:11:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (334, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 18:12:01', '2018-06-29 18:12:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (335, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 18:12:03', '2018-06-29 18:12:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (336, 1, 'admin/products', 'POST', '192.168.10.1', '{\"title\":null,\"description\":null,\"on_sale\":\"0\",\"_token\":\"pvbmk8umwTwvdkPD0d1DF5buVXktl4rvg8BPMunY\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products\"}', '2018-06-29 18:12:07', '2018-06-29 18:12:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (337, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2018-06-29 18:12:07', '2018-06-29 18:12:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (338, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-06-29 20:24:04', '2018-06-29 20:24:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (339, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 20:24:10', '2018-06-29 20:24:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (340, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 20:24:13', '2018-06-29 20:24:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (341, 1, 'admin/products', 'POST', '192.168.10.1', '{\"title\":\"Apple \\/\\u82f9\\u679c 15\\u82f1\\u5bf8\\uff1aMacBook Pro 2.8GHz \\u5904\\u7406\\u5668 256GB \\u94f6\\u8272\",\"description\":\"<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t20830\\/224\\/1618156802\\/218595\\/7b4e8d3\\/5b304d58N2ea1de8d.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><br \\/>\\r\\n<img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/popWaterMark\\/jfs\\/t16891\\/27\\/1820503674\\/857706\\/f8d5f46f\\/5ad85b18N227a83e0.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p><br \\/>\\r\\n<img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/popWaterMark\\/jfs\\/t18124\\/28\\/1622289209\\/938192\\/d41f1a88\\/5ad15d41Nb23c985a.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"\\u94f6\\u8272 15\\u5bf8\",\"price\":\"0.1\",\"stock\":\"2000\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"\\u6df1\\u7a7a\\u7070\\u8272 15\\u5bf8\",\"price\":\"0.2\",\"stock\":\"2000\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"aNaFJkjaFAUCJxYhqQmMC7Kbri5H72pc1JSgAcqL\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products\"}', '2018-06-29 20:31:47', '2018-06-29 20:31:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (342, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-06-29 20:31:48', '2018-06-29 20:31:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (343, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 20:32:02', '2018-06-29 20:32:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (344, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 20:32:09', '2018-06-29 20:32:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (345, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2018-06-29 20:32:13', '2018-06-29 20:32:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (346, 1, 'admin/products/32/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 20:32:20', '2018-06-29 20:32:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (347, 1, 'admin/products/32', 'PUT', '192.168.10.1', '{\"title\":\"MacBook Pro\",\"description\":\"<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t20830\\/224\\/1618156802\\/218595\\/7b4e8d3\\/5b304d58N2ea1de8d.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><br \\/>\\r\\n<img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/popWaterMark\\/jfs\\/t16891\\/27\\/1820503674\\/857706\\/f8d5f46f\\/5ad85b18N227a83e0.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p><br \\/>\\r\\n<img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/popWaterMark\\/jfs\\/t18124\\/28\\/1622289209\\/938192\\/d41f1a88\\/5ad15d41Nb23c985a.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"93\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"\\u94f6\\u8272 15\\u5bf8\",\"price\":\"0.10\",\"stock\":\"2000\",\"id\":\"93\",\"_remove_\":\"0\"},\"94\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"\\u6df1\\u7a7a\\u7070\\u8272 15\\u5bf8\",\"price\":\"0.20\",\"stock\":\"2000\",\"id\":\"94\",\"_remove_\":\"0\"}},\"_token\":\"aNaFJkjaFAUCJxYhqQmMC7Kbri5H72pc1JSgAcqL\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products?&page=2\"}', '2018-06-29 20:35:42', '2018-06-29 20:35:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (348, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2018-06-29 20:35:43', '2018-06-29 20:35:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (349, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 20:41:58', '2018-06-29 20:41:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (350, 1, 'admin/orders/10', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-06-29 20:42:03', '2018-06-29 20:42:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (351, 1, 'admin/orders/10/ship', 'POST', '192.168.10.1', '{\"_token\":\"aNaFJkjaFAUCJxYhqQmMC7Kbri5H72pc1JSgAcqL\",\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"072086999627\"}', '2018-06-29 20:42:13', '2018-06-29 20:42:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (352, 1, 'admin/orders/10', 'GET', '192.168.10.1', '[]', '2018-06-29 20:42:13', '2018-06-29 20:42:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (353, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-07-04 03:40:10', '2018-07-04 03:40:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (354, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 03:40:15', '2018-07-04 03:40:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (355, 1, 'admin/orders/11', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 03:40:20', '2018-07-04 03:40:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (356, 1, 'admin/orders/11/ship', 'POST', '192.168.10.1', '{\"_token\":\"aNaFJkjaFAUCJxYhqQmMC7Kbri5H72pc1JSgAcqL\",\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"072086999628\"}', '2018-07-04 03:40:28', '2018-07-04 03:40:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (357, 1, 'admin/orders/11', 'GET', '192.168.10.1', '[]', '2018-07-04 03:40:29', '2018-07-04 03:40:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (358, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 03:52:52', '2018-07-04 03:52:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (359, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-07-04 03:52:55', '2018-07-04 03:52:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (360, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-07-04 20:19:34', '2018-07-04 20:19:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (361, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 20:19:43', '2018-07-04 20:19:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (362, 1, 'admin/orders/11', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 20:19:47', '2018-07-04 20:19:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (363, 1, 'admin/orders/11', 'GET', '192.168.10.1', '[]', '2018-07-04 20:20:03', '2018-07-04 20:20:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (364, 1, 'admin/orders/11/refund', 'POST', '192.168.10.1', '{\"agree\":false,\"reason\":\"\\u5df2\\u7ecf\\u53d1\\u8d27\\u4e0d\\u4e88\\u9000\\u6b3e\",\"_token\":\"9qptD9CjnJq5q4EaYTIxSnouR9rJ5sfONHiF29Dx\"}', '2018-07-04 20:21:16', '2018-07-04 20:21:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (365, 1, 'admin/orders/11', 'GET', '192.168.10.1', '[]', '2018-07-04 20:21:17', '2018-07-04 20:21:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (366, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:37:48', '2018-07-04 22:37:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (367, 1, 'admin/orders/10', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:37:57', '2018-07-04 22:37:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (368, 1, 'admin/orders/10', 'GET', '192.168.10.1', '[]', '2018-07-04 22:44:51', '2018-07-04 22:44:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (369, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:44:53', '2018-07-04 22:44:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (370, 1, 'admin/orders/10', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:44:56', '2018-07-04 22:44:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (371, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:44:59', '2018-07-04 22:44:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (372, 1, 'admin/orders/11', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:45:01', '2018-07-04 22:45:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (373, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:45:04', '2018-07-04 22:45:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (374, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:45:06', '2018-07-04 22:45:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (375, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:45:10', '2018-07-04 22:45:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (376, 1, 'admin/orders/11', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-04 22:45:16', '2018-07-04 22:45:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (377, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 01:07:51', '2018-07-05 01:07:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (378, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 01:07:55', '2018-07-05 01:07:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (379, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"icon\":\"fa-tags\",\"uri\":\"\\/coupon_codes\",\"roles\":[null],\"_token\":\"9qptD9CjnJq5q4EaYTIxSnouR9rJ5sfONHiF29Dx\"}', '2018-07-05 01:08:59', '2018-07-05 01:08:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (380, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-07-05 01:08:59', '2018-07-05 01:08:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (381, 1, 'admin/auth/menu/12/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 01:09:12', '2018-07-05 01:09:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (382, 1, 'admin/auth/menu/12/edit', 'GET', '192.168.10.1', '[]', '2018-07-05 01:09:18', '2018-07-05 01:09:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (383, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-07-05 01:09:18', '2018-07-05 01:09:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (384, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 01:09:23', '2018-07-05 01:09:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (385, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2018-07-05 01:09:30', '2018-07-05 01:09:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (386, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2018-07-05 02:05:59', '2018-07-05 02:05:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (387, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2018-07-05 02:31:40', '2018-07-05 02:31:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (388, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '[]', '2018-07-05 02:33:48', '2018-07-05 02:33:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (389, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 03:56:28', '2018-07-05 03:56:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (390, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 03:56:30', '2018-07-05 03:56:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (391, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 04:09:59', '2018-07-05 04:09:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (392, 1, 'admin/coupon_codes/create', 'GET', '192.168.10.1', '[]', '2018-07-05 04:10:41', '2018-07-05 04:10:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (393, 1, 'admin/coupon_codes/create', 'GET', '192.168.10.1', '[]', '2018-07-05 04:10:58', '2018-07-05 04:10:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (394, 1, 'admin/coupon_codes', 'POST', '192.168.10.1', '{\"name\":null,\"code\":null,\"value\":null,\"total\":null,\"min_amount\":null,\"not_before\":null,\"not_after\":null,\"enabled\":\"0\",\"_token\":\"9qptD9CjnJq5q4EaYTIxSnouR9rJ5sfONHiF29Dx\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/coupon_codes\"}', '2018-07-05 04:12:43', '2018-07-05 04:12:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (395, 1, 'admin/coupon_codes/create', 'GET', '192.168.10.1', '[]', '2018-07-05 04:12:44', '2018-07-05 04:12:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (396, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-07-05 09:17:20', '2018-07-05 09:17:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (397, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 09:17:25', '2018-07-05 09:17:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (398, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 09:17:26', '2018-07-05 09:17:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (399, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:40:12', '2018-07-05 11:40:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (400, 1, 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:41:06', '2018-07-05 11:41:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (401, 1, 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"products\",\"name\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/products\",\"_token\":\"ugNkbWlh0rV4EGdr4wfq96TcVieOTnnLJ1hTqZZW\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-07-05 11:41:42', '2018-07-05 11:41:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (402, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:41:43', '2018-07-05 11:41:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (403, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:41:52', '2018-07-05 11:41:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (404, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:41:54', '2018-07-05 11:41:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (405, 1, 'admin/auth/permissions/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:41:58', '2018-07-05 11:41:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (406, 1, 'admin/auth/permissions/7', 'PUT', '192.168.10.1', '{\"slug\":\"products\",\"name\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/products\",\"_token\":\"ugNkbWlh0rV4EGdr4wfq96TcVieOTnnLJ1hTqZZW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-07-05 11:42:05', '2018-07-05 11:42:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (407, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:42:06', '2018-07-05 11:42:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (408, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:43:12', '2018-07-05 11:43:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (409, 1, 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:43:21', '2018-07-05 11:43:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (410, 1, 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"orders\",\"name\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/orders\",\"_token\":\"ugNkbWlh0rV4EGdr4wfq96TcVieOTnnLJ1hTqZZW\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-07-05 11:43:37', '2018-07-05 11:43:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (411, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:43:37', '2018-07-05 11:43:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (412, 1, 'admin/auth/permissions/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:43:48', '2018-07-05 11:43:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (413, 1, 'admin/auth/permissions', 'POST', '192.168.10.1', '{\"slug\":\"coupon_codes\",\"name\":\"\\u4f18\\u60e0\\u5238\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/coupon_codes\",\"_token\":\"ugNkbWlh0rV4EGdr4wfq96TcVieOTnnLJ1hTqZZW\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/auth\\/permissions\"}', '2018-07-05 11:44:09', '2018-07-05 11:44:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (414, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:44:10', '2018-07-05 11:44:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (415, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:47:28', '2018-07-05 11:47:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (416, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:47:31', '2018-07-05 11:47:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (417, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '[]', '2018-07-05 11:47:34', '2018-07-05 11:47:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (418, 1, 'admin/auth/permissions/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:47:48', '2018-07-05 11:47:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (419, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-05 11:47:55', '2018-07-05 11:47:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (420, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-07-14 10:41:39', '2018-07-14 10:41:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (421, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-14 10:41:48', '2018-07-14 10:41:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (422, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-07-14 10:41:52', '2018-07-14 10:41:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (423, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-08-14 15:45:14', '2018-08-14 15:45:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (424, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-14 15:45:22', '2018-08-14 15:45:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (425, 1, 'admin/orders/11', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-14 15:45:26', '2018-08-14 15:45:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (426, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-08-16 17:13:04', '2018-08-16 17:13:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (427, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-16 17:13:10', '2018-08-16 17:13:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (428, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-16 17:13:12', '2018-08-16 17:13:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (429, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-08-16 17:13:15', '2018-08-16 17:13:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (430, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-09-25 14:32:39', '2018-09-25 14:32:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (431, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:32:51', '2018-09-25 14:32:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (432, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:33:11', '2018-09-25 14:33:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (433, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:33:14', '2018-09-25 14:33:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (434, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:33:17', '2018-09-25 14:33:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (435, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:33:30', '2018-09-25 14:33:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (436, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:33:32', '2018-09-25 14:33:32');
INSERT INTO `lnmp_admin_operation_log` VALUES (437, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:33:35', '2018-09-25 14:33:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (438, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:33:36', '2018-09-25 14:33:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (439, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:34:03', '2018-09-25 14:34:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (440, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:34:11', '2018-09-25 14:34:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (441, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:34:12', '2018-09-25 14:34:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (442, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:41:13', '2018-09-25 14:41:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (443, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:47:06', '2018-09-25 14:47:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (444, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:47:08', '2018-09-25 14:47:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (445, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:48:33', '2018-09-25 14:48:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (446, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-09-25 14:49:37', '2018-09-25 14:49:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (447, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-09-25 14:51:08', '2018-09-25 14:51:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (448, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-09-25 14:51:10', '2018-09-25 14:51:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (449, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-09-25 14:51:15', '2018-09-25 14:51:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (450, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:51:36', '2018-09-25 14:51:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (451, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:51:39', '2018-09-25 14:51:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (452, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:51:42', '2018-09-25 14:51:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (453, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:51:47', '2018-09-25 14:51:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (454, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:51:50', '2018-09-25 14:51:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (455, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:51:52', '2018-09-25 14:51:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (456, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:51:54', '2018-09-25 14:51:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (457, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:52:00', '2018-09-25 14:52:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (458, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:52:03', '2018-09-25 14:52:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (459, 1, 'admin/auth/roles/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:52:08', '2018-09-25 14:52:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (460, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:52:23', '2018-09-25 14:52:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (461, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:52:35', '2018-09-25 14:52:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (462, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:52:50', '2018-09-25 14:52:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (463, 1, 'admin/auth/setting', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:13', '2018-09-25 14:53:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (464, 1, 'admin/auth/setting', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:37', '2018-09-25 14:53:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (465, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:40', '2018-09-25 14:53:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (466, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:45', '2018-09-25 14:53:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (467, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:47', '2018-09-25 14:53:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (468, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:51', '2018-09-25 14:53:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (469, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:53', '2018-09-25 14:53:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (470, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:56', '2018-09-25 14:53:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (471, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:53:57', '2018-09-25 14:53:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (472, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"nuMIeOGFPDZS9QEX1mb51Ey8bSFtoiW3lFWoWltS\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2018-09-25 14:54:18', '2018-09-25 14:54:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (473, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-09-25 14:54:19', '2018-09-25 14:54:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (474, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-10-01 21:32:15', '2018-10-01 21:32:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (475, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:32:23', '2018-10-01 21:32:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (476, 1, 'admin/orders/14', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:32:58', '2018-10-01 21:32:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (477, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:33:07', '2018-10-01 21:33:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (478, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:33:13', '2018-10-01 21:33:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (479, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:34:25', '2018-10-01 21:34:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (480, 1, 'admin/orders/10', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:34:29', '2018-10-01 21:34:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (481, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:47:02', '2018-10-01 21:47:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (482, 1, 'admin/orders/14', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:47:05', '2018-10-01 21:47:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (483, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:47:14', '2018-10-01 21:47:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (484, 1, 'admin/orders/10', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 21:58:47', '2018-10-01 21:58:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (485, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 22:31:26', '2018-10-01 22:31:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (486, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 22:31:33', '2018-10-01 22:31:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (487, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 22:31:38', '2018-10-01 22:31:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (488, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-01 22:31:41', '2018-10-01 22:31:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (489, 1, 'admin/orders/11', 'GET', '192.168.10.1', '[]', '2018-10-01 22:31:51', '2018-10-01 22:31:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (490, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:04:36', '2018-10-02 00:04:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (491, 1, 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:04:40', '2018-10-02 00:04:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (492, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:04:45', '2018-10-02 00:04:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (493, 1, 'admin/coupon_codes/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:04:58', '2018-10-02 00:04:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (494, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:06:12', '2018-10-02 00:06:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (495, 1, 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:06:16', '2018-10-02 00:06:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (496, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:06:30', '2018-10-02 00:06:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (497, 1, 'admin/coupon_codes/10/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:06:33', '2018-10-02 00:06:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (498, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:06:41', '2018-10-02 00:06:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (499, 1, 'admin/coupon_codes/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:06:48', '2018-10-02 00:06:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (500, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 00:07:16', '2018-10-02 00:07:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (501, 1, 'admin/coupon_codes/6/edit', 'GET', '192.168.10.1', '[]', '2018-10-02 08:16:49', '2018-10-02 08:16:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (502, 1, 'admin/auth/login', 'GET', '192.168.10.1', '[]', '2018-10-02 08:16:57', '2018-10-02 08:16:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (503, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 08:17:03', '2018-10-02 08:17:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (504, 1, 'admin/coupon_codes/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 08:17:07', '2018-10-02 08:17:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (505, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 08:19:59', '2018-10-02 08:19:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (506, 1, 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 08:54:13', '2018-10-02 08:54:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (507, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 09:19:53', '2018-10-02 09:19:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (508, 1, 'admin/coupon_codes/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 09:48:53', '2018-10-02 09:48:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (509, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-02 13:21:33', '2018-10-02 13:21:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (510, 1, 'admin/auth/menu/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 13:22:53', '2018-10-02 13:22:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (511, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 13:23:07', '2018-10-02 13:23:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (512, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 13:23:11', '2018-10-02 13:23:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (513, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-02 13:28:45', '2018-10-02 13:28:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (514, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-10-21 22:03:16', '2018-10-21 22:03:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (515, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-10-21 22:03:59', '2018-10-21 22:03:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (516, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:04:12', '2018-10-21 22:04:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (517, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:17:13', '2018-10-21 22:17:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (518, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u5546\\u54c1\\u7c7b\\u76ee\",\"icon\":\"fa-align-justify\",\"uri\":\"\\/categories\",\"roles\":[null],\"_token\":\"CRxLMja2WGPT0VF3S869Ov5OCZCEJny6bkjAVHcF\"}', '2018-10-21 22:18:34', '2018-10-21 22:18:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (519, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-21 22:18:35', '2018-10-21 22:18:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (520, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-21 22:18:55', '2018-10-21 22:18:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (521, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:19:03', '2018-10-21 22:19:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (522, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:19:12', '2018-10-21 22:19:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (523, 1, 'admin/orders/14', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:19:25', '2018-10-21 22:19:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (524, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:19:31', '2018-10-21 22:19:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (525, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-10-21 22:19:46', '2018-10-21 22:19:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (526, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:19:53', '2018-10-21 22:19:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (527, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:20:49', '2018-10-21 22:20:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (528, 1, 'admin/orders/14', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:20:54', '2018-10-21 22:20:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (529, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:20:57', '2018-10-21 22:20:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (530, 1, 'admin/orders/14', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:21:00', '2018-10-21 22:21:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (531, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:21:03', '2018-10-21 22:21:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (532, 1, 'admin/orders/14', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:21:05', '2018-10-21 22:21:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (533, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:21:07', '2018-10-21 22:21:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (534, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:21:51', '2018-10-21 22:21:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (535, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-10-21 22:21:52', '2018-10-21 22:21:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (536, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:22:00', '2018-10-21 22:22:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (537, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:22:09', '2018-10-21 22:22:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (538, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:22:17', '2018-10-21 22:22:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (539, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"CRxLMja2WGPT0VF3S869Ov5OCZCEJny6bkjAVHcF\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2018-10-21 22:22:27', '2018-10-21 22:22:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (540, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:22:28', '2018-10-21 22:22:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (541, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:22:35', '2018-10-21 22:22:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (542, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-21 22:22:36', '2018-10-21 22:22:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (543, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-21 22:22:39', '2018-10-21 22:22:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (544, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:22:44', '2018-10-21 22:22:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (545, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:22:46', '2018-10-21 22:22:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (546, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:22:48', '2018-10-21 22:22:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (547, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:22:49', '2018-10-21 22:22:49');
INSERT INTO `lnmp_admin_operation_log` VALUES (548, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:06', '2018-10-21 22:23:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (549, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:23:07', '2018-10-21 22:23:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (550, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:12', '2018-10-21 22:23:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (551, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:23:13', '2018-10-21 22:23:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (552, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:15', '2018-10-21 22:23:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (553, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:18', '2018-10-21 22:23:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (554, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:23:18', '2018-10-21 22:23:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (555, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:21', '2018-10-21 22:23:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (556, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:23', '2018-10-21 22:23:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (557, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:23:24', '2018-10-21 22:23:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (558, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:26', '2018-10-21 22:23:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (559, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:29', '2018-10-21 22:23:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (560, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:31', '2018-10-21 22:23:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (561, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:33', '2018-10-21 22:23:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (562, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-10-21 22:23:33', '2018-10-21 22:23:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (563, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-10-21 22:23:46', '2018-10-21 22:23:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (564, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:51', '2018-10-21 22:23:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (565, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:23:58', '2018-10-21 22:23:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (566, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:24:01', '2018-10-21 22:24:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (567, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:24:04', '2018-10-21 22:24:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (568, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:24:06', '2018-10-21 22:24:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (569, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-10-21 22:24:28', '2018-10-21 22:24:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (570, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-10-21 22:24:30', '2018-10-21 22:24:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (571, 1, 'admin/coupon_codes', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:24:35', '2018-10-21 22:24:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (572, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:24:37', '2018-10-21 22:24:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (573, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-10-21 22:25:26', '2018-10-21 22:25:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (574, 1, 'admin/orders/14', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:25:30', '2018-10-21 22:25:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (575, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:25:35', '2018-10-21 22:25:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (576, 1, 'admin/orders/9', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:25:38', '2018-10-21 22:25:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (577, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:25:41', '2018-10-21 22:25:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (578, 1, 'admin/orders/10', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:25:44', '2018-10-21 22:25:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (579, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:25:47', '2018-10-21 22:25:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (580, 1, 'admin/orders', 'GET', '192.168.10.1', '[]', '2018-10-21 22:26:01', '2018-10-21 22:26:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (581, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:26:06', '2018-10-21 22:26:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (582, 1, 'admin/categories/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:26:09', '2018-10-21 22:26:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (583, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:26:24', '2018-10-21 22:26:24');
INSERT INTO `lnmp_admin_operation_log` VALUES (584, 1, 'admin/categories/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:26:28', '2018-10-21 22:26:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (585, 1, 'admin/categories/2/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:26:41', '2018-10-21 22:26:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (586, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:27:34', '2018-10-21 22:27:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (587, 1, 'admin/categories/8/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:27:41', '2018-10-21 22:27:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (588, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"er\"}', '2018-10-21 22:28:09', '2018-10-21 22:28:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (589, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"e\"}', '2018-10-21 22:28:10', '2018-10-21 22:28:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (590, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"er\"}', '2018-10-21 22:28:11', '2018-10-21 22:28:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (591, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"er\'ji\"}', '2018-10-21 22:28:11', '2018-10-21 22:28:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (592, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u8033\\u673a\"}', '2018-10-21 22:28:11', '2018-10-21 22:28:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (593, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"s\'ho\"}', '2018-10-21 22:28:18', '2018-10-21 22:28:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (594, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"sho\'h\"}', '2018-10-21 22:28:18', '2018-10-21 22:28:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (595, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"s\'ho\"}', '2018-10-21 22:28:19', '2018-10-21 22:28:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (596, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"shou\"}', '2018-10-21 22:28:19', '2018-10-21 22:28:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (597, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u624b\\u673a\"}', '2018-10-21 22:28:20', '2018-10-21 22:28:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (598, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:28:48', '2018-10-21 22:28:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (599, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:28:54', '2018-10-21 22:28:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (600, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"s\'ho\"}', '2018-10-21 22:28:59', '2018-10-21 22:28:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (601, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"sho\'h\"}', '2018-10-21 22:28:59', '2018-10-21 22:28:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (602, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"s\'ho\"}', '2018-10-21 22:29:00', '2018-10-21 22:29:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (603, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"shou\"}', '2018-10-21 22:29:01', '2018-10-21 22:29:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (604, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u624b\\u673a\"}', '2018-10-21 22:29:01', '2018-10-21 22:29:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (605, 1, 'admin/categories/7', 'PUT', '192.168.10.1', '{\"name\":\"\\u8033\\u673a\",\"is_directory\":\"1\",\"parent_id\":\"1\",\"_token\":\"CRxLMja2WGPT0VF3S869Ov5OCZCEJny6bkjAVHcF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/categories\"}', '2018-10-21 22:29:09', '2018-10-21 22:29:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (606, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:29:10', '2018-10-21 22:29:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (607, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-21 22:29:14', '2018-10-21 22:29:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (608, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:29:25', '2018-10-21 22:29:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (609, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:29:36', '2018-10-21 22:29:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (610, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:29:43', '2018-10-21 22:29:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (611, 1, 'admin/categories/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:29:45', '2018-10-21 22:29:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (612, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:29:48', '2018-10-21 22:29:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (613, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:30:07', '2018-10-21 22:30:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (614, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:30:40', '2018-10-21 22:30:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (615, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:33:57', '2018-10-21 22:33:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (616, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:36:03', '2018-10-21 22:36:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (617, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:36:48', '2018-10-21 22:36:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (618, 1, 'admin/categories/7/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:36:56', '2018-10-21 22:36:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (619, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:37:16', '2018-10-21 22:37:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (620, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:37:22', '2018-10-21 22:37:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (621, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:37:25', '2018-10-21 22:37:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (622, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2018-10-21 22:52:27', '2018-10-21 22:52:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (623, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"sho\"}', '2018-10-21 22:52:34', '2018-10-21 22:52:34');
INSERT INTO `lnmp_admin_operation_log` VALUES (624, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"shou\"}', '2018-10-21 22:52:36', '2018-10-21 22:52:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (625, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"shouji\"}', '2018-10-21 22:52:36', '2018-10-21 22:52:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (626, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"s\"}', '2018-10-21 22:52:37', '2018-10-21 22:52:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (627, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"shou\"}', '2018-10-21 22:52:39', '2018-10-21 22:52:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (628, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\"}', '2018-10-21 22:52:39', '2018-10-21 22:52:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (629, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\"}', '2018-10-21 22:52:44', '2018-10-21 22:52:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (630, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"sh\'j\'ou\"}', '2018-10-21 22:52:51', '2018-10-21 22:52:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (631, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u65f6\\u95f4\\u5076\"}', '2018-10-21 22:52:52', '2018-10-21 22:52:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (632, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:52:57', '2018-10-21 22:52:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (633, 1, 'admin/products/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:53:03', '2018-10-21 22:53:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (634, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"s\'ho\"}', '2018-10-21 22:53:07', '2018-10-21 22:53:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (635, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"shou\'ji\"}', '2018-10-21 22:53:07', '2018-10-21 22:53:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (636, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\\u5361\"}', '2018-10-21 22:53:08', '2018-10-21 22:53:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (637, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\"}', '2018-10-21 22:53:09', '2018-10-21 22:53:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (638, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"er\"}', '2018-10-21 22:53:21', '2018-10-21 22:53:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (639, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u8033\\u673a\"}', '2018-10-21 22:53:22', '2018-10-21 22:53:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (640, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:53:48', '2018-10-21 22:53:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (641, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-10-21 22:56:28', '2018-10-21 22:56:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (642, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\",\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:56:55', '2018-10-21 22:56:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (643, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2018-10-21 22:56:59', '2018-10-21 22:56:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (644, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"2\"}', '2018-10-21 22:57:03', '2018-10-21 22:57:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (645, 1, 'admin/products/32/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-21 22:57:54', '2018-10-21 22:57:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (646, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"dian\"}', '2018-10-21 22:58:02', '2018-10-21 22:58:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (647, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"d\"}', '2018-10-21 22:58:03', '2018-10-21 22:58:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (648, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"dian\'n\"}', '2018-10-21 22:58:04', '2018-10-21 22:58:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (649, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u7535\\u8111\"}', '2018-10-21 22:58:04', '2018-10-21 22:58:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (650, 1, 'admin/products/32', 'PUT', '192.168.10.1', '{\"title\":\"MacBook Pro\",\"category_id\":\"20\",\"description\":\"<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t20830\\/224\\/1618156802\\/218595\\/7b4e8d3\\/5b304d58N2ea1de8d.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><br \\/>\\r\\n<img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/popWaterMark\\/jfs\\/t16891\\/27\\/1820503674\\/857706\\/f8d5f46f\\/5ad85b18N227a83e0.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p><br \\/>\\r\\n<img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/popWaterMark\\/jfs\\/t18124\\/28\\/1622289209\\/938192\\/d41f1a88\\/5ad15d41Nb23c985a.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"93\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"\\u94f6\\u8272 15\\u5bf8\",\"price\":\"0.10\",\"stock\":\"1999\",\"id\":\"93\",\"_remove_\":\"0\"},\"94\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"\\u6df1\\u7a7a\\u7070\\u8272 15\\u5bf8\",\"price\":\"0.20\",\"stock\":\"1997\",\"id\":\"94\",\"_remove_\":\"0\"}},\"_token\":\"CRxLMja2WGPT0VF3S869Ov5OCZCEJny6bkjAVHcF\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products?&page=2\"}', '2018-10-21 22:58:14', '2018-10-21 22:58:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (651, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2018-10-21 22:58:14', '2018-10-21 22:58:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (652, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2018-10-21 23:00:27', '2018-10-21 23:00:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (653, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"1\",\"_pjax\":\"#pjax-container\"}', '2018-10-21 23:00:32', '2018-10-21 23:00:32');
INSERT INTO `lnmp_admin_operation_log` VALUES (654, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-10-22 13:11:17', '2018-10-22 13:11:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (655, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 13:31:52', '2018-10-22 13:31:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (656, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:26:55', '2018-10-22 15:26:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (657, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u4f17\\u7b79\\u5546\\u54c1\",\"icon\":\"fa-flag-checkered\",\"uri\":\"\\/crowdfunding_products\",\"roles\":[null],\"_token\":\"SZ5lnMQ0IfZpVLt4di3SmdZZp1dE3bwuzXVlckB1\"}', '2018-10-22 15:28:00', '2018-10-22 15:28:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (658, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-22 15:28:02', '2018-10-22 15:28:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (659, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"SZ5lnMQ0IfZpVLt4di3SmdZZp1dE3bwuzXVlckB1\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":10},{\\\"id\\\":14},{\\\"id\\\":11},{\\\"id\\\":12}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2018-10-22 15:28:16', '2018-10-22 15:28:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (660, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:28:16', '2018-10-22 15:28:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (661, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-22 15:28:20', '2018-10-22 15:28:20');
INSERT INTO `lnmp_admin_operation_log` VALUES (662, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:28:27', '2018-10-22 15:28:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (663, 1, 'admin/crowdfunding_products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:28:32', '2018-10-22 15:28:32');
INSERT INTO `lnmp_admin_operation_log` VALUES (664, 1, 'admin/crowdfunding_products/create', 'GET', '192.168.10.1', '[]', '2018-10-22 15:29:40', '2018-10-22 15:29:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (665, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\"}', '2018-10-22 15:37:02', '2018-10-22 15:37:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (666, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673ato\"}', '2018-10-22 15:37:04', '2018-10-22 15:37:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (667, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\\u901a\\u8baf\"}', '2018-10-22 15:37:05', '2018-10-22 15:37:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (668, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673atong\'x\"}', '2018-10-22 15:37:05', '2018-10-22 15:37:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (669, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\"}', '2018-10-22 15:37:09', '2018-10-22 15:37:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (670, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-22 15:37:22', '2018-10-22 15:37:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (671, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:37:27', '2018-10-22 15:37:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (672, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\\u901a\\u8baf\"}', '2018-10-22 15:37:38', '2018-10-22 15:37:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (673, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\\u673a\"}', '2018-10-22 15:37:53', '2018-10-22 15:37:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (674, 1, 'admin/crowdfunding_products', 'POST', '192.168.10.1', '{\"type\":\"crowdfunding\",\"title\":\"iPhoneXS\",\"category_id\":\"25\",\"description\":\"<p>Apple iPhone XS (A2100) 64GB \\u91d1\\u8272 \\u79fb\\u52a8\\u8054\\u901a\\u7535\\u4fe14G\\u624b\\u673a<\\/p>\",\"on_sale\":\"1\",\"crowdfunding\":{\"target_amount\":\"1000000\",\"end_at\":\"2019-01-01 00:00:00\"},\"skus\":{\"new_1\":{\"title\":\"\\u6982\\u5ff5\\u7248 iPhone XS  \\u4e00\\u53f0\",\"description\":\"\\u4f17\\u7b79\\u4f18\\u60e0\\u52b510000\",\"price\":\"10000\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"title\":\"\\u6982\\u5ff5\\u7248 iPhone XS  \\u4e24\\u53f0\",\"description\":\"\\u4f17\\u7b79\\u4f18\\u60e0\\u52b59000\",\"price\":\"18000\",\"stock\":\"50\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"SZ5lnMQ0IfZpVLt4di3SmdZZp1dE3bwuzXVlckB1\"}', '2018-10-22 15:53:02', '2018-10-22 15:53:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (675, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '[]', '2018-10-22 15:53:03', '2018-10-22 15:53:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (676, 1, 'admin/crowdfunding_products/create', 'GET', '192.168.10.1', '[]', '2018-10-22 15:53:05', '2018-10-22 15:53:05');
INSERT INTO `lnmp_admin_operation_log` VALUES (677, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:53:12', '2018-10-22 15:53:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (678, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:53:15', '2018-10-22 15:53:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (679, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2018-10-22 15:53:16', '2018-10-22 15:53:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (680, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:53:37', '2018-10-22 15:53:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (681, 1, 'admin/crowdfunding_products/63/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:53:41', '2018-10-22 15:53:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (682, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:53:47', '2018-10-22 15:53:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (683, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:54:03', '2018-10-22 15:54:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (684, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:54:18', '2018-10-22 15:54:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (685, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:54:23', '2018-10-22 15:54:23');
INSERT INTO `lnmp_admin_operation_log` VALUES (686, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"id\":\"63\"}', '2018-10-22 15:54:28', '2018-10-22 15:54:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (687, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 15:54:35', '2018-10-22 15:54:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (688, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"4\"}', '2018-10-22 15:54:38', '2018-10-22 15:54:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (689, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\"}', '2018-10-22 16:14:18', '2018-10-22 16:14:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (690, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:14:26', '2018-10-22 16:14:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (691, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:14:29', '2018-10-22 16:14:29');
INSERT INTO `lnmp_admin_operation_log` VALUES (692, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:14:33', '2018-10-22 16:14:33');
INSERT INTO `lnmp_admin_operation_log` VALUES (693, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:27:43', '2018-10-22 16:27:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (694, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:27:48', '2018-10-22 16:27:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (695, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:27:51', '2018-10-22 16:27:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (696, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:27:56', '2018-10-22 16:27:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (697, 1, 'admin/products/62/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:27:59', '2018-10-22 16:27:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (698, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-10-22 16:28:15', '2018-10-22 16:28:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (699, 1, 'admin/products/62/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:28:19', '2018-10-22 16:28:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (700, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:28:54', '2018-10-22 16:28:54');
INSERT INTO `lnmp_admin_operation_log` VALUES (701, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:28:58', '2018-10-22 16:28:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (702, 1, 'admin/crowdfunding_products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:29:01', '2018-10-22 16:29:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (703, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:29:03', '2018-10-22 16:29:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (704, 1, 'admin/crowdfunding_products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:29:06', '2018-10-22 16:29:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (705, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:29:09', '2018-10-22 16:29:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (706, 1, 'admin/crowdfunding_products/63/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:29:12', '2018-10-22 16:29:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (707, 1, 'admin/crowdfunding_products/63/edit', 'GET', '192.168.10.1', '[]', '2018-10-22 16:29:18', '2018-10-22 16:29:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (708, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:29:25', '2018-10-22 16:29:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (709, 1, 'admin/crowdfunding_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:29:42', '2018-10-22 16:29:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (710, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:30:47', '2018-10-22 16:30:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (711, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:30:52', '2018-10-22 16:30:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (712, 1, 'admin/auth/users/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:30:55', '2018-10-22 16:30:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (713, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:31:07', '2018-10-22 16:31:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (714, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:31:10', '2018-10-22 16:31:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (715, 1, 'admin/auth/users/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:31:13', '2018-10-22 16:31:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (716, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:31:15', '2018-10-22 16:31:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (717, 1, 'admin/auth/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:31:18', '2018-10-22 16:31:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (718, 1, 'admin/auth/users/1', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:31:21', '2018-10-22 16:31:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (719, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:34:02', '2018-10-22 16:34:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (720, 1, 'admin/products/62/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:34:06', '2018-10-22 16:34:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (721, 1, 'admin/products/62/edit', 'GET', '192.168.10.1', '[]', '2018-10-22 16:34:17', '2018-10-22 16:34:17');
INSERT INTO `lnmp_admin_operation_log` VALUES (722, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-22 16:34:26', '2018-10-22 16:34:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (723, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-10-23 17:01:46', '2018-10-23 17:01:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (724, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-23 17:01:59', '2018-10-23 17:01:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (725, 1, 'admin/auth/roles/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-23 17:02:03', '2018-10-23 17:02:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (726, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-23 17:02:09', '2018-10-23 17:02:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (727, 1, 'admin/auth/permissions/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-23 17:02:16', '2018-10-23 17:02:16');
INSERT INTO `lnmp_admin_operation_log` VALUES (728, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-23 17:02:36', '2018-10-23 17:02:36');
INSERT INTO `lnmp_admin_operation_log` VALUES (729, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-10-25 15:15:59', '2018-10-25 15:15:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (730, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:16:06', '2018-10-25 15:16:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (731, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:16:09', '2018-10-25 15:16:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (732, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:16:11', '2018-10-25 15:16:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (733, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:16:13', '2018-10-25 15:16:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (734, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:19:56', '2018-10-25 15:19:56');
INSERT INTO `lnmp_admin_operation_log` VALUES (735, 1, 'admin/auth/roles', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:20:00', '2018-10-25 15:20:00');
INSERT INTO `lnmp_admin_operation_log` VALUES (736, 1, 'admin/auth/permissions', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:20:03', '2018-10-25 15:20:03');
INSERT INTO `lnmp_admin_operation_log` VALUES (737, 1, 'admin/auth/permissions/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-25 15:20:13', '2018-10-25 15:20:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (738, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-10-26 14:30:10', '2018-10-26 14:30:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (739, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 14:30:18', '2018-10-26 14:30:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (740, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 14:30:21', '2018-10-26 14:30:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (741, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 14:30:22', '2018-10-26 14:30:22');
INSERT INTO `lnmp_admin_operation_log` VALUES (742, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2018-10-26 14:30:30', '2018-10-26 14:30:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (743, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2018-10-26 14:32:42', '2018-10-26 14:32:42');
INSERT INTO `lnmp_admin_operation_log` VALUES (744, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2018-10-26 14:33:01', '2018-10-26 14:33:01');
INSERT INTO `lnmp_admin_operation_log` VALUES (745, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2018-10-26 14:33:57', '2018-10-26 14:33:57');
INSERT INTO `lnmp_admin_operation_log` VALUES (746, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 14:34:55', '2018-10-26 14:34:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (747, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2018-10-26 14:35:30', '2018-10-26 14:35:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (748, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"4\"}', '2018-10-26 14:35:35', '2018-10-26 14:35:35');
INSERT INTO `lnmp_admin_operation_log` VALUES (749, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 14:35:38', '2018-10-26 14:35:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (750, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"type\":\"normal\",\"title\":\"Apple iPhone X\",\"category_id\":\"23\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"198\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"properties\":{\"new_1\":{\"name\":\"\\u54c1\\u724c\\u540d\\u79f0\",\"value\":\"\\u82f9\\u679c\\/Apple\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u94f6\\u8272\",\"id\":null,\"_remove_\":\"0\"},\"new_3\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u7070\\u8272\",\"id\":null,\"_remove_\":\"0\"},\"new_4\":{\"name\":\"\\u5b58\\u50a8\\u5bb9\\u91cf\",\"value\":\"256G\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"ADqxz1HaaBlTruhNSLDDiwVvMcTEDeu2Rx5nD2tr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products?&page=4\"}', '2018-10-26 14:37:13', '2018-10-26 14:37:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (751, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\"}', '2018-10-26 14:37:14', '2018-10-26 14:37:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (752, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 14:37:18', '2018-10-26 14:37:18');
INSERT INTO `lnmp_admin_operation_log` VALUES (753, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\"}', '2018-10-26 14:37:30', '2018-10-26 14:37:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (754, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\"}', '2018-10-26 14:37:32', '2018-10-26 14:37:32');
INSERT INTO `lnmp_admin_operation_log` VALUES (755, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zi\"}', '2018-10-26 14:37:37', '2018-10-26 14:37:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (756, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zi\'len\"}', '2018-10-26 14:37:39', '2018-10-26 14:37:39');
INSERT INTO `lnmp_admin_operation_log` VALUES (757, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zi\"}', '2018-10-26 14:37:40', '2018-10-26 14:37:40');
INSERT INTO `lnmp_admin_operation_log` VALUES (758, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zi\'neng\"}', '2018-10-26 14:37:41', '2018-10-26 14:37:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (759, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u81ea\\u80fd\"}', '2018-10-26 14:37:41', '2018-10-26 14:37:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (760, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u81ea\"}', '2018-10-26 14:37:43', '2018-10-26 14:37:43');
INSERT INTO `lnmp_admin_operation_log` VALUES (761, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"z\"}', '2018-10-26 14:37:45', '2018-10-26 14:37:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (762, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zh\"}', '2018-10-26 14:37:46', '2018-10-26 14:37:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (763, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\"}', '2018-10-26 14:37:46', '2018-10-26 14:37:46');
INSERT INTO `lnmp_admin_operation_log` VALUES (764, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'do\"}', '2018-10-26 14:37:47', '2018-10-26 14:37:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (765, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'do\'g\"}', '2018-10-26 14:37:47', '2018-10-26 14:37:47');
INSERT INTO `lnmp_admin_operation_log` VALUES (766, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'do\"}', '2018-10-26 14:37:48', '2018-10-26 14:37:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (767, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'dong\"}', '2018-10-26 14:37:48', '2018-10-26 14:37:48');
INSERT INTO `lnmp_admin_operation_log` VALUES (768, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"z\"}', '2018-10-26 14:37:50', '2018-10-26 14:37:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (769, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zi\"}', '2018-10-26 14:37:50', '2018-10-26 14:37:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (770, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"z\"}', '2018-10-26 14:37:51', '2018-10-26 14:37:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (771, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\"}', '2018-10-26 14:37:51', '2018-10-26 14:37:51');
INSERT INTO `lnmp_admin_operation_log` VALUES (772, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'neng\"}', '2018-10-26 14:37:52', '2018-10-26 14:37:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (773, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\"}', '2018-10-26 14:37:53', '2018-10-26 14:37:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (774, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"type\":\"normal\",\"title\":\"Apple iPhone X\",\"category_id\":\"25\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"198\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"properties\":{\"1\":{\"name\":\"\\u54c1\\u724c\\u540d\\u79f0\",\"value\":\"\\u82f9\\u679c\\/Apple\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u94f6\\u8272\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u7070\\u8272\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"\\u5b58\\u50a8\\u5bb9\\u91cf\",\"value\":\"256G\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"ADqxz1HaaBlTruhNSLDDiwVvMcTEDeu2Rx5nD2tr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products?&page=4\"}', '2018-10-26 14:37:58', '2018-10-26 14:37:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (775, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\"}', '2018-10-26 14:37:58', '2018-10-26 14:37:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (776, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 15:00:37', '2018-10-26 15:00:37');
INSERT INTO `lnmp_admin_operation_log` VALUES (777, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"type\":\"normal\",\"title\":\"Apple iPhone X\",\"long_title\":\"2018\\u6700\\u65b0\\u6b3e iPhone X 256G \\u82f9\\u679c\\u624b\\u673a\",\"category_id\":\"25\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"198\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"properties\":{\"1\":{\"name\":\"\\u54c1\\u724c\\u540d\\u79f0\",\"value\":\"\\u82f9\\u679c\\/Apple\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u94f6\\u8272\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u7070\\u8272\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"\\u5b58\\u50a8\\u5bb9\\u91cf\",\"value\":\"256G\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"ADqxz1HaaBlTruhNSLDDiwVvMcTEDeu2Rx5nD2tr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products?&page=4\"}', '2018-10-26 15:03:58', '2018-10-26 15:03:58');
INSERT INTO `lnmp_admin_operation_log` VALUES (778, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\"}', '2018-10-26 15:03:59', '2018-10-26 15:03:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (779, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 15:30:52', '2018-10-26 15:30:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (780, 1, 'admin/products/70/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 17:24:25', '2018-10-26 17:24:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (781, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 17:42:59', '2018-10-26 17:42:59');
INSERT INTO `lnmp_admin_operation_log` VALUES (782, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"4\"}', '2018-10-26 17:43:04', '2018-10-26 17:43:04');
INSERT INTO `lnmp_admin_operation_log` VALUES (783, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 17:43:08', '2018-10-26 17:43:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (784, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"type\":\"normal\",\"title\":\"Apple iPhone X\",\"long_title\":\"2018\\u6700\\u65b0\\u6b3e iPhone X 256G \\u82f9\\u679c\\u624b\\u673a\",\"category_id\":\"25\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"198\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"properties\":{\"1\":{\"name\":\"\\u54c1\\u724c\\u540d\\u79f0\",\"value\":\"\\u82f9\\u679c\\/Apple\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u94f6\\u8272\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u7070\\u8272\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"\\u5b58\\u50a8\\u5bb9\\u91cf\",\"value\":\"256G\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"ADqxz1HaaBlTruhNSLDDiwVvMcTEDeu2Rx5nD2tr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products?&page=4\"}', '2018-10-26 17:43:15', '2018-10-26 17:43:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (785, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\"}', '2018-10-26 17:43:15', '2018-10-26 17:43:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (786, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-26 17:44:44', '2018-10-26 17:44:44');
INSERT INTO `lnmp_admin_operation_log` VALUES (787, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"type\":\"normal\",\"title\":\"Apple iPhone X 256G\",\"long_title\":\"2018\\u6700\\u65b0\\u6b3e iPhone X 256G \\u82f9\\u679c\\u624b\\u673a\",\"category_id\":\"25\",\"description\":\"<p>\\u200b\\u200b\\u200b\\u200b<a href=\\\"https:\\/\\/sale.jd.com\\/act\\/XpbwM0G1ZaW.html\\\" target=\\\"_blank\\\"><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t24250\\/4\\/221454018\\/20495\\/68e604c7\\/5b29b6d2Ne6da1187.jpg\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/cms\\/jfs\\/t20224\\/64\\/1456783694\\/118133\\/e7b04d48\\/5b2a122fN098e03ad.jpg\\\" style=\\\"height:223px; width:750px\\\" \\/><\\/p>\\r\\n\\r\\n<table align=\\\"center\\\" border=\\\"0\\\" cellpadding=\\\"0\\\" cellspacing=\\\"0\\\" style=\\\"height:1272px; width:750px\\\">\\r\\n\\t<tbody>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t16873\\/173\\/2429368143\\/84521\\/f722c057\\/5af564e5N4c0d564f.jpg\\\" style=\\\"height:249px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t18493\\/37\\/635247604\\/42841\\/b751e11f\\/5a9cfa70Nd0637367.jpg\\\" style=\\\"height:341px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t17668\\/348\\/2483879516\\/82843\\/ff7ca37c\\/5af78e10N103afbd7.jpg\\\" style=\\\"height:405px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t\\t<tr>\\r\\n\\t\\t\\t<td><img alt=\\\"\\\" src=\\\"https:\\/\\/img10.360buyimg.com\\/imgzone\\/jfs\\/t15079\\/323\\/2344529912\\/61849\\/ce9798d9\\/5a9cfa70N43f7357c.jpg\\\" style=\\\"height:277px; width:750px\\\" \\/><\\/td>\\r\\n\\t\\t<\\/tr>\\r\\n\\t<\\/tbody>\\r\\n<\\/table>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\\" src=\\\"https:\\/\\/img30.360buyimg.com\\/jgsq-productsoa\\/jfs\\/t9724\\/59\\/1430591780\\/2138721\\/c72f6394\\/59e0726aN1edf23c4.jpg\\\" \\/><\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"\\u94f6\\u8272\",\"description\":\"Apple iPhone X \\u94f6\\u8272\",\"price\":\"7599.00\",\"stock\":\"198\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"title\":\"\\u6df1\\u7a7a\\u7070\\u8272\",\"description\":\"Apple iPhone X \\u6df1\\u7a7a\\u7070\\u8272\",\"price\":\"7699.00\",\"stock\":\"220\",\"id\":\"2\",\"_remove_\":\"0\"}},\"properties\":{\"1\":{\"name\":\"\\u54c1\\u724c\\u540d\\u79f0\",\"value\":\"\\u82f9\\u679c\\/Apple\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u94f6\\u8272\",\"id\":\"2\",\"_remove_\":\"0\"},\"3\":{\"name\":\"\\u673a\\u8eab\\u989c\\u8272\",\"value\":\"\\u7070\\u8272\",\"id\":\"3\",\"_remove_\":\"0\"},\"4\":{\"name\":\"\\u5b58\\u50a8\\u5bb9\\u91cf\",\"value\":\"256G\",\"id\":\"4\",\"_remove_\":\"0\"}},\"_token\":\"ADqxz1HaaBlTruhNSLDDiwVvMcTEDeu2Rx5nD2tr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/products?&page=4\"}', '2018-10-26 17:44:52', '2018-10-26 17:44:52');
INSERT INTO `lnmp_admin_operation_log` VALUES (788, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\"}', '2018-10-26 17:44:53', '2018-10-26 17:44:53');
INSERT INTO `lnmp_admin_operation_log` VALUES (789, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\"}', '2018-10-26 19:11:25', '2018-10-26 19:11:25');
INSERT INTO `lnmp_admin_operation_log` VALUES (790, 1, 'admin', 'GET', '192.168.10.1', '[]', '2018-10-31 13:07:45', '2018-10-31 13:07:45');
INSERT INTO `lnmp_admin_operation_log` VALUES (791, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:07:55', '2018-10-31 13:07:55');
INSERT INTO `lnmp_admin_operation_log` VALUES (792, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"9\",\"title\":\"\\u79d2\\u6740\\u5546\\u54c1\",\"icon\":\"fa-bolt\",\"uri\":\"\\/seckill_products\",\"roles\":[null],\"_token\":\"1rhFuMaqu4MBzCYEPaOLqhw158M9TSEPP3bwEjxr\"}', '2018-10-31 13:08:50', '2018-10-31 13:08:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (793, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-31 13:08:50', '2018-10-31 13:08:50');
INSERT INTO `lnmp_admin_operation_log` VALUES (794, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"1rhFuMaqu4MBzCYEPaOLqhw158M9TSEPP3bwEjxr\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":13},{\\\"id\\\":10},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":11},{\\\"id\\\":12}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2018-10-31 13:09:11', '2018-10-31 13:09:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (795, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:09:12', '2018-10-31 13:09:12');
INSERT INTO `lnmp_admin_operation_log` VALUES (796, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:09:15', '2018-10-31 13:09:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (797, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2018-10-31 13:09:19', '2018-10-31 13:09:19');
INSERT INTO `lnmp_admin_operation_log` VALUES (798, 1, 'admin/seckill_products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:09:27', '2018-10-31 13:09:27');
INSERT INTO `lnmp_admin_operation_log` VALUES (799, 1, 'admin/seckill_products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:09:30', '2018-10-31 13:09:30');
INSERT INTO `lnmp_admin_operation_log` VALUES (800, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2018-10-31 13:11:31', '2018-10-31 13:11:31');
INSERT INTO `lnmp_admin_operation_log` VALUES (801, 1, 'admin/products', 'GET', '192.168.10.1', '{\"id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:11:41', '2018-10-31 13:11:41');
INSERT INTO `lnmp_admin_operation_log` VALUES (802, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\"}', '2018-10-31 13:12:06', '2018-10-31 13:12:06');
INSERT INTO `lnmp_admin_operation_log` VALUES (803, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673ato\"}', '2018-10-31 13:12:07', '2018-10-31 13:12:07');
INSERT INTO `lnmp_admin_operation_log` VALUES (804, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673aton\"}', '2018-10-31 13:12:08', '2018-10-31 13:12:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (805, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673aton\'x\"}', '2018-10-31 13:12:08', '2018-10-31 13:12:08');
INSERT INTO `lnmp_admin_operation_log` VALUES (806, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\\u673a\\u901a\\u8baf\"}', '2018-10-31 13:12:09', '2018-10-31 13:12:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (807, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u624b\"}', '2018-10-31 13:12:13', '2018-10-31 13:12:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (808, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"z\"}', '2018-10-31 13:12:13', '2018-10-31 13:12:13');
INSERT INTO `lnmp_admin_operation_log` VALUES (809, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\"}', '2018-10-31 13:12:14', '2018-10-31 13:12:14');
INSERT INTO `lnmp_admin_operation_log` VALUES (810, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'neng\'j\"}', '2018-10-31 13:12:15', '2018-10-31 13:12:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (811, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\\u673a\"}', '2018-10-31 13:12:15', '2018-10-31 13:12:15');
INSERT INTO `lnmp_admin_operation_log` VALUES (812, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:12:21', '2018-10-31 13:12:21');
INSERT INTO `lnmp_admin_operation_log` VALUES (813, 1, 'admin/seckill_products', 'POST', '192.168.10.1', '{\"type\":\"seckill\",\"title\":\"\\u79d2\\u6740 iPhone X 256G\",\"long_title\":\"2018\\u6700\\u65b0\\u6b3e iPhone X 256G \\u82f9\\u679c\\u624b\\u673a\",\"category_id\":\"25\",\"description\":\"<p>\\u79d2\\u6740\\u5546\\u54c1\\u4e00\\u4efd<\\/p>\",\"on_sale\":\"1\",\"seckill\":{\"start_at\":\"2018-10-31 00:00:00\",\"end_at\":\"2018-10-12 00:00:00\"},\"skus\":{\"new_1\":{\"title\":\"iPhone XS  \\u4e00\\u53f0\",\"description\":\"\\u79d2\\u6740 iPhone XS\",\"price\":\"6666\",\"stock\":null,\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"1rhFuMaqu4MBzCYEPaOLqhw158M9TSEPP3bwEjxr\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/seckill_products\"}', '2018-10-31 13:14:09', '2018-10-31 13:14:09');
INSERT INTO `lnmp_admin_operation_log` VALUES (814, 1, 'admin/seckill_products/create', 'GET', '192.168.10.1', '[]', '2018-10-31 13:14:10', '2018-10-31 13:14:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (815, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"s\'ho\"}', '2018-10-31 13:14:26', '2018-10-31 13:14:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (816, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"s\"}', '2018-10-31 13:14:26', '2018-10-31 13:14:26');
INSERT INTO `lnmp_admin_operation_log` VALUES (817, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'neng\"}', '2018-10-31 13:14:28', '2018-10-31 13:14:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (818, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"zhi\'neng\'j\"}', '2018-10-31 13:14:28', '2018-10-31 13:14:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (819, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u667a\\u80fd\\u673a\"}', '2018-10-31 13:14:28', '2018-10-31 13:14:28');
INSERT INTO `lnmp_admin_operation_log` VALUES (820, 1, 'admin/seckill_products', 'POST', '192.168.10.1', '{\"type\":\"seckill\",\"title\":\"\\u79d2\\u6740 iPhone X 256G\",\"long_title\":\"2018\\u6700\\u65b0\\u6b3e iPhone X 256G \\u82f9\\u679c\\u624b\\u673a\",\"category_id\":\"25\",\"description\":\"<p>\\u79d2\\u6740\\u5546\\u54c1\\u4e00\\u4efd<\\/p>\",\"on_sale\":\"1\",\"seckill\":{\"start_at\":\"2018-10-31 00:00:00\",\"end_at\":\"2018-10-12 00:00:00\"},\"skus\":{\"new_1\":{\"title\":\"\\u79d2\\u6740 iPhone X 256G\",\"description\":\"<p>\\u79d2\\u6740\\u5546\\u54c1\\u4e00\\u4efd<\\/p>\",\"price\":\"6666\",\"stock\":\"1000\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"1rhFuMaqu4MBzCYEPaOLqhw158M9TSEPP3bwEjxr\"}', '2018-10-31 13:14:38', '2018-10-31 13:14:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (821, 1, 'admin/seckill_products', 'GET', '192.168.10.1', '[]', '2018-10-31 13:14:38', '2018-10-31 13:14:38');
INSERT INTO `lnmp_admin_operation_log` VALUES (822, 1, 'admin/seckill_products/71/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 13:16:02', '2018-10-31 13:16:02');
INSERT INTO `lnmp_admin_operation_log` VALUES (823, 1, 'admin/seckill_products/71', 'PUT', '192.168.10.1', '{\"type\":\"seckill\",\"title\":\"\\u79d2\\u6740 iPhone X 256G\",\"long_title\":\"\\u79d2\\u6740 2018\\u6700\\u65b0\\u6b3e iPhone X 256G \\u82f9\\u679c\\u624b\\u673a\",\"category_id\":\"25\",\"description\":\"<p>\\u79d2\\u6740\\u5546\\u54c1\\u4e00\\u4efd<\\/p>\",\"on_sale\":\"1\",\"seckill\":{\"start_at\":\"2018-10-31 00:00:00\",\"end_at\":\"2018-10-12 00:00:00\"},\"skus\":{\"208\":{\"title\":\"\\u79d2\\u6740 iPhone X 256G\",\"description\":\"<p>\\u79d2\\u6740\\u5546\\u54c1\\u4e00\\u4efd<\\/p>\",\"price\":\"6666.00\",\"stock\":\"1000\",\"id\":\"208\",\"_remove_\":\"0\"}},\"_token\":\"1rhFuMaqu4MBzCYEPaOLqhw158M9TSEPP3bwEjxr\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shop.buqiu.test\\/admin\\/seckill_products\"}', '2018-10-31 13:16:10', '2018-10-31 13:16:10');
INSERT INTO `lnmp_admin_operation_log` VALUES (824, 1, 'admin/seckill_products', 'GET', '192.168.10.1', '[]', '2018-10-31 13:16:11', '2018-10-31 13:16:11');
INSERT INTO `lnmp_admin_operation_log` VALUES (825, 1, 'admin/seckill_products/71/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2018-10-31 15:08:28', '2018-10-31 15:08:28');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_permissions`;
CREATE TABLE `lnmp_admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识',
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTTP方法',
  `http_path` text COLLATE utf8mb4_unicode_ci COMMENT 'HTTP路径',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台权限表';

-- ----------------------------
-- Records of lnmp_admin_permissions
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_permissions` VALUES (1, '所有权限', '*', '', '*', '2018-06-27 22:52:42', '2018-06-27 22:52:42');
INSERT INTO `lnmp_admin_permissions` VALUES (2, '首页', 'dashboard', 'GET', '/', '2018-06-27 22:53:29', '2018-06-27 22:53:29');
INSERT INTO `lnmp_admin_permissions` VALUES (3, '登录', 'auth.login', '', '/auth/login\r\n/auth/logout', '2018-06-27 22:53:10', '2018-06-27 22:53:10');
INSERT INTO `lnmp_admin_permissions` VALUES (4, '用户设置', 'auth.setting', 'GET,PUT', '/auth/setting', '2018-06-27 22:53:46', '2018-06-27 22:53:46');
INSERT INTO `lnmp_admin_permissions` VALUES (5, '权限管理', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', '2018-06-27 22:54:13', '2018-06-27 22:54:13');
INSERT INTO `lnmp_admin_permissions` VALUES (6, '用户管理', 'users', '', '/users', '2018-06-27 22:52:07', '2018-06-27 22:52:07');
INSERT INTO `lnmp_admin_permissions` VALUES (7, '商品管理', 'products', '', '/products', '2018-07-05 11:41:42', '2018-07-05 11:41:42');
INSERT INTO `lnmp_admin_permissions` VALUES (8, '订单管理', 'orders', '', '/orders', '2018-07-05 11:43:37', '2018-07-05 11:43:37');
INSERT INTO `lnmp_admin_permissions` VALUES (9, '优惠券管理', 'coupon_codes', '', '/coupon_codes', '2018-07-05 11:44:09', '2018-07-05 11:44:09');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_role_menu`;
CREATE TABLE `lnmp_admin_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台菜单角色表';

-- ----------------------------
-- Records of lnmp_admin_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_role_menu` VALUES (1, 2, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lnmp_admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_role_permissions`;
CREATE TABLE `lnmp_admin_role_permissions` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台角色权限表';

-- ----------------------------
-- Records of lnmp_admin_role_permissions
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_role_permissions` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lnmp_admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_role_users`;
CREATE TABLE `lnmp_admin_role_users` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台角色用户表';

-- ----------------------------
-- Records of lnmp_admin_role_users
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_role_users` VALUES (1, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lnmp_admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_roles`;
CREATE TABLE `lnmp_admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标识',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台角色表';

-- ----------------------------
-- Records of lnmp_admin_roles
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_roles` VALUES (1, '超级管理员', 'administrator', '2018-06-27 21:01:29', '2018-06-27 22:55:04');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_user_permissions`;
CREATE TABLE `lnmp_admin_user_permissions` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `permission_id` int(11) NOT NULL COMMENT '权限ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台用户权限表';

-- ----------------------------
-- Table structure for lnmp_admin_users
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_admin_users`;
CREATE TABLE `lnmp_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '记住登录',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='后台用户表';

-- ----------------------------
-- Records of lnmp_admin_users
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_admin_users` VALUES (1, 'admin', '$2y$10$7UkH/26nTrP.A4mISm337ejsUXvNHrUruIudcbUQ0a1Ub5eHng3g.', '超级管理员', NULL, 'T0MkjdXwCOiorPGvX0qwGOUX3PHDTPa3kqA9FXidklAYkAOxkpeKOatqAEB4', '2018-06-27 21:01:29', '2018-06-27 21:11:52');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_cart_items
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_cart_items`;
CREATE TABLE `lnmp_cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `product_sku_id` int(10) unsigned NOT NULL COMMENT '商品SKU_ID',
  `amount` int(10) unsigned NOT NULL COMMENT '商品数量',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `cart_items_user_id_foreign` (`user_id`),
  KEY `cart_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `lnmp_product_skus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `lnmp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='购物车品目表';

-- ----------------------------
-- Records of lnmp_cart_items
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_cart_items` VALUES (15, 1, 94, 1, '2018-06-29 23:44:52', '2018-06-29 23:44:52');
INSERT INTO `lnmp_cart_items` VALUES (16, 1, 93, 1, '2018-06-29 23:45:36', '2018-06-29 23:45:36');
INSERT INTO `lnmp_cart_items` VALUES (17, 1, 4, 1, '2018-07-05 08:52:31', '2018-07-05 08:52:31');
INSERT INTO `lnmp_cart_items` VALUES (18, 1, 8, 1, '2018-08-15 03:24:03', '2018-08-15 03:24:03');
INSERT INTO `lnmp_cart_items` VALUES (19, 2, 93, 1, '2018-09-07 18:25:07', '2018-09-07 18:25:07');
INSERT INTO `lnmp_cart_items` VALUES (20, 1, 97, 1, '2018-10-24 17:13:10', '2018-10-24 17:13:10');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_categories
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_categories`;
CREATE TABLE `lnmp_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '栏目名称',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT '父类目ID',
  `is_directory` tinyint(1) NOT NULL COMMENT '是否拥有子类目',
  `level` int(10) unsigned NOT NULL COMMENT '当前类目层级',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '该类目所有父类目ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `lnmp_categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='类目表';

-- ----------------------------
-- Records of lnmp_categories
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_categories` VALUES (1, '手机配件', NULL, 1, 0, '-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (2, '手机壳', 1, 0, 1, '-1-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (3, '贴膜', 1, 0, 1, '-1-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (4, '存储卡', 1, 0, 1, '-1-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (5, '数据线', 1, 0, 1, '-1-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (6, '充电线', 1, 0, 1, '-1-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (7, '耳机', 1, 1, 1, '-1-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (8, '有线耳机', 7, 0, 2, '-1-7-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (9, '蓝牙耳机', 7, 0, 2, '-1-7-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (10, '电脑配件', NULL, 1, 0, '-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (11, '显示器', 10, 0, 1, '-10-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (12, '显卡', 10, 0, 1, '-10-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (13, '内存', 10, 0, 1, '-10-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (14, 'CPU', 10, 0, 1, '-10-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (15, '主板', 10, 0, 1, '-10-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (16, '硬盘', 10, 0, 1, '-10-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (17, '电脑整机', NULL, 1, 0, '-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (18, '笔记本', 17, 0, 1, '-17-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (19, '台式机', 17, 0, 1, '-17-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (20, '平板电脑', 17, 0, 1, '-17-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (21, '一体机', 17, 0, 1, '-17-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (22, '服务器', 17, 0, 1, '-17-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (23, '工作站', 17, 0, 1, '-17-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (24, '手机通讯', NULL, 1, 0, '-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (25, '智能机', 24, 0, 1, '-24-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (26, '老人机', 24, 0, 1, '-24-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
INSERT INTO `lnmp_categories` VALUES (27, '对讲机', 24, 0, 1, '-24-', '2018-10-21 21:58:39', '2018-10-21 21:58:39');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_coupon_codes
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_coupon_codes`;
CREATE TABLE `lnmp_coupon_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠券标题',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠券码，用户下单时输入',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '优惠券类型，支持固定金额和百分比折扣',
  `value` decimal(8,2) NOT NULL COMMENT '折扣值，根据不同类型含义不同',
  `total` int(10) unsigned NOT NULL COMMENT '全站可兑换的数量',
  `used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前已兑换的数量',
  `min_amount` decimal(10,2) NOT NULL COMMENT '使用该优惠券的最低订单金额',
  `not_before` datetime DEFAULT NULL COMMENT '在这个时间之前不可用',
  `not_after` datetime DEFAULT NULL COMMENT '在这个时间之后不可用',
  `enabled` tinyint(1) NOT NULL COMMENT '优惠券是否生效',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupon_codes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='优惠券表';

-- ----------------------------
-- Records of lnmp_coupon_codes
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_coupon_codes` VALUES (1, 'pariatur est quo', 'DCBGLWXUMSVUCUDA', 'fixed', 108.00, 1000, 0, 108.01, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (2, 'animi quis magni', 'PCGZDLAMZZWHQ6RC', 'percent', 20.00, 1000, 0, 100.00, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (3, 'hic doloremque autem', 'MSEIBKT00ZYJIAZO', 'fixed', 12.00, 1000, 0, 12.01, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (4, 'qui et quo', 'FO8YEV7PCBMDWHVF', 'fixed', 100.00, 1000, 0, 100.01, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (5, 'molestiae sint magnam', 'RIUPIHQVOPWF54AE', 'percent', 50.00, 1000, 0, 0.00, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (6, 'incidunt autem est', 'YTEV7JSBOPW3TBUM', 'percent', 4.00, 1000, 0, 0.00, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (7, 'sint sunt id', 'MQVZV8FVI4LD5CH2', 'percent', 25.00, 1000, 0, 100.00, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (8, 'ducimus repudiandae est', 'EPKQJ9BAXDBIFW5P', 'fixed', 138.00, 1000, 0, 138.01, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (9, 'id qui vel', '2P6VMFC6E30J5TRA', 'fixed', 15.00, 1000, 0, 15.01, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
INSERT INTO `lnmp_coupon_codes` VALUES (10, 'rerum maiores nesciunt', 'K1ROUA38AWOGKLM4', 'percent', 16.00, 1000, 0, 100.00, NULL, NULL, 1, '2018-07-05 02:05:19', '2018-07-05 02:05:19');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_crowdfunding_products
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_crowdfunding_products`;
CREATE TABLE `lnmp_crowdfunding_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `target_amount` decimal(10,2) NOT NULL COMMENT '众筹目标金额',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '当前已筹金额',
  `user_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前参与众筹用户数',
  `end_at` datetime NOT NULL COMMENT '众筹结束时间',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'funding' COMMENT '当前筹款的状态',
  PRIMARY KEY (`id`),
  KEY `crowdfunding_products_product_id_foreign` (`product_id`),
  CONSTRAINT `crowdfunding_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `lnmp_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='众筹产品表';

-- ----------------------------
-- Records of lnmp_crowdfunding_products
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_crowdfunding_products` VALUES (1, 63, 1000000.00, 0.00, 0, '2019-01-01 00:00:00', 'funding');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_installment_items
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_installment_items`;
CREATE TABLE `lnmp_installment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `installment_id` int(10) unsigned NOT NULL COMMENT '分期ID',
  `sequence` int(10) unsigned NOT NULL COMMENT '还款顺序编号',
  `base` decimal(8,2) NOT NULL COMMENT '当期本金',
  `fee` decimal(8,2) NOT NULL COMMENT '当期手续费',
  `fine` decimal(8,2) DEFAULT NULL COMMENT '当期逾期费',
  `due_date` datetime NOT NULL COMMENT '还款截止日期',
  `paid_at` datetime DEFAULT NULL COMMENT '还款日期',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '还款支付方式',
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '还款支付平台订单号',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '退款状态',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `installment_items_installment_id_foreign` (`installment_id`),
  CONSTRAINT `installment_items_installment_id_foreign` FOREIGN KEY (`installment_id`) REFERENCES `lnmp_installments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='还款计划表';

-- ----------------------------
-- Table structure for lnmp_installments
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_installments`;
CREATE TABLE `lnmp_installments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分期流水号',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `order_id` int(10) unsigned NOT NULL COMMENT '订单ID',
  `total_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '总本金',
  `count` int(10) unsigned NOT NULL COMMENT '还款期数',
  `fee_rate` double(8,2) NOT NULL COMMENT '手续费率',
  `fine_rate` double(8,2) NOT NULL COMMENT '逾期费率',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '还款状态',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `installments_user_id_foreign` (`user_id`),
  KEY `installments_order_id_foreign` (`order_id`),
  CONSTRAINT `installments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `lnmp_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `installments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `lnmp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='分期信息表';

-- ----------------------------
-- Table structure for lnmp_migrations
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_migrations`;
CREATE TABLE `lnmp_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='数据迁移表';

-- ----------------------------
-- Records of lnmp_migrations
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_migrations` VALUES (5, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `lnmp_migrations` VALUES (6, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `lnmp_migrations` VALUES (7, '2018_06_18_205850_create_user_addresses_table', 2);
INSERT INTO `lnmp_migrations` VALUES (8, '2016_01_04_173148_create_admin_tables', 3);
INSERT INTO `lnmp_migrations` VALUES (9, '2018_06_27_145731_create_products_table', 4);
INSERT INTO `lnmp_migrations` VALUES (10, '2018_06_27_145748_create_product_skus_table', 4);
INSERT INTO `lnmp_migrations` VALUES (11, '2018_06_27_230255_create_user_favorite_products_table', 5);
INSERT INTO `lnmp_migrations` VALUES (12, '2018_06_28_010748_create_cart_items_table', 6);
INSERT INTO `lnmp_migrations` VALUES (13, '2018_06_28_083214_create_orders_table', 7);
INSERT INTO `lnmp_migrations` VALUES (14, '2018_06_28_083238_create_order_items_table', 7);
INSERT INTO `lnmp_migrations` VALUES (15, '2018_07_04_164113_create_coupon_codes_table', 8);
INSERT INTO `lnmp_migrations` VALUES (16, '2018_07_04_165310_orders_add_coupon_code_id', 8);
INSERT INTO `lnmp_migrations` VALUES (17, '2018_10_21_213719_create_categories_table', 9);
INSERT INTO `lnmp_migrations` VALUES (18, '2018_10_21_214654_products_add_category_id', 9);
INSERT INTO `lnmp_migrations` VALUES (19, '2018_10_22_124046_create_crowdfunding_products_table', 10);
INSERT INTO `lnmp_migrations` VALUES (20, '2018_10_22_130001_products_add_type', 10);
INSERT INTO `lnmp_migrations` VALUES (21, '2018_10_23_102141_orders_add_type', 11);
INSERT INTO `lnmp_migrations` VALUES (22, '2018_10_24_105232_create_installments_table', 12);
INSERT INTO `lnmp_migrations` VALUES (23, '2018_10_24_105301_create_installment_items_table', 12);
INSERT INTO `lnmp_migrations` VALUES (24, '2018_10_26_141019_create_product_properties_table', 13);
INSERT INTO `lnmp_migrations` VALUES (25, '2018_10_26_145347_products_add_long_title', 14);
INSERT INTO `lnmp_migrations` VALUES (26, '2018_10_30_194340_create_seckill_products_table', 15);
COMMIT;

-- ----------------------------
-- Table structure for lnmp_order_items
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_order_items`;
CREATE TABLE `lnmp_order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属订单ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '对应商品ID',
  `product_sku_id` int(10) unsigned NOT NULL COMMENT '对应商品SKU ID',
  `amount` int(10) unsigned NOT NULL COMMENT '数量',
  `price` decimal(10,2) NOT NULL COMMENT '单价',
  `rating` int(10) unsigned DEFAULT NULL COMMENT '用户打分',
  `review` text COLLATE utf8mb4_unicode_ci COMMENT '用户评价',
  `reviewed_at` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  PRIMARY KEY (`id`),
  KEY `orders_items_order_id_foreign` (`order_id`),
  KEY `orders_items_product_id_foreign` (`product_id`),
  KEY `orders_items_product_sku_id_foreign` (`product_sku_id`),
  CONSTRAINT `lnmp_order_items_copy1_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `lnmp_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lnmp_order_items_copy1_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `lnmp_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `lnmp_order_items_copy1_ibfk_3` FOREIGN KEY (`product_sku_id`) REFERENCES `lnmp_product_skus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单项目表';

-- ----------------------------
-- Records of lnmp_order_items
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_order_items` VALUES (1, 3, 5, 14, 1, 5752.00, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (2, 4, 1, 2, 2, 7699.00, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (3, 4, 1, 1, 1, 7599.00, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (4, 5, 1, 1, 1, 7599.00, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (5, 6, 12, 33, 1, 9415.00, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (6, 7, 1, 1, 1, 7599.00, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (7, 8, 1, 1, 1, 7599.00, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (8, 9, 1, 1, 1, 7599.00, 5, '很棒的产品，值得拥有', '2018-06-29 19:53:40');
INSERT INTO `lnmp_order_items` VALUES (9, 10, 32, 94, 1, 0.20, 3, '很棒的产品，值得拥有', '2018-06-29 20:43:16');
INSERT INTO `lnmp_order_items` VALUES (10, 11, 32, 94, 1, 0.20, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (11, 12, 32, 94, 1, 0.20, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (12, 13, 32, 94, 1, 0.20, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (13, 13, 32, 93, 1, 0.10, NULL, NULL, NULL);
INSERT INTO `lnmp_order_items` VALUES (14, 14, 32, 94, 1, 0.20, 1, '1', '2018-08-15 03:25:28');
INSERT INTO `lnmp_order_items` VALUES (15, 14, 32, 93, 1, 0.10, 2, '2', '2018-08-15 03:25:28');
INSERT INTO `lnmp_order_items` VALUES (16, 14, 2, 4, 1, 6409.00, 3, '3', '2018-08-15 03:25:28');
INSERT INTO `lnmp_order_items` VALUES (17, 14, 3, 8, 1, 3960.00, 4, '4', '2018-08-15 03:25:28');
INSERT INTO `lnmp_order_items` VALUES (19, 16, 71, 208, 1, 6666.00, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for lnmp_orders
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_orders`;
CREATE TABLE `lnmp_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '商品类型',
  `no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单流水号',
  `user_id` int(10) unsigned NOT NULL COMMENT '下单用户ID',
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SON格式的收货地址',
  `total_amount` decimal(10,2) NOT NULL COMMENT '订单总金额',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '订单备注',
  `paid_at` datetime DEFAULT NULL COMMENT '支付时间',
  `coupon_code_id` int(10) unsigned DEFAULT NULL COMMENT '优惠券ID',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付方式',
  `payment_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '支付平台订单号',
  `refund_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '退款状态',
  `refund_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '退款单号',
  `closed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单是否已关闭',
  `reviewed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单是否已评价',
  `ship_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '物流状态',
  `ship_data` text COLLATE utf8mb4_unicode_ci COMMENT '物流数据',
  `extra` text COLLATE utf8mb4_unicode_ci COMMENT '其他额外的数据',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_no_unique` (`no`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_coupon_code_id_foreign` (`coupon_code_id`),
  CONSTRAINT `orders_coupon_code_id_foreign` FOREIGN KEY (`coupon_code_id`) REFERENCES `lnmp_coupon_codes` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `lnmp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

-- ----------------------------
-- Records of lnmp_orders
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_orders` VALUES (3, 'normal', '20180628155359356498', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 5752.00, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2018-06-28 23:53:59', '2018-06-28 23:53:59');
INSERT INTO `lnmp_orders` VALUES (4, 'normal', '20180628162701591453', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 22997.00, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2018-06-29 00:27:01', '2018-06-29 00:27:32');
INSERT INTO `lnmp_orders` VALUES (5, 'normal', '20180628163831391535', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 7599.00, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2018-06-29 00:38:31', '2018-06-29 00:39:02');
INSERT INTO `lnmp_orders` VALUES (6, 'normal', '20180628170059504853', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 9415.00, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2018-06-29 01:00:59', '2018-06-29 01:01:31');
INSERT INTO `lnmp_orders` VALUES (7, 'normal', '20180628171717694638', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 7599.00, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2018-06-29 01:17:17', '2018-06-29 01:17:17');
INSERT INTO `lnmp_orders` VALUES (8, 'normal', '20180628172050422981', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 7599.00, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2018-06-29 01:20:50', '2018-06-29 12:22:14');
INSERT INTO `lnmp_orders` VALUES (9, 'normal', '20180628172218974416', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 7599.00, NULL, '2018-07-02 16:05:55', NULL, 'wechatpay', '4200000138201805160955153502', 'pending', NULL, 0, 1, 'received', '{\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"072086999626\"}', NULL, '2018-06-29 01:22:18', '2018-06-29 19:53:40');
INSERT INTO `lnmp_orders` VALUES (10, 'normal', '20180629123601673287', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 0.20, NULL, '2018-07-03 14:21:56', NULL, 'alipay', '2018070321001004720561634663', 'applied', NULL, 0, 1, 'received', '{\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"072086999627\"}', '{\"refund_reason\":\"\\u6d4b\\u8bd5\\u9000\\u6b3e\"}', '2018-06-29 20:36:01', '2018-07-04 22:37:42');
INSERT INTO `lnmp_orders` VALUES (11, 'normal', '20180629123644258840', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 0.20, NULL, '2018-07-03 14:21:59', NULL, 'alipay', '2018070321001004720561634664', 'pending', NULL, 0, 0, 'delivered', '{\"express_company\":\"\\u987a\\u4e30\\u5feb\\u9012\",\"express_no\":\"072086999628\"}', '{\"refund_reason\":\"\\u6d4b\\u8bd5\\u9000\\u6b3e\",\"refund_disagree_reason\":\"\\u5df2\\u7ecf\\u53d1\\u8d27\\u4e0d\\u4e88\\u9000\\u6b3e\"}', '2018-06-29 20:36:44', '2018-07-04 20:21:16');
INSERT INTO `lnmp_orders` VALUES (12, 'normal', '20180629154502258558', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 0.20, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2018-06-29 23:45:02', '2018-08-15 03:23:01');
INSERT INTO `lnmp_orders` VALUES (13, 'normal', '20180629154604000632', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 0.30, NULL, NULL, NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2018-06-29 23:46:04', '2018-08-15 03:23:01');
INSERT INTO `lnmp_orders` VALUES (14, 'normal', '20180815032410457103', 1, '{\"address\":\"\\u4e0a\\u6d77\\u5e02\\u5e02\\u8f96\\u533a\\u5f90\\u6c47\\u533a\\u756a\\u79ba\\u8def1028\\u53f71207-1208\\u5ba4\",\"zip\":200030,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198805\"}', 10369.30, NULL, '2018-08-15 18:18:42', NULL, NULL, NULL, 'pending', NULL, 0, 1, 'pending', NULL, NULL, '2018-08-15 03:24:10', '2018-08-15 03:25:28');
INSERT INTO `lnmp_orders` VALUES (16, 'seckill', '20181031152205054557', 1, '{\"address\":\"\\u56db\\u5ddd\\u7701\\u5357\\u5145\\u5e02\\u5357\\u90e8\\u53bf\\u5b9a\\u6c34\\u9547\\u5c71\\u6c34\\u8317\\u82d13\\u680b1\\u5355\\u5143201\\u5ba4\",\"zip\":637301,\"contact_name\":\"\\u8463\\u5764\\u9e3f\",\"contact_phone\":\"18302198804\"}', 6666.00, '', NULL, NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2018-10-31 15:22:05', '2018-10-31 15:22:05');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_password_resets`;
CREATE TABLE `lnmp_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'TOKEN',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='密码重置表';

-- ----------------------------
-- Table structure for lnmp_product_properties
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_product_properties`;
CREATE TABLE `lnmp_product_properties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性名称',
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`),
  KEY `product_properties_product_id_foreign` (`product_id`),
  CONSTRAINT `product_properties_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `lnmp_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品属性表';

-- ----------------------------
-- Records of lnmp_product_properties
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_product_properties` VALUES (1, 1, '品牌名称', '苹果/Apple');
INSERT INTO `lnmp_product_properties` VALUES (2, 1, '机身颜色', '银色');
INSERT INTO `lnmp_product_properties` VALUES (3, 1, '机身颜色', '灰色');
INSERT INTO `lnmp_product_properties` VALUES (4, 1, '存储容量', '256G');
INSERT INTO `lnmp_product_properties` VALUES (5, 65, '品牌名称', '金士顿');
INSERT INTO `lnmp_product_properties` VALUES (6, 65, '内存容量', '8GB');
INSERT INTO `lnmp_product_properties` VALUES (7, 65, '传输类型', 'DDR4');
INSERT INTO `lnmp_product_properties` VALUES (8, 65, '内存容量', '4GB');
INSERT INTO `lnmp_product_properties` VALUES (9, 65, '内存容量', '16GB');
INSERT INTO `lnmp_product_properties` VALUES (10, 66, '品牌名称', '威刚');
INSERT INTO `lnmp_product_properties` VALUES (11, 66, '传输类型', 'DDR4');
INSERT INTO `lnmp_product_properties` VALUES (12, 66, '内存容量', '4GB');
INSERT INTO `lnmp_product_properties` VALUES (13, 66, '内存容量', '8GB');
INSERT INTO `lnmp_product_properties` VALUES (14, 67, '品牌名称', '金士顿');
INSERT INTO `lnmp_product_properties` VALUES (15, 67, '传输类型', 'DDR3');
INSERT INTO `lnmp_product_properties` VALUES (16, 67, '内存容量', '4GB');
INSERT INTO `lnmp_product_properties` VALUES (17, 67, '内存容量', '8GB');
INSERT INTO `lnmp_product_properties` VALUES (18, 68, '品牌名称', '影驰');
INSERT INTO `lnmp_product_properties` VALUES (19, 68, '传输类型', 'DDR4');
INSERT INTO `lnmp_product_properties` VALUES (20, 68, '内存容量', '8GB');
INSERT INTO `lnmp_product_properties` VALUES (21, 68, '内存容量', '16GB');
INSERT INTO `lnmp_product_properties` VALUES (22, 69, '品牌名称', '海盗船');
INSERT INTO `lnmp_product_properties` VALUES (23, 69, '内存容量', '16GB');
INSERT INTO `lnmp_product_properties` VALUES (24, 69, '内存容量', '8GB');
INSERT INTO `lnmp_product_properties` VALUES (25, 69, '内存容量', '4GB');
INSERT INTO `lnmp_product_properties` VALUES (26, 69, '传输类型', 'DDR4');
INSERT INTO `lnmp_product_properties` VALUES (27, 70, '品牌名称', '三星');
INSERT INTO `lnmp_product_properties` VALUES (28, 70, '传输类型', 'DDR4');
INSERT INTO `lnmp_product_properties` VALUES (29, 70, '内存容量', '8GB');
INSERT INTO `lnmp_product_properties` VALUES (30, 70, '内存容量', '16GB');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_product_skus
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_product_skus`;
CREATE TABLE `lnmp_product_skus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SKU 名称',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'SKU 描述',
  `price` decimal(10,2) NOT NULL COMMENT 'SKU 价格',
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `product_id` int(10) unsigned NOT NULL COMMENT '所属商品 id	',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `product_skus_product_id_foreign` (`product_id`),
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `lnmp_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品sku表';

-- ----------------------------
-- Records of lnmp_product_skus
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_product_skus` VALUES (1, '银色', 'Apple iPhone X 银色', 7599.00, 198, 1, '2018-06-28 00:04:08', '2018-06-29 12:22:14');
INSERT INTO `lnmp_product_skus` VALUES (2, '深空灰色', 'Apple iPhone X 深空灰色', 7699.00, 220, 1, '2018-06-28 00:04:08', '2018-06-29 00:27:01');
INSERT INTO `lnmp_product_skus` VALUES (3, 'tempora', 'Vero soluta animi dignissimos necessitatibus quisquam ipsam soluta.', 1521.00, 8358, 2, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (4, 'animi', 'Quia necessitatibus facere doloremque debitis sed.', 6409.00, 82101, 2, '2018-06-28 01:55:39', '2018-08-15 03:24:10');
INSERT INTO `lnmp_product_skus` VALUES (5, 'rerum', 'Rem qui ratione incidunt id voluptatem.', 5532.00, 41985, 2, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (6, 'iusto', 'Tempore in unde commodi nemo dolorem.', 4328.00, 76466, 3, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (7, 'omnis', 'Quaerat repudiandae et culpa aspernatur.', 1219.00, 34724, 3, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (8, 'voluptas', 'Quis est nostrum et perferendis dolores.', 3960.00, 87814, 3, '2018-06-28 01:55:39', '2018-08-15 03:24:10');
INSERT INTO `lnmp_product_skus` VALUES (9, 'asperiores', 'Consequuntur ab distinctio aut.', 679.00, 58641, 4, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (10, 'perferendis', 'Possimus ut voluptates a accusantium omnis dolor ab praesentium.', 3891.00, 9729, 4, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (11, 'eveniet', 'Saepe placeat enim sed omnis.', 1231.00, 87343, 4, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (12, 'et', 'Laboriosam maxime voluptatem quas ipsa iure neque hic.', 2768.00, 58697, 5, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (13, 'enim', 'Dolorum ducimus vel dolorem ab porro distinctio veniam beatae.', 8164.00, 12696, 5, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (14, 'qui', 'Voluptatem tempore aut saepe totam veniam.', 5752.00, 56986, 5, '2018-06-28 01:55:39', '2018-06-29 00:56:44');
INSERT INTO `lnmp_product_skus` VALUES (15, 'omnis', 'Aspernatur nesciunt maiores cumque ipsa nulla a impedit.', 1469.00, 91864, 6, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (16, 'quaerat', 'Harum officiis et ea non.', 8313.00, 86124, 6, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (17, 'eaque', 'Harum ut qui eligendi suscipit.', 2275.00, 22233, 6, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (18, 'optio', 'Quos voluptates ipsam voluptatum.', 7427.00, 361, 7, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (19, 'quas', 'Et et esse doloribus occaecati modi inventore.', 636.00, 22145, 7, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (20, 'enim', 'Ut id corporis illo et.', 8350.00, 83777, 7, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (21, 'ut', 'Iste quasi voluptas voluptatem sint dolores ducimus est.', 4092.00, 30388, 8, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (22, 'voluptatem', 'Consequatur et omnis libero.', 4049.00, 69026, 8, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (23, 'laudantium', 'Aut tempore illum doloremque autem ut fuga.', 8298.00, 6741, 8, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (24, 'quia', 'Libero quis voluptatum et dolore suscipit repellat.', 9753.00, 57869, 9, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (25, 'omnis', 'Sit quo velit in necessitatibus quod ut.', 6123.00, 50651, 9, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (26, 'et', 'Et voluptates laudantium cum excepturi.', 7514.00, 61363, 9, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (27, 'aut', 'Eos dolor perspiciatis officiis aspernatur.', 5680.00, 48565, 10, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (28, 'qui', 'Quisquam ipsam deserunt autem itaque consequatur occaecati.', 4128.00, 30073, 10, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (29, 'iste', 'Soluta rerum omnis accusantium sunt impedit laudantium ut.', 317.00, 58547, 10, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (30, 'aspernatur', 'Omnis cumque sit sunt nesciunt.', 2884.00, 4178, 11, '2018-06-28 01:55:39', '2018-06-28 23:44:55');
INSERT INTO `lnmp_product_skus` VALUES (31, 'quae', 'Animi fugiat voluptatum voluptatem vel sit harum.', 5683.00, 79842, 11, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (32, 'nemo', 'Quasi est vel voluptatibus ex aut eos.', 5749.00, 90049, 11, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (33, 'qui', 'Dolor ipsa numquam maiores quas labore.', 9415.00, 83047, 12, '2018-06-28 01:55:39', '2018-06-29 01:15:46');
INSERT INTO `lnmp_product_skus` VALUES (34, 'nulla', 'Enim libero dolores asperiores quo nostrum velit molestiae.', 933.00, 85420, 12, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (35, 'qui', 'Sed quia voluptatem quasi et.', 6669.00, 26586, 12, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (36, 'veritatis', 'Cum commodi dolorum eaque consectetur animi ut.', 2394.00, 25429, 13, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (37, 'ipsam', 'Aliquid quas sint ut amet.', 3848.00, 61754, 13, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (38, 'odio', 'Inventore ut at porro repellendus accusantium.', 5190.00, 68248, 13, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (39, 'assumenda', 'Quo illum perferendis qui ab placeat.', 479.00, 69083, 14, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (40, 'enim', 'Veniam molestiae consequatur voluptatibus velit cumque.', 3216.00, 58250, 14, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (41, 'totam', 'Est est earum laboriosam sed debitis recusandae quam ab.', 4115.00, 93446, 14, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (42, 'tenetur', 'Iste qui omnis voluptate similique aut error aliquam.', 1592.00, 86661, 15, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (43, 'excepturi', 'Maxime ea et accusamus amet.', 6144.00, 55215, 15, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (44, 'atque', 'Deleniti qui distinctio et qui totam.', 267.00, 73786, 15, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (45, 'quia', 'Fugit sit quia laboriosam ut ut.', 2743.00, 3296, 16, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (46, 'esse', 'Id magnam quia velit temporibus tempora commodi.', 8907.00, 3269, 16, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (47, 'modi', 'Iusto magni totam suscipit ea.', 4972.00, 61337, 16, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (48, 'et', 'Ea in impedit cum voluptatem eum.', 4033.00, 94037, 17, '2018-06-28 01:55:39', '2018-06-28 23:44:55');
INSERT INTO `lnmp_product_skus` VALUES (49, 'non', 'Consequatur magnam reiciendis molestias qui deleniti praesentium vitae.', 6894.00, 39564, 17, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (50, 'temporibus', 'Aspernatur et iusto vero accusamus quia hic.', 448.00, 75223, 17, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (51, 'et', 'Voluptate qui eum consequatur sunt quis rerum voluptas.', 6306.00, 49118, 18, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (52, 'suscipit', 'Officiis illum officiis labore qui sed corporis molestiae.', 3015.00, 61827, 18, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (53, 'et', 'Velit enim qui est a et ex.', 6504.00, 96698, 18, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (54, 'laborum', 'Et quis autem quam omnis sit possimus porro voluptas.', 5081.00, 93288, 19, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (55, 'optio', 'Ratione et earum nihil voluptate esse ullam.', 5411.00, 62732, 19, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (56, 'fuga', 'Qui sed occaecati distinctio blanditiis qui.', 5177.00, 55666, 19, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (57, 'ex', 'Reiciendis qui adipisci voluptate voluptatum cupiditate vero.', 1941.00, 90011, 20, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (58, 'est', 'Hic est voluptas rerum vel dignissimos officia.', 789.00, 17964, 20, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (59, 'tenetur', 'Necessitatibus minus qui aperiam deserunt asperiores et ab.', 856.00, 57554, 20, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (60, 'similique', 'Neque dolorum iste sint nesciunt autem.', 8046.00, 86764, 21, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (61, 'voluptas', 'Hic error dolorum autem sed et.', 8793.00, 5200, 21, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (62, 'dolorem', 'Debitis aperiam a dolor natus quia voluptates.', 4157.00, 29399, 21, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (63, 'doloribus', 'Rerum veniam autem aut fugit.', 3382.00, 76132, 22, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (64, 'officia', 'Quos eaque cum est earum.', 9742.00, 14091, 22, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (65, 'dolores', 'Mollitia beatae ducimus inventore earum.', 8292.00, 80347, 22, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (66, 'sunt', 'Commodi ut cumque dicta amet rem a.', 6458.00, 25787, 23, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (67, 'nulla', 'Voluptatem sint sed quaerat ut ab nobis.', 7853.00, 78720, 23, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (68, 'vel', 'Odit facere dolorem soluta.', 3231.00, 39352, 23, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (69, 'harum', 'Sequi non voluptatem corporis corrupti voluptatem.', 8937.00, 83916, 24, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (70, 'eveniet', 'Deserunt qui accusantium mollitia ut dolorem at.', 682.00, 70132, 24, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (71, 'pariatur', 'Inventore doloremque voluptatum dolores exercitationem quaerat in.', 2916.00, 3487, 24, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (72, 'quibusdam', 'Qui eveniet repudiandae vel consectetur expedita aspernatur saepe.', 4727.00, 60317, 25, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (73, 'facilis', 'Dignissimos nam enim nostrum omnis excepturi.', 487.00, 28627, 25, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (74, 'ut', 'Commodi voluptatem debitis a.', 3097.00, 50519, 25, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (75, 'autem', 'Neque beatae voluptatem id aut deserunt aut.', 5962.00, 28283, 26, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (76, 'tempore', 'Beatae blanditiis accusantium incidunt.', 4827.00, 44503, 26, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (77, 'voluptatem', 'Omnis voluptatem voluptatem eum consequuntur.', 496.00, 81337, 26, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (78, 'officiis', 'Voluptas facilis aut et at molestiae rerum fugiat facilis.', 3436.00, 22469, 27, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (79, 'et', 'Similique nihil perspiciatis voluptas ratione.', 3723.00, 11011, 27, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (80, 'nihil', 'Consequatur quo maxime rem cum.', 2284.00, 91634, 27, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (81, 'sit', 'Aut sapiente quia perferendis.', 3837.00, 9065, 28, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (82, 'quae', 'Sed rerum veniam perferendis in nulla.', 1384.00, 12167, 28, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (83, 'architecto', 'Quasi quasi dolorum consectetur in facere dignissimos et.', 5552.00, 62379, 28, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (84, 'suscipit', 'Quam cupiditate aut saepe non id maxime explicabo.', 8981.00, 32515, 29, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (85, 'quos', 'Consequatur ut qui ut ex tenetur praesentium et.', 648.00, 53967, 29, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (86, 'sit', 'Et quod delectus quis voluptatem quia est provident.', 3527.00, 12457, 29, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (87, 'quibusdam', 'Sed blanditiis aut dolore est rem eum.', 6277.00, 1858, 30, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (88, 'debitis', 'Voluptatem fuga laboriosam doloremque repellat.', 9956.00, 67364, 30, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (89, 'assumenda', 'Ducimus impedit perferendis laborum et dignissimos.', 9929.00, 20515, 30, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (90, 'totam', 'Ratione enim ullam numquam natus ut.', 6733.00, 32323, 31, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (91, 'blanditiis', 'Dicta quod ipsam voluptatem dolor qui.', 2286.00, 38507, 31, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (92, 'neque', 'Similique unde sed aliquam maiores ad similique.', 1438.00, 58626, 31, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_product_skus` VALUES (93, '银色', '银色 15寸', 0.10, 1999, 32, '2018-06-29 20:31:47', '2018-08-15 03:24:10');
INSERT INTO `lnmp_product_skus` VALUES (94, '深空灰色', '深空灰色 15寸', 0.20, 1997, 32, '2018-06-29 20:31:47', '2018-08-15 03:24:10');
INSERT INTO `lnmp_product_skus` VALUES (95, 'odio', 'Itaque dolorem omnis explicabo pariatur occaecati.', 7648.00, 74072, 33, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (96, 'quos', 'Eum sunt consectetur tempora architecto.', 5716.00, 34384, 33, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (97, 'tenetur', 'Voluptas sint explicabo dolorum et inventore.', 494.00, 7223, 33, '2018-10-21 22:56:21', '2018-10-26 17:42:38');
INSERT INTO `lnmp_product_skus` VALUES (98, 'aut', 'Debitis quis voluptatem ut veniam et et exercitationem.', 1596.00, 44358, 34, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (99, 'fuga', 'At sit accusamus enim dolores.', 3675.00, 20225, 34, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (100, 'et', 'Qui accusamus repudiandae amet non qui deserunt.', 6971.00, 5915, 34, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (101, 'laboriosam', 'Ut eum et enim voluptates repellendus blanditiis quo.', 1889.00, 80452, 35, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (102, 'voluptas', 'In dolor totam repellat eum repellat.', 1310.00, 50457, 35, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (103, 'quam', 'Aperiam est aut molestias quo esse sunt.', 6563.00, 91696, 35, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (104, 'est', 'At accusamus reiciendis doloremque voluptatum nihil voluptas omnis.', 1587.00, 23667, 36, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (105, 'voluptatum', 'Neque nostrum iusto a.', 8679.00, 64747, 36, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (106, 'suscipit', 'Dolores ab ea non reiciendis vitae omnis.', 4872.00, 59582, 36, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (107, 'et', 'Quis neque eos deleniti quo molestias non sint ut.', 6567.00, 26001, 37, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (108, 'sed', 'Minima sit inventore voluptatem quasi repellendus minus.', 3322.00, 16027, 37, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (109, 'recusandae', 'Inventore est facilis quia dolores libero.', 7320.00, 2396, 37, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (110, 'repellendus', 'Inventore quaerat animi voluptatem quaerat.', 6109.00, 21436, 38, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (111, 'ut', 'Ratione animi ut ut error ea.', 8655.00, 93257, 38, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (112, 'modi', 'Nihil dolorum voluptate qui error maiores illo.', 6330.00, 38699, 38, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (113, 'harum', 'Deleniti non aut ut earum ullam eos sit.', 5542.00, 17152, 39, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (114, 'qui', 'Neque sit facere vel molestiae quia maxime.', 2068.00, 80640, 39, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (115, 'corporis', 'Aliquid ut assumenda velit sed.', 8016.00, 90816, 39, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (116, 'debitis', 'Porro minima enim sint et numquam eum.', 8482.00, 81477, 40, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (117, 'est', 'Quia nihil quos et necessitatibus.', 8468.00, 52889, 40, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (118, 'est', 'Expedita cumque voluptatem quis at vitae.', 1882.00, 26013, 40, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (119, 'voluptatem', 'Aspernatur eum quis quia vel et culpa dolorem.', 131.00, 92369, 41, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (120, 'dolorem', 'Quia dolores illum voluptas repudiandae suscipit quaerat.', 2965.00, 55819, 41, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (121, 'quia', 'Itaque error ea ut.', 5694.00, 86403, 41, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (122, 'assumenda', 'Laboriosam rem ab et aut ipsum.', 7040.00, 30926, 42, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (123, 'ut', 'Ipsam a velit eligendi.', 8495.00, 65847, 42, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (124, 'dolores', 'Dolores et sint facilis ex et.', 3274.00, 19736, 42, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (125, 'voluptates', 'Ut et nobis sunt non.', 6759.00, 56078, 43, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (126, 'delectus', 'Porro ullam porro quia voluptatem voluptates omnis omnis.', 298.00, 20635, 43, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (127, 'et', 'A autem non accusantium.', 2295.00, 56909, 43, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (128, 'tenetur', 'Sint et velit similique sit quis suscipit qui.', 5424.00, 75271, 44, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (129, 'aspernatur', 'Necessitatibus sint non voluptas sint.', 2704.00, 69082, 44, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (130, 'eius', 'Praesentium vel earum quas et.', 1615.00, 51938, 44, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (131, 'omnis', 'Impedit tempore aut aliquid repudiandae qui id.', 1219.00, 99058, 45, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (132, 'maxime', 'Beatae sit provident aliquam nihil veniam consequatur.', 7472.00, 56165, 45, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_product_skus` VALUES (133, 'aspernatur', 'Aut expedita ducimus et modi fugit est beatae est.', 1013.00, 44482, 45, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (134, 'quia', 'Magnam vel repellat aliquam minima.', 4021.00, 88581, 46, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (135, 'voluptas', 'Aut alias cupiditate recusandae.', 6494.00, 54755, 46, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (136, 'aspernatur', 'Neque perspiciatis quos nihil.', 8467.00, 60758, 46, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (137, 'laborum', 'At quasi voluptas perspiciatis illo qui nisi.', 5314.00, 73699, 47, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (138, 'exercitationem', 'Quod commodi sit soluta hic voluptatem ducimus nihil.', 4714.00, 9181, 47, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (139, 'et', 'Fugit est voluptates voluptates.', 1427.00, 90565, 47, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (140, 'quod', 'Quis sint quia laudantium a natus tenetur perferendis.', 6749.00, 71440, 48, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (141, 'commodi', 'Eos sed recusandae recusandae dolorem.', 3206.00, 60429, 48, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (142, 'et', 'Vel eaque facilis accusamus officia explicabo error.', 3355.00, 61203, 48, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (143, 'laboriosam', 'Quidem nemo tenetur dolorem eum quis nemo.', 9875.00, 22812, 49, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (144, 'eos', 'Nesciunt suscipit aut quia soluta in libero.', 658.00, 63633, 49, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (145, 'quos', 'Accusamus inventore temporibus vitae dicta.', 7802.00, 75708, 49, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (146, 'rerum', 'Nesciunt quia ipsam eveniet qui.', 3629.00, 32746, 50, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (147, 'qui', 'Provident nesciunt perspiciatis qui.', 2392.00, 55973, 50, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (148, 'harum', 'Velit temporibus et deleniti vel sed impedit consequatur.', 4507.00, 59675, 50, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (149, 'sit', 'Et autem vel accusamus adipisci.', 9924.00, 78530, 51, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (150, 'eum', 'Dolorum nesciunt reiciendis et quisquam incidunt facere.', 4496.00, 30724, 51, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (151, 'fuga', 'Eveniet occaecati minus enim.', 1373.00, 59169, 51, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (152, 'numquam', 'Adipisci dignissimos maxime cumque quas omnis ducimus expedita.', 1172.00, 30369, 52, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (153, 'et', 'Sed modi quo ad vel neque officiis.', 1833.00, 72686, 52, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (154, 'dolorem', 'Et aut cumque deserunt cum nostrum error dolorem.', 135.00, 20410, 52, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (155, 'sunt', 'Fugit quasi atque nam eos illo id nihil fugit.', 7321.00, 4613, 53, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (156, 'ea', 'Id accusantium sit temporibus illum voluptate repellat ut.', 4450.00, 8705, 53, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (157, 'libero', 'Voluptatem possimus totam culpa dolores illum.', 5288.00, 5341, 53, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (158, 'quia', 'Et libero enim ut pariatur voluptas mollitia.', 3246.00, 13682, 54, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (159, 'quo', 'Dolore quisquam corporis harum et.', 1407.00, 79540, 54, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (160, 'dignissimos', 'Voluptas aperiam quo voluptas qui molestias exercitationem.', 7155.00, 23519, 54, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (161, 'unde', 'Voluptatem sed deserunt nemo aperiam sit.', 6502.00, 45980, 55, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (162, 'officia', 'Inventore voluptatibus quia cupiditate quibusdam omnis numquam velit.', 697.00, 98668, 55, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (163, 'quos', 'Blanditiis quasi numquam eum sint similique aut voluptatum.', 8824.00, 19376, 55, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (164, 'deserunt', 'Officia molestias deserunt odio nobis ex doloremque quia.', 6148.00, 52798, 56, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (165, 'assumenda', 'Nesciunt quia iusto eligendi.', 8545.00, 10103, 56, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (166, 'accusantium', 'Fugit ab consectetur ullam facilis.', 488.00, 83550, 56, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (167, 'a', 'Optio similique repellat earum distinctio natus non.', 8834.00, 9019, 57, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (168, 'dolorem', 'Libero ratione culpa consequuntur provident eum tempore non.', 3496.00, 43050, 57, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (169, 'deserunt', 'Aliquid earum corporis officia corporis cumque minus minus.', 5022.00, 34189, 57, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (170, 'facilis', 'Aut autem laudantium cumque maiores non quos voluptates quia.', 762.00, 9357, 58, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (171, 'autem', 'Provident aut facilis ipsa sit animi exercitationem modi placeat.', 3341.00, 12635, 58, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (172, 'pariatur', 'Est dolor quae earum aut.', 9708.00, 43744, 58, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (173, 'repellendus', 'Inventore nesciunt ab magnam assumenda nisi.', 6507.00, 9871, 59, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (174, 'non', 'Quis excepturi facere alias beatae doloremque ut unde.', 3471.00, 76349, 59, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (175, 'at', 'Soluta iusto itaque et totam quibusdam sunt hic.', 4697.00, 47286, 59, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (176, 'fugit', 'Voluptatem exercitationem debitis ad reiciendis sequi adipisci voluptatem.', 4371.00, 30142, 60, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (177, 'officia', 'Aliquam quo vero eveniet possimus reiciendis quas.', 7576.00, 82845, 60, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (178, 'dolorem', 'Et quod et quaerat esse perspiciatis ut vero.', 146.00, 43374, 60, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (179, 'ut', 'Assumenda vel ipsum praesentium fugiat corrupti qui.', 541.00, 15897, 61, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (180, 'hic', 'Quasi beatae aut veniam qui.', 1982.00, 89987, 61, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (181, 'deleniti', 'Magni inventore neque omnis vel odio et alias.', 2850.00, 91352, 61, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (182, 'illo', 'Ipsam sed illo est nulla.', 3402.00, 14488, 62, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (183, 'iure', 'In ut similique asperiores fugiat voluptatem rem totam.', 6498.00, 39379, 62, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (184, 'et', 'Nemo corrupti consequuntur expedita delectus aperiam velit amet.', 6107.00, 26358, 62, '2018-10-21 22:56:22', '2018-10-21 22:56:22');
INSERT INTO `lnmp_product_skus` VALUES (185, '概念版 iPhone XS  一台', '众筹优惠劵10000', 10000.00, 100, 63, '2018-10-22 15:53:02', '2018-10-22 15:53:02');
INSERT INTO `lnmp_product_skus` VALUES (186, '概念版 iPhone XS  两台', '众筹优惠劵9000', 18000.00, 50, 63, '2018-10-22 15:53:02', '2018-10-22 15:53:02');
INSERT INTO `lnmp_product_skus` VALUES (187, '8GB 黑色', '8GB 2400 DDR4 黑色', 549.00, 999, 65, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (188, '8GB 绿色', '8GB 2400 DDR4 绿色', 529.00, 999, 65, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (189, '16GB', '2400 16GB', 1299.00, 999, 65, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (190, '4GB', '2400 4GB', 399.00, 999, 65, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (191, '8GB DDR4 2400', '8GB DDR4 2400 XPG单条', 489.00, 999, 66, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (192, '4GB 万紫千红 DDR4 2133', '4GB 万紫千红 DDR4 2133', 489.00, 999, 66, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (193, 'DDR3 1600 8G', 'DDR3 1600 8G', 439.00, 999, 67, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (194, 'DDR3 1600 4G', 'DDR3 1600 4G', 239.00, 999, 67, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (195, 'DDR3 1333 4G', 'DDR3 1333 4G', 259.00, 999, 67, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (196, '16GB 3000', '16GB 3000 8GB*2', 1199.00, 999, 68, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (197, '16GB 3600', '16GB 3600 8GB*2', 1379.00, 999, 68, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (198, '8GB 2400', '8GB 2400 DDR4', 489.00, 999, 68, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (199, '8GB 3000', '8GB 3000 DDR4', 519.00, 999, 68, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (200, 'DDR4 8G 2400', 'DDR4 8G 2400', 519.00, 999, 69, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (201, 'DDR4 4G 2400', 'DDR4 4G 2400', 359.00, 999, 69, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (202, 'DDR4 8G*2 2400', 'DDR4 8G*2 2400', 1279.00, 999, 69, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (203, 'DDR4 16G 2400', 'DDR4 16G 2400', 1279.00, 999, 69, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (204, 'DDR4 2400 8G', 'DDR4 2400 8G', 539.00, 999, 70, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (205, 'DDR4 2133 8G', 'DDR4 2133 8G', 539.00, 999, 70, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (206, 'DDR4 2666 8G', 'DDR4 2666 8G', 589.00, 999, 70, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (207, 'DDR4 2400 16G', 'DDR4 2400 16G', 1199.00, 999, 70, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_product_skus` VALUES (208, '秒杀 iPhone X 256G', '秒杀商品一份', 6666.00, 999, 71, '2018-10-31 13:14:38', '2018-10-31 15:22:05');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_products
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_products`;
CREATE TABLE `lnmp_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '商品类型',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT '类目ID',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `long_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品长标题',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品详情',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品封面图片文件路径',
  `on_sale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '商品是否正在售卖',
  `rating` float(8,2) NOT NULL DEFAULT '5.00' COMMENT '商品平均评分',
  `sold_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `review_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(10,2) NOT NULL COMMENT 'SKU 最低价格',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_type_index` (`type`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `lnmp_categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='产品表';

-- ----------------------------
-- Records of lnmp_products
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_products` VALUES (1, 'normal', 25, 'Apple iPhone X 256G', '2018最新款 iPhone X 256G 苹果手机', '<p>​​​​<a href=\"https://sale.jd.com/act/XpbwM0G1ZaW.html\" target=\"_blank\"><img alt=\"\" src=\"https://img30.360buyimg.com/jgsq-productsoa/jfs/t24250/4/221454018/20495/68e604c7/5b29b6d2Ne6da1187.jpg\" /></a></p>\r\n\r\n<p><img alt=\"\" src=\"https://img30.360buyimg.com/cms/jfs/t20224/64/1456783694/118133/e7b04d48/5b2a122fN098e03ad.jpg\" style=\"height:223px; width:750px\" /></p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"height:1272px; width:750px\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://img10.360buyimg.com/imgzone/jfs/t16873/173/2429368143/84521/f722c057/5af564e5N4c0d564f.jpg\" style=\"height:249px; width:750px\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://img10.360buyimg.com/imgzone/jfs/t18493/37/635247604/42841/b751e11f/5a9cfa70Nd0637367.jpg\" style=\"height:341px; width:750px\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://img10.360buyimg.com/imgzone/jfs/t17668/348/2483879516/82843/ff7ca37c/5af78e10N103afbd7.jpg\" style=\"height:405px; width:750px\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td><img alt=\"\" src=\"https://img10.360buyimg.com/imgzone/jfs/t15079/323/2344529912/61849/ce9798d9/5a9cfa70N43f7357c.jpg\" style=\"height:277px; width:750px\" /></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://img30.360buyimg.com/jgsq-productsoa/jfs/t9724/59/1430591780/2138721/c72f6394/59e0726aN1edf23c4.jpg\" /></p>', 'images/59e42830N9da56c41.jpg', 1, 5.00, 1, 0, 7599.00, '2018-06-28 00:04:08', '2018-10-26 17:44:52');
INSERT INTO `lnmp_products` VALUES (2, 'normal', 12, 'vero', '', 'Minima reiciendis vel accusamus qui nam maxime.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 3.00, 0, 1, 1521.00, '2018-06-28 01:55:39', '2018-08-15 03:25:28');
INSERT INTO `lnmp_products` VALUES (3, 'normal', 2, 'consectetur', '', 'Unde perspiciatis qui et vel officiis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 4.00, 0, 1, 1219.00, '2018-06-28 01:55:39', '2018-08-15 03:25:28');
INSERT INTO `lnmp_products` VALUES (4, 'normal', 1, 'pariatur', '', 'Iste qui nihil ipsum quae est porro maiores et.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 0.00, 0, 0, 679.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (5, 'normal', 3, 'velit', '', 'Saepe vel dolorem enim pariatur excepturi quidem quidem.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 3.00, 0, 0, 2768.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (6, 'normal', 12, 'pariatur', '', 'In delectus labore et.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 3.00, 0, 0, 1469.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (7, 'normal', 21, 'est', '', 'Vel quidem beatae ut alias.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 2.00, 0, 0, 636.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (8, 'normal', 12, 'id', '', 'Et quia nostrum aspernatur non est eos esse.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 5.00, 0, 0, 4049.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (9, 'normal', 12, 'sit', '', 'Vero consequatur et a impedit.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 3.00, 0, 0, 6123.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (10, 'normal', 22, 'enim', '', 'Dicta quibusdam velit dolores consequatur neque sint.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 0.00, 0, 0, 317.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (11, 'normal', 8, 'blanditiis', '', 'Nulla veniam qui repellendus ut aliquid numquam.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 4.00, 0, 0, 2884.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (12, 'normal', 18, 'quo', '', 'Omnis nulla repudiandae quos culpa.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 0.00, 0, 0, 933.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (13, 'normal', 10, 'ipsam', '', 'Cumque qui delectus qui id autem.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 1.00, 0, 0, 2394.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (14, 'normal', 17, 'distinctio', '', 'A maiores qui voluptatem ut rem eum velit.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 5.00, 0, 0, 479.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (15, 'normal', 21, 'ducimus', '', 'Delectus neque ab tenetur voluptas eos voluptatum iusto.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 2.00, 0, 0, 267.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (16, 'normal', 23, 'delectus', '', 'Quo et odit ab cum repellendus delectus.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 3.00, 0, 0, 2743.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (17, 'normal', 16, 'modi', '', 'Quo aut modi placeat ut qui culpa.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 4.00, 0, 0, 448.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (18, 'normal', 27, 'ea', '', 'Ab eius iure distinctio hic.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 5.00, 0, 0, 3015.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (19, 'normal', 13, 'ratione', '', 'Magnam nulla ullam neque maxime dignissimos.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 4.00, 0, 0, 5081.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (20, 'normal', 5, 'quis', '', 'Omnis qui cum enim enim.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 1.00, 0, 0, 789.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (21, 'normal', 2, 'amet', '', 'Asperiores nostrum ex tempore deleniti consequatur vel voluptate.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 5.00, 0, 0, 4157.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (22, 'normal', 3, 'placeat', '', 'Amet soluta dolores in in.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 0.00, 0, 0, 3382.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (23, 'normal', 5, 'earum', '', 'Qui et sed dolore tenetur ipsam.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 4.00, 0, 0, 3231.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (24, 'normal', 4, 'iste', '', 'Sit rem dolor voluptates eius quisquam sunt.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 3.00, 0, 0, 682.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (25, 'normal', 24, 'ad', '', 'Rerum quam adipisci omnis reiciendis quas.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 4.00, 0, 0, 487.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (26, 'normal', 7, 'earum', '', 'Nobis maxime doloribus nulla voluptas.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 2.00, 0, 0, 496.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (27, 'normal', 10, 'nostrum', '', 'Et iusto in iure possimus qui totam.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 4.00, 0, 0, 2284.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (28, 'normal', 19, 'deserunt', '', 'Impedit nostrum sint dolores.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 3.00, 0, 0, 1384.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (29, 'normal', 20, 'temporibus', '', 'Ut ab eum vitae enim rerum.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 1.00, 0, 0, 648.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (30, 'normal', 16, 'sequi', '', 'Nulla et quam autem sint.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 5.00, 0, 0, 6277.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (31, 'normal', 13, 'et', '', 'Recusandae voluptatem voluptates mollitia repudiandae aut quis quis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 3.00, 0, 0, 1438.00, '2018-06-28 01:55:39', '2018-06-28 01:55:39');
INSERT INTO `lnmp_products` VALUES (32, 'normal', 20, 'MacBook Pro', '', '<p>&nbsp;</p>\r\n\r\n<p><img src=\"https://img10.360buyimg.com/imgzone/jfs/t20830/224/1618156802/218595/7b4e8d3/5b304d58N2ea1de8d.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><br />\r\n<img alt=\"\" src=\"https://img30.360buyimg.com/popWaterMark/jfs/t16891/27/1820503674/857706/f8d5f46f/5ad85b18N227a83e0.jpg\" /></p>\r\n\r\n<p><br />\r\n<img alt=\"\" src=\"https://img30.360buyimg.com/popWaterMark/jfs/t18124/28/1622289209/938192/d41f1a88/5ad15d41Nb23c985a.jpg\" /></p>', 'images/1530598418838.jpg', 1, 2.00, 2, 4, 0.10, '2018-06-29 20:31:47', '2018-10-21 22:58:14');
INSERT INTO `lnmp_products` VALUES (33, 'normal', 2, 'numquam', '', 'Corporis expedita sequi culpa qui sequi eum.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 1.00, 0, 0, 494.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (34, 'normal', 16, 'illum', '', 'Nihil est a dolorem quia voluptatem enim ex.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 1.00, 0, 0, 1596.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (35, 'normal', 14, 'id', '', 'Ratione est nihil veritatis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 2.00, 0, 0, 1310.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (36, 'normal', 6, 'reprehenderit', '', 'Voluptatibus doloremque laborum omnis quis et explicabo.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 3.00, 0, 0, 1587.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (37, 'normal', 23, 'voluptas', '', 'Laudantium nemo occaecati eveniet in possimus quia aut.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 5.00, 0, 0, 3322.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (38, 'normal', 27, 'similique', '', 'Impedit qui rerum dolore sit aliquam magni.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 5.00, 0, 0, 6109.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (39, 'normal', 20, 'consequatur', '', 'Quidem autem dolorum enim et.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 2.00, 0, 0, 2068.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (40, 'normal', 12, 'fugit', '', 'Culpa et ratione officiis qui magni.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 4.00, 0, 0, 1882.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (41, 'normal', 5, 'voluptatem', '', 'Optio quasi eius labore sint voluptas omnis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 3.00, 0, 0, 131.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (42, 'normal', 9, 'laudantium', '', 'Amet aperiam earum mollitia numquam.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 5.00, 0, 0, 3274.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (43, 'normal', 4, 'perspiciatis', '', 'At tenetur id non voluptatem est ut.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 1.00, 0, 0, 298.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (44, 'normal', 26, 'ipsa', '', 'Inventore rem dolor odio.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 2.00, 0, 0, 1615.00, '2018-10-21 22:56:21', '2018-10-21 22:56:21');
INSERT INTO `lnmp_products` VALUES (45, 'normal', 26, 'qui', '', 'Molestiae ipsum dolores aspernatur ad cupiditate.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 0.00, 0, 0, 1013.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (46, 'normal', 13, 'nam', '', 'Aut incidunt eos quis in sed aut.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 4.00, 0, 0, 4021.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (47, 'normal', 21, 'nisi', '', 'Ut id qui veniam et.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 2.00, 0, 0, 1427.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (48, 'normal', 15, 'et', '', 'Nisi quia vitae sunt ut excepturi ut.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 1.00, 0, 0, 3206.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (49, 'normal', 12, 'assumenda', '', 'Tempora ipsam pariatur labore excepturi repellendus.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 1.00, 0, 0, 658.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (50, 'normal', 21, 'voluptas', '', 'Consequatur cupiditate sint mollitia debitis et.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 0.00, 0, 0, 2392.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (51, 'normal', 19, 'et', '', 'Occaecati voluptas corrupti esse dolor molestiae.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 0.00, 0, 0, 1373.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (52, 'normal', 18, 'quod', '', 'Qui tempore eum ipsum modi vitae dolores.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 1.00, 0, 0, 135.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (53, 'normal', 4, 'atque', '', 'Tenetur iusto ratione doloremque laboriosam.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 0.00, 0, 0, 4450.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (54, 'normal', 21, 'nesciunt', '', 'Quos rerum doloremque hic debitis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 5.00, 0, 0, 1407.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (55, 'normal', 3, 'ducimus', '', 'Odit distinctio id quibusdam pariatur quis assumenda.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 0.00, 0, 0, 697.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (56, 'normal', 18, 'rerum', '', 'Ea explicabo repellendus tempore consequuntur quia.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 0.00, 0, 0, 488.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (57, 'normal', 22, 'possimus', '', 'Nulla culpa itaque et tenetur.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 0.00, 0, 0, 3496.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (58, 'normal', 20, 'perferendis', '', 'Reiciendis qui quas labore ipsa maiores non.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 4.00, 0, 0, 762.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (59, 'normal', 3, 'possimus', '', 'Maiores sunt harum et autem eius.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 0.00, 0, 0, 3471.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (60, 'normal', 18, 'et', '', 'Maxime sit ut vero est nam ea.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 4.00, 0, 0, 146.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (61, 'normal', 15, 'asperiores', '', 'Velit vel soluta pariatur cumque alias laboriosam.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 0.00, 0, 0, 541.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (62, 'normal', 9, 'molestias', '', 'Praesentium fuga ad ut rem est et debitis.', 'https://lccdn.phphub.org/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 1.00, 0, 0, 3402.00, '2018-10-21 22:56:21', '2018-10-21 22:56:22');
INSERT INTO `lnmp_products` VALUES (63, 'crowdfunding', 25, 'iPhoneXS', '', '<p>Apple iPhone XS (A2100) 64GB 金色 移动联通电信4G手机</p>', 'images/0ace3ed19582dbe6.jpg', 1, 5.00, 0, 0, 10000.00, '2018-10-22 15:53:02', '2018-10-22 15:53:02');
INSERT INTO `lnmp_products` VALUES (64, 'normal', 13, 'Kingston/金士顿 HX424C15FB/8', '金士顿 骇客神条 ddr4 2400 8g 台式机 电脑 四代内存条 吃鸡内存', '<p><img src=\"https://img.alicdn.com/imgextra/i3/704392951/TB25akyqsuYBuNkSmRyXXcA3pXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/704392951/TB288x6y25TBuNjSspmXXaDRVXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/704392951/TB2ck46y7CWBuNjy0FaXXXUlXXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2_OV3y1uSBuNjSsziXXbq8pXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i3/704392951/TB2F9KZiP7nBKNjSZLeXXbxCFXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2XQ06y7CWBuNjy0FaXXXUlXXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB20Tl7y4SYBuNjSspjXXX73VXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2QygAqDdYBeNkSmLyXXXfnVXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i3/704392951/TB2C6S5qyCYBuNkHFCcXXcHtVXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2J_pByYGYBuNjy0FoXXciBFXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2520Ny29TBuNjy1zbXXXpepXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2ozkLyFmWBuNjSspdXXbugXXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2S9IFiOAnBKNjSZFvXXaTKXXa_!!704392951.jpg\" /></p><p><img alt=\"\" src=\"https://gdp.alicdn.com/imgextra/i4/704392951/TB2KpHwfviSBuNkSnhJXXbDcpXa_!!704392951.jpg\" /></p>', 'https://img.alicdn.com/bao/uploaded/i2/TB1iqkaLVXXXXagXXXXObG1FpXX_091208.jpg_b.jpg', 1, 5.00, 0, 0, 399.00, '2018-10-26 15:29:30', '2018-10-26 15:29:30');
INSERT INTO `lnmp_products` VALUES (65, 'normal', 13, 'Kingston/金士顿 HX424C15FB/8', '金士顿 骇客神条 ddr4 2400 8g 台式机 电脑 四代内存条 吃鸡内存', '<p><img src=\"https://img.alicdn.com/imgextra/i3/704392951/TB25akyqsuYBuNkSmRyXXcA3pXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/704392951/TB288x6y25TBuNjSspmXXaDRVXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/704392951/TB2ck46y7CWBuNjy0FaXXXUlXXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2_OV3y1uSBuNjSsziXXbq8pXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i3/704392951/TB2F9KZiP7nBKNjSZLeXXbxCFXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2XQ06y7CWBuNjy0FaXXXUlXXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB20Tl7y4SYBuNjSspjXXX73VXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2QygAqDdYBeNkSmLyXXXfnVXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i3/704392951/TB2C6S5qyCYBuNkHFCcXXcHtVXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2J_pByYGYBuNjy0FoXXciBFXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2520Ny29TBuNjy1zbXXXpepXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2ozkLyFmWBuNjSspdXXbugXXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2S9IFiOAnBKNjSZFvXXaTKXXa_!!704392951.jpg\" /></p><p><img alt=\"\" src=\"https://gdp.alicdn.com/imgextra/i4/704392951/TB2KpHwfviSBuNkSnhJXXbDcpXa_!!704392951.jpg\" /></p>', 'https://img.alicdn.com/bao/uploaded/i2/TB1iqkaLVXXXXagXXXXObG1FpXX_091208.jpg_b.jpg', 1, 5.00, 0, 0, 399.00, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_products` VALUES (66, 'normal', 13, 'AData/威刚 8G DDR4 2400 (XPG 单条） ', 'ADATA/威刚 8G 16G 3200 3000 2666 2400游戏台式机内存条DDR4套条', '<p><img src=\"https://img.alicdn.com/imgextra/i4/2133729733/TB2LYbVxFOWBuNjy0FiXXXFxVXa_!!2133729733.jpg\" /><br /><a href = \"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-16853183550.96.20b86fd1MBVKRL&id=40645526570&rn=d717312a898e0fb53e74b1c2db2c2232&abbucket=12\" target = \"_self\" ><img src = \"https://img.alicdn.com/imgextra/i2/2133729733/TB2zEdobrZnBKNjSZFhXXc.oXXa_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i1/2133729733/TB2W3VPbWmWBuNjy1XaXXXCbXXa_!!2133729733.jpg\" /></a ><br /><img src = \"https://img.alicdn.com/imgextra/i1/2133729733/TB2NLaeaQyWBuNjy0FpXXassXXa_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i4/2133729733/TB2hvRtfamgSKJjSsphXXcy1VXa_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i2/2133729733/TB2DFptaXXXXXaOXXXXXXXXXXXX_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i4/2133729733/TB2mAUhkCFjpuFjSszhXXaBuVXa_!!2133729733.jpg_q90.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i1/2133729733/TB2aU8kaXXXXXbbXpXXXXXXXXXX_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i3/2133729733/TB2Nhf8cRfM8KJjSZFrXXXSdXXa_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i1/2133729733/TB2h0oEhSYH8KJjSspdXXcRgVXa_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i2/2133729733/TB202q8gP3z9KJjy0FmXXXiwXXa_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i3/2133729733/TB2kRllh0nJ8KJjSszdXXaxuFXa_!!2133729733.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i3/2133729733/TB2BXY3cqzB9uJjSZFMXXXq4XXa_!!2133729733.jpg\" /></p >', 'https://img.alicdn.com/bao/uploaded/i4/TB1URYGHVXXXXXsaXXXtD198VXX_032444.jpg_b.jpg', 1, 5.00, 0, 0, 489.00, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_products` VALUES (67, 'normal', 13, 'Kingston/金士顿 金士顿DDR3 1600 8GB', 'Kingston/金士顿 DDR3 1600 8G 台式机电脑 三代 内存条 兼容1333', '<p><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2Y5OKqOOYBuNjSsD4XXbSkFXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/704392951/TB2cQS8y29TBuNjy0FcXXbeiFXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/704392951/TB2GrWfqIyYBuNkSnfoXXcWgVXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2.Onyy7yWBuNjy0FpXXassXXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i3/704392951/TB2yEnCy29TBuNjy1zbXXXpepXa_!!704392951.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/704392951/TB2Urm1y7KWBuNjy1zjXXcOypXa_!!704392951.jpg\" /></p><p><img alt = \"\" src = \"https://gdp.alicdn.com/imgextra/i4/704392951/TB2KpHwfviSBuNkSnhJXXbDcpXa_!!704392951.jpg\" /></p >', 'https://img.alicdn.com/bao/uploaded/i5/TB1up8DGXXXXXaAaXXXszso_pXX_060025.jpg_b.jpg', 1, 5.00, 0, 0, 239.00, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_products` VALUES (68, 'normal', 13, '影驰 Gamer DDR4-2133 8G ', '影驰 Gamer DDR4-2400/3000 8G/8G*2 单条/套条 台式机呼吸内存条', '<p><img src=\"https://img.alicdn.com/imgextra/i4/2731691808/TB2o._izipnpuFjSZFkXXc4ZpXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/2731691808/TB2eORYmvDH8KJjy1XcXXcpdXXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2731691808/TB21XTzm22H8KJjy0FcXXaDlFXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/2731691808/TB21Sflm46I8KJjSszfXXaZVXXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2731691808/TB29lrSmZjI8KJjSsppXXXbyVXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2731691808/TB2kZUBm4PI8KJjSspfXXcCFXXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/2731691808/TB2QAraeqLN8KJjSZFvXXXW8VXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2731691808/TB2eAwMmgvD8KJjSsplXXaIEFXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2731691808/TB2gCV_mxPI8KJjSspfXXcCFXXa_!!2731691808.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/2731691808/TB2fZ.glj3z9KJjy0FmXXXiwXXa_!!2731691808.jpg\" /></p><p><img src = \"https://gdp.alicdn.com/imgextra/i3/2731691808/TB2fOzyi_mWBKNjSZFBXXXxUFXa_!!2731691808.jpg\" /></p >', 'https://img.alicdn.com/bao/uploaded/i3/TB1oIQJKVXXXXc3XXXXa0s37FXX_013328.jpg_b.jpg', 1, 5.00, 0, 0, 489.00, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_products` VALUES (69, 'normal', 13, '美商海盗船 LPX系列 ', '美商海盗船复仇者DDR4 8G 2400内存条电脑台式主机吃鸡4G16G 3000', '<p><img src=\"https://img.alicdn.com/imgextra/i1/2672032086/TB2sU5YX8HH8KJjy0FbXXcqlpXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2672032086/TB2HwNWumBjpuFjy1XdXXaooVXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2672032086/TB2Y6PJugJlpuFjSspjXXcT.pXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/2672032086/TB22lOTcmBYBeNjy0FeXXbnmFXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i3/2672032086/TB2F4KNul0kpuFjSsziXXa.oVXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2672032086/TB2O1qZoZbI8KJjy1zdXXbe1VXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2672032086/TB2mNK1yiRnpuFjSZFCXXX2DXXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2672032086/TB2rmzDyb4npuFjSZFmXXXl4FXa_!!2672032086.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2672032086/TB2vNOVumxjpuFjSszeXXaeMVXa_!!2672032086.jpg\" /></p>', 'https://img.alicdn.com/bao/uploaded/i2/TB1SynxMVXXXXaVXFXX_qyp.VXX_111729.jpg_b.jpg', 1, 5.00, 0, 0, 359.00, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_products` VALUES (70, 'normal', 13, 'Samsung/三星 8G DDR4 2400', '三星内存条8g DDR4 2400 2133 2666 笔记本内存条16g四代吃鸡内存', '<p><img src=\"https://img.alicdn.com/imgextra/i4/2088879112/TB2haJVAXOWBuNjy0FiXXXFxVXa_!!2088879112.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i4/2088879112/TB24BfbAhWYBuNjy1zkXXXGGpXa_!!2088879112.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i2/2088879112/TB2D_McAntYBeNjy1XdXXXXyVXa_!!2088879112.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i3/2088879112/TB255XTAeOSBuNjy0FdXXbDnVXa_!!2088879112.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/2088879112/TB2.iU3rRmWBuNkSndVXXcsApXa_!!2088879112.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/2088879112/TB2p93srLiSBuNkSnhJXXbDcpXa_!!2088879112.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/2088879112/TB2z_ugAf5TBuNjSspmXXaDRVXa_!!2088879112.jpg\" /><img src=\"https://img.alicdn.com/imgextra/i1/2088879112/TB2WBc7rOOYBuNjSsD4XXbSkFXa_!!2088879112.jpg\" /></p><p><img src = \"https://img.alicdn.com/imgextra/i2/2088879112/TB23DUcAntYBeNjy1XdXXXXyVXa_!!2088879112.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i1/2088879112/TB28YJWAXuWBuNjSszbXXcS7FXa_!!2088879112.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i2/2088879112/TB2p1NBAf5TBuNjSspcXXbnGFXa_!!2088879112.jpg\" /></p > <p ><img src = \"https://img.alicdn.com/imgextra/i3/2088879112/TB25P9BjkZmBKNjSZPiXXXFNVXa_!!2088879112.jpg\" /><img src = \"https://img.alicdn.com/imgextra/i2/2088879112/TB2ArOKAbSYBuNjSspfXXcZCpXa_!!2088879112.jpg\" /></p > <p ><img src = \"https://gdp.alicdn.com/imgextra/i4/2088879112/TB20U1Tcsr_F1JjSZFoXXbVRXXa_!!2088879112.jpg\" /></p >', 'https://img.alicdn.com/bao/uploaded/i8/TB1nkDwATJYBeNjy1zelIqhzVXa_020604.jpg_b.jpg', 1, 5.00, 0, 0, 539.00, '2018-10-26 15:30:03', '2018-10-26 15:30:03');
INSERT INTO `lnmp_products` VALUES (71, 'seckill', 25, '秒杀 iPhone X 256G', '秒杀 2018最新款 iPhone X 256G 苹果手机', '<p>秒杀商品一份</p>', 'images/784a820ca4bcc7901feb1f8ef1cefb69.jpg', 1, 5.00, 0, 0, 6666.00, '2018-10-31 13:14:38', '2018-10-31 13:16:10');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_seckill_products
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_seckill_products`;
CREATE TABLE `lnmp_seckill_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `start_at` datetime NOT NULL COMMENT '秒杀开始时间',
  `end_at` datetime NOT NULL COMMENT '秒杀结束时间',
  PRIMARY KEY (`id`),
  KEY `seckill_products_product_id_foreign` (`product_id`),
  CONSTRAINT `seckill_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `lnmp_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='秒杀产品表';

-- ----------------------------
-- Records of lnmp_seckill_products
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_seckill_products` VALUES (1, 71, '2018-10-31 15:00:00', '2018-11-12 15:00:00');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_user_addresses`;
CREATE TABLE `lnmp_user_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID[改地址所属用户]',
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '省份',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市',
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '地区',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详细地址',
  `zip` int(10) unsigned NOT NULL COMMENT '邮编',
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '联系人电话',
  `last_used_at` datetime DEFAULT NULL COMMENT '最好一次使用时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_addresses_user_id_foreign` (`user_id`),
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `lnmp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户收货地址表';

-- ----------------------------
-- Records of lnmp_user_addresses
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_user_addresses` VALUES (1, 1, '天津市', '市辖区', '河西区', '第12街道第799号', 714000, '叶娜', '13774566368', '2018-06-28 15:47:03', '2018-06-19 06:00:09', '2018-06-28 23:47:03');
INSERT INTO `lnmp_user_addresses` VALUES (2, 1, '重庆市', '市辖区', '南岸区', '第14街道第916号', 728600, '僧娟', '18243707378', NULL, '2018-06-19 06:00:09', '2018-06-19 06:00:09');
INSERT INTO `lnmp_user_addresses` VALUES (3, 1, '重庆市', '市辖区', '渝中区', '第34街道第453号', 136300, '揭辉', '18392012296', NULL, '2018-06-19 06:00:09', '2018-06-19 06:00:09');
INSERT INTO `lnmp_user_addresses` VALUES (4, 1, '四川省', '南充市', '南部县', '定水镇山水茗苑3栋1单元201室', 637301, '董坤鸿', '18302198804', '2018-10-31 15:22:05', '2018-06-19 06:54:01', '2018-10-31 15:22:05');
INSERT INTO `lnmp_user_addresses` VALUES (5, 1, '上海市', '市辖区', '徐汇区', '番禺路1028号1207-1208室', 200030, '董坤鸿', '18302198805', '2018-10-24 17:13:36', '2018-06-19 19:24:12', '2018-10-24 17:13:36');
INSERT INTO `lnmp_user_addresses` VALUES (6, 2, '上海市', '市辖区', '浦东新区', '成山路24弄2号204室', 200163, '何春凤', '18717861651', NULL, '2018-06-27 20:18:53', '2018-06-27 20:18:53');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_user_favorite_products
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_user_favorite_products`;
CREATE TABLE `lnmp_user_favorite_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `user_favorite_products_user_id_foreign` (`user_id`),
  KEY `user_favorite_products_product_id_foreign` (`product_id`),
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `lnmp_products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `lnmp_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户收藏表';

-- ----------------------------
-- Records of lnmp_user_favorite_products
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_user_favorite_products` VALUES (1, 1, 1, '2018-06-28 07:29:53', '2018-06-28 07:29:53');
INSERT INTO `lnmp_user_favorite_products` VALUES (2, 1, 2, '2018-06-28 07:43:28', '2018-06-28 07:43:28');
INSERT INTO `lnmp_user_favorite_products` VALUES (3, 1, 3, '2018-06-28 07:43:34', '2018-06-28 07:43:34');
INSERT INTO `lnmp_user_favorite_products` VALUES (4, 1, 4, '2018-06-28 07:45:05', '2018-06-28 07:45:05');
INSERT INTO `lnmp_user_favorite_products` VALUES (6, 1, 5, '2018-06-28 07:49:10', '2018-06-28 07:49:10');
INSERT INTO `lnmp_user_favorite_products` VALUES (7, 1, 6, '2018-06-28 07:49:54', '2018-06-28 07:49:54');
INSERT INTO `lnmp_user_favorite_products` VALUES (8, 1, 32, '2018-07-04 22:17:11', '2018-07-04 22:17:11');
INSERT INTO `lnmp_user_favorite_products` VALUES (9, 2, 32, '2018-09-12 12:29:08', '2018-09-12 12:29:08');
COMMIT;

-- ----------------------------
-- Table structure for lnmp_users
-- ----------------------------
DROP TABLE IF EXISTS `lnmp_users`;
CREATE TABLE `lnmp_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `email_verified` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮箱验证',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '记住登录',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of lnmp_users
-- ----------------------------
BEGIN;
INSERT INTO `lnmp_users` VALUES (1, '董坤鸿', '249529979@qq.com', '$2y$10$9tYJ85knFzTkk6Dqwp09kuEj7xvJwcIugC7krgR67kKzDMcFOffOm', 1, 'rBkdqZ7WReQRjOIjLswpeXzIKTUAJ1n2OMDNu0PsICjkvsAILOI6MWczWkoK', '2018-06-19 02:23:18', '2018-10-31 14:50:38');
INSERT INTO `lnmp_users` VALUES (2, '何春凤', '764561837@qq.com', '$2y$10$sy/GE/bghOnJio3cr3.wDOWfFJRohO3.0coUNGfSpY9NFrSUkPwPq', 1, 'm5zXrcLzek6kZhN5BCO2sJcYvQEIr3ggsvPrB0ZHD41QAtydyPOG85IdRDMj', '2018-06-19 04:16:16', '2018-09-18 12:55:43');
INSERT INTO `lnmp_users` VALUES (3, 'smallk', '466135132@qq.com', '$2y$10$8NZdty5d8DHljZcsGSj18OlElHr6xT7xRu3ez15R6A0WguqPVq/ZO', 0, '', '2018-08-03 09:07:48', '2018-08-03 09:07:48');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
