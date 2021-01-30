/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : myweb

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 14/03/2019 06:40:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `messageid` int(15) UNSIGNED NOT NULL AUTO_INCREMENT,
  `mesage` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'guest',
  `mesagesh` tinyint(1) NOT NULL DEFAULT 0 COMMENT '审核',
  PRIMARY KEY (`messageid`) USING BTREE,
  INDEX `message_ibfk_1`(`username`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userpwd` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tail` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '可自定义小尾巴',
  `tx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'upload/def.jpg',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('guest', 'guestadmin', '游客留言', 'upload/def.jpg');

-- ----------------------------
-- View structure for showmessage
-- ----------------------------
DROP VIEW IF EXISTS `showmessage`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `showmessage` AS select `message`.`mesage` AS `mesage`,`message`.`username` AS `username`,`message`.`mesagesh` AS `mesagesh`,`user`.`tail` AS `tail`,`user`.`tx` AS `tx` from (`message` join `user` on((`message`.`username` = `user`.`username`)));

SET FOREIGN_KEY_CHECKS = 1;
