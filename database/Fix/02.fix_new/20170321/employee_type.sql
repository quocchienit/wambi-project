/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : wambi_scu

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-03-22 23:13:40
*/

SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `employee_type` ;
-- ----------------------------
-- Records of employee_type
-- ----------------------------
INSERT INTO `employee_type` VALUES ('1', 'scheduling-manager', 'Scheduling Manager', 'upload/nursh.png', '[\"dashboard\"]');
INSERT INTO `employee_type` VALUES ('2', 'employee', 'Employee', 'upload/ffff.png', '[\"dashboard\"]');
INSERT INTO `employee_type` VALUES ('3', 'admin', 'Admin', '', '[\"dashboard\",\"newfeed\",\"coin\",\"addcoin\",\"list_approve_request\"]');
INSERT INTO `employee_type` VALUES ('4', 'super-admin', 'Super Admin', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]');
INSERT INTO `employee_type` VALUES ('5', 'patient-manager', 'Patient Manager', '', '[\"dashboard\",\"patient\"]');
INSERT INTO `employee_type` VALUES ('6', 'employee-manager', 'Employee Manager', '', '');
INSERT INTO `employee_type` VALUES ('7', 'super-executive', 'Super Executive User', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]');
