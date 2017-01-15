# Host: 127.0.0.1  (Version: 5.5.24-log)
# Date: 2016-09-05 20:49:15
# Generator: MySQL-Front 5.3  (Build 2.42)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

DROP DATABASE IF EXISTS `mobileshop`;
CREATE DATABASE `mobileshop` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mobileshop`;

#
# Source for table "mobileclassify"
#

DROP TABLE IF EXISTS `mobileclassify`;
CREATE TABLE `mobileclassify` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Data for table "mobileclassify"
#

INSERT INTO `mobileclassify` VALUES (1,'iPhone手机'),(2,'Android手机'),(3,'Win Phone手机');

#
# Source for table "mobileform"
#

DROP TABLE IF EXISTS `mobileform`;
CREATE TABLE `mobileform` (
  `mobile_version` char(50) NOT NULL DEFAULT '',
  `mobile_name` char(60) DEFAULT NULL,
  `mobile_made` char(200) DEFAULT NULL,
  `mobile_price` float(4,0) DEFAULT NULL,
  `mobile_mess` char(255) DEFAULT NULL,
  `mobile_pic` char(200) NOT NULL DEFAULT '',
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mobile_version`,`mobile_pic`),
  KEY `id` (`id`),
  CONSTRAINT `mobileform_ibfk_1` FOREIGN KEY (`id`) REFERENCES `mobileclassify` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "mobileform"
#

INSERT INTO `mobileform` VALUES ('A89S6','苹果S5手机','苹果公司',9876,'高清大屏幕','apple.jpg',1),('B8978','三星A98手机','三星公司',8976,'支持图形非常好','aa.jpg',2),('C555','中兴N986','中兴公司',3567,'双卡双待','cc.jpg',2),('D0909','诺基亚','诺基亚公司',1000,'屏幕清晰','bb.jpg',3);

#
# Source for table "orderform"
#

DROP TABLE IF EXISTS `orderform`;
CREATE TABLE `orderform` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `logname` char(255) DEFAULT NULL,
  `mess` char(255) DEFAULT NULL,
  `sum` float DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "orderform"
#

INSERT INTO `orderform` VALUES (1,'ljl','1:(A89S6,苹果S5手机,苹果公司,9876.0)2:(A89S6,苹果S5手机,苹果公司,9876.0)',19752),(2,'ljl','1:(C555,中兴N986,中兴公司,3567)',3567),(3,'ljl','1:(A89S6,苹果S5手机,苹果公司,9876)',9876),(4,'ljl','1:(A89S6,苹果S5手机,苹果公司,9876.0)',9876);

#
# Source for table "user"
#

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `logname` char(255) NOT NULL DEFAULT '',
  `password` char(255) DEFAULT NULL,
  `phone` char(255) DEFAULT NULL,
  `address` char(255) DEFAULT NULL,
  `realname` char(255) DEFAULT NULL,
  PRIMARY KEY (`logname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "user"
#

INSERT INTO `user` VALUES ('fmj','123','142536','四平','小李'),('ljl','123','3291955','streat','ljl'),('zjf','123','172839','吉林','小张');

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
