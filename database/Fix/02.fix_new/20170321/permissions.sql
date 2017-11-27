/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : wambi_scu

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-03-22 22:19:18
*/

SET FOREIGN_KEY_CHECKS=0;
DELETE FROM `permissions` ;
-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'dashboard', 'Access dashboard page', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('2', 'shift-add', 'Post shift', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('3', 'shift-edit', 'Edit shift', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('4', 'shift-delete', 'Delete shift', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('5', 'shift-approve', 'Approve shift', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('6', 'award-add', 'Add award', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('7', 'award-delete', 'Delete Award', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('8', 'award-approve', 'Approve Award', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('9', 'employee-add', 'Add Employee', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('10', 'employee-edit', 'Edit Employee', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('11', 'employee-delete', 'Delete Employee', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('12', 'patient-add', 'Add Patient', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('13', 'patient-edit', 'Edit Patient', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('14', 'patient-delete', 'Delete Patient', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('15', 'shift-manage', 'Manage Shifts', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('16', 'employee-manage', 'Manage Employees', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('17', 'patient-manage', 'Manage Patients', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('18', 'award-manage', 'Manage Awards', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('19', 'survey-manage', 'Manage Survey', null, '2016-08-15 09:58:46', '2016-08-15 09:58:46');
INSERT INTO `permissions` VALUES ('20', 'data-manage', 'Manage Data', null, null, null);
INSERT INTO `permissions` VALUES ('21', 'reward-add', 'Add Reward', null, '2016-09-22 21:59:11', '2016-09-22 21:59:15');
