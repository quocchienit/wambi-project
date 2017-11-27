/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-07-14 21:20:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `employee_type`
-- ----------------------------
DROP TABLE IF EXISTS `employee_type`;
CREATE TABLE `employee_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `permission` varchar(1000) NOT NULL,
  `visiabled` tinyint(4) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etid` (`id`) USING BTREE,
  KEY `etid_2` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee_type
-- ----------------------------
INSERT INTO `employee_type` VALUES ('1', 'scheduling-manager', 'Scheduling Manager', 'upload/nursh.png', '[\"dashboard\"]', '0', '4');
INSERT INTO `employee_type` VALUES ('2', 'employee', 'Employee', 'upload/ffff.png', '[\"dashboard\"]', '0', '1');
INSERT INTO `employee_type` VALUES ('3', 'admin', 'Admin', '', '[\"dashboard\",\"newfeed\",\"coin\",\"addcoin\",\"list_approve_request\"]', '0', '5');
INSERT INTO `employee_type` VALUES ('4', 'super-admin', 'Super Admin', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]', '0', '6');
INSERT INTO `employee_type` VALUES ('5', 'patient-manager', 'Patient Manager', '', '[\"dashboard\",\"patient\"]', '0', '2');
INSERT INTO `employee_type` VALUES ('6', 'employee-manager', 'Employee Manager', '', '', '0', '3');
INSERT INTO `employee_type` VALUES ('7', 'super-executive', 'Super Executive User', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]', '1', '7');
