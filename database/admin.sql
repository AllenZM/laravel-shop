-- MySQL dump 10.13  Distrib 5.7.23, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: laravel-shop
-- ------------------------------------------------------
-- Server version	5.7.23-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `lnmp_admin_menu`
--

LOCK TABLES `lnmp_admin_menu` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_menu` DISABLE KEYS */;
INSERT INTO `lnmp_admin_menu` VALUES (1,0,1,'首页','fa-bar-chart','/',NULL,'2018-06-27 21:45:17'),(2,0,9,'系统管理','fa-tasks',NULL,NULL,'2018-10-22 15:28:16'),(3,2,10,'管理员管理','fa-users','auth/users',NULL,'2018-10-22 15:28:16'),(4,2,11,'角色管理','fa-user','auth/roles',NULL,'2018-10-22 15:28:16'),(5,2,12,'权限管理','fa-ban','auth/permissions',NULL,'2018-10-22 15:28:16'),(6,2,13,'菜单管理','fa-bars','auth/menu',NULL,'2018-10-22 15:28:16'),(7,2,14,'操作日志','fa-history','auth/logs',NULL,'2018-10-22 15:28:16'),(8,0,2,'用户管理','fa-users','/users','2018-06-27 21:44:06','2018-06-27 21:45:17'),(9,0,3,'产品管理','fa-cubes',NULL,'2018-06-27 23:38:52','2018-06-27 23:39:53'),(10,9,5,'商品管理','fa-cube','/products','2018-06-27 23:40:36','2018-10-21 22:22:27'),(11,9,7,'订单管理','fa-rmb','/orders','2018-06-29 12:39:25','2018-10-22 15:28:16'),(12,9,8,'优惠券管理','fa-tags','/coupon_codes','2018-07-05 01:08:59','2018-10-22 15:28:16'),(13,9,4,'商品类目','fa-align-justify','/categories','2018-10-21 22:18:34','2018-10-21 22:22:27'),(14,9,6,'众筹商品','fa-flag-checkered','/crowdfunding_products','2018-10-22 15:28:00','2018-10-22 15:28:16');
/*!40000 ALTER TABLE `lnmp_admin_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lnmp_admin_permissions`
--

LOCK TABLES `lnmp_admin_permissions` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_permissions` DISABLE KEYS */;
INSERT INTO `lnmp_admin_permissions` VALUES (1,'所有权限','*','','*','2018-06-27 22:52:42','2018-06-27 22:52:42'),(2,'首页','dashboard','GET','/','2018-06-27 22:53:29','2018-06-27 22:53:29'),(3,'登录','auth.login','','/auth/login\r\n/auth/logout','2018-06-27 22:53:10','2018-06-27 22:53:10'),(4,'用户设置','auth.setting','GET,PUT','/auth/setting','2018-06-27 22:53:46','2018-06-27 22:53:46'),(5,'权限管理','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs','2018-06-27 22:54:13','2018-06-27 22:54:13'),(6,'用户管理','users','','/users','2018-06-27 22:52:07','2018-06-27 22:52:07'),(7,'商品管理','products','','/products','2018-07-05 11:41:42','2018-07-05 11:41:42'),(8,'订单管理','orders','','/orders','2018-07-05 11:43:37','2018-07-05 11:43:37'),(9,'优惠券管理','coupon_codes','','/coupon_codes','2018-07-05 11:44:09','2018-07-05 11:44:09');
/*!40000 ALTER TABLE `lnmp_admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lnmp_admin_role_menu`
--

LOCK TABLES `lnmp_admin_role_menu` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_role_menu` DISABLE KEYS */;
INSERT INTO `lnmp_admin_role_menu` VALUES (1,2,NULL,NULL);
/*!40000 ALTER TABLE `lnmp_admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lnmp_admin_role_permissions`
--

LOCK TABLES `lnmp_admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_role_permissions` DISABLE KEYS */;
INSERT INTO `lnmp_admin_role_permissions` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `lnmp_admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lnmp_admin_role_users`
--

LOCK TABLES `lnmp_admin_role_users` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_role_users` DISABLE KEYS */;
INSERT INTO `lnmp_admin_role_users` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `lnmp_admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lnmp_admin_roles`
--

LOCK TABLES `lnmp_admin_roles` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_roles` DISABLE KEYS */;
INSERT INTO `lnmp_admin_roles` VALUES (1,'超级管理员','administrator','2018-06-27 21:01:29','2018-06-27 22:55:04');
/*!40000 ALTER TABLE `lnmp_admin_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lnmp_admin_user_permissions`
--

LOCK TABLES `lnmp_admin_user_permissions` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `lnmp_admin_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `lnmp_admin_users`
--

LOCK TABLES `lnmp_admin_users` WRITE;
/*!40000 ALTER TABLE `lnmp_admin_users` DISABLE KEYS */;
INSERT INTO `lnmp_admin_users` VALUES (1,'admin','$2y$10$7UkH/26nTrP.A4mISm337ejsUXvNHrUruIudcbUQ0a1Ub5eHng3g.','超级管理员',NULL,'T0MkjdXwCOiorPGvX0qwGOUX3PHDTPa3kqA9FXidklAYkAOxkpeKOatqAEB4','2018-06-27 21:01:29','2018-06-27 21:11:52');
/*!40000 ALTER TABLE `lnmp_admin_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-22  7:57:47
