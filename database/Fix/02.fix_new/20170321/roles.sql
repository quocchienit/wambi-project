/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : wambi_scu

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-03-22 22:19:06
*/

SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `roles` ;
-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'super-admin', 'Super Admin', null, '2016-08-15 09:44:16', '2016-08-15 09:44:21');
INSERT INTO `roles` VALUES ('2', 'admin', 'Admin', null, '2016-08-15 09:44:16', '2016-08-15 09:44:16');
INSERT INTO `roles` VALUES ('3', 'employee-manager', 'Employee Manager', null, '2016-08-15 09:44:16', '2016-08-15 09:44:16');
INSERT INTO `roles` VALUES ('4', 'scheduling-manager', 'Scheduling Manager', null, '2016-08-15 09:44:16', '2016-08-15 09:44:16');
INSERT INTO `roles` VALUES ('5', 'patient-manager', 'Patient Manager', null, '2016-08-15 09:44:16', '2016-08-15 09:44:16');
INSERT INTO `roles` VALUES ('6', 'employee', 'Employee', null, '2016-08-15 09:44:16', '2016-08-15 09:44:16');
INSERT INTO `roles` VALUES ('7', 'super-executive', 'Super Executive User', null, null, null);
