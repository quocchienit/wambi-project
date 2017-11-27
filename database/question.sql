/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-07-01 16:38:50
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `css_class` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT '1',
  `fac_id` varchar(50) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('181', '1', 'Was compassionate and charitable towards you', '#f4292d', '1', '1', '1', '1');
INSERT INTO `question` VALUES ('182', '2', 'Was compassionate and charitable towards you', '#f4292d', '2', '1', '1', '1');
INSERT INTO `question` VALUES ('183', '3', 'Was compassionate and charitable towards you', '#f4292d', '3', '1', '1', '1');
INSERT INTO `question` VALUES ('184', '4', 'Was compassionate and charitable towards you', '#f4292d', '4', '1', '1', '1');
INSERT INTO `question` VALUES ('185', '5', 'Was compassionate and charitable towards you', '#f4292d', '5', '1', '1', '1');
INSERT INTO `question` VALUES ('186', '6', 'Helped to enhance the quality of your life', '#9e0dfe', '1', '1', '1', '2');
INSERT INTO `question` VALUES ('187', '7', 'Helped to enhance the quality of your life', '#9e0dfe', '2', '1', '1', '2');
INSERT INTO `question` VALUES ('188', '8', 'Helped to enhance the quality of your life', '#9e0dfe', '3', '1', '1', '2');
INSERT INTO `question` VALUES ('189', '9', 'Helped to enhance the quality of your life', '#9e0dfe', '4', '1', '1', '2');
INSERT INTO `question` VALUES ('190', '10', 'Helped to enhance the quality of your life', '#9e0dfe', '5', '1', '1', '2');
INSERT INTO `question` VALUES ('191', '11', 'Communicated effectively', '#194df4', '1', '1', '1', '3');
INSERT INTO `question` VALUES ('192', '12', 'Communicated effectively', '#194df4', '2', '1', '1', '3');
INSERT INTO `question` VALUES ('193', '13', 'Communicated effectively', '#194df4', '3', '1', '1', '3');
INSERT INTO `question` VALUES ('194', '14', 'Communicated effectively', '#194df4', '4', '1', '1', '3');
INSERT INTO `question` VALUES ('195', '15', 'Communicated effectively', '#194df4', '5', '1', '1', '3');
INSERT INTO `question` VALUES ('196', '16', 'Was respectful of your needs', '#149af4', '1', '1', '1', '4');
INSERT INTO `question` VALUES ('197', '17', 'Was respectful of your needs', '#149af4', '2', '1', '1', '4');
INSERT INTO `question` VALUES ('198', '18', 'Was respectful of your needs', '#149af4', '3', '1', '1', '4');
INSERT INTO `question` VALUES ('199', '19', 'Was respectful of your needs', '#149af4', '4', '1', '1', '4');
INSERT INTO `question` VALUES ('200', '20', 'Was respectful of your needs', '#149af4', '5', '1', '1', '4');
INSERT INTO `question` VALUES ('201', '21', 'Was dedicated to enriching your life', '#0af43a', '1', '1', '1', '5');
INSERT INTO `question` VALUES ('202', '22', 'Was dedicated to enriching your life', '#0af43a', '2', '1', '1', '5');
INSERT INTO `question` VALUES ('203', '23', 'Was dedicated to enriching your life', '#0af43a', '3', '1', '1', '5');
INSERT INTO `question` VALUES ('204', '24', 'Was dedicated to enriching your life', '#0af43a', '4', '1', '1', '5');
INSERT INTO `question` VALUES ('205', '25', 'Was dedicated to enriching your life', '#0af43a', '5', '1', '1', '5');
INSERT INTO `question` VALUES ('206', '26', 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', '1', '1', '1', '6');
INSERT INTO `question` VALUES ('207', '27', 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', '2', '1', '1', '6');
INSERT INTO `question` VALUES ('208', '28', 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', '3', '1', '1', '6');
INSERT INTO `question` VALUES ('209', '29', 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', '4', '1', '1', '6');
INSERT INTO `question` VALUES ('210', '30', 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', '5', '1', '1', '6');
