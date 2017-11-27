/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50631
Source Host           : localhost:3306
Source Database       : wambi

Target Server Type    : MYSQL
Target Server Version : 50631
File Encoding         : 65001

Date: 2017-01-07 03:28:55
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of award_type
-- ----------------------------
INSERT INTO `award_type` VALUES ('1', '1', 'employee', 'Top Scoring Employee', '1', null);
INSERT INTO `award_type` VALUES ('2', '2', 'employee', 'No missed punches', '1', null);
INSERT INTO `award_type` VALUES ('3', '3', 'employee', 'Special Situations', '1', null);
INSERT INTO `award_type` VALUES ('4', '1', 'employee', 'Top Scoring Employee', '2', null);
INSERT INTO `award_type` VALUES ('5', '2', 'employee', 'No missed punches', '2', null);
INSERT INTO `award_type` VALUES ('6', '3', 'employee', 'Special Situations', '2', null);
INSERT INTO `award_type` VALUES ('7', '1', 'employee', 'Top Scoring Employee 3', '3', null);
INSERT INTO `award_type` VALUES ('8', '2', 'employee', 'No missed punches', '3', null);
INSERT INTO `award_type` VALUES ('9', '3', 'employee', 'Special Situations', '3', null);
INSERT INTO `award_type` VALUES ('10', '1', 'unit', 'No falls', '1', null);
INSERT INTO `award_type` VALUES ('11', '2', 'unit', 'No Clautis', '1', null);
INSERT INTO `award_type` VALUES ('12', '3', 'unit', 'No Hap u’s', '1', null);
INSERT INTO `award_type` VALUES ('13', '4', 'unit', 'No Vap’s', '1', null);
INSERT INTO `award_type` VALUES ('14', '5', 'unit', 'No Agency Use', '1', null);
INSERT INTO `award_type` VALUES ('15', '1', 'unit', 'No falls', '2', null);
INSERT INTO `award_type` VALUES ('16', '2', 'unit', 'No Clautis', '2', null);
INSERT INTO `award_type` VALUES ('17', '3', 'unit', 'No Hap u’s', '2', null);
INSERT INTO `award_type` VALUES ('18', '4', 'unit', 'No Vap’s', '2', null);
INSERT INTO `award_type` VALUES ('19', '5', 'unit', 'No Agency Use 2', '2', null);
INSERT INTO `award_type` VALUES ('20', '1', 'unit', 'No falls', '3', null);
INSERT INTO `award_type` VALUES ('21', '2', 'unit', 'No Clautis', '3', null);
INSERT INTO `award_type` VALUES ('22', '3', 'unit', 'No Hap u’s', '3', null);
INSERT INTO `award_type` VALUES ('23', '4', 'unit', 'No Vap’s', '3', null);
INSERT INTO `award_type` VALUES ('24', '5', 'unit', 'No Agency Use', '3', null);

-- ----------------------------
-- Table structure for `code_master`
-- ----------------------------
DROP TABLE IF EXISTS `code_master`;
CREATE TABLE `code_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `key` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of code_master
-- ----------------------------
INSERT INTO `code_master` VALUES ('1', 'job_title', '1', 'RN', '1', null);
INSERT INTO `code_master` VALUES ('2', 'job_title', '2', 'CNA', '1', null);
INSERT INTO `code_master` VALUES ('3', 'job_title', '3', 'PCA', '1', null);
INSERT INTO `code_master` VALUES ('4', 'job_title', '4', 'PT', '3', null);
INSERT INTO `code_master` VALUES ('5', 'job_title', '5', 'OT', '3', null);
INSERT INTO `code_master` VALUES ('6', 'job_title', '6', 'RT', '2', null);
INSERT INTO `code_master` VALUES ('7', 'discipline', '1', 'Nurse', null, null);
INSERT INTO `code_master` VALUES ('8', 'discipline', '2', 'Respiratory', null, null);
INSERT INTO `code_master` VALUES ('9', 'discipline', '3', 'Rehab', null, null);
INSERT INTO `code_master` VALUES ('10', 'shift_pecks', '1', '15', '15', 'Urgent-');
INSERT INTO `code_master` VALUES ('11', 'shift_pecks', '2', '25', '25', 'Very Urgent-');
INSERT INTO `code_master` VALUES ('12', 'shift_pecks', '3', '30', '35', 'Extremely Urgent-');
INSERT INTO `code_master` VALUES ('14', 'shift_time', '1', '7am-7pm', null, null);
INSERT INTO `code_master` VALUES ('15', 'shift_time', '2', '7pm-7am', null, null);
INSERT INTO `code_master` VALUES ('16', 'shift_time', '3', '7am-3pm', null, null);
INSERT INTO `code_master` VALUES ('17', 'shift_time', '4', '3pm-11pm', null, null);
INSERT INTO `code_master` VALUES ('18', 'shift_time', '5', '11pm-7am', null, null);
INSERT INTO `code_master` VALUES ('19', 'shift_time', '6', '11am-7pm', null, null);
INSERT INTO `code_master` VALUES ('20', 'unit', '1', 'Broward Health Medical Center', '1', null);
INSERT INTO `code_master` VALUES ('21', 'unit', '2', 'Broward North Medical Center', '1', null);
INSERT INTO `code_master` VALUES ('22', 'unit', '3', 'Plantation General Hospital', '1', null);
INSERT INTO `code_master` VALUES ('23', 'employee_award', '1', 'Top Scoring Employee', 'default', null);
INSERT INTO `code_master` VALUES ('24', 'employee_award', '2', 'No missed punches', 'primary', null);
INSERT INTO `code_master` VALUES ('25', 'employee_award', '3', 'Special Situations', 'info', null);
INSERT INTO `code_master` VALUES ('26', 'time_period', '1', 'Month', null, null);
INSERT INTO `code_master` VALUES ('27', 'time_period', '2', 'Quarter', null, null);
INSERT INTO `code_master` VALUES ('28', 'time_period', '3', 'Year', null, null);
INSERT INTO `code_master` VALUES ('29', 'award_type', '1', 'Unit', null, null);
INSERT INTO `code_master` VALUES ('33', 'award_type', '2', 'Employee', null, null);
INSERT INTO `code_master` VALUES ('34', 'award_type', '3', 'Tenure', null, null);
INSERT INTO `code_master` VALUES ('35', 'unit_award', '1', 'No falls', 'success', null);
INSERT INTO `code_master` VALUES ('36', 'unit_award', '2', 'No Clautis', 'warning', null);
INSERT INTO `code_master` VALUES ('37', 'unit_award', '3', 'No Hap u’s', 'danger', null);
INSERT INTO `code_master` VALUES ('38', 'unit_award', '4', 'No Vap’s', 'pink', null);
INSERT INTO `code_master` VALUES ('39', 'unit_award', '5', 'No Agency Use', 'purple', null);
INSERT INTO `code_master` VALUES ('41', 'tenure_year', '3', '', null, '3 years');
INSERT INTO `code_master` VALUES ('42', 'tenure_year', '4', '', null, '4 years');
INSERT INTO `code_master` VALUES ('43', 'tenure_year', '5', '', null, '5 years');
INSERT INTO `code_master` VALUES ('44', 'tenure_year', '6', '', null, '6 years');
INSERT INTO `code_master` VALUES ('45', 'tenure_year', '7', '', null, '7 years');
INSERT INTO `code_master` VALUES ('46', 'tenure_year', '8', '', null, '8 years');
INSERT INTO `code_master` VALUES ('47', 'tenure_year', '9', '', null, '9 years');
INSERT INTO `code_master` VALUES ('48', 'tenure_year', '10', '', null, '10 years');
INSERT INTO `code_master` VALUES ('49', 'tenure_year', '-1', '', null, '10 or more years');
INSERT INTO `code_master` VALUES ('50', 'pecks_for_answer', 'poor', '0', '1', 'Poor');
INSERT INTO `code_master` VALUES ('51', 'pecks_for_answer', 'fair', '5', '2', 'Fair');
INSERT INTO `code_master` VALUES ('52', 'pecks_for_answer', 'ok', '15', '3', 'Ok');
INSERT INTO `code_master` VALUES ('53', 'pecks_for_answer', 'good', '25', '4', 'Good');
INSERT INTO `code_master` VALUES ('54', 'pecks_for_answer', 'great', '30', '5', 'Great');
INSERT INTO `code_master` VALUES ('55', 'qa_notes', 'improvement', '0% - 59%', null, 'Improvement Needed');
INSERT INTO `code_master` VALUES ('56', 'qa_notes', 'satisfactory', '60% - 69%', null, 'Satisfactory');
INSERT INTO `code_master` VALUES ('57', 'qa_notes', 'good', '70% - 79%', null, 'Good');
INSERT INTO `code_master` VALUES ('58', 'qa_notes', 'excellent', '80% - 89%', null, 'Excellent');
INSERT INTO `code_master` VALUES ('59', 'qa_notes', 'exceptional', '90% - 100%', null, 'Exceptional');
INSERT INTO `code_master` VALUES ('60', 'insurance', '1', 'AARP', null, null);
INSERT INTO `code_master` VALUES ('61', 'insurance', '2', 'Aetna', null, null);
INSERT INTO `code_master` VALUES ('62', 'insurance', '3', 'American Family Insurance', null, null);
INSERT INTO `code_master` VALUES ('63', 'insurance', '4', 'American National Insurance', null, null);
INSERT INTO `code_master` VALUES ('64', 'insurance', '5', 'Amerigroup', null, null);
INSERT INTO `code_master` VALUES ('65', 'insurance', '6', 'Anthem Blue Cross and Blue Shield', null, null);
INSERT INTO `code_master` VALUES ('66', 'insurance', '7', 'Blue Cross and Blue Shield Association', null, null);
INSERT INTO `code_master` VALUES ('67', 'insurance', '8', 'CareSource', null, null);
INSERT INTO `code_master` VALUES ('68', 'insurance', '9', 'Cambia Health Solutions', null, null);
INSERT INTO `code_master` VALUES ('69', 'insurance', '10', 'Centene Corporation', null, null);
INSERT INTO `code_master` VALUES ('70', 'insurance', '11', 'Cigna', null, null);
INSERT INTO `code_master` VALUES ('71', 'insurance', '12', 'Coventry Health Care', null, null);
INSERT INTO `code_master` VALUES ('72', 'insurance', '13', 'EmblemHealth', null, null);
INSERT INTO `code_master` VALUES ('73', 'insurance', '14', 'Fortis', null, null);
INSERT INTO `code_master` VALUES ('74', 'insurance', '15', 'Golden Rule Insurance Company', null, null);
INSERT INTO `code_master` VALUES ('75', 'insurance', '16', 'Group Health Cooperative', null, null);
INSERT INTO `code_master` VALUES ('76', 'insurance', '17', 'Group Health Incorporated', null, null);
INSERT INTO `code_master` VALUES ('77', 'insurance', '18', 'Health Net', null, null);
INSERT INTO `code_master` VALUES ('78', 'insurance', '19', 'HealthMarkets', null, null);
INSERT INTO `code_master` VALUES ('79', 'insurance', '20', 'HealthPartners', null, null);
INSERT INTO `code_master` VALUES ('80', 'insurance', '21', 'HealthSpring', null, null);
INSERT INTO `code_master` VALUES ('81', 'insurance', '22', 'Highmark', null, null);
INSERT INTO `code_master` VALUES ('82', 'insurance', '23', 'Horace Mann Educators Corporation', null, null);
INSERT INTO `code_master` VALUES ('83', 'insurance', '24', 'Humana', null, null);
INSERT INTO `code_master` VALUES ('84', 'insurance', '25', 'Independence Blue Cross', null, null);
INSERT INTO `code_master` VALUES ('85', 'insurance', '26', 'Kaiser Permanente', null, null);
INSERT INTO `code_master` VALUES ('86', 'insurance', '27', 'Kaleida Health', null, null);
INSERT INTO `code_master` VALUES ('87', 'insurance', '28', 'LifeWise Health Plan of Oregon', null, null);
INSERT INTO `code_master` VALUES ('88', 'insurance', '29', 'Medica', null, null);
INSERT INTO `code_master` VALUES ('89', 'insurance', '30', 'Medical Mutual of Ohio', null, null);
INSERT INTO `code_master` VALUES ('90', 'insurance', '31', 'Molina Healthcare', null, null);
INSERT INTO `code_master` VALUES ('91', 'insurance', '32', 'Premera Blue Cross', null, null);
INSERT INTO `code_master` VALUES ('92', 'insurance', '33', 'Principal Financial Group', null, null);
INSERT INTO `code_master` VALUES ('93', 'insurance', '34', 'Shelter Insurance', null, null);
INSERT INTO `code_master` VALUES ('94', 'insurance', '35', 'State Farm', null, null);
INSERT INTO `code_master` VALUES ('95', 'insurance', '36', 'Thrivent Financial for Lutherans', null, null);
INSERT INTO `code_master` VALUES ('96', 'insurance', '37', 'UnitedHealth Group', null, null);
INSERT INTO `code_master` VALUES ('97', 'insurance', '38', 'Unitrin', null, null);
INSERT INTO `code_master` VALUES ('98', 'insurance', '39', 'Universal American Corporation', null, null);
INSERT INTO `code_master` VALUES ('99', 'insurance', '40', 'WellCare Health Plans', null, null);
INSERT INTO `code_master` VALUES ('100', 'insurance', '41', 'WellPoint', null, null);
INSERT INTO `code_master` VALUES ('101', 'exit_survey', '1', 'Physicians', 'physicians', null);
INSERT INTO `code_master` VALUES ('102', 'exit_survey', '2', 'Nursing_Staff', 'nursingstaff', null);
INSERT INTO `code_master` VALUES ('103', 'exit_survey', '3', 'Other_Therapy_Staff', 'othertherapystaff', null);
INSERT INTO `code_master` VALUES ('104', 'exit_survey', '4', 'Facility_Unit', 'facility_unit', null);
