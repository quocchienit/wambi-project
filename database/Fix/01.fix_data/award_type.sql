/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : wambi_scu

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-02-22 21:32:04
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `award_type`
-- ----------------------------
DROP TABLE IF EXISTS `award_type`;
CREATE TABLE `award_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` varchar(250) NOT NULL,
  `unit_id` varchar(50) NOT NULL,
  `notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of award_type
-- ----------------------------
INSERT INTO `award_type` VALUES ('1', '1\r\n2\r\n3\r\n', 'employee', 'Top Scoring Employee', '1', 'default');
INSERT INTO `award_type` VALUES ('2', '2', 'employee', 'No missed punches', '1', 'primary');
INSERT INTO `award_type` VALUES ('3', '3', 'employee', 'Special Situations', '1', 'info');
INSERT INTO `award_type` VALUES ('4', '1', 'employee', 'Top Scoring Employee', '2', 'default');
INSERT INTO `award_type` VALUES ('5', '2', 'employee', 'No missed punches', '2', 'primary');
INSERT INTO `award_type` VALUES ('6', '3', 'employee', 'Special Situations', '2', 'info');
INSERT INTO `award_type` VALUES ('7', '1', 'employee', 'Top Scoring Employee', '3', 'default');
INSERT INTO `award_type` VALUES ('8', '2', 'employee', 'No missed punches', '3', 'primary');
INSERT INTO `award_type` VALUES ('9', '3', 'employee', 'Special Situations', '3', 'info');
INSERT INTO `award_type` VALUES ('10', '1', 'unit', 'No falls', '1', 'success');
INSERT INTO `award_type` VALUES ('11', '2', 'unit', 'No Clautis', '1', 'warning');
INSERT INTO `award_type` VALUES ('12', '3', 'unit', 'No Hap u’s', '1', 'danger');
INSERT INTO `award_type` VALUES ('13', '4', 'unit', 'No Vap’s', '1', 'pink');
INSERT INTO `award_type` VALUES ('14', '5', 'unit', 'No Agency Use', '1', 'purple');
INSERT INTO `award_type` VALUES ('15', '1', 'unit', 'No falls', '2', 'success');
INSERT INTO `award_type` VALUES ('16', '2', 'unit', 'No Clautis', '2', 'warning');
INSERT INTO `award_type` VALUES ('17', '3', 'unit', 'No Hap u’s', '2', 'danger');
INSERT INTO `award_type` VALUES ('18', '4', 'unit', 'No Vap’s', '2', 'pink');
INSERT INTO `award_type` VALUES ('19', '5', 'unit', 'No Agency Use', '2', 'purple');
INSERT INTO `award_type` VALUES ('20', '1', 'unit', 'No falls', '3', 'success');
INSERT INTO `award_type` VALUES ('21', '2', 'unit', 'No Clautis', '3', 'warning');
INSERT INTO `award_type` VALUES ('22', '3', 'unit', 'No Hap u’s', '3', 'danger');
INSERT INTO `award_type` VALUES ('23', '4', 'unit', 'No Vap’s', '3', 'pink');
INSERT INTO `award_type` VALUES ('24', '5', 'unit', 'No Agency Use', '3', 'purple');
