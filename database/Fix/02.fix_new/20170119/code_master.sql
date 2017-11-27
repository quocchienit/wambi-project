-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 18, 2017 at 09:40 PM
-- Server version: 5.6.34
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wambiorg_scu`
--

-- --------------------------------------------------------

--
-- Table structure for table `code_master`
--

CREATE TABLE IF NOT EXISTS `code_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `key` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=111 ;

--
-- Dumping data for table `code_master`
--

INSERT INTO `code_master` (`id`, `type`, `key`, `value`, `notes`, `display_name`) VALUES
(1, 'job_title', '1', 'RN', '1', 'RN - REGISTERED NURSE\r\n'),
(2, 'job_title', '2', 'CNA', '1', 'CNA - CERTIFIED NURSING ASSISTANT\r\n'),
(3, 'job_title', '3', 'PCA', '1', NULL),
(4, 'job_title', '4', 'PT', '3', 'PT - PHYSICAL THERPIST\r\n'),
(5, 'job_title', '5', 'OT', '3', 'OT - OCCUPATIONAL THERAPIST\r\n'),
(6, 'job_title', '6', 'RT', '2', 'RT - RESPIRATORY THERAPIST\r\n'),
(7, 'discipline', '1', 'Nurse', NULL, NULL),
(8, 'discipline', '2', 'Respiratory', NULL, NULL),
(9, 'discipline', '3', 'Rehab', NULL, NULL),
(10, 'shift_pecks', '1', '15', '15', 'Urgent-'),
(11, 'shift_pecks', '2', '25', '25', 'Very Urgent-'),
(12, 'shift_pecks', '3', '30', '35', 'Extremely Urgent-'),
(14, 'shift_time', '1', '7am-7pm', NULL, NULL),
(15, 'shift_time', '2', '7pm-7am', NULL, NULL),
(16, 'shift_time', '3', '7am-3pm', NULL, NULL),
(17, 'shift_time', '4', '3pm-11pm', NULL, NULL),
(18, 'shift_time', '5', '11pm-7am', NULL, NULL),
(19, 'shift_time', '6', '11am-7pm', NULL, NULL),
(20, 'unit', '1', 'Broward Health Medical Center', '1', NULL),
(21, 'unit', '2', 'Broward North Medical Center', '1', NULL),
(22, 'unit', '3', 'Plantation General Hospital', '1', NULL),
(23, 'employee_award', '1', 'Top Scoring Employee', 'default', NULL),
(24, 'employee_award', '2', 'No missed punches', 'primary', NULL),
(25, 'employee_award', '3', 'Special Situations', 'info', NULL),
(26, 'time_period', '1', 'Month', NULL, NULL),
(27, 'time_period', '2', 'Quarter', NULL, NULL),
(28, 'time_period', '3', 'Year', NULL, NULL),
(29, 'award_type', '1', 'Unit', NULL, NULL),
(33, 'award_type', '2', 'Employee', NULL, NULL),
(34, 'award_type', '3', 'Tenure', NULL, NULL),
(35, 'unit_award', '1', 'No falls', 'success', NULL),
(36, 'unit_award', '2', 'No Clautis', 'warning', NULL),
(37, 'unit_award', '3', 'No Hap u’s', 'danger', NULL),
(38, 'unit_award', '4', 'No Vap’s', 'pink', NULL),
(39, 'unit_award', '5', 'No Agency Use', 'purple', NULL),
(41, 'tenure_year', '3', '', NULL, '3 years'),
(42, 'tenure_year', '4', '', NULL, '4 years'),
(43, 'tenure_year', '5', '', NULL, '5 years'),
(44, 'tenure_year', '6', '', NULL, '6 years'),
(45, 'tenure_year', '7', '', NULL, '7 years'),
(46, 'tenure_year', '8', '', NULL, '8 years'),
(47, 'tenure_year', '9', '', NULL, '9 years'),
(48, 'tenure_year', '10', '', NULL, '10 years'),
(49, 'tenure_year', '-1', '', NULL, '10 or more years'),
(50, 'pecks_for_answer', 'poor', '0', '1', 'Poor'),
(51, 'pecks_for_answer', 'fair', '5', '2', 'Fair'),
(52, 'pecks_for_answer', 'ok', '15', '3', 'Ok'),
(53, 'pecks_for_answer', 'good', '25', '4', 'Good'),
(54, 'pecks_for_answer', 'great', '30', '5', 'Great'),
(55, 'qa_notes', 'improvement', '0% - 59%', NULL, 'Improvement Needed'),
(56, 'qa_notes', 'satisfactory', '60% - 69%', NULL, 'Satisfactory'),
(57, 'qa_notes', 'good', '70% - 79%', NULL, 'Good'),
(58, 'qa_notes', 'excellent', '80% - 89%', NULL, 'Excellent'),
(59, 'qa_notes', 'exceptional', '90% - 100%', NULL, 'Exceptional'),
(60, 'insurance', '1', 'AARP', NULL, NULL),
(61, 'insurance', '2', 'Aetna', NULL, NULL),
(62, 'insurance', '3', 'American Family Insurance', NULL, NULL),
(63, 'insurance', '4', 'American National Insurance', NULL, NULL),
(64, 'insurance', '5', 'Amerigroup', NULL, NULL),
(65, 'insurance', '6', 'Anthem Blue Cross and Blue Shield', NULL, NULL),
(66, 'insurance', '7', 'Blue Cross and Blue Shield Association', NULL, NULL),
(67, 'insurance', '8', 'CareSource', NULL, NULL),
(68, 'insurance', '9', 'Cambia Health Solutions', NULL, NULL),
(69, 'insurance', '10', 'Centene Corporation', NULL, NULL),
(70, 'insurance', '11', 'Cigna', NULL, NULL),
(71, 'insurance', '12', 'Coventry Health Care', NULL, NULL),
(72, 'insurance', '13', 'EmblemHealth', NULL, NULL),
(73, 'insurance', '14', 'Fortis', NULL, NULL),
(74, 'insurance', '15', 'Golden Rule Insurance Company', NULL, NULL),
(75, 'insurance', '16', 'Group Health Cooperative', NULL, NULL),
(76, 'insurance', '17', 'Group Health Incorporated', NULL, NULL),
(77, 'insurance', '18', 'Health Net', NULL, NULL),
(78, 'insurance', '19', 'HealthMarkets', NULL, NULL),
(79, 'insurance', '20', 'HealthPartners', NULL, NULL),
(80, 'insurance', '21', 'HealthSpring', NULL, NULL),
(81, 'insurance', '22', 'Highmark', NULL, NULL),
(82, 'insurance', '23', 'Horace Mann Educators Corporation', NULL, NULL),
(83, 'insurance', '24', 'Humana', NULL, NULL),
(84, 'insurance', '25', 'Independence Blue Cross', NULL, NULL),
(85, 'insurance', '26', 'Kaiser Permanente', NULL, NULL),
(86, 'insurance', '27', 'Kaleida Health', NULL, NULL),
(87, 'insurance', '28', 'LifeWise Health Plan of Oregon', NULL, NULL),
(88, 'insurance', '29', 'Medica', NULL, NULL),
(89, 'insurance', '30', 'Medical Mutual of Ohio', NULL, NULL),
(90, 'insurance', '31', 'Molina Healthcare', NULL, NULL),
(91, 'insurance', '32', 'Premera Blue Cross', NULL, NULL),
(92, 'insurance', '33', 'Principal Financial Group', NULL, NULL),
(93, 'insurance', '34', 'Shelter Insurance', NULL, NULL),
(94, 'insurance', '35', 'State Farm', NULL, NULL),
(95, 'insurance', '36', 'Thrivent Financial for Lutherans', NULL, NULL),
(96, 'insurance', '37', 'UnitedHealth Group', NULL, NULL),
(97, 'insurance', '38', 'Unitrin', NULL, NULL),
(98, 'insurance', '39', 'Universal American Corporation', NULL, NULL),
(99, 'insurance', '40', 'WellCare Health Plans', NULL, NULL),
(100, 'insurance', '41', 'WellPoint', NULL, NULL),
(101, 'exit_survey', '1', 'Physicians', 'physicians', NULL),
(102, 'exit_survey', '2', 'Nursing Staff', 'nursingstaff', NULL),
(103, 'exit_survey', '3', 'Other Therapy Staff', 'othertherapystaff', NULL),
(104, 'exit_survey', '4', 'Facility', 'facility_unit', NULL),
(105, 'job_title', '7', 'OTA', '3', 'OTA - OCCUPATIONAL THERAPY ASSISTANT'),
(106, 'job_title', '8', 'PTA', '3', 'PTA - PHYSICAL THERAPY ASSISTANT'),
(107, 'job_title', '9', 'PTAA', '3', 'RRT - REGISTERED RESPIRATORY THERAPIST'),
(108, 'job_title', '11', 'SCRN', '1', 'SCRN - SENIOR CHARGE REGISTERED NURSE'),
(109, 'job_title', '12', 'ST', '3', 'ST - SPEECH THERAPIST'),
(110, 'job_title', '10', 'RRT', '2', 'RRT - REGISTERED RESPIRATORY THERAPIST');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
