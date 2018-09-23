/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : forum

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 09/23/2018 16:25:36 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `Board`
-- ----------------------------
DROP TABLE IF EXISTS `Board`;
CREATE TABLE `Board` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `replyCount` int(11) NOT NULL,
  `threadCount` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `last_reply_id` int(11) DEFAULT NULL,
  `last_thread_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3D5FEC6B0A9BAC5` (`last_thread_id`),
  KEY `FK3D5FEC6264DFFAE` (`category_id`),
  KEY `FK3D5FEC66AD9BECF` (`last_reply_id`),
  CONSTRAINT `FK3D5FEC6264DFFAE` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`),
  CONSTRAINT `FK3D5FEC66AD9BECF` FOREIGN KEY (`last_reply_id`) REFERENCES `Reply` (`id`),
  CONSTRAINT `FK3D5FEC6B0A9BAC5` FOREIGN KEY (`last_thread_id`) REFERENCES `Thread` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `Board`
-- ----------------------------
BEGIN;
INSERT INTO `Board` VALUES ('1', '2018-09-21 17:38:58', b'1', null, '大六壬板块', '大六壬', '2', '2', '1', '3', null);
COMMIT;

-- ----------------------------
--  Table structure for `Category`
-- ----------------------------
DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `deleted` tinyint(10) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `Category`
-- ----------------------------
BEGIN;
INSERT INTO `Category` VALUES ('1', '2018-09-21 12:06:55', '0', null, '预测占卜'), ('2', '2018-09-21 18:32:02', '0', null, '娱乐八卦');
COMMIT;

-- ----------------------------
--  Table structure for `Person`
-- ----------------------------
DROP TABLE IF EXISTS `Person`;
CREATE TABLE `Person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `account` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `birthday` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateLastActived` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipCreated` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `ipLastActived` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `Person`
-- ----------------------------
BEGIN;
INSERT INTO `Person` VALUES ('1', '2018-09-20 23:59:48', b'0', '0', 'yori', '20180909', '2018-09-20 23:59:48', 'kongtong2004@163.com', '127.0.0.1', '127.0.0.1', 'yori yao', '5f912038598d7e07d2888cb7b0d96ac2', '男'), ('2', '2018-09-21 00:08:09', b'0', '14', 'admin', '19811230', '2018-09-21 18:31:00', 'kongtong2004@163.com', '127.0.0.1', '127.0.0.1', 'yori yao', '21232f297a57a5a743894a0e4a801fc3', '男');
COMMIT;

-- ----------------------------
--  Table structure for `Reply`
-- ----------------------------
DROP TABLE IF EXISTS `Reply`;
CREATE TABLE `Reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `floor` int(11) NOT NULL,
  `ipCreated` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `thread_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4B322CA73C3F12E` (`thread_id`),
  KEY `FK4B322CA21D82F58` (`author_id`),
  CONSTRAINT `FK4B322CA21D82F58` FOREIGN KEY (`author_id`) REFERENCES `Person` (`id`),
  CONSTRAINT `FK4B322CA73C3F12E` FOREIGN KEY (`thread_id`) REFERENCES `Thread` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `Reply`
-- ----------------------------
BEGIN;
INSERT INTO `Reply` VALUES ('1', '2018-09-21 17:41:16', b'1', null, '水电费水电费', '1', '10.20.120.20', '我来说下', '1', '1'), ('2', '2018-09-21 17:52:04', b'0', '1', '<p>我也不知道</p>', '1', null, 'Re: 今天头疼，帮忙占卜下是怎么了？', '2', '2'), ('3', '2018-09-21 18:09:16', b'0', '1', '<p>和气生财</p>', '1', null, 'Re: 呵呵啊', '2', '3');
COMMIT;

-- ----------------------------
--  Table structure for `Thread`
-- ----------------------------
DROP TABLE IF EXISTS `Thread`;
CREATE TABLE `Thread` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime DEFAULT NULL,
  `deleted` bit(1) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_bin,
  `dateLastReplied` datetime DEFAULT NULL,
  `hit` int(11) NOT NULL,
  `ipCreated` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `readonly` bit(1) NOT NULL,
  `replyCount` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `topped` bit(1) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `author_last_replied_id` int(11) DEFAULT NULL,
  `board_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9545FA2AC09B45C6` (`board_id`),
  KEY `FK9545FA2A7238BBF` (`author_last_replied_id`),
  KEY `FK9545FA2A21D82F58` (`author_id`),
  CONSTRAINT `FK9545FA2A21D82F58` FOREIGN KEY (`author_id`) REFERENCES `Person` (`id`),
  CONSTRAINT `FK9545FA2A7238BBF` FOREIGN KEY (`author_last_replied_id`) REFERENCES `Person` (`id`),
  CONSTRAINT `FK9545FA2AC09B45C6` FOREIGN KEY (`board_id`) REFERENCES `Board` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `Thread`
-- ----------------------------
BEGIN;
INSERT INTO `Thread` VALUES ('1', '2018-09-21 17:40:03', b'1', null, '求占卜', '2018-09-21 17:40:20', '1', '10.10.1.203', b'1', '0', '求占卜', b'1', '1', '1', '1'), ('2', '2018-09-21 17:51:39', b'0', '0', '<p>天啊，我今天头疼，感觉要死了怎么办？</p>', '2018-09-21 17:52:04', '5', '127.0.0.1', b'0', '1', '今天头疼，帮忙占卜下是怎么了？', b'0', '2', '2', '1'), ('3', '2018-09-21 18:08:58', b'0', '0', '熬', '2018-09-21 18:09:16', '5', '127.0.0.1', b'0', '1', '呵呵啊', b'0', '2', '2', '1');
COMMIT;

-- ----------------------------
--  Table structure for `board_administrator`
-- ----------------------------
DROP TABLE IF EXISTS `board_administrator`;
CREATE TABLE `board_administrator` (
  `board_id` int(11) NOT NULL,
  `person_id` int(11) NOT NULL,
  PRIMARY KEY (`board_id`,`person_id`),
  KEY `FKBDEF7934C09B45C6` (`board_id`),
  KEY `FKBDEF7934FCBEE94E` (`person_id`),
  CONSTRAINT `FKBDEF7934C09B45C6` FOREIGN KEY (`board_id`) REFERENCES `Board` (`id`),
  CONSTRAINT `FKBDEF7934FCBEE94E` FOREIGN KEY (`person_id`) REFERENCES `Person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
--  Records of `board_administrator`
-- ----------------------------
BEGIN;
INSERT INTO `board_administrator` VALUES ('1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
