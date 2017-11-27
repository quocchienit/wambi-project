-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 01, 2017 at 10:14 AM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wambiorg_amada`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `catid` int(250) NOT NULL,
  `peck` int(11) NOT NULL,
  `incid` int(11) NOT NULL,
  `etid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `user_type` varchar(20) DEFAULT NULL,
  `survey_id` int(11) DEFAULT NULL,
  `answer_id` int(11) NOT NULL,
  `fac_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `awards`
--

CREATE TABLE `awards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner` int(11) NOT NULL,
  `owner_name` text,
  `peck` int(11) DEFAULT NULL,
  `redemcoin` int(11) DEFAULT NULL,
  `balancecoin` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT NULL,
  `enterytype` varchar(250) DEFAULT NULL,
  `approval` varchar(10) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `period` int(255) DEFAULT '1',
  `award` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `fac_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `award_type`
--

CREATE TABLE `award_type` (
  `id` int(11) NOT NULL,
  `key` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` varchar(250) NOT NULL,
  `unit_id` varchar(50) NOT NULL,
  `notes` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `award_type`
--

INSERT INTO `award_type` (`id`, `key`, `type`, `value`, `unit_id`, `notes`) VALUES
(76, '1', 'employee', 'Caregiver of the Month Award', '1', '#2a85e0'),
(77, '1', 'employee', 'Caregiver of the Month Award', '2', '#2a85e0'),
(78, '1', 'employee', 'Caregiver of the Month Award', '3', '#2a85e0'),
(79, '1', 'employee', 'Caregiver of the Month Award', '4', '#2a85e0'),
(80, '1', 'employee', 'Caregiver of the Month Award', '5', '#2a85e0'),
(81, '2', 'employee', 'Runner-up Caregiver of the Month Award', '1', '#fa2230'),
(82, '2', 'employee', 'Runner-up Caregiver of the Month Award', '2', '#fa2230'),
(83, '2', 'employee', 'Runner-up Caregiver of the Month Award', '3', '#fa2230'),
(84, '2', 'employee', 'Runner-up Caregiver of the Month Award', '4', '#fa2230'),
(85, '2', 'employee', 'Runner-up Caregiver of the Month Award', '5', '#fa2230'),
(86, '3', 'employee', 'Attendance Award', '1', '#e51eea'),
(87, '3', 'employee', 'Attendance Award', '2', '#e51eea'),
(88, '3', 'employee', 'Attendance Award', '3', '#e51eea'),
(89, '3', 'employee', 'Attendance Award', '4', '#e51eea'),
(90, '3', 'employee', 'Attendance Award', '5', '#e51eea'),
(91, '4', 'employee', 'Customer Service Award', '1', '#de1eef'),
(92, '4', 'employee', 'Customer Service Award', '2', '#de1eef'),
(93, '4', 'employee', 'Customer Service Award', '3', '#de1eef'),
(94, '4', 'employee', 'Customer Service Award', '4', '#de1eef'),
(95, '4', 'employee', 'Customer Service Award', '5', '#de1eef'),
(96, '5', 'employee', 'Communication Award', '1', '#1ac5fa'),
(97, '5', 'employee', 'Communication Award', '2', '#1ac5fa'),
(98, '5', 'employee', 'Communication Award', '3', '#1ac5fa'),
(99, '5', 'employee', 'Communication Award', '4', '#1ac5fa'),
(100, '5', 'employee', 'Communication Award', '5', '#1ac5fa'),
(101, '6', 'employee', 'No Missed Visits Award', '1', '#19ed20'),
(102, '6', 'employee', 'No Missed Visits Award', '2', '#19ed20'),
(103, '6', 'employee', 'No Missed Visits Award', '3', '#19ed20'),
(104, '6', 'employee', 'No Missed Visits Award', '4', '#19ed20'),
(105, '6', 'employee', 'No Missed Visits Award', '5', '#19ed20'),
(106, '7', 'employee', 'Rockstar Award', '1', '#9b1d33'),
(107, '7', 'employee', 'Rockstar Award', '2', '#9b1d33'),
(108, '7', 'employee', 'Rockstar Award', '3', '#9b1d33'),
(109, '7', 'employee', 'Rockstar Award', '4', '#9b1d33'),
(110, '7', 'employee', 'Rockstar Award', '5', '#9b1d33'),
(111, '8', 'employee', 'Leaving an Online Review Award', '1', '#db17db'),
(112, '8', 'employee', 'Leaving an Online Review Award', '2', '#db17db'),
(113, '8', 'employee', 'Leaving an Online Review Award', '3', '#db17db'),
(114, '8', 'employee', 'Leaving an Online Review Award', '4', '#db17db'),
(115, '8', 'employee', 'Leaving an Online Review Award', '5', '#db17db'),
(116, '9', 'employee', '3 Months Tenure Award', '1', '#3e4205'),
(117, '9', 'employee', '3 Months Tenure Award', '2', '#3e4205'),
(118, '9', 'employee', '3 Months Tenure Award', '3', '#3e4205'),
(119, '9', 'employee', '3 Months Tenure Award', '4', '#3e4205'),
(120, '9', 'employee', '3 Months Tenure Award', '5', '#3e4205'),
(121, '10', 'employee', '6 Months Tenure Award', '1', '#c45c13'),
(122, '10', 'employee', '6 Months Tenure Award', '2', '#c45c13'),
(123, '10', 'employee', '6 Months Tenure Award', '3', '#c45c13'),
(124, '10', 'employee', '6 Months Tenure Award', '4', '#c45c13'),
(125, '10', 'employee', '6 Months Tenure Award', '5', '#c45c13'),
(126, '11', 'employee', '9 Months Tenure Award', '1', '#f57b61'),
(127, '11', 'employee', '9 Months Tenure Award', '2', '#f57b61'),
(128, '11', 'employee', '9 Months Tenure Award', '3', '#f57b61'),
(129, '11', 'employee', '9 Months Tenure Award', '4', '#f57b61'),
(130, '11', 'employee', '9 Months Tenure Award', '5', '#f57b61'),
(131, '12', 'employee', '12 Months Tenure Award', '1', '#186b11'),
(132, '12', 'employee', '12 Months Tenure Award', '2', '#186b11'),
(133, '12', 'employee', '12 Months Tenure Award', '3', '#186b11'),
(134, '12', 'employee', '12 Months Tenure Award', '4', '#186b11'),
(135, '12', 'employee', '12 Months Tenure Award', '5', '#186b11'),
(136, '13', 'employee', 'Integrity Award', '1', '#fc0c2a'),
(137, '13', 'employee', 'Integrity Award', '2', '#fc0c2a'),
(138, '13', 'employee', 'Integrity Award', '3', '#fc0c2a'),
(139, '13', 'employee', 'Integrity Award', '4', '#fc0c2a'),
(140, '13', 'employee', 'Integrity Award', '5', '#fc0c2a'),
(141, '1', 'unit', 'No Missed Visits', '1', '#1786f4'),
(142, '1', 'unit', 'No Missed Visits', '2', '#1786f4'),
(143, '1', 'unit', 'No Missed Visits', '3', '#1786f4'),
(144, '1', 'unit', 'No Missed Visits', '4', '#1786f4'),
(145, '1', 'unit', 'No Missed Visits', '5', '#1786f4'),
(146, '2', 'unit', 'No Customer Complaints', '1', '#1ae0f7'),
(147, '2', 'unit', 'No Customer Complaints', '2', '#1ae0f7'),
(148, '2', 'unit', 'No Customer Complaints', '3', '#1ae0f7'),
(149, '2', 'unit', 'No Customer Complaints', '4', '#1ae0f7'),
(150, '2', 'unit', 'No Customer Complaints', '5', '#1ae0f7'),
(151, '3', 'unit', 'Perfect Time Cards / Everyone on Time', '1', '#d324f4'),
(152, '3', 'unit', 'Perfect Time Cards / Everyone on Time', '2', '#d324f4'),
(153, '3', 'unit', 'Perfect Time Cards / Everyone on Time', '3', '#d324f4'),
(154, '3', 'unit', 'Perfect Time Cards / Everyone on Time', '4', '#d324f4'),
(155, '3', 'unit', 'Perfect Time Cards / Everyone on Time', '5', '#d324f4'),
(156, '4', 'unit', 'Rockstar Award', '1', '#cbf11e'),
(157, '4', 'unit', 'Rockstar Award', '2', '#cbf11e'),
(158, '4', 'unit', 'Rockstar Award', '3', '#cbf11e'),
(159, '4', 'unit', 'Rockstar Award', '4', '#cbf11e'),
(160, '4', 'unit', 'Rockstar Award', '5', '#cbf11e'),
(161, '5', 'unit', '10 Excellent Client Service Reviews', '1', '#f98a40'),
(162, '5', 'unit', '10 Excellent Client Service Reviews', '2', '#f98a40'),
(163, '5', 'unit', '10 Excellent Client Service Reviews', '3', '#f98a40'),
(164, '5', 'unit', '10 Excellent Client Service Reviews', '4', '#f98a40'),
(165, '5', 'unit', '10 Excellent Client Service Reviews', '5', '#f98a40'),
(166, '', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carriers`
--

CREATE TABLE `carriers` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carriers`
--

INSERT INTO `carriers` (`id`, `name`, `address`) VALUES
(1, '3 River Wireless', '@sms.3rivers.net'),
(2, 'ACS Wireless', '@paging.acswireless.com'),
(3, 'Alltel', '@message.alltel.com'),
(4, 'AT&T', '@txt.att.net'),
(5, 'Bell Canada', '@txt.bellmobility.ca'),
(6, 'Bell Canada', '@bellmobility.ca'),
(7, 'Bell Mobility (Canada)', '@txt.bell.ca'),
(8, 'Bell Mobility', '@txt.bellmobility.ca'),
(9, 'Blue Sky Frog', '@blueskyfrog.com'),
(10, 'Bluegrass Cellular', '@sms.bluecell.com'),
(11, 'Boost Mobile', '@myboostmobile.com'),
(12, 'BPL Mobile', '@bplmobile.com'),
(13, 'Carolina West Wireless', '@cwwsms.com'),
(14, 'Cellular One', '@mobile.celloneusa.com'),
(15, 'Cellular South', '@csouth1.com'),
(16, 'Centennial Wireless', '@cwemail.com'),
(17, 'CenturyTel', '@messaging.centurytel.net'),
(18, 'Cingular (Now AT&T)', '@txt.att.net'),
(19, 'Clearnet', '@msg.clearnet.com'),
(20, 'Comcast', '@comcastpcs.textmsg.com'),
(21, 'Corr Wireless Communications', '@corrwireless.net'),
(22, 'Dobson', '@mobile.dobson.net'),
(23, 'Edge Wireless', '@sms.edgewireless.com'),
(24, 'Fido', '@fido.ca'),
(25, 'Golden Telecom', '@sms.goldentele.com'),
(26, 'Helio', '@messaging.sprintpcs.com'),
(27, 'Houston Cellular', '@text.houstoncellular.net'),
(28, 'Idea Cellular', '@ideacellular.net'),
(29, 'Illinois Valley Cellular', '@ivctext.com'),
(30, 'Inland Cellular Telephone', '@inlandlink.com'),
(31, 'MCI', '@pagemci.com'),
(32, 'Metrocall', '@page.metrocall.com'),
(33, 'Metrocall 2-way', '@my2way.com'),
(34, 'Metro PCS', '@mymetropcs.com'),
(35, 'Microcell', '@fido.ca'),
(36, 'Midwest Wireless', '@clearlydigital.com'),
(37, 'Mobilcomm', '@mobilecomm.net'),
(38, 'MTS', '@text.mtsmobility.com'),
(39, 'Nextel', '@messaging.nextel.com'),
(40, 'OnlineBeep', '@onlinebeep.net'),
(41, 'PCS One', '@pcsone.net'),
(42, 'President\'s Choice', '@txt.bell.ca'),
(43, 'Public Service Cellular', '@sms.pscel.com'),
(44, 'Qwest', '@qwestmp.com'),
(45, 'Rogers AT&T Wireless', '@pcs.rogers.com'),
(46, 'Rogers Canada', '@pcs.rogers.com'),
(47, 'Satellink', '.pageme@satellink.net'),
(48, 'Southwestern Bell', '@email.swbw.com'),
(50, 'Sumcom', '@tms.suncom.com'),
(51, 'Surewest Communicaitons', '@mobile.surewest.com'),
(52, 'T-Mobile', '@tmomail.net'),
(53, 'Telus', '@msg.telus.com'),
(54, 'Tracfone', '@txt.att.net'),
(55, 'Triton', '@tms.suncom.com'),
(56, 'Unicel', '@utext.com'),
(57, 'U.S. Cellular', '@email.uscc.net'),
(58, 'Solo Mobile', '@txt.bell.ca'),
(59, 'Sprint', '@messaging.sprintpcs.com'),
(60, 'Sumcom', '@tms.suncom.com'),
(61, 'Surewest Communicaitons', '@mobile.surewest.com'),
(62, 'T-Mobile USA', '@tmomail.net'),
(67, 'US West', '@uswestdatamail.com'),
(68, 'Verizon Wireless', '@vtext.com'),
(69, 'Virgin Mobile', '@vmobl.com'),
(70, 'Virgin Mobile Canada', '@vmobile.ca'),
(71, 'West Central Wireless', '@sms.wcc.net'),
(72, 'Western Wireless', '@cellularonewest.com');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catid` int(11) NOT NULL,
  `etid` int(11) NOT NULL,
  `categoryname` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`catid`, `etid`, `categoryname`) VALUES
(1, 2, 'Nurse'),
(2, 2, 'Rehab'),
(3, 2, 'Respiratory');

-- --------------------------------------------------------

--
-- Table structure for table `code_master`
--

CREATE TABLE `code_master` (
  `id` int(11) NOT NULL,
  `type` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `key` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `value` varchar(250) CHARACTER SET utf8 DEFAULT NULL,
  `notes` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `display_name` varchar(500) DEFAULT NULL,
  `refkey` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `code_master`
--

INSERT INTO `code_master` (`id`, `type`, `key`, `value`, `notes`, `display_name`, `refkey`) VALUES
(10, 'shift_pecks', '1', '15', '15', 'Urgent-', NULL),
(11, 'shift_pecks', '2', '25', '25', 'Very Urgent-', NULL),
(12, 'shift_pecks', '3', '30', '35', 'Extremely Urgent-', NULL),
(14, 'shift_time', '1', '7am-7pm', NULL, NULL, NULL),
(15, 'shift_time', '2', '7pm-7am', NULL, NULL, NULL),
(16, 'shift_time', '3', '7am-3pm', NULL, NULL, NULL),
(17, 'shift_time', '4', '3pm-11pm', NULL, NULL, NULL),
(18, 'shift_time', '5', '11pm-7am', NULL, NULL, NULL),
(19, 'shift_time', '6', '11am-7pm', NULL, NULL, NULL),
(26, 'time_period', '1', 'Month', NULL, NULL, NULL),
(27, 'time_period', '2', 'Quarter', NULL, NULL, NULL),
(28, 'time_period', '3', 'Year', NULL, NULL, NULL),
(29, 'award_type', '1', 'Unit', NULL, NULL, NULL),
(33, 'award_type', '2', 'Employee', NULL, NULL, NULL),
(34, 'award_type', '3', 'Tenure', NULL, NULL, NULL),
(35, 'unit_award', '1', 'No Missed Visits', 'success', NULL, NULL),
(36, 'unit_award', '2', 'No Customer Complaints', 'warning', NULL, NULL),
(37, 'unit_award', '3', 'Perfect Time Cards / Everyone on Time', 'danger', NULL, NULL),
(38, 'unit_award', '4', 'Rockstar Award', 'pink', NULL, NULL),
(39, 'unit_award', '5', '10 Excellent Client Service Reviews', 'purple', NULL, NULL),
(41, 'tenure_year', '3', '', NULL, '3 years', NULL),
(42, 'tenure_year', '4', '', NULL, '4 years', NULL),
(43, 'tenure_year', '5', '', NULL, '5 years', NULL),
(44, 'tenure_year', '6', '', NULL, '6 years', NULL),
(45, 'tenure_year', '7', '', NULL, '7 years', NULL),
(46, 'tenure_year', '8', '', NULL, '8 years', NULL),
(47, 'tenure_year', '9', '', NULL, '9 years', NULL),
(48, 'tenure_year', '10', '', NULL, '10 years', NULL),
(49, 'tenure_year', '-1', '', NULL, '10 or more years', NULL),
(50, 'pecks_for_answer', 'poor', '0', '1', 'Poor', NULL),
(51, 'pecks_for_answer', 'fair', '5', '2', 'Fair', NULL),
(52, 'pecks_for_answer', 'ok', '15', '3', 'Ok', NULL),
(53, 'pecks_for_answer', 'good', '25', '4', 'Good', NULL),
(54, 'pecks_for_answer', 'great', '30', '5', 'Great', NULL),
(55, 'qa_notes', 'improvement', '0% - 59%', NULL, 'Improvement Needed', NULL),
(56, 'qa_notes', 'satisfactory', '60% - 69%', NULL, 'Satisfactory', NULL),
(57, 'qa_notes', 'good', '70% - 79%', NULL, 'Good', NULL),
(58, 'qa_notes', 'excellent', '80% - 89%', NULL, 'Excellent', NULL),
(59, 'qa_notes', 'exceptional', '90% - 100%', NULL, 'Exceptional', NULL),
(60, 'insurance', '1', 'AARP', NULL, NULL, NULL),
(61, 'insurance', '2', 'Aetna', NULL, NULL, NULL),
(62, 'insurance', '3', 'American Family Insurance', NULL, NULL, NULL),
(63, 'insurance', '4', 'American National Insurance', NULL, NULL, NULL),
(64, 'insurance', '5', 'Amerigroup', NULL, NULL, NULL),
(65, 'insurance', '6', 'Anthem Blue Cross and Blue Shield', NULL, NULL, NULL),
(66, 'insurance', '7', 'Blue Cross and Blue Shield Association', NULL, NULL, NULL),
(67, 'insurance', '8', 'CareSource', NULL, NULL, NULL),
(68, 'insurance', '9', 'Cambia Health Solutions', NULL, NULL, NULL),
(69, 'insurance', '10', 'Centene Corporation', NULL, NULL, NULL),
(70, 'insurance', '11', 'Cigna', NULL, NULL, NULL),
(71, 'insurance', '12', 'Coventry Health Care', NULL, NULL, NULL),
(72, 'insurance', '13', 'EmblemHealth', NULL, NULL, NULL),
(73, 'insurance', '14', 'Fortis', NULL, NULL, NULL),
(74, 'insurance', '15', 'Golden Rule Insurance Company', NULL, NULL, NULL),
(75, 'insurance', '16', 'Group Health Cooperative', NULL, NULL, NULL),
(76, 'insurance', '17', 'Group Health Incorporated', NULL, NULL, NULL),
(77, 'insurance', '18', 'Health Net', NULL, NULL, NULL),
(78, 'insurance', '19', 'HealthMarkets', NULL, NULL, NULL),
(79, 'insurance', '20', 'HealthPartners', NULL, NULL, NULL),
(80, 'insurance', '21', 'HealthSpring', NULL, NULL, NULL),
(81, 'insurance', '22', 'Highmark', NULL, NULL, NULL),
(82, 'insurance', '23', 'Horace Mann Educators Corporation', NULL, NULL, NULL),
(83, 'insurance', '24', 'Humana', NULL, NULL, NULL),
(84, 'insurance', '25', 'Independence Blue Cross', NULL, NULL, NULL),
(85, 'insurance', '26', 'Kaiser Permanente', NULL, NULL, NULL),
(86, 'insurance', '27', 'Kaleida Health', NULL, NULL, NULL),
(87, 'insurance', '28', 'LifeWise Health Plan of Oregon', NULL, NULL, NULL),
(88, 'insurance', '29', 'Medica', NULL, NULL, NULL),
(89, 'insurance', '30', 'Medical Mutual of Ohio', NULL, NULL, NULL),
(90, 'insurance', '31', 'Molina Healthcare', NULL, NULL, NULL),
(91, 'insurance', '32', 'Premera Blue Cross', NULL, NULL, NULL),
(92, 'insurance', '33', 'Principal Financial Group', NULL, NULL, NULL),
(93, 'insurance', '34', 'Shelter Insurance', NULL, NULL, NULL),
(94, 'insurance', '35', 'State Farm', NULL, NULL, NULL),
(95, 'insurance', '36', 'Thrivent Financial for Lutherans', NULL, NULL, NULL),
(96, 'insurance', '37', 'UnitedHealth Group', NULL, NULL, NULL),
(97, 'insurance', '38', 'Unitrin', NULL, NULL, NULL),
(98, 'insurance', '39', 'Universal American Corporation', NULL, NULL, NULL),
(99, 'insurance', '40', 'WellCare Health Plans', NULL, NULL, NULL),
(100, 'insurance', '41', 'WellPoint', NULL, NULL, NULL),
(101, 'exit_survey', '1', 'Physicians', 'physicians', NULL, NULL),
(102, 'exit_survey', '2', 'Nursing Staff', 'nursingstaff', NULL, NULL),
(103, 'exit_survey', '3', 'Other Therapy Staff', 'othertherapystaff', NULL, NULL),
(104, 'exit_survey', '4', 'Facility', 'facility_unit', NULL, NULL),
(111, 'csstype', 'default', 'Default', NULL, NULL, NULL),
(112, 'csstype', 'primary', 'Primary', NULL, NULL, NULL),
(113, 'csstype', 'info', 'Info', NULL, NULL, NULL),
(114, 'csstype', 'success', 'Success', NULL, NULL, NULL),
(115, 'csstype', 'warning', 'Warning', NULL, NULL, NULL),
(116, 'csstype', 'danger', 'Danger', NULL, NULL, NULL),
(117, 'csstype', 'pink', 'Pink', NULL, NULL, NULL),
(118, 'csstype', 'purple', 'Purple', NULL, NULL, NULL),
(119, 'facility', '1', 'Homecare', NULL, NULL, NULL),
(120, 'unit', '1', 'Corona', '1', NULL, '1'),
(121, 'unit', '2', 'Woodlands', '1', NULL, '1'),
(122, 'unit', '3', 'Colorado Springs', '1', NULL, '1'),
(123, 'unit', '4', 'Fort Collins', '1', NULL, '1'),
(124, 'unit', '5', 'Michigan', '1', NULL, '1'),
(133, 'discipline', '1', 'Caregiver', NULL, NULL, '1'),
(134, 'discipline', '2', 'Administrative Staff', NULL, NULL, '1'),
(140, 'job_title', '1', 'Caregiver', '1', 'Caregivers', '1'),
(141, 'job_title', '2', 'Administrative Staff', '2', 'Administrative Staff', '1'),
(143, 'discipline', '1', 'Caregiver', NULL, '', '2'),
(144, 'discipline', '2', 'Administrative Staff', NULL, '', '2'),
(145, 'job_title', '1', 'Caregiver', '1', 'Caregivers', '2'),
(146, 'job_title', '2', 'Administrative Staff', '2', 'Administrative Staff', '2'),
(147, 'discipline', '1', 'Colorado Springs Area', NULL, NULL, '3'),
(148, 'discipline', '2', 'Denver Area', NULL, NULL, '3'),
(149, 'discipline', '3', 'Other Areas', NULL, NULL, '3'),
(151, 'job_title', '1', 'Colorado Springs Area', '1', 'Colorado Springs Area', '3'),
(152, 'job_title', '2', 'Denver Area', '2', 'Denver Area', '3'),
(153, 'job_title', '3', 'Other Areas', '3', 'Other Areas', '3'),
(154, 'job_title', '4', 'Administrative Staff', '4', 'Administrative Staff', '3'),
(155, 'discipline', '1', 'Caregiver', NULL, NULL, '4'),
(156, 'discipline', '2', 'Administrative Staff', NULL, NULL, '4'),
(157, 'job_title', '1', 'Caregiver', '1', 'Caregivers', '4'),
(158, 'job_title', '2', 'Administrative Staff', '2', 'Administrative Staff', '4'),
(159, 'discipline', '1', 'Caregiver', NULL, NULL, '5'),
(160, 'discipline', '2', 'Administrative Staff', NULL, NULL, '5'),
(161, 'job_title', '1', 'Caregiver', '1', 'Caregivers', '5'),
(162, 'job_title', '2', 'Administrative Staff', '2', 'Administrative Staff', '5'),
(163, 'discipline', '4', 'Administrative Staff', NULL, NULL, '3'),
(164, 'employee_award', '1', 'Caregiver of the Month Award', 'default', NULL, NULL),
(165, 'employee_award', '2', 'Runner-up Caregiver of the Month Award', 'primary', NULL, NULL),
(166, 'employee_award', '3', 'Attendance Award', 'info', NULL, NULL),
(167, 'employee_award', '4', 'Customer Service Award', 'success', NULL, NULL),
(168, 'employee_award', '5', 'Communication Award', 'warning', NULL, NULL),
(169, 'employee_award', '6', 'No Missed Visits', 'danger', NULL, NULL),
(170, 'employee_award', '7', ' Rockstar Award', 'pink', NULL, NULL),
(171, 'employee_award', '8', 'Leaving an Online Review Award', 'purple', NULL, NULL),
(172, 'employee_award', '9', '3 Months Tenure Award', 'primary', NULL, NULL),
(173, 'employee_award', '10', '6 Months Tenure Award', 'info', NULL, NULL),
(174, 'employee_award', '11', '9 Months Tenure Award', 'success', NULL, NULL),
(175, 'employee_award', '12', '12 Months Tenure Award', 'warning', NULL, NULL),
(176, 'employee_award', '13', 'Integrity Award', 'danger', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coinmanager`
--

CREATE TABLE `coinmanager` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `applier_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `approval` varchar(5) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `cmt_description` varchar(500) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `number_phone` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `cmt_description`, `employee_id`, `patient_id`, `number_phone`, `email`, `first_name`, `last_name`, `date`) VALUES
(2, 'Amazing facility!', 446, 38, '', '', '', '', '2017-05-01 11:37:28'),
(3, 'tanphuqn test ', NULL, 1, '', '', '', '', '2017-05-11 11:35:13'),
(4, 'tanphuqn test survey', 402, 1, '', '', '', '', '2017-05-11 11:36:07'),
(5, 'tanphuqn test', 402, 1, '', '', '', '', '2017-05-12 11:30:28'),
(6, 'Amazing facility! ', 456, 39, '', '', '', '', '2017-05-15 12:53:13'),
(7, 'tanphuqn test comment', 20, 1, '', '', '', '', '2017-05-15 23:26:05'),
(8, 'tanphuqn test timezone', 402, 1, '', '', '', '', '2017-05-15 23:40:30'),
(9, 'test', 406, 1, '', '', '', '', '2017-05-16 03:47:09');

-- --------------------------------------------------------

--
-- Table structure for table `config_peck`
--

CREATE TABLE `config_peck` (
  `id` int(11) NOT NULL,
  `unit_id` varchar(250) NOT NULL,
  `poor` int(11) NOT NULL DEFAULT '0',
  `fair` int(11) NOT NULL DEFAULT '0',
  `ok` int(11) NOT NULL DEFAULT '0',
  `good` int(11) NOT NULL DEFAULT '0',
  `great` int(11) NOT NULL DEFAULT '0',
  `urgent` int(11) NOT NULL DEFAULT '0',
  `v_urgent` int(11) NOT NULL DEFAULT '0',
  `e_urgent` int(11) NOT NULL DEFAULT '0',
  `from_need` int(11) NOT NULL DEFAULT '0',
  `to_need` int(11) NOT NULL DEFAULT '0',
  `from_sactisfactory` int(11) NOT NULL DEFAULT '0',
  `to_sactisfactory` int(11) NOT NULL DEFAULT '0',
  `from_good` int(11) NOT NULL DEFAULT '0',
  `to_good` int(11) NOT NULL DEFAULT '0',
  `from_excellent` int(11) NOT NULL DEFAULT '0',
  `to_excellent` int(11) NOT NULL DEFAULT '0',
  `from_exceptional` int(11) NOT NULL DEFAULT '0',
  `to_exceptional` int(11) NOT NULL DEFAULT '0',
  `eidalert` varchar(1000) DEFAULT NULL,
  `eidfollow` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config_peck`
--

INSERT INTO `config_peck` (`id`, `unit_id`, `poor`, `fair`, `ok`, `good`, `great`, `urgent`, `v_urgent`, `e_urgent`, `from_need`, `to_need`, `from_sactisfactory`, `to_sactisfactory`, `from_good`, `to_good`, `from_excellent`, `to_excellent`, `from_exceptional`, `to_exceptional`, `eidalert`, `eidfollow`) VALUES
(1, '2', 0, 5, 10, 15, 20, 50, 100, 150, 0, 59, 60, 69, 70, 79, 80, 89, 90, 100, '[\"19\",\"390\"]', '[\"19\",\"390\"]'),
(2, '1', 0, 5, 10, 15, 20, 50, 100, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(3, '3', 0, 5, 10, 15, 20, 50, 100, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(4, '4', 0, 5, 10, 15, 20, 50, 100, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL),
(5, '5', 0, 5, 10, 15, 20, 50, 100, 150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_function`
--

CREATE TABLE `customer_function` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `enable` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_function`
--

INSERT INTO `customer_function` (`id`, `customer_id`, `function_id`, `enable`) VALUES
(0, 1, 1, 1),
(1, 1, 2, 1),
(2, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE `customer_master` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(250) NOT NULL,
  `enable` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_master`
--

INSERT INTO `customer_master` (`id`, `customer_id`, `customer_name`, `enable`) VALUES
(1, 1, 'out-patient', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_master`
--

CREATE TABLE `employee_master` (
  `id` int(11) NOT NULL,
  `etid` int(11) NOT NULL,
  `clockid` int(250) NOT NULL,
  `units` varchar(1000) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `disciplines` text NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `dob` date NOT NULL,
  `lastlogin` date NOT NULL,
  `hiredate` datetime DEFAULT NULL,
  `address` varchar(250) DEFAULT NULL,
  `shifts` varchar(250) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `employeeid` int(250) NOT NULL,
  `job` tinyint(250) NOT NULL,
  `carrier` varchar(500) DEFAULT NULL,
  `job_description` varchar(500) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `pecks` int(11) DEFAULT '0',
  `image_new` varchar(250) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `upload_date` datetime DEFAULT NULL,
  `fac_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_master`
--

INSERT INTO `employee_master` (`id`, `etid`, `clockid`, `units`, `catid`, `disciplines`, `firstname`, `lastname`, `dob`, `lastlogin`, `hiredate`, `address`, `shifts`, `email`, `mobile`, `image`, `password`, `employeeid`, `job`, `carrier`, `job_description`, `remember_token`, `pecks`, `image_new`, `status`, `upload_date`, `fac_id`) VALUES
(19, 4, 4444, '[\"1\",\"2\",\"3\",\"4\",\"5\"]', 1, '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\",\"7\"]', 'Wambi', 'Superadmin', '2016-12-09', '2016-03-11', '2016-12-24 00:00:00', '96I6 - PLANTATION', '[\"3\"]', 'tanphuqncrm@gmail.com', '9545527533', '4444_Wambibirdonly.png', '$2y$10$aabnTQhEGqDptc7N6cJOGewatM1ycgD0pHLFNHvQiWa0Lfgp2lctW', 4444, 1, '@mymetropcs.com', NULL, '9z2RcnlmiI0HBhfVo1KjPrxprY7FWDLpCr2501qEnrov8yS5xzeQ9PKJXz5r', 0, NULL, 0, NULL, '1'),
(411, 2, 1773, '[\"1\"]', NULL, '[\"1\"]', 'Shirley', 'Simmons', '0000-00-00', '0000-00-00', '2017-01-24 00:00:00', '', '[\"5\"]', 'betatestingmetz@gmail.com', '', '1773_Screen Shot 2017-02-13 at 1.03.24 PM.png', '', 1773, 1, '', NULL, 'p4T5risVbxuqkiCDKeHOK8jElY9h2x8MfkgWqqgzkvgeRhZxeruxoadaA0GP', 293, NULL, 0, NULL, '1'),
(425, 7, 7777, '[\"1\",\"2\",\"3\"]', NULL, '[\"3\"]', 'Wambi', 'Super Executive', '0000-00-00', '0000-00-00', '2017-03-27 00:00:00', '', '[\"2\",\"4\"]', 'tanphuqncrm@gmail.com', '9545527533', '7777_logo-frontend-login.png', '$2y$10$TylNWxbT8swsw8bF80b3GukJbsxz0VpS6syf/qZvAFkST.XAR7UrG', 7777, 5, '@mymetropcs.com', NULL, 'alYXMnK13ObvVwDZilEYixfTdWxKUkaKSxfbrEoebuqQeAM7fLFBDFQGmPw1', 0, '7777_Screen Shot 2017-03-22 at 2.28.14 PM.png', 0, NULL, '1'),
(669, 4, 5285877, '[\"1\"]', NULL, '[\"2\"]', 'Michael', 'Robrids', '0000-00-00', '0000-00-00', NULL, '', 'null', 'michael.r@amadaseniorcare.com', '9495285877', '', '$2y$10$pHKit3oMxHmmtOWzYTFVQe573yHqZNER3pjpgjGrK9xuz.3UfRoCW', 5285877, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(670, 4, 9385949, '[\"1\"]', NULL, '[\"2\"]', 'Stuart', 'Cochran', '0000-00-00', '0000-00-00', NULL, '', 'null', 'stuart.c@amadaseniorcare.com', '7209385949', '', '$2y$10$tgTbLCrIBku1RK8HH0q2EO6vYWYDP0oS4U5s9ZfRqipuZLmK6adri', 9385949, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(671, 1, 4272424, '[\"1\"]', NULL, '[\"2\"]', 'Arlene', 'Bada', '0000-00-00', '0000-00-00', NULL, '', 'null', 'Arlene.b@amadaseniorcare.com', '9514272424', '', '$2y$10$FtlK5yIak1LA2R9kWZhJkOHObTaMX4rBeWhFjsQyBsrfw6NLil47O', 4272424, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(672, 6, 5708682, '[\"1\"]', NULL, '[\"2\"]', 'Kathy', 'Monta', '0000-00-00', '0000-00-00', NULL, '', 'null', 'Kathy.m@amadaseniorcare.com ', '9515708682', '', '$2y$10$1Yp59FR/RsFcK/jwljujqOcajDhvsdljObeljW0dOS/yJRnaxF4Gi', 5708682, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(673, 4, 44444, '[\"3\"]', NULL, '[\"4\"]', 'Danny', 'Jenson', '0000-00-00', '0000-00-00', NULL, '', 'null', 'danny.j@amadaseniorcare.com', '', '', '$2y$10$LIAAq30ZNnwCCwWseEvUVuChBsmeeUE0MAF6ELsaztTDy3p093YVO', 44444, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(674, 5, 44445, '[\"3\"]', NULL, '[\"4\"]', 'Allison', 'Stanley', '0000-00-00', '0000-00-00', NULL, '', 'null', 'allison.s@amadaseniorcare.com', '', '', '$2y$10$6rMJ0woLQf/VrJjrZUvAfueT5SPY1JJ0VsUjXwwP1G3CFZsGfqHJ.', 44445, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(675, 1, 44446, '[\"3\"]', NULL, '[\"4\"]', 'Teresa', 'Erbert', '0000-00-00', '0000-00-00', NULL, '', 'null', 'teresa.e@amadaseniorcare.com', '', '', '$2y$10$xbci1B7P.WHxWvI5DDPy0.d4AgTCEQfgCVkLaMZ1lQjofkZB4oIAq', 44446, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(676, 6, 44447, '[\"3\"]', NULL, '[\"4\"]', 'Samantha', 'Dowdell', '0000-00-00', '0000-00-00', NULL, '', 'null', 'sam.d@amadaseniorcare.com', '', '', '$2y$10$OAoQY003/hHqvOhD4PjX4O9UQQ4KWE7ZLwGUmNeZmNKs9hCvAyk.W', 44447, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(677, 5, 44448, '[\"3\"]', NULL, '[\"4\"]', 'Rebecca', 'Burrell', '0000-00-00', '0000-00-00', NULL, '', 'null', 'r.burrell@amadaseniorcare.com', '', '', '$2y$10$dX24eXs1BVIN9fdtRxgakeuLBkYacei5pYhPXgmKqH5OnBtyhdtOm', 44448, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(678, 6, 44449, '[\"3\"]', NULL, '[\"4\"]', 'Ashlee ', 'Phelps', '0000-00-00', '0000-00-00', NULL, '', 'null', 'ashlee.p@amadaseniorcare.com', '', '', '$2y$10$dFsKQJNC18bRjtV8JnO0hukvCCWT7sUU4Ey2zeg3DioJDKVwgcjsa', 44449, 4, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(679, 4, 444410, '[\"4\"]', NULL, '[\"2\"]', 'Lisa', 'Olsen', '0000-00-00', '0000-00-00', NULL, '', 'null', 'lisa.o@amadaseniorcare.com', '', '', '$2y$10$poLeOEv0Kaacy.E7AgiZaum63F4kbHh7FT7tAC.AUj0aYK1Pdhv0a', 444410, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(680, 4, 444411, '[\"2\"]', NULL, '[\"2\"]', 'Amanda', 'Hupp', '0000-00-00', '0000-00-00', NULL, '', 'null', 'amanda.h@amadaseniorcare.com', '', '', '$2y$10$m5ILBaft8vnZ1vaKEaRGOuw.5ZczV2Ux1E0pzHKb04Wu4UlgUFZee', 444411, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(681, 4, 444412, '[\"2\"]', NULL, '[\"2\"]', 'Amy', 'Tice', '0000-00-00', '0000-00-00', NULL, '', 'null', 'amy.t@amadaseniorcare.com', '', '', '$2y$10$JW6btPvTPFqXtGF6qzaWkukcqbdXT77ZKND.kIdt81sRRKbY/CDzy', 444412, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(682, 4, 444413, '[\"2\"]', NULL, '[\"2\"]', 'Gentry', 'Deshotel', '0000-00-00', '0000-00-00', NULL, '', 'null', 'gentry.d@amadaseniorcare.com', '', '', '$2y$10$nD06GFICE.KvyHVi8exbjeCB1zRE2y19T50K6CXVCsipFvKjTR3qW', 444413, 2, NULL, NULL, NULL, 0, NULL, 0, NULL, '1'),
(683, 2, 10498, '[\"1\"]', NULL, '1', 'Karen ', 'Alvarez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', NULL, '(909) 658-9903', '', '', 10498, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(684, 2, 10264, '[\"1\"]', NULL, '1', 'Sabrina', 'Alves', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Ssabrinalalvess@gmail.com', '(323) 252-8608', '', '', 10264, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(685, 2, 10402, '[\"1\"]', NULL, '1', 'Sunmi', 'An', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'asma0601@gmail.com', '(909) 735-1103', '', '', 10402, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(686, 2, 6461, '[\"1\"]', NULL, '1', 'Arlene', 'Bada', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'arlenebada@yahoo.com', '(951) 427-2424', '', '', 6461, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(687, 2, 8136, '[\"1\"]', NULL, '1', 'Jessica', 'Baker', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'jessicamulubaker@gmail.com', '(760) 963-1031', '', '', 8136, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(688, 2, 10477, '[\"1\"]', NULL, '1', 'Lizbeth', 'Barron', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'liz90c@yahoo.com', '(909) 746-9174', '', '', 10477, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(689, 2, 4501, '[\"1\"]', NULL, '1', 'Ilene Marie', 'Barton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'ilenebarton33@gmail.com', '(951) 893-3937', '', '', 4501, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(690, 2, 9892, '[\"1\"]', NULL, '1', 'Teasia', 'Bennett', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Bennettteasia@yahoo.com', '(909) 708-2708', '', '', 9892, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(691, 2, 8529, '[\"1\"]', NULL, '1', 'Tarin Ann', 'Breistig', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Tarinabreistig@gmail.com', '(951) 289-2057', '', '', 8529, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(692, 2, 1382, '[\"1\"]', NULL, '1', 'Darlene', 'Brown', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'browsugga@aol.com', '(909) 803-7095', '', '', 1382, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(693, 2, 10515, '[\"1\"]', NULL, '1', 'De\'shae', 'Burton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mrs.edwards4lifee@gmail.com', '(909) 486-4254', '', '', 10515, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(694, 2, 9462, '[\"1\"]', NULL, '1', 'Renee', 'Butler', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'gottaloveme48@gmail.com', '(909) 688-3579', '', '', 9462, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(695, 2, 8532, '[\"1\"]', NULL, '1', 'Frances', 'Campa', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'francescampa@yahoo.com', '(909) 904-1231', '', '', 8532, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(696, 2, 10472, '[\"1\"]', NULL, '1', 'Ana', 'Castellon', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'acmorales@live.com', '(909) 641-7066', '', '', 10472, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(697, 2, 3208, '[\"1\"]', NULL, '1', 'Blanca', 'Chagolla', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'blancashubby13@gmail.com', '(909) 246-9533', '', '', 3208, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(698, 2, 1652, '[\"1\"]', NULL, '1', 'Nicole', 'Chapman', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'livelaughlove872@hotmail.com', '(951) 202-5548', '', '', 1652, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(699, 2, 6413, '[\"1\"]', NULL, '1', 'Chaohsiu', 'Chen', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'showshowchen@hotmail.com', '(626) 833-9955', '', '', 6413, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(700, 2, 2788, '[\"1\"]', NULL, '1', 'Diana', 'Conerly', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'diana.conerly@yahoo.com', '(951) 534-2451', '', '', 2788, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(701, 2, 1143, '[\"1\"]', NULL, '1', 'Jesus', 'Denoga', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'jessdenoga@yahoo.com', '(818) 519-6848', '', '', 1143, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(702, 2, 9204, '[\"1\"]', NULL, '1', 'Sabrina', 'Erickson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Binnnabby1245@gmail.com', '(951) 623-1536', '', '', 9204, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(703, 2, 1103, '[\"1\"]', NULL, '1', 'Margarita', 'Escobedo', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'margaritaescobedo1958@gmail.com', '(626) 922-4542', '', '', 1103, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(704, 2, 8474, '[\"1\"]', NULL, '1', 'Rosa', 'Escobedo', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'roce7677@yahoo.com', '(909) 301-2267', '', '', 8474, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(705, 2, 8147, '[\"1\"]', NULL, '1', 'Doreil', 'Flowers', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'doreil.flowers@gmail.com', '(323) 926-0799', '', '', 8147, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(706, 2, 9515, '[\"1\"]', NULL, '1', 'Angelica', 'Garcia', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'angelicafg80@outlook.express', '(909) 414-6555', '', '', 9515, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(707, 2, 9925, '[\"1\"]', NULL, '1', 'Elizabeth', 'Gonzalez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'gonzaleze896@yahoo.com', '(951) 264-1904', '', '', 9925, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(708, 2, 7425, '[\"1\"]', NULL, '1', 'Juana', 'Gonzalez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'juanagonz064@gmail.com', '(909) 782-2008', '', '', 7425, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(709, 2, 9334, '[\"1\"]', NULL, '1', 'Terriyona', 'Graham', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Grahamterriyona@gmail.com', '(951) 489-2893', '', '', 9334, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(710, 2, 9929, '[\"1\"]', NULL, '1', 'Maria (Mia)', 'Hernandez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mialove827@icloud.com', '(951) 374-2200', '', '', 9929, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(711, 2, 9614, '[\"1\"]', NULL, '1', 'Suzanne', 'Herrera', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'suzyqherrera69@gmail.com', '(909) 515-6270', '', '', 9614, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(712, 2, 1751, '[\"1\"]', NULL, '1', 'Robert', 'Hiles', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'rohiles78@gmail.com', '(402) 314-1454', '', '', 1751, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(713, 2, 5915, '[\"1\"]', NULL, '1', 'Anthony', 'Jimenez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'anthonytrinidadj@gmail.com', '(909) 734-8278', '', '', 5915, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(714, 2, 8242, '[\"1\"]', NULL, '1', 'Latonja (Lala)', 'Johnson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'latonjajaylynjohnson@gmail.com', '(909) 648-7564', '', '', 8242, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(715, 2, 10497, '[\"1\"]', NULL, '1', 'Jessica', 'Kabir', '0000-00-00', '0000-00-00', NULL, NULL, 'null', NULL, '(714) 457-0649', '', '', 10497, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(716, 2, 8110, '[\"1\"]', NULL, '1', 'Melanie', 'Knudson-Pickett', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'laniepickett@yahoo.com', '(760) 987-9000', '', '', 8110, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(717, 2, 1106, '[\"1\"]', NULL, '1', 'Laura', 'Lara', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'bandalaura64@yahoo.com', '(951) 250-9761', '', '', 1106, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(718, 2, 9887, '[\"1\"]', NULL, '1', 'Alicia', 'Lopez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'uhhleeshuhruhhnayy@gmail.com', '(951) 847-6474', '', '', 9887, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(719, 2, 3715, '[\"1\"]', NULL, '1', 'Maria', 'Mason', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'hotmamamason1@yahoo.com', '(760) 628-9367', '', '', 3715, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(720, 2, 8130, '[\"1\"]', NULL, '1', 'Tania', 'Mejia', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'tmejia020@yahoo.com', '(909) 453-5193', '', '', 8130, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(721, 2, 9440, '[\"1\"]', NULL, '1', 'Yvette', 'Meza', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mezayvette1014@gmail.com', '(760) 689-9172', '', '', 9440, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(722, 2, 2413, '[\"1\"]', NULL, '1', 'Eren', 'Mitchell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'eren.mitchell@yahoo.com', '(909) 331-5872', '', '', 2413, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(723, 2, 7289, '[\"1\"]', NULL, '1', 'Kathy', 'Monta', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'kathy.m@amadaseniorcare.com', '(951) 570-8682', '', '', 7289, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(724, 2, 10267, '[\"1\"]', NULL, '1', 'Delores', 'Musgrove', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'princessdd21@gmail.com', '(909) 687-6942', '', '', 10267, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(725, 2, 8246, '[\"1\"]', NULL, '1', 'Joseph', 'Nwankpa', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'josephprada45@gmail.com', '(323) 302-3785', '', '', 8246, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(726, 2, 3344, '[\"1\"]', NULL, '1', 'Monica', 'Olvera', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'olvera.monica30@gmail.com', '(909) 601-1321', '', '', 3344, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(727, 2, 8129, '[\"1\"]', NULL, '1', 'Carime', 'Ortiz', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'karimeortiz09@gmail.com', '(951) 287-2949', '', '', 8129, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(728, 2, 10274, '[\"1\"]', NULL, '1', 'Manuel', 'Perez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'szambrano73@gmail.com', '(909) 762-0566', '', '', 10274, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(729, 2, 2163, '[\"1\"]', NULL, '1', 'Maria', 'Razo', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'razomari03@yahoo.com', '(909) 238-5724', '', '', 2163, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(730, 2, 10469, '[\"1\"]', NULL, '1', 'Rosario', 'Romero', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'rosarioromero00@gmail.com', '(909) 251-3920', '', '', 10469, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(731, 2, 8124, '[\"1\"]', NULL, '1', 'Mykia', 'Salone', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Mykia_Renee10@yahoo.com', '(323) 241-2905', '', '', 8124, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(732, 2, 3756, '[\"1\"]', NULL, '1', 'Guillermina', 'Sandoval', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'gigi.sandoval1425@gmail.com', '(909) 441-9481', '', '', 3756, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(733, 2, 10244, '[\"1\"]', NULL, '1', 'Carolina', 'Santana', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'reydiana2002@yahoo.com', '(909) 213-3685', '', '', 10244, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(734, 2, 10213, '[\"1\"]', NULL, '1', 'Mildred', 'Smith', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'msmillysmith09@gmail.com', '(909) 681-2381', '', '', 10213, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(735, 2, 3321, '[\"1\"]', NULL, '1', 'Taylor', 'Spinks', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'taylorspinks57@gmail.com', '(909) 644-1754', '', '', 3321, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(736, 2, 10520, '[\"1\"]', NULL, '1', 'Zhayla', 'Vazquez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'z.aldoz8292@student.sbccd.edu', '(808) 366-2377', '', '', 10520, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(737, 2, 8155, '[\"1\"]', NULL, '1', 'Charlean', 'Welch', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'c.welch7786@gmail.com', '(909) 269-3987', '', '', 8155, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(738, 2, 9018, '[\"1\"]', NULL, '1', 'Megan', 'White', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'starbucksbetch@yahoo.com', '(909) 300-2364', '', '', 9018, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(739, 2, 9943, '[\"1\"]', NULL, '1', 'Sheri', 'Wison', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'wilsonsheri46@yahoo.com', '(951) 349-8317', '', '', 9943, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(740, 2, 9197, '[\"1\"]', NULL, '1', 'Maria', 'Yanez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'veronica_calif@hotmail.com', '(909) 518-9757', '', '', 9197, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(741, 2, 7344, '[\"1\"]', NULL, '1', 'Susana', 'Zambrano', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'szambrano73@gmail.com', '(909) 976-2361', '', '', 7344, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(742, 2, 3939, '[\"2\"]', NULL, '1', 'Karima', 'AbdulKadir', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Karimabashiru@gmail.com', '(614) 370-2779', '', '', 3939, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(743, 2, 5188, '[\"2\"]', NULL, '1', 'Crystal', 'Bowels', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'crystalbbowles@gmail.com', '(832) 458-6637', '', '', 5188, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(744, 2, 9468, '[\"2\"]', NULL, '1', 'Shaquoya', 'Broussard', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'koyaalyse@gmail.com', '(832) 739-5047', '', '', 9468, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(745, 2, 10364, '[\"2\"]', NULL, '1', 'Lisa', 'Brown', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lisareneebrown@hotmail.com', '(832) 315-1609', '', '', 10364, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(746, 2, 9985, '[\"2\"]', NULL, '1', 'Amy', 'Buress', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'amyburess70@gmail.com', '(901) 649-1503', '', '', 9985, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(747, 2, 3891, '[\"2\"]', NULL, '1', 'Trudy', 'Cain', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'caintrudy@gmail.com', '(832) 515-6909', '', '', 3891, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(748, 2, 1891, '[\"2\"]', NULL, '1', 'Andrea', 'Castro', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'b_bballdre@yahoo.com', '(936) 232-2839', '', '', 1891, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(749, 2, 6946, '[\"2\"]', NULL, '1', 'Chantal', 'Collins', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'godsplan2013@yahoo.com', '(832) 666-1091', '', '', 6946, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(750, 2, 5590, '[\"2\"]', NULL, '1', 'Tina', 'Comp', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'tinaucomp@yahoo.com', '(832) 244-2432', '', '', 5590, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(751, 2, 7172, '[\"2\"]', NULL, '1', 'Berthalina', 'Davis', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'berthadavis75@gmail.com', '(936) 244-2512', '', '', 7172, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(752, 2, 5033, '[\"2\"]', NULL, '1', 'Towanda', 'Davis', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'towandadavis97@gmail.com', '(832) 718-1143', '', '', 5033, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(753, 2, 9909, '[\"2\"]', NULL, '1', 'Jerineisha', 'Davison', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'jerineishadavison@yahoo.com', '(936) 581-7708', '', '', 9909, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(754, 2, 3136, '[\"2\"]', NULL, '1', 'Michelle', 'Denson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Michelledenson43@yahoo.com', '(936) 828-9172', '', '', 3136, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(755, 2, 7769, '[\"2\"]', NULL, '1', 'Kara', 'Diaz', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'diazkara77@yahoo.com', '(936) 648-4187', '', '', 7769, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(756, 2, 9558, '[\"2\"]', NULL, '1', 'Stephanie', 'Dillahunty', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'dillahunty21@gmail.com', '(832) 229-9628', '', '', 9558, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(757, 2, 10437, '[\"2\"]', NULL, '1', 'Nadlyn', 'Dilworth', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'nadlyn.dilworth@yahoo.com', '(832) 269-8830', '', '', 10437, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(758, 2, 9377, '[\"2\"]', NULL, '1', 'Miriam', 'Dosenovich', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mdosenovich@gmail.com', '(979) 324-0652', '', '', 9377, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(759, 2, 9259, '[\"2\"]', NULL, '1', 'Elena', 'Dritsas', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'elenadritsas@netscape.net', '(805) 975-8034', '', '', 9259, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(760, 2, 1690, '[\"2\"]', NULL, '1', 'Christy', 'Fabriguze', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'christy.fabriguze@yahoo.com', '(713) 397-9281', '', '', 1690, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(761, 2, 9253, '[\"2\"]', NULL, '1', 'Jessica', 'Garcia', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'bellgarcia2007@gmail.com', '(832) 226-8974', '', '', 9253, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(762, 2, 6709, '[\"2\"]', NULL, '1', 'Stacy', 'Garner', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'stacygarner@ymail.com', '(832) 279-8065', '', '', 6709, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(763, 2, 3414, '[\"2\"]', NULL, '1', 'Shana', 'Gillum', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Shanaboo0525@gmail.com', '(281) 760-7796', '', '', 3414, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(764, 2, 2917, '[\"2\"]', NULL, '1', 'Bruce', 'Green', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'bg333777@gmail.com', '(832) 988-2646', '', '', 2917, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(765, 2, 6741, '[\"2\"]', NULL, '1', 'Shantal', 'Green', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'shantalg3@gmail.com', '(318) 264-9262', '', '', 6741, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(766, 2, 1738, '[\"2\"]', NULL, '1', 'Rina', 'Guardado', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'guardadorina50@gmail.com', '(832) 297-1310', '', '', 1738, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(767, 2, 6658, '[\"2\"]', NULL, '1', 'Danyell', 'Hall', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'danyell.hall39@gmail.com', '(832) 725-6153', '', '', 6658, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(768, 2, 5159, '[\"2\"]', NULL, '1', 'Charisma', 'Harrison', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'charismacarter90@gmail.com', '(936) 257-2041', '', '', 5159, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(769, 2, 10159, '[\"2\"]', NULL, '1', 'Cherie', 'Henry', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'cheriehenry77@gmail.com', '(832) 887-5670', '', '', 10159, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(770, 2, 9194, '[\"2\"]', NULL, '1', 'Mary', 'Herrera', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mary4b@yahoo.com', '(832) 404-7037', '', '', 9194, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(771, 2, 5845, '[\"2\"]', NULL, '1', 'Tammy', 'Hickmon', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mckean83@gmail.com', '(936) 662-4082', '', '', 5845, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(772, 2, 4353, '[\"2\"]', NULL, '1', 'Ke\'Onda', 'Issac', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'keke.issac4@gmail.com', '(936) 355-1767', '', '', 4353, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(773, 2, 2272, '[\"2\"]', NULL, '1', 'Charlotte', 'Jones', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'charcara19@gmail.com', '(713) 382-3254', '', '', 2272, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(774, 2, 9393, '[\"2\"]', NULL, '1', 'LaTanya', 'Jones', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'latanyajones700@gmail.com', '(936) 701-8730', '', '', 9393, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(775, 2, 9533, '[\"2\"]', NULL, '1', 'Margaret', 'Jones', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'margaretjones3546@gmail.com', '(832) 909-5665', '', '', 9533, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(776, 2, 7101, '[\"2\"]', NULL, '1', 'Trudy', 'Kaiser', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'kaisertrudy@gmail.com', '(936) 235-8264', '', '', 7101, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(777, 2, 3708, '[\"2\"]', NULL, '1', 'Guinivere', 'Marshall', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'guiniveremarshall@gmail.com', '(832) 443-2624', '', '', 3708, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(778, 2, 5062, '[\"2\"]', NULL, '1', 'Monique', 'McCoy', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'shortahere4u@yahoo.com', '(832) 971-5900', '', '', 5062, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(779, 2, 4506, '[\"2\"]', NULL, '1', 'Darian', 'McPherson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mcpherson176@gmail.com', '(504) 505-9092', '', '', 4506, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(780, 2, 10001, '[\"2\"]', NULL, '1', 'Janice', 'Miller', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'miller.janice@gmail.com', '(919) 389-9046', '', '', 10001, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(781, 2, 4229, '[\"2\"]', NULL, '1', 'LeeEster', 'Morgan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'leeester504@yahoo.com', '(832) 806-9984', '', '', 4229, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(782, 2, 9258, '[\"2\"]', NULL, '1', 'Angie', 'Murphy-Vallier', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'angiemv29@gmail.com', '(713) 591-8990', '', '', 9258, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(783, 2, 3933, '[\"2\"]', NULL, '1', 'Kimberlea', 'Neitzel', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'kdneitzel2003@gmail.com', '(936) 718-9541', '', '', 3933, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(784, 2, 6787, '[\"2\"]', NULL, '1', 'Theresa', 'Obledo', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'theresaobledo@gmail.com', '(281) 706-1557', '', '', 6787, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(785, 2, 4226, '[\"2\"]', NULL, '1', 'Tammy', 'O\'Dell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'littlelady2252@gmail.com', '(479) 831-8180', '', '', 4226, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(786, 2, 7097, '[\"2\"]', NULL, '1', 'Dina', 'Ortega De Paz', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'evaciadepaz@gmail.com', '(631) 478-8116', '', '', 7097, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(787, 2, 2334, '[\"2\"]', NULL, '1', 'Jacqueline', 'Palmer', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'whitejacqueline24@yahoo.com', '(646) 279-7680', '', '', 2334, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(788, 2, 9581, '[\"2\"]', NULL, '1', 'Christine', 'Parker', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'crbrodyone@gmail.com', '(713) 256-1410', '', '', 9581, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(789, 2, 4129, '[\"2\"]', NULL, '1', 'Shelia', 'Parks', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'sheliap1979@gmail.com', '(281) 782-4196', '', '', 4129, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(790, 2, 3271, '[\"2\"]', NULL, '1', 'Talia', 'Pascual', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'nunezmonique35@yahoo.com', '(312) 532-7535', '', '', 3271, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(791, 2, 1586, '[\"2\"]', NULL, '1', 'Janna', 'Perez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'confzd2@gmail.com', '(224) 659-8853', '', '', 1586, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(792, 2, 5855, '[\"2\"]', NULL, '1', 'Kim', 'Pham', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'phamkim2@yahoo.com', '(832) 367-5771', '', '', 5855, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(793, 2, 1898, '[\"2\"]', NULL, '1', 'Jessica', 'Pipkin', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'jesspip80@gmail.com', '(936) 355-2307', '', '', 1898, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(794, 2, 3937, '[\"2\"]', NULL, '1', 'Candace', 'Prothro', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'candaceprothro@gmail.com', '(281) 736-1789', '', '', 3937, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(795, 2, 8327, '[\"2\"]', NULL, '1', 'Lawanda', 'Prothro', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lawanda.butler@yahoo.com', '(832) 260-8777', '', '', 8327, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(796, 2, 9718, '[\"2\"]', NULL, '1', 'Jeanette', 'Puente', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'deernjayp@gmail.com', '(832) 267-3364', '', '', 9718, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(797, 2, 3378, '[\"2\"]', NULL, '1', 'Shakima', 'Rideau', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 's.rideau4565@gmail.com', '(713) 543-0039', '', '', 3378, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(798, 2, 6233, '[\"2\"]', NULL, '1', 'Ursula', 'Riston', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'ursula_riston@rocketmail.com', '(713) 538-4049', '', '', 6233, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(799, 2, 10475, '[\"2\"]', NULL, '1', 'Angela', 'Rivette', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'rivettea65@gmail.com', '(832) 869-5472', '', '', 10475, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(800, 2, 6856, '[\"2\"]', NULL, '1', 'Artell Mae', 'Shelby', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'artellshelby@gmail.com', '(281) 757-5062', '', '', 6856, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(801, 2, 6750, '[\"2\"]', NULL, '1', 'Nakesha', 'Simington', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'nakeshasimington@yahoo.com', '(430) 200-9032', '', '', 6750, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(802, 2, 4963, '[\"2\"]', NULL, '1', 'Delphina', 'Sloan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'deparks3@yahoo.com', '(832) 339-5318', '', '', 4963, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(803, 2, 5444, '[\"2\"]', NULL, '1', 'Antoinette', 'Spencer', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Antoinettespencer@outlook.com', '(832) 739-3083', '', '', 5444, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(804, 2, 3031, '[\"2\"]', NULL, '1', 'Ashlie', 'Steed', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'ags0102000@hotmail.com', '(713) 419-0865', '', '', 3031, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(805, 2, 6621, '[\"2\"]', NULL, '1', 'Daniela', 'Stewart', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'itzyagirldeedy@gmail.com', '(504) 319-5611', '', '', 6621, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(806, 2, 5089, '[\"2\"]', NULL, '1', 'Dominique', 'Sullen', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'donmoniqu@aol.com', '(281) 964-5902', '', '', 5089, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(807, 2, 2911, '[\"2\"]', NULL, '1', 'Briana', 'Suniga', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'bbsuniga@gmail.com', '(281) 702-2627', '', '', 2911, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(808, 2, 3306, '[\"2\"]', NULL, '1', 'Shelia', 'Taylor', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Sheliacarol@yahoo.com', '(682) 552-3675', '', '', 3306, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(809, 2, 7077, '[\"2\"]', NULL, '1', 'Rohey', 'Touray', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'roheytouray@outlook.com', '(678) 717-7190', '', '', 7077, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(810, 2, 1066, '[\"2\"]', NULL, '1', 'Lanta', 'Turner', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lanta.turner@gmail.com', '(832) 607-5868', '', '', 1066, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(811, 2, 4784, '[\"2\"]', NULL, '1', 'Laurie', 'Turner', '0000-00-00', '0000-00-00', NULL, NULL, 'null', NULL, '(832) 555-5555', '', '', 4784, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(812, 2, 6254, '[\"2\"]', NULL, '1', 'Catina', 'Vaulx', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'restorerofthestreets@ymail.com', '(832) 875-7359', '', '', 6254, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(813, 2, 7427, '[\"2\"]', NULL, '1', 'Brittny', 'Veltkamp', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'brittnyv87@gmail.com', '(936) 443-8101', '', '', 7427, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(814, 2, 7062, '[\"2\"]', NULL, '1', 'Debra', 'West', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'debrawest2964@gmail.com', '(713) 377-2964', '', '', 7062, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(815, 2, 1348, '[\"2\"]', NULL, '1', 'Leslie', 'Wiley', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lesliewiley2992@yahoo.com', '(281) 761-5943', '', '', 1348, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(816, 2, 10137, '[\"2\"]', NULL, '1', 'Nerissa', 'Wilkins', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'nerissawilkins30@yahoo.com', '(832) 775-5257', '', '', 10137, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(817, 2, 9987, '[\"2\"]', NULL, '1', 'Alicia', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'aliciawilliams968@yahoo.com', '(469) 226-9089', '', '', 9987, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(818, 2, 5094, '[\"2\"]', NULL, '1', 'Kionna', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Kikiw@att.net', '(936) 668-1508', '', '', 5094, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(819, 2, 4110, '[\"2\"]', NULL, '1', 'Kwanza', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'kwanza76@gmail.com', '(936) 445-8422', '', '', 4110, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(820, 2, 5956, '[\"2\"]', NULL, '1', 'Nicola', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'nikiastonpr@yahoo.com', '(713) 878-3114', '', '', 5956, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(821, 2, 9245, '[\"2\"]', NULL, '1', 'Chinyere', 'Womack', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'giftnwagadi@yahoo.com', '(936) 333-7569', '', '', 9245, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(822, 2, 4272, '[\"2\"]', NULL, '1', 'Margaret', 'Woods', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'margaretreyes30@gmail.com', '(936) 900-2476', '', '', 4272, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(823, 2, 6686, '[\"2\"]', NULL, '1', 'Davon', 'Youngblood', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'icareforyou89@gmail.com', '(832) 767-7810', '', '', 6686, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(824, 2, 6962, '[\"3\"]', NULL, '3', 'Connor', 'Balkissoon', '0000-00-00', '0000-00-00', NULL, 'Pueblo and surrounding areas', 'null', 'connorbalkissoon@gmail.com', '(303) 667-9689', '', '', 6962, 3, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(825, 2, 4714, '[\"3\"]', NULL, '3', 'Sarah', 'Brigham', '0000-00-00', '0000-00-00', NULL, 'Pueblo and surrounding areas', 'null', 'urmyluckyduck2012@gmail.com', '(720) 907-5251', '', '', 4714, 3, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(826, 2, 6850, '[\"3\"]', NULL, '3', 'Terry', 'Dowdell', '0000-00-00', '0000-00-00', NULL, 'Pueblo and surrounding areas', 'null', 'Terrydowdell53@gmail.com', '(719) 553-8552', '', '', 6850, 3, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(827, 2, 9720, '[\"3\"]', NULL, '3', 'Kayla', 'Mast', '0000-00-00', '0000-00-00', NULL, 'Pueblo and surrounding areas', 'null', 'KJ527777@yahoo.com', '(970) 402-6993', '', '', 9720, 3, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(828, 2, 6267, '[\"3\"]', NULL, '1', 'Devin', 'Brown', '0000-00-00', '0000-00-00', NULL, 'Facillity - Colorado Springs', 'null', 'devin.tweety21@gmail.com', '(719) 337-9812', '', '', 6267, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(829, 2, 9983, '[\"3\"]', NULL, '1', 'Rebecca', 'Burrell', '0000-00-00', '0000-00-00', NULL, 'Facillity - Colorado Springs', 'null', NULL, '(443) 857-9427', '', '', 9983, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(830, 2, 9898, '[\"3\"]', NULL, '1', 'Nicole', 'Vick', '0000-00-00', '0000-00-00', NULL, 'Facillity - Colorado Springs', 'null', NULL, '(910) 977-6730', '', '', 9898, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(831, 2, 357, '[\"3\"]', NULL, '1', 'Rebecca', 'Burton', '0000-00-00', '0000-00-00', NULL, 'Facility - Colorado Springs', 'null', 'rebeccaburton680@gmail.com', '(719) 487-5510', '', '', 357, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(832, 2, 8081, '[\"3\"]', NULL, '2', 'Alondra', 'Alcantar', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'aalcantar92@live.com.mx', '(720) 291-7176', '', '', 8081, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(833, 2, 125, '[\"3\"]', NULL, '2', 'Victoria', 'Andrej', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'victoria.a@amadaseniorcare.com', '(720) 965-2237', '', '', 125, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(834, 2, 9392, '[\"3\"]', NULL, '2', 'Destinie', 'Arguello', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'destinie6906@yahoo.com', '(720) 526-1749', '', '', 9392, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(835, 2, 1786, '[\"3\"]', NULL, '2', 'Lorenia', 'Avelar', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'lorenaavelar4@gmail.com', '(720) 934-2033', '', '', 1786, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(836, 2, 3022, '[\"3\"]', NULL, '2', 'Kathy', 'Avina', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'katnthehat7@yahoo.com', '(720) 628-3067', '', '', 3022, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(837, 2, 6476, '[\"3\"]', NULL, '2', 'Sharmin (Esha)', 'Calvaresi', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', NULL, '(720) 229-8595', '', '', 6476, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(838, 2, 7261, '[\"3\"]', NULL, '2', 'Geeneave', 'Carino', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'alohawaiigg@gmail.com', '(720) 325-4604', '', '', 7261, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(839, 2, 6715, '[\"3\"]', NULL, '2', 'Ashley', 'Carter', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'ashleypanda90@gmail.com', '(303) 210-8761', '', '', 6715, 2, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(840, 2, 10009, '[\"3\"]', NULL, '2', 'Kyleah', 'Chavez', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'kyleahelizabeth@gmail.com', '(720) 839-6619', '', '', 10009, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(841, 2, 6185, '[\"3\"]', NULL, '2', 'Shelly', 'Cooper', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'shllcpr@gmail.com', '(720) 435-8198', '', '', 6185, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(842, 2, 8178, '[\"3\"]', NULL, '2', 'Misty', 'Davila', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'mistyblue658@gmail.com', '(720) 496-7209', '', '', 8178, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(843, 2, 8847, '[\"3\"]', NULL, '2', 'Ashley', 'Dawson', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'dawson.ashley31@yahoo.com', '(850) 240-8536', '', '', 8847, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(844, 2, 10216, '[\"3\"]', NULL, '2', 'Jeannette', 'Durkee', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'jdurkee93@gmail.com', '(303) 720-4302', '', '', 10216, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(845, 2, 5227, '[\"3\"]', NULL, '2', 'Ritabella (Bella)', 'Egwuonwu', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'belotaa@gmail.com', '(214) 264-7673', '', '', 5227, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(846, 2, 9460, '[\"3\"]', NULL, '2', 'Courtnee', 'Fann', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'cmf80123@yahoo.com', '(720) 338-2096', '', '', 9460, 2, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(847, 2, 3596, '[\"3\"]', NULL, '2', 'Yvonne', 'Fierro', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'Yvyfierro@gmail.com', '(720) 917-8583', '', '', 3596, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(848, 2, 8927, '[\"3\"]', NULL, '2', 'Lashantarica (Shani)', 'Flynn', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'flynnlashantarica@gmail.com', '(720) 206-5574', '', '', 8927, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(849, 2, 6635, '[\"3\"]', NULL, '2', 'Julie', 'Fries', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'julielf8fries@hotmail.com', '(720) 338-7280', '', '', 6635, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(850, 2, 10062, '[\"3\"]', NULL, '2', 'Velira', 'Fuller', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'jump2fly327@gmail.com', '(303) 847-1599', '', '', 10062, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(851, 2, 9088, '[\"3\"]', NULL, '2', 'Dawn', 'Gallupe', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'dgallupe@gmail.com', '(720) 616-9687', '', '', 9088, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(852, 2, 6812, '[\"3\"]', NULL, '2', 'Valerie', 'Ganaway-Lewis', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'ladyv312@comcast.net', '(720) 273-1838', '', '', 6812, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(853, 2, 3595, '[\"3\"]', NULL, '2', 'Yesenia', 'Garfio', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'YYesenia04@gmail.com', '(720) 838-7077', '', '', 3595, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(854, 2, 2967, '[\"3\"]', NULL, '2', 'Karen', 'Harris', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'classylady926@gmail.com', '(719) 648-5056', '', '', 2967, 2, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(855, 2, 9853, '[\"3\"]', NULL, '2', 'Samantha', 'Hughes', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'sjhughesz@icloud.com', '(719) 640-2668', '', '', 9853, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(856, 2, 9850, '[\"3\"]', NULL, '2', 'Jeannie', 'Jensen', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'swedelady12345@gmail.com', '(720) 425-7722', '', '', 9850, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(857, 2, 8082, '[\"3\"]', NULL, '2', 'Jordan', 'Jensen', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'jordan.jensen02@gmail.com', '(720) 300-7060', '', '', 8082, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(858, 2, 7499, '[\"3\"]', NULL, '2', 'Tiffani', 'Jojola', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'tiff303@gmail.com', '(720) 999-4146', '', '', 7499, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(859, 2, 8625, '[\"3\"]', NULL, '2', 'Rebecca', 'Kaufman', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'beccafam@msn.com', '(720) 490-8044', '', '', 8625, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(860, 2, 6952, '[\"3\"]', NULL, '2', 'Anne', 'Krusekopf', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'akkrusekopf@gmail.com', '(720) 998-2657', '', '', 6952, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(861, 2, 9328, '[\"3\"]', NULL, '2', 'Bonnie', 'Lackey', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'bonnielackey@yahoo.com', '(720) 636-1969', '', '', 9328, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(862, 2, 7953, '[\"3\"]', NULL, '2', 'Nolana', 'Lemley', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'mercysda.nolana@hotmail.com', '(303) 513-2923', '', '', 7953, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(863, 2, 10116, '[\"3\"]', NULL, '2', 'Savana', 'Leon Trejo', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'savanaleon17@gmail.com', '(720) 380-6411', '', '', 10116, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(864, 2, 9851, '[\"3\"]', NULL, '2', 'Natassia', 'Mack', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'natassiamack2@gmail.com', '(720) 707-8897', '', '', 9851, 2, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(865, 2, 9957, '[\"3\"]', NULL, '2', 'Ramona', 'Maes', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'ramonamaes19@gmail.com', '(720) 301-9296', '', '', 9957, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(866, 2, 4271, '[\"3\"]', NULL, '2', 'Andrea', 'McMurray', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', NULL, '(719) 330-2915', '', '', 4271, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(867, 2, 8440, '[\"3\"]', NULL, '2', 'Robin', 'Meadows', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'sweetbaby6270@gmail.com', '(720) 532-6900', '', '', 8440, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(868, 2, 9413, '[\"3\"]', NULL, '2', 'Angelique', 'Merino', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'angieme80@yahoo.com', '(720) 477-9042', '', '', 9413, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(869, 2, 9958, '[\"3\"]', NULL, '2', 'Jayne', 'Miller', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'jaynemiller15@yahoo.com', '(720) 297-9217', '', '', 9958, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(870, 2, 10388, '[\"3\"]', NULL, '2', 'Ana', 'Perez-Duarte', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'anaperez9759@gmail.com', '(720) 668-1865', '', '', 10388, 2, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(871, 2, 9563, '[\"3\"]', NULL, '2', 'Ashlee', 'Phelps', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'Ashlee.p@amadaseniorcare.com', '(303) 591-1398', '', '', 9563, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(872, 2, 3492, '[\"3\"]', NULL, '2', 'Mckayla', 'Randolph', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'mckaylar123@gmail.com', '(720) 525-3691', '', '', 3492, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(873, 2, 7926, '[\"3\"]', NULL, '2', 'Marlene', 'Reyes', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', NULL, '(720) 517-1487', '', '', 7926, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(874, 2, 10313, '[\"3\"]', NULL, '2', 'Adrianna', 'Rivera', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'rivera_adrianna@hotmail.com', '(720) 936-1182', '', '', 10313, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(875, 2, 8138, '[\"3\"]', NULL, '2', 'Valerie', 'Saeteune', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'valerie.saeteune@yahoo.com', '(720) 333-4391', '', '', 8138, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(876, 2, 7329, '[\"3\"]', NULL, '2', 'Angelic', 'Sasse', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'angelicsasse@gmail.com', '(303) 324-3495', '', '', 7329, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(877, 2, 1511, '[\"3\"]', NULL, '2', 'Veronica', 'Smith', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'veronicaEsmith@yahoo.com', '(580) 647-1141', '', '', 1511, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(878, 2, 10390, '[\"3\"]', NULL, '2', 'Dejah', 'Stefanovic', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'dejahhmonai@gmail.com', '(414) 595-2566', '', '', 10390, 2, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(879, 2, 9329, '[\"3\"]', NULL, '2', 'Joella', 'Vigil', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'vigiljoella@yahoo.com', '(720) 692-9377', '', '', 9329, 2, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(880, 2, 10215, '[\"3\"]', NULL, '2', 'Sierra', 'Walton', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'waltonsa21@gmail.com', '(720) 461-3858', '', '', 10215, 2, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(881, 2, 4672, '[\"3\"]', NULL, '2', 'Julie', 'Wetterlund', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'julie.wetterlund@gmail.com', '(970) 417-1608', '', '', 4672, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(882, 2, 10117, '[\"3\"]', NULL, '2', 'Tiara', 'Yoakum', '0000-00-00', '0000-00-00', NULL, 'Denver Area', 'null', 'tiarayoakum3@gmail.com', '(331) 575-9278', '', '', 10117, 2, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(883, 2, 10250, '[\"3\"]', NULL, '1', 'Cimani', 'Adams', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'cimaniadams@gmail.com', '(254) 423-0987', '', '', 10250, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(884, 2, 9881, '[\"3\"]', NULL, '1', 'Cassandra', 'Alcenius', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'calcenius89@gmail.com', '(719) 659-0152', '', '', 9881, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(885, 2, 10392, '[\"3\"]', NULL, '1', 'Ashley', 'Alfieri-Nightingale', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'beautifulmess87@yahoo.com', '(719) 209-3900', '', '', 10392, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(886, 2, 9715, '[\"3\"]', NULL, '1', 'Deborah', 'Allen', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'flowers719@msn.com', '(719) 360-9286', '', '', 9715, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(887, 2, 8804, '[\"3\"]', NULL, '1', 'Donna', 'Andersen', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'djhutchensl@yahoo.com', '(719) 598-1278', '', '', 8804, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(888, 2, 7141, '[\"3\"]', NULL, '1', 'Karissa', 'Aubuchon', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'mommylarae@gmail.com', '(719) 232-6759', '', '', 7141, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1');
INSERT INTO `employee_master` (`id`, `etid`, `clockid`, `units`, `catid`, `disciplines`, `firstname`, `lastname`, `dob`, `lastlogin`, `hiredate`, `address`, `shifts`, `email`, `mobile`, `image`, `password`, `employeeid`, `job`, `carrier`, `job_description`, `remember_token`, `pecks`, `image_new`, `status`, `upload_date`, `fac_id`) VALUES
(889, 2, 5668, '[\"3\"]', NULL, '1', 'Nellie', 'Axt', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'axt.nellie@yahoo.com', '(334) 717-3509', '', '', 5668, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(890, 2, 5309, '[\"3\"]', NULL, '1', 'Julia', 'Beaudoin', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'juliaofthebees@gmail.com', '719-527-6722', '', '', 5309, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(891, 2, 2790, '[\"3\"]', NULL, '1', 'Alease', 'Beavers', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'aleasebe89@gmail.com', '(313) 282-5277', '', '', 2790, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(892, 2, 9964, '[\"3\"]', NULL, '1', 'Rachel', 'Bloomfield', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'rachel.a.bloomfield@gmail.com', '(719) 355-4897', '', '', 9964, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(893, 2, 9569, '[\"3\"]', NULL, '1', 'Stefanie', 'Bonis', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'myasmommy516@yahoo.com', '(719) 459-0517', '', '', 9569, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(894, 2, 2853, '[\"3\"]', NULL, '1', 'Stacey', 'Boydstun', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'staceyjune73@gmail.com', '(719) 217-2280', '', '', 2853, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(895, 2, 9709, '[\"3\"]', NULL, '1', 'Austin', 'Bradley', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'mraustinbradley@gmail.com', '(719) 309-7427', '', '', 9709, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(896, 2, 8679, '[\"3\"]', NULL, '1', 'Cassandra', 'Bresci', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'meek7769@gmail.com', '(720) 525-2013', '', '', 8679, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(897, 2, 2242, '[\"3\"]', NULL, '1', 'Janine', 'Briggs', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'J9_Briggs@yahoo.com', '(719) 231-8782', '', '', 2242, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(898, 2, 7707, '[\"3\"]', NULL, '1', 'Vicki', 'Brunson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'msvlbrunson@gmail.com', '(318) 548-7572', '', '', 7707, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(899, 2, 9176, '[\"3\"]', NULL, '1', 'Christopher', 'Byrd', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'cbyrd090@gmail.com', '(708) 603-1409', '', '', 9176, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(900, 2, 10047, '[\"3\"]', NULL, '1', 'Amaya', 'Capestany', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'amayacapestary@yahoo.com', '(719) 306-7119', '', '', 10047, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(901, 2, 567, '[\"3\"]', NULL, '1', 'Irenia', 'Carpenter', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'secipc2@msn.com', '(719) 213-4586', '', '', 567, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(902, 2, 7454, '[\"3\"]', NULL, '1', 'Beatrise', 'Carrillo', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'beajoec@aol.com', '(719) 360-3995', '', '', 7454, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(903, 2, 8568, '[\"3\"]', NULL, '1', 'Kelley', 'Carter', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'kellbell102010@gmail.com', '(719) 287-4189', '', '', 8568, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(904, 2, 533, '[\"3\"]', NULL, '1', 'Eunice', 'Clarin', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'eunice.clarin10@gmail.com', '(719) 338-7091', '', '', 533, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(905, 2, 8678, '[\"3\"]', NULL, '1', 'Laura', 'Clark (Branden)', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'l_branden@hotmail.com', '(719) 339-7421', '', '', 8678, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(906, 2, 10256, '[\"3\"]', NULL, '1', 'Kaitlyn', 'Clawson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'romanchick12@gmail.com', '(719) 424-0531', '', '', 10256, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(907, 2, 7107, '[\"3\"]', NULL, '1', 'Ma. Theresa', 'Cooper', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'matheresa_paran@yahoo.com', '(719) 355-4834', '', '', 7107, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(908, 2, 8805, '[\"3\"]', NULL, '1', 'Norma', 'Currie', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'njc56@outlook.com', '(719) 645-5032', '', '', 8805, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(909, 2, 8583, '[\"3\"]', NULL, '1', 'Yolanda', 'Davis', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'yolanda.davis23@yahoo.com', '(719) 352-6685', '', '', 8583, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(910, 2, 9707, '[\"3\"]', NULL, '1', 'Maria', 'Decoste', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'ladunifeoluwa@gmail.com', '(719) 551-9762', '', '', 9707, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(911, 2, 8489, '[\"3\"]', NULL, '1', 'Michael', 'DelDuca', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'mikedelduca@comcast.net', '(719) 351-8859', '', '', 8489, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(912, 2, 6184, '[\"3\"]', NULL, '1', 'Lovelynn', 'Delmonte', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'luvlynnsd@yahoo.com', '(719) 433-2302', '', '', 6184, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(913, 2, 108, '[\"3\"]', NULL, '1', 'Cathy', 'Deschaine', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'deschainecathy@yahoo.com', '(719) 243-2860', '', '', 108, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(914, 2, 9884, '[\"3\"]', NULL, '1', 'Diane', 'Dimbat', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'dianedimbat64@yahoo.com', '(719) 822-8623', '', '', 9884, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(915, 2, 5526, '[\"3\"]', NULL, '1', 'Amy', 'Dorsett', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'akwdorsett@gmail.com', '(719) 888-0332', '', '', 5526, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(916, 2, 7146, '[\"3\"]', NULL, '1', 'Emilie', 'Earl', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'emilie_earl@yahoo.com', '(719) 271-8677', '', '', 7146, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(917, 2, 10129, '[\"3\"]', NULL, '1', 'Elena', 'Ehrlin', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'elenaehrlin@gmail.com', '(719) 459-5513', '', '', 10129, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(918, 2, 8206, '[\"3\"]', NULL, '1', 'Ruth', 'Eisler', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'ruth_eisler@juno.com', '(719) 661-2254', '', '', 8206, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(919, 2, 9133, '[\"3\"]', NULL, '1', 'Janessa', 'Eleazer', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'janessa719@gmail.com', '(719) 465-8697', '', '', 9133, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(920, 2, 7904, '[\"3\"]', NULL, '1', 'Angela', 'Elorreaga', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'angelaelorreaga@yahoo.com', '(719) 551-0665', '', '', 7904, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(921, 2, 7948, '[\"3\"]', NULL, '1', 'Teresa', 'Erbert', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lambydoo@comcast.net', '(719) 963-1720', '', '', 7948, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(922, 2, 9960, '[\"3\"]', NULL, '1', 'Adrianna', 'Espinosa', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'soosadrianna890@gmail.com', '(719) 460-5165', '', '', 9960, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(923, 2, 9435, '[\"3\"]', NULL, '1', 'Daisy', 'Espinoza', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', NULL, '(337) 565-9002', '', '', 9435, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(924, 2, 2772, '[\"3\"]', NULL, '1', 'Lynette', 'Falgoust', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'bfalgoust@hotmail.com', '(719) 358-3609', '', '', 2772, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(925, 2, 2187, '[\"3\"]', NULL, '1', 'Kelley', 'Fazzone', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'blulab2@yahoo.com', '(719) 573-0222', '', '', 2187, 1, '@comcastpcs.textmsg.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(926, 2, 7233, '[\"3\"]', NULL, '1', 'Mirasol', 'Fernandez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'fernandezmirasol21@gmail.com', '(719) 744-3373', '', '', 7233, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(927, 2, 9714, '[\"3\"]', NULL, '1', 'Reginald (Reggie)', 'Figgs', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'regsmooth@hotmail.com', '(303) 249-9110', '', '', 9714, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(928, 2, 7855, '[\"3\"]', NULL, '1', 'Nathan', 'Franklin', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'nathanfranklin83@gmail.com', '(917) 588-4365', '', '', 7855, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(929, 2, 1742, '[\"3\"]', NULL, '1', 'Tammie', 'Fresquez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'tammiefresquez@aol.com', '(719) 358-0091', '', '', 1742, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(930, 2, 2852, '[\"3\"]', NULL, '1', 'Gloria', 'Fuentez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'ggf2468@hotmail.com', '(719) 440-5951', '', '', 2852, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(931, 2, 9136, '[\"3\"]', NULL, '1', 'Diana', 'Garcia', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'siaraz26@gmail.com', '(719) 644-0441', '', '', 9136, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(932, 2, 9882, '[\"3\"]', NULL, '1', 'Felecia', 'Garcia', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'eauphoria13@gmail.com', '(719) 896-1231', '', '', 9882, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(933, 2, 9883, '[\"3\"]', NULL, '1', 'Mariah', 'Garcia', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'gmariah38@icloud.com', '(719) 600-7395', '', '', 9883, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(934, 2, 10066, '[\"3\"]', NULL, '1', 'Courtney', 'Gee', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'courtneygee31@yahoo.com', '(405) 432-0224', '', '', 10066, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(935, 2, 6118, '[\"3\"]', NULL, '1', 'Christian', 'Gilbert', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'cgilbert122284@gmail.com', '(719) 229-7557', '', '', 6118, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(936, 2, 5027, '[\"3\"]', NULL, '1', 'Christine', 'Gillespie', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'smtwiddlebug@aol.com', '(719) 360-3560', '', '', 5027, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(937, 2, 8488, '[\"3\"]', NULL, '1', 'Soledad', 'Gonzalez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'soledadgonzalez0324@yahoo.com', '(719) 321-8067', '', '', 8488, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(938, 2, 5944, '[\"3\"]', NULL, '1', 'Jessica', 'Greathouse', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jesslyngreat@gmail.com', '(719) 213-0475', '', '', 5944, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(939, 2, 10249, '[\"3\"]', NULL, '1', 'LaMonica', 'Hale', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'monicahale71@yahoo.com', '(719) 722-8612', '', '', 10249, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(940, 2, 10393, '[\"3\"]', NULL, '1', 'Destinie', 'Hebert', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'reneeh1998@hotmail.com', '(337) 290-5514', '', '', 10393, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(941, 2, 9306, '[\"3\"]', NULL, '1', 'Daniel', 'Hinch', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'dhinch80@gmail.com', '(858) 335-0968', '', '', 9306, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(942, 2, 3200, '[\"3\"]', NULL, '1', 'Suzanne', 'Horton', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'suzannehorton@mac.com', '(808) 381-9732', '', '', 3200, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(943, 2, 8807, '[\"3\"]', NULL, '1', 'Zachary', 'Howard', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'zachary.c.howard@gmail.com', '(505) 280-1349', '', '', 8807, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(944, 2, 10118, '[\"3\"]', NULL, '1', 'James', 'Jackman', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jamesjackman5@gmail.com', '(719) 205-8915', '', '', 10118, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(945, 2, 8930, '[\"3\"]', NULL, '1', 'Kimberly', 'Jackson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'mskimberlysjackson@gmail.com', '(612) 481-6966', '', '', 8930, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(946, 2, 7145, '[\"3\"]', NULL, '1', 'Lundyn', 'Jackson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lundynjack22@outlook.com', '(720) 299-3281', '', '', 7145, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(947, 2, 7307, '[\"3\"]', NULL, '1', 'Michelle', 'Jackson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'j.michelle1260@gmail.com', '(904) 480-5460', '', '', 7307, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(948, 2, 6410, '[\"3\"]', NULL, '1', 'Melissa', 'Jakob', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'melissa.jakob@hotmail.com', '(719) 640-0136', '', '', 6410, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(949, 2, 10070, '[\"3\"]', NULL, '1', 'Valencia', 'Jaramillo', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'valenciajaramillo@gmail.com', '(719) 282-5339', '', '', 10070, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(950, 2, 1, '[\"3\"]', NULL, '1', 'Ken', 'Jenson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'ken.j@amadaseniorcare.com', '(719) 229-2046', '', '', 1, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(951, 2, 9965, '[\"3\"]', NULL, '1', 'Meagan R', 'Jenson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'meagan811@gmail.com', '(719) 440-0942', '', '', 9965, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(952, 2, 4008, '[\"3\"]', NULL, '1', 'Jordan', 'Johnson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'thebestway125@gmail.com', '(719) 200-2930', '', '', 4008, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(953, 2, 7055, '[\"3\"]', NULL, '1', 'Vicky', 'Johnson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'vickyannjohnson@gmail.com', '(720) 260-0929', '', '', 7055, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(954, 2, 8928, '[\"3\"]', NULL, '1', 'Jasmine', 'Johnson-Boxley', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jazzibabes32@gmail.com', '(719) 291-8707', '', '', 8928, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(955, 2, 7057, '[\"3\"]', NULL, '1', 'Sarah', 'Kaibel', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'sarahkaibel@gmail.com', '(719) 650-4698', '', '', 7057, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(956, 2, 5786, '[\"3\"]', NULL, '1', 'Maria', 'Karadimos', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'mariakaradimos@yahoo.com', '(248) 953-0079', '', '', 5786, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(957, 2, 8490, '[\"3\"]', NULL, '1', 'Linda', 'Keane', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lkeane611@gmail.com', '(772) 924-6816', '', '', 8490, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(958, 2, 2822, '[\"3\"]', NULL, '1', 'Jennifer', 'Kimbrough', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jennifer_042003@hotmail.com', '(254) 669-1750', '', '', 2822, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(959, 2, 8311, '[\"3\"]', NULL, '1', 'Amy', 'Kindall', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'amynikale@gmail.com', '(719) 216-7235', '', '', 8311, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(960, 2, 9969, '[\"3\"]', NULL, '1', 'Priscilla', 'Konadu', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'prisboat2011@yahoo.com', '(719) 453-3270', '', '', 9969, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(961, 2, 9885, '[\"3\"]', NULL, '1', 'Kelsey', 'Lafferty', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'kelseyjlafferty@gmail.com', '(308) 660-5550', '', '', 9885, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(962, 2, 8205, '[\"3\"]', NULL, '1', 'Lindsey', 'Ledford', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lindseymane34@gmail.com', '(810) 280-1819', '', '', 8205, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(963, 2, 9424, '[\"3\"]', NULL, '1', 'Sharia', 'Lee', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'shariald3mw@gmail.com', '(719) 290-9390', '', '', 9424, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(964, 2, 425, '[\"3\"]', NULL, '1', 'Anja', 'Leland', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'leland4122@live.com', '(719) 232-2206', '', '', 425, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(965, 2, 8310, '[\"3\"]', NULL, '1', 'Deborah', 'Leonhardt', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'debbiekleonhardt@gmail.com', '(719) 360-8485', '', '', 8310, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(966, 2, 10396, '[\"3\"]', NULL, '1', 'Kelsey', 'Lewis', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'kartersj14@gmail.com', '(719) 377-7106', '', '', 10396, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(967, 2, 8314, '[\"3\"]', NULL, '1', 'Bernadine', 'Long', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'b-long2011@live.com', '(505) 860-6470', '', '', 8314, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(968, 2, 8141, '[\"3\"]', NULL, '1', 'Janelle', 'Lucas', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jlucas4267@gmail.com', '(719) 459-3821', '', '', 8141, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(969, 2, 9880, '[\"3\"]', NULL, '1', 'Samantha', 'Mangum', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'aspnmorg@gmail.com', '(719) 582-7244', '', '', 9880, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(970, 2, 4451, '[\"3\"]', NULL, '1', 'Joanna', 'Marrow', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jmarrow051664@gmail.com', '(719) 352-4710', '', '', 4451, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(971, 2, 5527, '[\"3\"]', NULL, '1', 'Michael', 'Martin', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'mikemart2k@gmail.com', '(254) 630-0284', '', '', 5527, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(972, 2, 3996, '[\"3\"]', NULL, '1', 'Felicia', 'Mata', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'feliciabruno91@yahoo.com', '(719) 360-0150', '', '', 3996, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(973, 2, 7147, '[\"3\"]', NULL, '1', 'Morgan', 'McCauley', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'morgan.mcc17@gmail.com', '(720) 775-7092', '', '', 7147, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(974, 2, 1698, '[\"3\"]', NULL, '1', 'Tanya', 'McCord', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'tanyalovesrandy@gmail.com', '(719) 217-7305', '', '', 1698, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(975, 2, 2518, '[\"3\"]', NULL, '1', 'Cheryl', 'McDowell', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'cmcd5588@hotmail.com', '(951) 858-4078', '', '', 2518, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(976, 2, 5460, '[\"3\"]', NULL, '1', 'Cassandra', 'McLaughlin', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'cassandramclaughlin@hotmail.com', '(719) 644-9359', '', '', 5460, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(977, 2, 10394, '[\"3\"]', NULL, '1', 'Perla', 'Meza-Stadtlander', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'ceciliastradtlander@gmail.com', '(719) 930-3153', '', '', 10394, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(978, 2, 7246, '[\"3\"]', NULL, '1', 'Amanda', 'Milliorn', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'amandakay_2012@hotmail.com', '(719) 960-9806', '', '', 7246, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(979, 2, 9135, '[\"3\"]', NULL, '1', 'Zuri', 'Molina', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lammoni21@yahoo.com', '(405) 922-6425', '', '', 9135, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(980, 2, 9704, '[\"3\"]', NULL, '1', 'Lisa', 'Montoya', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lisalacy4469@gmail.com', '(719) 246-7907', '', '', 9704, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(981, 2, 18, '[\"3\"]', NULL, '1', 'Steven', 'Moore', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'steven.moore1960@gmail.com', '(303) 888-7243', '', '', 18, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(982, 2, 3098, '[\"3\"]', NULL, '1', 'Elizabeth', 'Moro', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lizrivera1957@yahoo.com', '(720) 448-0392', '', '', 3098, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(983, 2, 4717, '[\"3\"]', NULL, '1', 'Lani', 'Mraczek', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lani.m.mraczek@gmail.com', '(719) 246-8516', '', '', 4717, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(984, 2, 3651, '[\"3\"]', NULL, '1', 'Jane', 'Navarro', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'adiffdimen@aol.com', '(719) 313-2134', '', '', 3651, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(985, 2, 9967, '[\"3\"]', NULL, '1', 'Connie', 'Nichols', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', NULL, '(719) 440-9955', '', '', 9967, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(986, 2, 1990, '[\"3\"]', NULL, '1', 'Liza', 'Ocampo', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'cali.lili@yahoo.com', '(719) 460-1073', '', '', 1990, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(987, 2, 24, '[\"3\"]', NULL, '1', 'Carol', 'Olmstead', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'carol.olmstead88@gmail.com', '(719) 359-3382', '', '', 24, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(988, 2, 8806, '[\"3\"]', NULL, '1', 'Debra', 'Otto', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'tejasottol@gmail.com', '(719) 641-4722', '', '', 8806, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(989, 2, 3612, '[\"3\"]', NULL, '1', 'Sieglinde', 'Pablo', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'siegpablo@gmail.com', '(719) 460-3451', '', '', 3612, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(990, 2, 389, '[\"3\"]', NULL, '1', 'Marie', 'Pagalilauan', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'new.business153@gmail.com', '(719) 351-1095', '', '', 389, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(991, 2, 6119, '[\"3\"]', NULL, '1', 'Carri', 'Parrish', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'sammyusa64@gmail.com', '(719) 201-3573', '', '', 6119, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(992, 2, 8713, '[\"3\"]', NULL, '1', 'Sandra', 'Poirier', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'sanlee5665@gmail.com', '(904) 400-2780', '', '', 8713, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(993, 2, 4331, '[\"3\"]', NULL, '1', 'Corazon (Cora)', 'Pulido', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jasmine_bayna@yahoo.com', '(719) 337-3996', '', '', 4331, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(994, 2, 7993, '[\"3\"]', NULL, '1', 'Carolyn', 'Pyeatt', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'carolynpyeatt@yahoo.com', '(830) 777-0841', '', '', 7993, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(995, 2, 7849, '[\"3\"]', NULL, '1', 'Maria', 'Ramirez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lupita.ramirez27@yahoo.com', '(719) 217-6344', '', '', 7849, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(996, 2, 9574, '[\"3\"]', NULL, '1', 'Rogelio (RJ)', 'Ramirez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'rjguap32@yahoo.com', '(303) 726-6617', '', '', 9574, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(997, 2, 10397, '[\"3\"]', NULL, '1', 'Rhiannon', 'Reynolds', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'rhi.reynolds16@gmail.com', '(915) 443-3486', '', '', 10397, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(998, 2, 9800, '[\"3\"]', NULL, '1', 'Hannah', 'Richards', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'hannahwolfe116@yahoo.com', '(719) 229-3226', '', '', 9800, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(999, 2, 5735, '[\"3\"]', NULL, '1', 'Taylor', 'Richards', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'taylor.richards@yahoo.com', '(719) 393-2244', '', '', 5735, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1000, 2, 535, '[\"3\"]', NULL, '1', 'Tina', 'Richards', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'tinawolfe35@yahoo.com', '(719) 406-6719', '', '', 535, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1001, 2, 6182, '[\"3\"]', NULL, '1', 'Carmen', 'Robinson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'santiago_1963@yahoo.com', '(719) 639-6765', '', '', 6182, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1002, 2, 7856, '[\"3\"]', NULL, '1', 'Juan', 'Romero', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jdromefierro@yahoo.com', '(832) 302-4893', '', '', 7856, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1003, 2, 9797, '[\"3\"]', NULL, '1', 'Shakiya', 'Rose', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'shakiya_rose@yahoo.com', '(315) 804-0135', '', '', 9797, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1004, 2, 4671, '[\"3\"]', NULL, '1', 'Walter', 'Rule', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'wright.rule.walter@gmail.com', '(828) 778-2171', '', '', 4671, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1005, 2, 684, '[\"3\"]', NULL, '1', 'Sabrie', 'Saenz', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'sabrie_saenz@yahoo.com', '(719) 493-6606', '', '', 684, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1006, 2, 8308, '[\"3\"]', NULL, '1', 'Janie', 'Salas', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'janie.salas2013@yahoo.com', '(719) 213-9190', '', '', 8308, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1007, 2, 4070, '[\"3\"]', NULL, '1', 'Esmeralda', 'Sanchez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'essanchez04@hotmail.com', '(720) 675-1869', '', '', 4070, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1008, 2, 10261, '[\"3\"]', NULL, '1', 'Amaya', 'Sands', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'amayasands21@gmail.com', '(719) 459-4259', '', '', 10261, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1009, 2, 7231, '[\"3\"]', NULL, '1', 'Carolyn', 'Savoren', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'csavoren@yahoo.com', '(719) 661-1142', '', '', 7231, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1010, 2, 9988, '[\"3\"]', NULL, '1', 'Amanda', 'Schleicher', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'schleicher2154@gmail.com', '(719) 429-0552', '', '', 9988, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1011, 2, 2188, '[\"3\"]', NULL, '1', 'Robin', 'Schmelling', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'robinschme@gmail.com', '(719) 896-1965', '', '', 2188, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1012, 2, 8680, '[\"3\"]', NULL, '1', 'Myrna', 'Seals', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'usafmyrna@gmail.com', '(719) 291-7125', '', '', 8680, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1013, 2, 3218, '[\"3\"]', NULL, '1', 'Lela', 'Sharp', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', NULL, '(720) 560-6633', '', '', 3218, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1014, 2, 8753, '[\"3\"]', NULL, '1', 'Esmeralda', 'Silva', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'essycsilva@gmail.com', '(954) 461-5535', '', '', 8753, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1015, 2, 10093, '[\"3\"]', NULL, '1', 'Elyse', 'Slabaugh', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'eslabaugh5@gmail.com', '(719) 571-0838', '', '', 10093, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1016, 2, 8682, '[\"3\"]', NULL, '1', 'Jewel', 'Smith', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'jfamousj@yahoo.com', '(916) 256-6310', '', '', 8682, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1017, 2, 8139, '[\"3\"]', NULL, '1', 'Pat', 'Smith', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'bpsmith5272@msn.com', '(719) 482-8336', '', '', 8139, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1018, 2, 735, '[\"3\"]', NULL, '1', 'Rose', 'Smith', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'rosestarme88@gmail.com', '(719) 551-8218', '', '', 735, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1019, 2, 9430, '[\"3\"]', NULL, '1', 'Nelia', 'Springfield', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', NULL, '(719) 963-6802', '', '', 9430, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1020, 2, 6979, '[\"3\"]', NULL, '1', 'Allison', 'Stanley', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', NULL, '(512) 618-1286', '', '', 6979, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1021, 2, 21, '[\"3\"]', NULL, '1', 'Judy', 'Stolk', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'judystolk@hotmail.com', '(719) 231-8636', '', '', 21, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1022, 2, 8676, '[\"3\"]', NULL, '1', 'Kahaili', 'Timmsen', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'kahaili.timmsen@gmail.com', '(719) 726-0053', '', '', 8676, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1023, 2, 7977, '[\"3\"]', NULL, '1', 'Kathryn (Kathy)', 'Torrez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'kathyt@q.com', '(719) 434-0868', '', '', 7977, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1024, 2, 9968, '[\"3\"]', NULL, '1', 'Linda', 'Torrez', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'lindatorrez06@yahoo.com', '(719) 671-8349', '', '', 9968, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1025, 2, 9012, '[\"3\"]', NULL, '1', 'Stephanie', 'Twyman', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'stephanielynn@gmail.com', '(719) 321-1546', '', '', 9012, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1026, 2, 2342, '[\"3\"]', NULL, '1', 'Maribel', 'Valentin', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'nikoy_nikay@yahoo.com', '(407) 668-8082', '', '', 2342, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1027, 2, 2825, '[\"3\"]', NULL, '1', 'Natasha', 'Valentine', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', NULL, '(719) 246-6857', '', '', 2825, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1028, 2, 8106, '[\"3\"]', NULL, '1', 'Traci', 'Vallejos', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'v_traci@hotmail.com', '(719) 250-9644', '', '', 8106, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1029, 2, 1970, '[\"3\"]', NULL, '1', 'Darryl', 'Walker', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'twistedgemini26@rocketmail.com', '(720) 808-8846', '', '', 1970, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1030, 2, 9297, '[\"3\"]', NULL, '1', 'Kimmerley', 'Wallace', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'k.wallace92@yahoo.com', '(832) 469-1082', '', '', 9297, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1031, 2, 4157, '[\"3\"]', NULL, '1', 'Terry', 'Weiss', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'teweiss2865@yahoo.ca', '(503) 709-3029', '', '', 4157, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1032, 2, 8315, '[\"3\"]', NULL, '1', 'Crystal', 'West', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'dynellwest29@gmail.com', '(719) 453-7028', '', '', 8315, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1033, 2, 9966, '[\"3\"]', NULL, '1', 'Amanda', 'White', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'amanda.white@gmail.com', '(575) 403-7858', '', '', 9966, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1034, 2, 5667, '[\"3\"]', NULL, '1', 'Daphne', 'Wilson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'dwilson8554@gmail.com', '(719) 651-9001', '', '', 5667, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1035, 2, 3019, '[\"3\"]', NULL, '1', 'Lorna', 'Wilson', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'mellow_tweety26@yahoo.com', '(573) 356-7675', '', '', 3019, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1036, 2, 346, '[\"3\"]', NULL, '1', 'Tonya', 'Wolfe', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'tonyawolfe2728@yahoo.com', '(719) 355-6366', '', '', 346, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1037, 2, 8929, '[\"3\"]', NULL, '1', 'Martha', 'Wright', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'patyperez980@hotmail.com', '(719) 535-2615', '', '', 8929, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1038, 2, 53, '[\"3\"]', NULL, '1', 'Feofaaki (Ana)', 'Yoon', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'Ana30young@yahoo.com', '(719) 233-5458', '', '', 53, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1039, 2, 9799, '[\"3\"]', NULL, '1', 'Kelsey', 'Young', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'kelseyyoung98@gmail.com', '(719) 493-7588', '', '', 9799, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1040, 2, 10405, '[\"3\"]', NULL, '1', 'Susan', 'Young', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'simplyhappy1988@aim.com', '(719) 377-9120', '', '', 10405, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1041, 2, 10069, '[\"3\"]', NULL, '1', 'Susan', 'Zimmerman', '0000-00-00', '0000-00-00', NULL, 'Colorado Springs Area', 'null', 'SKZWPF52@gmail.com', '(719) 216-8324', '', '', 10069, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1042, 2, 111111111, '[\"3\"]', NULL, '4', 'Allison', 'Stanley', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'allison.s@amadaseniorcare.com', NULL, '', '', 111111111, 4, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1043, 2, 111111112, '[\"3\"]', NULL, '4', 'Teresa', 'Erbert', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'teresa.e@amadaseniorcare.com', NULL, '', '', 111111112, 4, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1044, 2, 111111113, '[\"3\"]', NULL, '4', 'Samantha', 'Dowdell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'sam.d@amadaseniorcare.com', NULL, '', '', 111111113, 4, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1045, 2, 111111114, '[\"3\"]', NULL, '4', 'Rebecca', 'Burrell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'r.burrell@amadaseniorcare.com', NULL, '', '', 111111114, 4, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1046, 2, 111111115, '[\"3\"]', NULL, '4', 'Ashlee ', 'Phelps', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'ashlee.p@amadaseniorcare.com', NULL, '', '', 111111115, 4, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1047, 2, 9562, '[\"4\"]', NULL, '1', 'Aladin', 'Test', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'gwen.m@amadaseniorcare.com', '(303) 913-7044', '', '', 9562, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1048, 2, 7644, '[\"4\"]', NULL, '1', 'Amanda', 'Edmiston', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'aedmiston1705.ae@gmail.com', '(619) 277-1470', '', '', 7644, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1049, 2, 3932, '[\"4\"]', NULL, '1', 'Amy', 'Culler', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'amy.c@amadaseniorcare.com', '(970) 581-4798', '', '', 3932, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1050, 2, 9934, '[\"4\"]', NULL, '1', 'Angelica', 'Pickett', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'nekoai16@aol.com', '(732) 343-5772', '', '', 9934, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1051, 2, 8235, '[\"4\"]', NULL, '1', 'Beatriz', 'Saldivar Camacho', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'beatrizsaldivarcamacho@gmail.com', '(720) 289-6938', '', '', 8235, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1052, 2, 6056, '[\"4\"]', NULL, '1', 'Becky', 'Esquibel', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Esquibel4459@gmail.com', '(970) 689-5527', '', '', 6056, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1053, 2, 9445, '[\"4\"]', NULL, '1', 'Beth', 'McCombs', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'browncurls14@outlook.com', '(231) 384-3638', '', '', 9445, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1054, 2, 9561, '[\"4\"]', NULL, '1', 'Catherine', 'Oladoye', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'catholadoye@yahoo.com', '(970) 889-0708', '', '', 9561, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1055, 2, 6355, '[\"4\"]', NULL, '1', 'Charlotte', 'Bishelli', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '4hunterb@gmail.com', '(970) 889-4733', '', '', 6355, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1056, 2, 7276, '[\"4\"]', NULL, '1', 'Cheyenne', 'Haigler', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'cpruett150@gmail.com', '(970) 980-9680', '', '', 7276, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1057, 2, 5747, '[\"4\"]', NULL, '1', 'Corinne', 'Blackburn', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'corinne_blackburn@yahoo.com', '(425) 737-5878', '', '', 5747, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1058, 2, 3355, '[\"4\"]', NULL, '1', 'DeAnn', 'Fairholt', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'defairholt@yahoo.com', '(970) 825-4070', '', '', 3355, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1059, 2, 7252, '[\"4\"]', NULL, '1', 'Deanna', 'Angell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'rjscars@netzero.net', '(720) 292-4096', '', '', 7252, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1060, 2, 8091, '[\"4\"]', NULL, '1', 'Debbie', 'Hughes', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'ddkhughes@comcast.net', '(970) 689-0561', '', '', 8091, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1061, 2, 8233, '[\"4\"]', NULL, '1', 'Desiree', 'Brown', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'dtbrown15@yahoo.com', '(111) 111-1111', '', '', 8233, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1062, 2, 4626, '[\"4\"]', NULL, '1', 'Dorothy', 'Colyer', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'spt5er@gmail.com', '(970) 988-1150', '', '', 4626, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1063, 2, 8585, '[\"4\"]', NULL, '1', 'Dyani', 'Ladd', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'indya_tarot25@hotmail.com', '(970) 397-7870', '', '', 8585, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1064, 2, 5903, '[\"4\"]', NULL, '1', 'Ellen', 'Stover', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'estover76@yahoo.com', '(970) 690-9167', '', '', 5903, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1065, 2, 2879, '[\"4\"]', NULL, '1', 'Ellen', 'Graham', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'grahamellen3@gmail.com', '(720) 357-3833', '', '', 2879, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1066, 2, 9196, '[\"4\"]', NULL, '1', 'Hannah', 'Colyer', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'hannahcolyer55@gmail.com', '(970) 397-0086', '', '', 9196, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1067, 2, 7195, '[\"4\"]', NULL, '1', 'Iman', 'AlSudani', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'ialsudani@yahoo.com', '(720) 366-2829', '', '', 7195, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1068, 2, 10330, '[\"4\"]', NULL, '1', 'Irene', 'Zaidi', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'greyloves@hotmail.com', '(970) 619-1870', '', '', 10330, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1069, 2, 6079, '[\"4\"]', NULL, '1', 'Janie', 'Eichorn', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'janie1961@live.com', '(970) 422-0675', '', '', 6079, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1070, 2, 4339, '[\"4\"]', NULL, '1', 'Jeanne', 'Schaffer', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'caregirl1216@gmail.com', '(970) 646-7149', '', '', 4339, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1071, 2, 9356, '[\"4\"]', NULL, '1', 'Jeannette', 'Benglen', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lhmassage@aol.com', '(970) 646-3906', '', '', 9356, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1072, 2, 8687, '[\"4\"]', NULL, '1', 'Jennifer', 'Johnston', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'jennjohnston33.jj@gmail.com', '(970) 324-3076', '', '', 8687, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1073, 2, 4742, '[\"4\"]', NULL, '1', 'Judy', 'Ramirez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'jkayramirez53@gmail.com', '(720) 308-7265', '', '', 4742, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1074, 2, 1826, '[\"4\"]', NULL, '1', 'Kandice', 'Duran', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'durankandice@gmail.com', '(720) 387-9093', '', '', 1826, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1075, 2, 7333, '[\"4\"]', NULL, '1', 'Karalee (Karly)', 'Hensley', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'karaleehensley@gmail.com', '(303) 359-6088', '', '', 7333, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1076, 2, 8936, '[\"4\"]', NULL, '1', 'Kathryn', 'White', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'kathy_white7@msn.com', '(303) 564-4126', '', '', 8936, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1077, 2, 1962, '[\"4\"]', NULL, '1', 'Kelly', 'Trevino', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'kat1113969@gmail.com', '(970) 397-2684', '', '', 1962, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1078, 2, 7156, '[\"4\"]', NULL, '1', 'Kimberly', 'Birdsall', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'K.bird8776@gmail.com', '(507) 327-9303', '', '', 7156, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1079, 2, 3677, '[\"4\"]', NULL, '1', 'Krista', 'Carroll', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'kristacarroll7@yahoo.com', '(720) 935-1589', '', '', 3677, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1080, 2, 2151, '[\"4\"]', NULL, '1', 'Latashia', 'Graham', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'nananas59@gmail.com', '(970) 978-7629', '', '', 2151, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1081, 2, 9240, '[\"4\"]', NULL, '1', 'Linda', 'Walsh', '0000-00-00', '0000-00-00', NULL, NULL, 'null', NULL, '(111) 111-1111', '', '', 9240, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1082, 2, 7286, '[\"4\"]', NULL, '1', 'Linda \"Lyn\"', 'Wazny', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lwaz84@hotmail.com', '(307) 460-0715', '', '', 7286, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1083, 2, 8073, '[\"4\"]', NULL, '1', 'Madison', 'Barber \"Xander\"', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'xme4323@gmail.com', '(720) 628-4374', '', '', 8073, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1084, 2, 9742, '[\"4\"]', NULL, '1', 'Maria', 'Hernandez Galindo', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lvldmalia@gmail.com', '(303) 676-7175', '', '', 9742, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1085, 2, 6571, '[\"4\"]', NULL, '1', 'Maria G', 'Cornejo Cruz', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '30642.mc@gmail.com', '(970) 685-7529', '', '', 6571, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1086, 2, 7153, '[\"4\"]', NULL, '1', 'Patricia', 'Tabares', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'patatabares@gmail.com', '(970) 347-0465', '', '', 7153, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1087, 2, 9680, '[\"4\"]', NULL, '1', 'Phyllis', 'DeNovellis', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'theperfectdip@comcast.net', '(970) 825-9235', '', '', 9680, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1088, 2, 5136, '[\"4\"]', NULL, '1', 'Raquel', 'Romero', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'raquelcrvnts@yahoo.com', '(970) 381-2611', '', '', 5136, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1089, 2, 9038, '[\"4\"]', NULL, '1', 'Renay', 'Stoltz', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'rstoltz119@gmail.com', '(720) 882-5969', '', '', 9038, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1090, 2, 8597, '[\"4\"]', NULL, '1', 'Roxanne', 'Martinez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'roxmtz123@gmail.com', '(620) 640-9846', '', '', 8597, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1091, 2, 1893, '[\"4\"]', NULL, '1', 'Sabrina', 'Allen', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'Mtsaride@yahoo.com', '(970) 980-4545', '', '', 1893, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1092, 2, 6538, '[\"4\"]', NULL, '1', 'Sandra', 'Trujillo', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'sandra.trujillo1025@gmail.com', '(303) 945-0170', '', '', 6538, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1093, 2, 6814, '[\"4\"]', NULL, '1', 'Sara', 'Wirth', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'sarawstpaul@yahoo.com', '(817) 673-9106', '', '', 6814, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1094, 2, 8950, '[\"4\"]', NULL, '1', 'Sarah', 'Silkey', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'sbsilkey@gmail.com', '(720) 429-0705', '', '', 8950, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1095, 2, 7908, '[\"4\"]', NULL, '1', 'Sherry', 'Whisenton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'sawhisentonhome@yahoo.com', '(303) 934-0378', '', '', 7908, 1, '@comcastpcs.textmsg.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1096, 2, 1910, '[\"4\"]', NULL, '1', 'Stefanie', 'LaSala', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'stefanielasala@yahoo.com', '(970) 568-6579', '', '', 1910, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1097, 2, 7035, '[\"4\"]', NULL, '1', 'Susan', 'Jaster', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'mauigirlinco@hotmail.com', '(970) 231-5168', '', '', 7035, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1098, 2, 8362, '[\"4\"]', NULL, '1', 'Teggy', 'Araki', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'teggy.araki@yahoo.com', '(720) 275-9798', '', '', 8362, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1099, 2, 10299, '[\"4\"]', NULL, '1', 'Teresa', 'Ramirez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'teresar1309@yahoo.com', '(720) 692-1727', '', '', 10299, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1100, 2, 9771, '[\"4\"]', NULL, '1', 'Theresa', 'Dillon', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'stevenson_family9@yahoo.com', '(720) 648-9319', '', '', 9771, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1101, 2, 9357, '[\"4\"]', NULL, '1', 'Tiffany', 'Null', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'tnull8@gmail.com', '(720) 448-7992', '', '', 9357, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1102, 2, 7278, '[\"4\"]', NULL, '1', 'Tinkerbell', 'Test', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'lisa.o@amadaseniorcare.com', '(307) 262-8561', '', '', 7278, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1103, 2, 6419, '[\"4\"]', NULL, '1', 'Traci', 'Hamilton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'hamiltontraci05@gmail.com', '(651) 230-9297', '', '', 6419, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1104, 2, 8975, '[\"4\"]', NULL, '1', 'Yvette', 'Padilla', '0000-00-00', '0000-00-00', NULL, NULL, 'null', 'vettyboo88@gmail.com', '(970) 412-9098', '', '', 8975, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1105, 2, 9370, '[\"5\"]', NULL, '1', 'Monea', 'Adams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 258-7098', 'moneaadams@gmail.com', '', '', 9370, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1106, 2, 9647, '[\"5\"]', NULL, '1', 'Michaela', 'Adams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 248-3674', 'michaeladams629@gmail.com', '', '', 9647, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1107, 2, 6649, '[\"5\"]', NULL, '1', 'Akossiwa', 'Adjignon', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 204-8531', 'honorineahefa@yahoo.com', '', '', 6649, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1108, 2, 4752, '[\"5\"]', NULL, '1', 'Bessem', 'Agbor ', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(817) 948-6830', 'reginabes89@yahoo.com', '', '', 4752, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1');
INSERT INTO `employee_master` (`id`, `etid`, `clockid`, `units`, `catid`, `disciplines`, `firstname`, `lastname`, `dob`, `lastlogin`, `hiredate`, `address`, `shifts`, `email`, `mobile`, `image`, `password`, `employeeid`, `job`, `carrier`, `job_description`, `remember_token`, `pecks`, `image_new`, `status`, `upload_date`, `fac_id`) VALUES
(1109, 2, 5676, '[\"5\"]', NULL, '1', 'Takwa', 'Al-Hachami', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 207-7210', 'alhachami1991@hotmail.com', '', '', 5676, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1110, 2, 5200, '[\"5\"]', NULL, '1', 'David', 'Allen', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 496-7156', 'davidallen222@yahoo.com', '', '', 5200, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1111, 2, 2774, '[\"5\"]', NULL, '1', 'Iwanna', 'Anderson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 818-5033', 'pooka1961@gmail.com', '', '', 2774, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1112, 2, 6415, '[\"5\"]', NULL, '1', 'Gina', 'Andreone', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 550-9144', 'giandreone@icloud.com', '', '', 6415, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1113, 2, 9530, '[\"5\"]', NULL, '1', 'Deborah', 'Andrews', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 221-4413', 'Debraandrews27@yahoo.com', '', '', 9530, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1114, 2, 5338, '[\"5\"]', NULL, '1', 'Kimberly', 'Anthony', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 307-6350', 'MsKimJann@gmail.com', '', '', 5338, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1115, 2, 5495, '[\"5\"]', NULL, '1', 'Kelli', 'Bailey', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 600-4011', 'kellibailey2014@gmail.com', '', '', 5495, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1116, 2, 4194, '[\"5\"]', NULL, '1', 'Charlotte', 'Baker', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 218-5117', 'charlottebaker202@yahoo.com', '', '', 4194, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1117, 2, 9997, '[\"5\"]', NULL, '1', 'Andrew', 'Banks', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(702) 557-1873', 'andrewbanks15@yahoo.com', '', '', 9997, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1118, 2, 8355, '[\"5\"]', NULL, '1', 'Jayla', 'Barker', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 419-1489', 'jbarke312@gmail.com', '', '', 8355, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1119, 2, 5581, '[\"5\"]', NULL, '1', 'Candice', 'Bell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 717-6452', 'ckbell526@yahoo.com', '', '', 5581, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1120, 2, 9774, '[\"5\"]', NULL, '1', 'Daiona', 'Bell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 904-4904', 'Daiona177@gmail.com', '', '', 9774, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1121, 2, 4546, '[\"5\"]', NULL, '1', 'Josephine', 'Belman', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 384-6036', 'josephine_Belman@outlook.com', '', '', 4546, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1122, 2, 8316, '[\"5\"]', NULL, '1', 'Angela', 'Berry', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 523-3213', 'angelaberry169@gmail.com', '', '', 8316, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1123, 2, 8507, '[\"5\"]', NULL, '1', 'Dianna', 'Blair', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 727-3640', 'dianna.blair69@yahoo.com', '', '', 8507, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1124, 2, 5060, '[\"5\"]', NULL, '1', 'Lillie', 'Blair', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 685-2176', 'lbair583@gmail.com', '', '', 5060, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1125, 2, 5081, '[\"5\"]', NULL, '1', 'Alantee', 'Bolling', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 340-8729', 'alantee95@gmail.com', '', '', 5081, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1126, 2, 5617, '[\"5\"]', NULL, '1', 'Samantha', 'Bonner', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 575-1501', '1120san1977@gmail.com', '', '', 5617, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1127, 2, 3575, '[\"5\"]', NULL, '1', 'Sherrill', 'Bradley', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 277-1342', 'sherrillb1961@gmail.com', '', '', 3575, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1128, 2, 7076, '[\"5\"]', NULL, '1', 'Heather', 'Brock', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 660-4436', 'hlb03131971@gmail.com', '', '', 7076, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1129, 2, 7665, '[\"5\"]', NULL, '1', 'Jana R.', 'Brodie', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 925-1695', 'JBrodie12@aol.com', '', '', 7665, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1130, 2, 3724, '[\"5\"]', NULL, '1', 'Angrell', 'Brown', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 768-4807', 'angrell.brown@yahoo.com', '', '', 3724, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1131, 2, 9981, '[\"5\"]', NULL, '1', 'Daniel', 'Brown', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 231-8572', NULL, '', '', 9981, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1132, 2, 1146, '[\"5\"]', NULL, '1', 'Kristina', 'Burrell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 513-1315', 'krisbur06@gmail.com', '', '', 1146, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1133, 2, 3150, '[\"5\"]', NULL, '1', 'Charice', 'Byrd', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 334-8883', 'charicebyrd@yahoo.com', '', '', 3150, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1134, 2, 3244, '[\"5\"]', NULL, '1', 'Ayeshah', 'Carr', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 410-2877', 'ayeshahcarr@gmail.com', '', '', 3244, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1135, 2, 4468, '[\"5\"]', NULL, '1', 'Brendisha', 'Carr', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 870-8308', NULL, '', '', 4468, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1136, 2, 2509, '[\"5\"]', NULL, '1', 'Perpetua', 'Chambers', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 687-3045', NULL, '', '', 2509, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1137, 2, 9998, '[\"5\"]', NULL, '1', 'Deann', 'Chartier', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 697-1761', 'dcdnn@aol.com', '', '', 9998, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1138, 2, 9659, '[\"5\"]', NULL, '1', 'Taylor', 'Clifford', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 821-0173', 'mzhilliard.TC@gmail.com', '', '', 9659, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1139, 2, 7353, '[\"5\"]', NULL, '1', 'Michelle Renee', 'Coleman', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 629-7468', 'mrc3620@yahoo.com', '', '', 7353, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1140, 2, 3194, '[\"5\"]', NULL, '1', 'Evelyn', 'Colson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 465-5998', NULL, '', '', 3194, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1141, 2, 4063, '[\"5\"]', NULL, '1', 'kiara', 'Colson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 728-8991', NULL, '', '', 4063, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1142, 2, 6818, '[\"5\"]', NULL, '1', 'Thomas', 'Cooper', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 334-8217', 'Tcooper841@gmail.com', '', '', 6818, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1143, 2, 6500, '[\"5\"]', NULL, '1', 'David', 'Dailey', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 846-3576', 'david.dailey43@yahoo.com', '', '', 6500, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1144, 2, 3746, '[\"5\"]', NULL, '1', 'Tina', 'Dailey', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 772-4494', NULL, '', '', 3746, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1145, 2, 8674, '[\"5\"]', NULL, '1', 'Emma', 'Daniel', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(615) 419-7803', 'emjdan@yahoo.com', '', '', 8674, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1146, 2, 6209, '[\"5\"]', NULL, '1', 'Terrie', 'Daniels', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 685-3155', 'skippy44452@gmail.com', '', '', 6209, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1147, 2, 4380, '[\"5\"]', NULL, '1', 'Marlean', 'Davis', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 760-4508', 'marleandavis@yahoo.com', '', '', 4380, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1148, 2, 5126, '[\"5\"]', NULL, '1', 'Julene', 'Dennis', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 843-9364', 'J.michelle.d91@gmail.com', '', '', 5126, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1149, 2, 9553, '[\"5\"]', NULL, '1', 'Ariel', 'Dewberry', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 718-3346', 'Arieldewberry36@gmail.com', '', '', 9553, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1150, 2, 8525, '[\"5\"]', NULL, '1', 'Vanessa', 'Donelson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 482-8709', 'vanessadonaldson@gmail.com', '', '', 8525, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1151, 2, 9701, '[\"5\"]', NULL, '1', 'Helena', 'Doucet', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 467-4475', 'doucethelena5@gmail.com', '', '', 9701, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1152, 2, 10004, '[\"5\"]', NULL, '1', 'A\'Miracle', 'Drain', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 363-2893', 'amdrain@wccnet.edu', '', '', 10004, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1153, 2, 9963, '[\"5\"]', NULL, '1', 'Darnell', 'Dykes-Bivings', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 636-9059', 'ddarnellbivings@yahoo.com', '', '', 9963, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1154, 2, 9665, '[\"5\"]', NULL, '1', 'Anna Mae', 'Eby', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 767-3426', 'animeby2007@gmail.com', '', '', 9665, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1155, 2, 10362, '[\"5\"]', NULL, '1', 'Cristina  RN', 'Edwards', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 485-6613', 'kkgrier06@att.net', '', '', 10362, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1156, 2, 9260, '[\"5\"]', NULL, '1', 'Mercedes', 'Eubanks', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 602-6140', 'derrickgolston08@gmail.com', '', '', 9260, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1157, 2, 3517, '[\"5\"]', NULL, '1', 'LaTrena', 'Favor', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 444-7928', NULL, '', '', 3517, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1158, 2, 4544, '[\"5\"]', NULL, '1', 'Martez', 'Fenderson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 818-5824', 'martez.fenderson89@gmail.com', '', '', 4544, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1159, 2, 6487, '[\"5\"]', NULL, '1', 'Michelle', 'Fitzgerald', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 943-1783', 'michellefitzgerald319@yahoo.com', '', '', 6487, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1160, 2, 6981, '[\"5\"]', NULL, '1', 'Gail', 'Fleeton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 796-3962', NULL, '', '', 6981, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1161, 2, 4842, '[\"5\"]', NULL, '1', 'Deon', 'Foster', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 772-2349', 'Jettaluv@yahoo.com', '', '', 4842, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1162, 2, 10315, '[\"5\"]', NULL, '1', 'Willie Ermadine', 'Foster', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 408-1059', NULL, '', '', 10315, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1163, 2, 9555, '[\"5\"]', NULL, '1', 'Janisha', 'Freeman', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(810) 858-1415', '2014lovingmybabys@gmail.com', '', '', 9555, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1164, 2, 5888, '[\"5\"]', NULL, '1', 'Summer', 'Freeman', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 728-7594', 'summerorlandowife@gmail.com', '', '', 5888, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1165, 2, 4217, '[\"5\"]', NULL, '1', 'Michelle', 'Fuller', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 671-0498', 'mrfuller@umd.umich.edu', '', '', 4217, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1166, 2, 6283, '[\"5\"]', NULL, '1', 'Debra', 'Gholston', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 742-9923', 'mizzdeeg@yahoo.com', '', '', 6283, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1167, 2, 6780, '[\"5\"]', NULL, '1', 'Ruth', 'Gilman', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 957-8946', NULL, '', '', 6780, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1168, 2, 8150, '[\"5\"]', NULL, '1', 'Belinda', 'Gray', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 828-7790', 'belindagray64@gmail.com', '', '', 8150, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1169, 2, 9536, '[\"5\"]', NULL, '1', 'Cierra', 'Gray', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 443-6298', 'nicole90.gray@gmail.com', '', '', 9536, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1170, 2, 9554, '[\"5\"]', NULL, '1', 'Rayshell', 'Green', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 818-5126', 'Rayshell.green03@gmail.com', '', '', 9554, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1171, 2, 5571, '[\"5\"]', NULL, '1', 'Wynee', 'Green', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 820-0408', 'wynee.y.green@gmail.com', '', '', 5571, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1172, 2, 9646, '[\"5\"]', NULL, '1', 'Katie', 'Greenwood', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 785-8195', 'kgreen2191@gnail.com', '', '', 9646, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1173, 2, 2312, '[\"5\"]', NULL, '1', 'danielle', 'Griffin', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 996-9935', 'griffindanielle@yahoo.com', '', '', 2312, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1174, 2, 10414, '[\"5\"]', NULL, '1', 'Tenicia', 'Harlan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 217-9940', 'teniciaharlan213@gmail.com', '', '', 10414, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1175, 2, 9234, '[\"5\"]', NULL, '1', 'Jamie', 'Harrington', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 209-9665', 'jeharrington45@gmail.com', '', '', 9234, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1176, 2, 7750, '[\"5\"]', NULL, '1', 'Mary', 'Harrington', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 445-4582', 'Harringtonmary93@gmail.com', '', '', 7750, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1177, 2, 4614, '[\"5\"]', NULL, '1', 'Raven', 'Harvey', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 817-8878', 'rhavey1191@yahoo.com', '', '', 4614, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1178, 2, 7120, '[\"5\"]', NULL, '1', 'Lorraine', 'Heard', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 333-8062', 'LorraineHeard2@gmail.com', '', '', 7120, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1179, 2, 4001, '[\"5\"]', NULL, '1', 'Manice', 'Hicks', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 412-3109', 'manicehicks@yahoo.com', '', '', 4001, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1180, 2, 3216, '[\"5\"]', NULL, '1', 'Greg', 'Hines', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 790-9772', NULL, '', '', 3216, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1181, 2, 5890, '[\"5\"]', NULL, '1', 'Tequilla', 'Holloway', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 269-3766', 'teqholloway1970@gmail.com', '', '', 5890, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1182, 2, 10279, '[\"5\"]', NULL, '1', 'Alexsus', 'Holt', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 658-4596', 'Alexusholt30@yahoo.com', '', '', 10279, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1183, 2, 5476, '[\"5\"]', NULL, '1', 'Deanna', 'Honiston', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 344-5950', NULL, '', '', 5476, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1184, 2, 4655, '[\"5\"]', NULL, '1', 'Anginae', 'Hopkins', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 445-1679', 'anginaehopkins1@yahoo.com', '', '', 4655, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1185, 2, 9337, '[\"5\"]', NULL, '1', 'Maryanne', 'Howard', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 800-9103', 'howardanne27@yahoo.com', '', '', 9337, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1186, 2, 3711, '[\"5\"]', NULL, '1', 'Myra', 'HUBBARD', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 671-2213', NULL, '', '', 3711, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1187, 2, 5388, '[\"5\"]', NULL, '1', 'Michaela', 'Hudson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 740-5238', NULL, '', '', 5388, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1188, 2, 9759, '[\"5\"]', NULL, '1', 'Telecia', 'Hudson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 953-9292', NULL, '', '', 9759, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1189, 2, 6010, '[\"5\"]', NULL, '1', 'Recardo', 'Hughes', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 658-5918', NULL, '', '', 6010, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1190, 2, 6340, '[\"5\"]', NULL, '1', 'LeeNetta', 'Ingrahm', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 471-1380', 'abundantlifeind@yahoo.com', '', '', 6340, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1191, 2, 8313, '[\"5\"]', NULL, '1', 'Alexis', 'Jackson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(205) 920-5769', 'AlexisJania@icloud.com', '', '', 8313, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1192, 2, 2322, '[\"5\"]', NULL, '1', 'Eric', 'Jackson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 242-0761', 'eaj5040@gmail.com', '', '', 2322, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1193, 2, 2252, '[\"5\"]', NULL, '1', 'Janis', 'Jackson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 293-9875', 'janjax1979@gmail.com', '', '', 2252, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1194, 2, 9772, '[\"5\"]', NULL, '1', 'Seberna', 'Jackson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 979-3269', 'seberna48@gmail.com', '', '', 9772, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1195, 2, 10459, '[\"5\"]', NULL, '1', 'Sharisse', 'Jackson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 447-2548', 'sharissej64@gmail.com', '', '', 10459, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1196, 2, 6473, '[\"5\"]', NULL, '1', 'Kia', 'Jacob', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 739-0584', 'KiaJacob@gmail.com', '', '', 6473, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1197, 2, 5352, '[\"5\"]', NULL, '1', 'Danette', 'James', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 409-4339', 'Danette750@gmail.com', '', '', 5352, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1198, 2, 9648, '[\"5\"]', NULL, '1', 'Catharina', 'Jenkins', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 346-3789', NULL, '', '', 9648, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1199, 2, 7100, '[\"5\"]', NULL, '1', 'Arnold', 'Johnson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 506-9819', 'ajohns15@sbcglobal.net', '', '', 7100, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1200, 2, 4265, '[\"5\"]', NULL, '1', 'Carmen', 'Johnson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(770) 875-9688', 'CarmenJ1414@gmail.com', '', '', 4265, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1201, 2, 4387, '[\"5\"]', NULL, '1', 'Cynthia', 'Johnson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 929-4611', 'paradisejohnson27@yahoo.com', '', '', 4387, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1202, 2, 8469, '[\"5\"]', NULL, '1', 'Glenda', 'Jones', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 646-0441', 'glendajones0108@gmail.com', '', '', 8469, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1203, 2, 5929, '[\"5\"]', NULL, '1', 'Kimyana', 'Jones', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 656-1912', 'Kimyana.jones@gmail.com', '', '', 5929, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1204, 2, 3710, '[\"5\"]', NULL, '1', 'Charlene', 'Jordan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 363-1783', 'charlenejordan26@yahoo.com', '', '', 3710, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1205, 2, 9309, '[\"5\"]', NULL, '1', 'Tamara', 'Jordan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 820-8220', 'tamarajordan@ymail.com', '', '', 9309, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1206, 2, 8255, '[\"5\"]', NULL, '1', 'Audrey', 'Kelly', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 641-8054', 'akelley1064@hotmail.com', '', '', 8255, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1207, 2, 1678, '[\"5\"]', NULL, '1', 'Sonia', 'Kennedy', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 251-3082', 'kimston620@gmail.com', '', '', 1678, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1208, 2, 4746, '[\"5\"]', NULL, '1', 'Sandra', 'King', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 361-1033', 'sksandy225@aol.com', '', '', 4746, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1209, 2, 6064, '[\"5\"]', NULL, '1', 'Pamela', 'Knuckles', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 469-0771', NULL, '', '', 6064, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1210, 2, 5296, '[\"5\"]', NULL, '1', 'Nakesha', 'Lane', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 932-8253', 'keshalane28@icloud.com', '', '', 5296, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1211, 2, 10293, '[\"5\"]', NULL, '1', 'Mercedes', 'Larock', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 685-2265', 'mercedesbrown75@gmail.com', '', '', 10293, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1212, 2, 8772, '[\"5\"]', NULL, '1', 'Briana', 'Looney', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 787-3010', 'Briana_Looney@gmail.com', '', '', 8772, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1213, 2, 5648, '[\"5\"]', NULL, '1', 'Erica', 'Lopez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 935-4449', 'erica1lopez19@gmail.com', '', '', 5648, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1214, 2, 7184, '[\"5\"]', NULL, '1', 'Leigha', 'Lovett', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 439-8472', 'lovet1lh@cmich.edu', '', '', 7184, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1215, 2, 9513, '[\"5\"]', NULL, '1', 'Connie', 'Luschas', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 728-6045', NULL, '', '', 9513, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1216, 2, 3693, '[\"5\"]', NULL, '1', 'Richard', 'Manning', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 265-8302', NULL, '', '', 3693, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1217, 2, 8899, '[\"5\"]', NULL, '1', 'Monica', 'Martey', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(815) 600-6496', 'moniquezf4@gmail.com', '', '', 8899, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1218, 2, 6284, '[\"5\"]', NULL, '1', 'Nadia', 'McClendon', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 695-4361', 'Nadiamcclendon@yahoo.com', '', '', 6284, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1219, 2, 6532, '[\"5\"]', NULL, '1', 'Cierra', 'McCreary', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 808-7967', 'cmccre02@yahoo.com', '', '', 6532, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1220, 2, 4914, '[\"5\"]', NULL, '1', 'Crystal', 'Mcmillan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 720-5014', 'crystal.h@amadaseniorcare.com', '', '', 4914, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1221, 2, 4334, '[\"5\"]', NULL, '1', 'Shawntae', 'McMillan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 910-9985', 'mcmillanshawntae@yahoo.com', '', '', 4334, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1222, 2, 2323, '[\"5\"]', NULL, '1', 'Felicia', 'Melton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 348-6862', 'fmelton4634@marygrove.edu', '', '', 2323, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1223, 2, 9104, '[\"5\"]', NULL, '1', 'Jamika', 'Mitchell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 574-5996', 'jamikamitchell15@yahoo.com', '', '', 9104, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1224, 2, 10342, '[\"5\"]', NULL, '1', 'Lisa', 'Mitchell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 980-0270', 'Lisa7224@att.net', '', '', 10342, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1225, 2, 7681, '[\"5\"]', NULL, '1', 'Sherron', 'Moore', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 550-5963', 'Sherroncmoore@yahoo.com', '', '', 7681, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1226, 2, 10456, '[\"5\"]', NULL, '1', 'Geneva', 'Morrow', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 802-9607', 'genevamarrow3933@att.net', '', '', 10456, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1227, 2, 9692, '[\"5\"]', NULL, '1', 'Jacqueline', 'Munlin', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 310-8592', 'jmunlin51@gmail.com', '', '', 9692, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1228, 2, 7380, '[\"5\"]', NULL, '1', 'Brandie', 'Newsome', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 333-4816', 'Bnewsome71@gmail.com', '', '', 7380, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1229, 2, 5173, '[\"5\"]', NULL, '1', 'Maria', 'Nichifor', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 678-5038', NULL, '', '', 5173, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1230, 2, 4004, '[\"5\"]', NULL, '1', 'Latasya', 'Nickens', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 704-1944', 'lnickens40@gmail.com', '', '', 4004, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1231, 2, 9697, '[\"5\"]', NULL, '1', 'Devlyn', 'Norris', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 275-6533', 'ndevlyn@yahoo.com', '', '', 9697, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1232, 2, 2474, '[\"5\"]', NULL, '1', 'Victoria', 'Nowak', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(810) 845-2373', NULL, '', '', 2474, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1233, 2, 6563, '[\"5\"]', NULL, '1', 'Lashana', 'Oates', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 695-8618', 'oates36@att.net', '', '', 6563, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1234, 2, 4855, '[\"5\"]', NULL, '1', 'Molly', 'O\'Connor', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 496-3483', 'moloconnor@hotmail.com', '', '', 4855, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1235, 2, 6361, '[\"5\"]', NULL, '1', 'Cassandra', 'Oldham', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 359-5012', 'cassandraoldham27@yahoo.com', '', '', 6361, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1236, 2, 6618, '[\"5\"]', NULL, '1', 'Alice', 'Opoku', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 675-5978', 'alicebussybee@yahoo.com', '', '', 6618, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1237, 2, 5233, '[\"5\"]', NULL, '1', 'Patricia', 'Owens', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 377-7972', 'PatriciaOwens99@yahoo.com', '', '', 5233, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1238, 2, 3662, '[\"5\"]', NULL, '1', 'Patricia', 'Paroly', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 478-9958', NULL, '', '', 3662, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1239, 2, 9672, '[\"5\"]', NULL, '1', 'Gynena', 'Perry', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 790-2284', NULL, '', '', 9672, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1240, 2, 4073, '[\"5\"]', NULL, '1', 'Donna', 'Peterson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 914-4015', 'Donnapeterson31@gmail.com', '', '', 4073, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1241, 2, 9729, '[\"5\"]', NULL, '1', 'Latasha', 'Pippen', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 702-4063', 'latashacollin@yahoo.com', '', '', 9729, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1242, 2, 9980, '[\"5\"]', NULL, '1', 'Jasmine', 'Pollard', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 910-5818', 'pollardjasmine37@gmail.com', '', '', 9980, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1243, 2, 7034, '[\"5\"]', NULL, '1', 'Gail', 'Poole', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 726-2019', NULL, '', '', 7034, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1244, 2, 7033, '[\"5\"]', NULL, '1', 'Tina', 'Poole - Green', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 254-2443', 'tinagreen1109@att.net', '', '', 7033, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1245, 2, 4482, '[\"5\"]', NULL, '1', 'Bria', 'Porter', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 748-5213', 'porterbria1@gmail.com', '', '', 4482, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1246, 2, 4901, '[\"5\"]', NULL, '1', 'Brenda L.', 'Prophet', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 585-2591', NULL, '', '', 4901, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1247, 2, 6472, '[\"5\"]', NULL, '1', 'Chanta', 'Renfroe', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 492-6898', 'ChantaThomas@yahoo.com', '', '', 6472, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1248, 2, 4737, '[\"5\"]', NULL, '1', 'Sheila', 'Rhodes', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 205-0949', 'rhodes.sheilal@att.net', '', '', 4737, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1249, 2, 6817, '[\"5\"]', NULL, '1', 'Willie', 'Rhymes Jr.', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 344-1143', 'w.rhymes@yahoo.com', '', '', 6817, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1250, 2, 7180, '[\"5\"]', NULL, '1', 'Jewell', 'Ridgeway', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(713) 298-4852', 'jridgeway59@gmail.com', '', '', 7180, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1251, 2, 7171, '[\"5\"]', NULL, '1', 'Jewell', 'Ridgeway', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(713) 298-4852', 'jridgeway59@gmail.com', '', '', 7171, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1252, 2, 9650, '[\"5\"]', NULL, '1', 'Rasheedah', 'Robinson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 675-2616', 'rasheedehrr@gmail.com', '', '', 9650, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1253, 2, 10017, '[\"5\"]', NULL, '1', 'Yvonne', 'Rock', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 231-4749', 'gmrock2002@yahoo.com', '', '', 10017, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1254, 2, 6659, '[\"5\"]', NULL, '1', 'Patricia', 'Russel', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 664-8076', 'russellaudreytimes2@yahoo.com', '', '', 6659, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1255, 2, 8891, '[\"5\"]', NULL, '1', 'Audrey', 'Russell', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 828-3371', 'russellaudreytimes2@yahoo.com', '', '', 8891, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1256, 2, 3751, '[\"5\"]', NULL, '1', 'Catherine', 'Sanchez', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 205-7033', 'catherinesanchez0824@gmail.com', '', '', 3751, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1257, 2, 10281, '[\"5\"]', NULL, '1', 'Chance', 'Savage', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 293-2377', 'Chance23savage@gmail.com', '', '', 10281, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1258, 2, 7203, '[\"5\"]', NULL, '1', 'Sheila', 'Schroeder', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 925-0328', NULL, '', '', 7203, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1259, 2, 9695, '[\"5\"]', NULL, '1', 'Aviaunce', 'Scott', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 221-0032', 'a.scott8663@gmail.com', '', '', 9695, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1260, 2, 3730, '[\"5\"]', NULL, '1', 'Serpil', 'Sezgin', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 269-2949', 'serpilsezgin2@hotmail.com', '', '', 3730, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1261, 2, 7790, '[\"5\"]', NULL, '1', 'Gloria', 'Sharkey-Jones', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 678-4282', 'JEANJONES724@yahoo.com', '', '', 7790, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1262, 2, 4565, '[\"5\"]', NULL, '1', 'Vivienne', 'Shaw', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 418-0043', NULL, '', '', 4565, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1263, 2, 8773, '[\"5\"]', NULL, '1', 'Gladys', 'Simpson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 629-1297', 'gladyssimpson30@yahoo.com', '', '', 8773, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1264, 2, 4947, '[\"5\"]', NULL, '1', 'Wilhemena', 'Sims', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 205-6571', 'mena.sims@yahoo.com', '', '', 4947, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1265, 2, 3664, '[\"5\"]', NULL, '1', 'Marie', 'Sledge', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 819-1724', NULL, '', '', 3664, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1266, 2, 3485, '[\"5\"]', NULL, '1', 'Lakendria', 'Smith', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 508-3863', NULL, '', '', 3485, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1267, 2, 9008, '[\"5\"]', NULL, '1', 'Gloria', 'Sovor', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 498-3415', 'gloriasovor0828@yahoo.com', '', '', 9008, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1268, 2, 9661, '[\"5\"]', NULL, '1', 'Paris', 'Spicer', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 231-4313', NULL, '', '', 9661, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1269, 2, 10316, '[\"5\"]', NULL, '1', 'Andrea', 'Stanton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 293-2887', 'LisaGrant0921@gmail.com', '', '', 10316, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1270, 2, 2374, '[\"5\"]', NULL, '1', 'Tammy', 'Sullivan', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 613-4975', 'sullivto13@hotmail.com', '', '', 2374, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1271, 2, 4336, '[\"5\"]', NULL, '1', 'Dominique', 'Summers', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 399-7373', 'summersd89@yahoo.com', '', '', 4336, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1272, 2, 9366, '[\"5\"]', NULL, '1', 'Dionne', 'Talley', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 658-4107', 'talley_dionne@yahoo.com', '', '', 9366, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1273, 2, 4623, '[\"5\"]', NULL, '1', 'Vanesta', 'Tankard', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 918-5590', 'vanestatankard@yahoo.com', '', '', 4623, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1274, 2, 7177, '[\"5\"]', NULL, '1', 'Monita', 'Tarver', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 686-9166', 'williamsmonita@yahoo.com', '', '', 7177, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1275, 2, 9575, '[\"5\"]', NULL, '1', 'Treva', 'Taylor', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(517) 962-6875', '1trevataylor@gmail.com', '', '', 9575, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1276, 2, 10023, '[\"5\"]', NULL, '1', 'Deedra', 'Thomas', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 505-0695', 'dthomas26@emich.edu', '', '', 10023, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1277, 2, 9979, '[\"5\"]', NULL, '1', 'Lennisa', 'Thomas', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 895-0594', 'lennisathomas35@gmail.com', '', '', 9979, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1278, 2, 7046, '[\"5\"]', NULL, '1', 'Rosieta', 'Thomas', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 585-9490', 'roethomas711@gmail.com', '', '', 7046, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1279, 2, 2470, '[\"5\"]', NULL, '1', 'Sheree', 'Thomas', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 753-4037', 'shereesnt1@yahoo.com', '', '', 2470, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1280, 2, 4270, '[\"5\"]', NULL, '1', 'Chevonne', 'Thompson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(909) 200-8381', 'chevonnethompson1325@gmail.com', '', '', 4270, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1281, 2, 10029, '[\"5\"]', NULL, '1', 'Breanna-Amanda-Nicol', 'Thornton', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 208-4414', 'thorntonbrefine@gmail.com', '', '', 10029, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1282, 2, 7463, '[\"5\"]', NULL, '1', 'Peggy', 'Toney', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 736-0526', 'pmarshlltoney@gmail.com', '', '', 7463, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1283, 2, 9186, '[\"5\"]', NULL, '1', 'Roxanne', 'Turner', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 415-9409', 'roxanne553@comcast.net', '', '', 9186, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1284, 2, 5779, '[\"5\"]', NULL, '1', 'Brittani', 'Tyson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 416-6187', 'ms.tyson16@yahoo.com', '', '', 5779, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1285, 2, 9027, '[\"5\"]', NULL, '1', 'Melissa', 'Ulewicz', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 604-5014', 'melashrah@yahoo.com', '', '', 9027, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1286, 2, 8721, '[\"5\"]', NULL, '1', 'Kathy', 'Waters', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 403-4811', 'waters.Kathy@yahoo.com', '', '', 8721, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1287, 2, 9693, '[\"5\"]', NULL, '1', 'Brandy', 'Watkins', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 870-8756', 'brandywatkins32@gmail.com', '', '', 9693, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1288, 2, 10341, '[\"5\"]', NULL, '1', 'Lei-Lonnie', 'Watson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 894-1512', 'leilonnie_watson@yahoo.com', '', '', 10341, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1289, 2, 5228, '[\"5\"]', NULL, '1', 'Khadijah', 'Weathers', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(586) 945-9937', 'kadyyshanise@yahoo.com', '', '', 5228, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1290, 2, 6140, '[\"5\"]', NULL, '1', 'Kimberly', 'Wells', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 918-4444', 'Kimberly.wells42@yahoo.com', '', '', 6140, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1291, 2, 6779, '[\"5\"]', NULL, '1', 'Kimberly', 'White', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 896-8856', 'kkdkxtwins@gmail.com', '', '', 6779, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1292, 2, 9655, '[\"5\"]', NULL, '1', 'NaKeria', 'William', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 492-0374', 'nakeriawilliams@gmail.com', '', '', 9655, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1293, 2, 6637, '[\"5\"]', NULL, '1', 'Andrea', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 624-7109', NULL, '', '', 6637, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1294, 2, 5923, '[\"5\"]', NULL, '1', 'Barbara', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(734) 837-7701', 'mamabj68@yahoo.com', '', '', 5923, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1295, 2, 7084, '[\"5\"]', NULL, '1', 'Chantal', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 420-9849', 'williamschantal92@yahoo.com', '', '', 7084, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1296, 2, 4635, '[\"5\"]', NULL, '1', 'Jeremy', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 725-0166', 'jeremylee953@gmail.com', '', '', 4635, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1297, 2, 2902, '[\"5\"]', NULL, '1', 'Marcaela', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 319-4419', 'marcaelawilliams@yahoo.com', '', '', 2902, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1298, 2, 3243, '[\"5\"]', NULL, '1', 'Tolischa', 'Williams', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 768-4857', NULL, '', '', 3243, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1299, 2, 4142, '[\"5\"]', NULL, '1', 'Raymond', 'Wilson', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 926-6685', NULL, '', '', 4142, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1300, 2, 5243, '[\"5\"]', NULL, '1', 'Teresa', 'Wojcik', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 420-3341', 'radwanka12@wp.pl', '', '', 5243, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1301, 2, 5621, '[\"5\"]', NULL, '1', 'Moneak', 'Womack', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 333-3959', 'moneak.womack@aol.com', '', '', 5621, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1302, 2, 6894, '[\"5\"]', NULL, '1', 'Alison', 'Woodfolk', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(313) 303-9128', 'almasmileyinc@yahoo.com', '', '', 6894, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1'),
(1303, 2, 5595, '[\"5\"]', NULL, '1', 'Frances', 'Yancey', '0000-00-00', '0000-00-00', NULL, NULL, 'null', '(248) 533-3265', 'phatfatkat@gmail.com', '', '', 5595, 1, '', NULL, NULL, 0, NULL, 0, NULL, '1');

-- --------------------------------------------------------

--
-- Table structure for table `employee_notification`
--

CREATE TABLE `employee_notification` (
  `id` bigint(20) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT 'NOT_SEEN',
  `jobtitle_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_notification`
--

INSERT INTO `employee_notification` (`id`, `employee_id`, `notification_id`, `content`, `created_at`, `updated_at`, `status`, `jobtitle_id`) VALUES
(2308, 411, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2309, 683, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2310, 684, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2311, 685, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2312, 686, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2313, 687, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2314, 688, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2315, 689, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2316, 690, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2317, 691, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2318, 692, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2319, 693, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2320, 694, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2321, 695, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2322, 696, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2323, 697, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2324, 698, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2325, 699, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2326, 700, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2327, 701, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2328, 702, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2329, 703, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2330, 704, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2331, 705, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2332, 706, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2333, 707, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2334, 708, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2335, 709, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2336, 710, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2337, 711, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2338, 712, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2339, 713, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2340, 714, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2341, 715, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2342, 716, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2343, 717, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2344, 718, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2345, 719, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2346, 720, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2347, 721, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2348, 722, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2349, 723, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2350, 724, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2351, 725, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2352, 726, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2353, 727, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2354, 728, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2355, 729, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2356, 730, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2357, 731, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2358, 732, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2359, 733, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2360, 734, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2361, 735, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2362, 736, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2363, 737, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2364, 738, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2365, 739, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2366, 740, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2367, 741, 4, '1', '2017-06-27 14:29:55', NULL, 'NOT_SEEN', 2),
(2368, 742, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2369, 743, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2370, 744, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2371, 745, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2372, 746, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2373, 747, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2374, 748, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2375, 749, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2376, 750, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2377, 751, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2378, 752, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2379, 753, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2380, 754, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2381, 755, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2382, 756, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2383, 757, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2384, 758, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2385, 759, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2386, 760, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2387, 761, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2388, 762, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2389, 763, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2390, 764, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2391, 765, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2392, 766, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2393, 767, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2394, 768, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2395, 769, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2396, 770, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2397, 771, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2398, 772, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2399, 773, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2400, 774, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2401, 775, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2402, 776, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2403, 777, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2404, 778, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2405, 779, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2406, 780, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2407, 781, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2408, 782, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2409, 783, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2410, 784, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2411, 785, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2412, 786, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2413, 787, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2414, 788, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2415, 789, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2416, 790, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2417, 791, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2418, 792, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2419, 793, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2420, 794, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2421, 795, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2422, 796, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2423, 797, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2424, 798, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2425, 799, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2426, 800, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2427, 801, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2428, 802, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2429, 803, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2430, 804, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2431, 805, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2432, 806, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2433, 807, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2434, 808, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2435, 809, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2436, 810, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2437, 811, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2438, 812, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2439, 813, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2440, 814, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2441, 815, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2442, 816, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2443, 817, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2444, 818, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2445, 819, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2446, 820, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2447, 821, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2448, 822, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1),
(2449, 823, 4, '1', '2017-07-01 14:14:24', NULL, 'NOT_SEEN', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_shift`
--

CREATE TABLE `employee_shift` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `shift_id` int(11) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `approval` varchar(3) NOT NULL DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_type`
--

CREATE TABLE `employee_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `permission` varchar(1000) NOT NULL,
  `visiabled` tinyint(4) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_type`
--

INSERT INTO `employee_type` (`id`, `type`, `name`, `icon`, `permission`, `visiabled`, `orderby`) VALUES
(1, 'scheduling-manager', 'Scheduling Manager', 'upload/nursh.png', '[\"dashboard\"]', 0, 4),
(2, 'employee', 'Employee', 'upload/ffff.png', '[\"dashboard\"]', 0, 1),
(3, 'admin', 'Admin', '', '[\"dashboard\",\"newfeed\",\"coin\",\"addcoin\",\"list_approve_request\"]', 1, 6),
(4, 'super-admin', 'Super Admin', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]', 0, 5),
(5, 'patient-manager', 'Patient Manager', '', '[\"dashboard\",\"patient\"]', 0, 2),
(6, 'employee-manager', 'Employee Manager', '', '', 0, 3),
(7, 'super-executive', 'Super Executive User', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `exitsurvey`
--

CREATE TABLE `exitsurvey` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `q1` int(11) NOT NULL,
  `q2` int(11) NOT NULL,
  `q3` int(11) NOT NULL,
  `q4` int(11) NOT NULL,
  `q5` int(11) NOT NULL,
  `q6` int(11) NOT NULL,
  `q7` int(11) NOT NULL,
  `q8` int(11) NOT NULL,
  `q9` int(11) NOT NULL,
  `q10` int(11) NOT NULL,
  `q11` int(11) NOT NULL,
  `q12` int(11) NOT NULL,
  `q13` int(11) NOT NULL,
  `q14` int(11) NOT NULL,
  `q15` int(11) NOT NULL,
  `q16` int(11) NOT NULL,
  `q17` int(11) NOT NULL,
  `type` varchar(250) NOT NULL,
  `date` datetime NOT NULL,
  `q19` int(11) NOT NULL,
  `q20` int(11) NOT NULL,
  `q21` int(11) NOT NULL,
  `q22` int(11) NOT NULL,
  `q23` int(11) NOT NULL,
  `q24` int(11) NOT NULL,
  `q25` int(11) NOT NULL,
  `q26` int(11) NOT NULL,
  `q27` int(11) NOT NULL,
  `q28` int(11) NOT NULL,
  `q29` int(11) NOT NULL,
  `q30` int(11) NOT NULL,
  `qcount` int(11) NOT NULL,
  `q18` int(11) NOT NULL,
  `fac_id` varchar(50) DEFAULT NULL,
  `insurance_id` varchar(50) DEFAULT NULL,
  `unit_id` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exit_question`
--

CREATE TABLE `exit_question` (
  `id` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `question` varchar(250) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `unit_id` int(11) DEFAULT NULL,
  `fac_id` varchar(50) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exit_question`
--

INSERT INTO `exit_question` (`id`, `qid`, `type`, `question`, `enabled`, `unit_id`, `fac_id`, `orderby`) VALUES
(12, 1, 1, 'Were you treated fairly?', 1, 1, '1', 1),
(13, 2, 1, 'Takes_enough_time_with_you', 1, 1, '1', 2),
(14, 3, 1, 'Explains_what_you_want_to_know', 1, 1, '1', 3),
(15, 4, 1, 'Provides_good_advice_and_treatment', 1, 1, '1', 4),
(16, 1, 2, 'Listens_to_you_answers_questions', 1, 1, '1', 1),
(17, 2, 2, 'Provides_good_nursing_care', 1, 1, '1', 2),
(18, 3, 2, 'Takes_enough_time_with_you', 1, 1, '1', 3),
(19, 4, 2, 'Has_a_caring_attitude', 1, 1, '1', 4),
(20, 1, 3, 'Friendly_and_helpful_to_you', 1, 1, '1', 1),
(21, 2, 3, 'Answers_your_questions', 1, 1, '1', 2),
(22, 3, 3, 'Explains_Treatment_Plan', 1, 1, '1', 3),
(23, 4, 3, 'Has_a_caring_attitude', 1, 1, '1', 4),
(24, 1, 4, 'Neat_and_clean_building', 1, 1, '1', 1),
(25, 2, 4, 'Unit_easily_accessible', 1, 1, '1', 2),
(26, 3, 4, 'Comfort_and_Safety', 1, 1, '1', 3),
(27, 4, 4, 'Privacy', 1, 1, '1', 4),
(28, 5, 4, 'Likelihood_of_referring_others', 1, 1, '1', 5),
(29, 1, 1, 'Were you treated fairly?', 1, 2, '1', 1),
(30, 2, 1, 'Takes_enough_time_with_you', 1, 2, '1', 2),
(31, 3, 1, 'Explains_what_you_want_to_know', 1, 2, '1', 3),
(32, 4, 1, 'Provides_good_advice_and_treatment', 1, 2, '1', 4),
(33, 1, 2, 'Listens_to_you_answers_questions', 1, 2, '1', 1),
(34, 2, 2, 'Provides_good_nursing_care', 1, 2, '1', 2),
(35, 3, 2, 'Takes_enough_time_with_you', 1, 2, '1', 3),
(36, 4, 2, 'Has_a_caring_attitude', 1, 2, '1', 4),
(37, 1, 3, 'Friendly_and_helpful_to_you', 1, 2, '1', 1),
(38, 2, 3, 'Answers_your_questions', 1, 2, '1', 2),
(39, 3, 3, 'Explains_Treatment_Plan', 1, 2, '1', 3),
(40, 4, 3, 'Has_a_caring_attitude', 1, 2, '1', 4),
(41, 1, 4, 'Neat_and_clean_building', 1, 2, '1', 1),
(42, 2, 4, 'Unit_easily_accessible', 1, 2, '1', 2),
(43, 3, 4, 'Comfort_and_Safety', 1, 2, '1', 3),
(44, 4, 4, 'Privacy', 1, 2, '1', 4),
(45, 5, 4, 'Likelihood_of_referring_others', 1, 2, '1', 5),
(46, 1, 1, 'Were you treated fairly?', 1, 3, '1', 1),
(47, 2, 1, 'Takes_enough_time_with_you', 1, 3, '1', 2),
(48, 3, 1, 'Explains_what_you_want_to_know', 1, 3, '1', 3),
(49, 4, 1, 'Provides_good_advice_and_treatment', 1, 3, '1', 4),
(50, 1, 2, 'Listens_to_you_answers_questions', 1, 3, '1', 1),
(51, 2, 2, 'Provides_good_nursing_care', 1, 3, '1', 2),
(52, 3, 2, 'Takes_enough_time_with_you', 1, 3, '1', 3),
(53, 4, 2, 'Has_a_caring_attitude', 1, 3, '1', 4),
(54, 1, 3, 'Friendly_and_helpful_to_you', 1, 3, '1', 1),
(55, 2, 3, 'Answers_your_questions', 1, 3, '1', 2),
(56, 3, 3, 'Explains_Treatment_Plan', 1, 3, '1', 3),
(57, 4, 3, 'Has_a_caring_attitude', 1, 3, '1', 4),
(58, 1, 4, 'Neat_and_clean_building', 1, 3, '1', 1),
(59, 2, 4, 'Unit_easily_accessible', 1, 3, '1', 2),
(60, 3, 4, 'Comfort_and_Safety', 1, 3, '1', 3),
(61, 4, 4, 'Privacy', 1, 3, '1', 4),
(62, 5, 4, 'Likelihood_of_referring_others', 1, 3, '1', 5),
(63, 0, 2, 'Takes time to discuss your medication, diet and first physician appointment after discharge', 1, 1, '1', 0),
(64, 0, 2, 'Takes time to discuss your medication, diet and first physician appointment after discharge', 1, 2, '1', 0),
(65, 0, 2, 'Takes time to discuss your medication, diet and first physician appointment after discharge', 1, 3, '1', 0),
(66, 0, 1, 'Test', 1, 3, '1', 0),
(67, 5, 1, 'test 2', 1, 3, '1', 5),
(68, 5, 1, 'Listens to you and answers questions', 0, 1, '1', 5),
(69, 6, 4, 'Noise Level', 0, 1, '1', 6),
(70, 5, 3, 'Attitude', 0, 1, '1', 5),
(71, 1, 1, 'Were you treated fairly?', 1, 5, '1', 1),
(72, 1, 1, 'Were you treated fairly?', 1, 4, '1', 1),
(73, 1, 1, 'Were you treated fairly?', 1, 6, '1', 1),
(74, 1, 1, 'Were you treated fairly?', 1, 7, '1', 1),
(75, 1, 1, 'Were you treated fairly?', 1, 8, '1', 1),
(76, 1, 1, 'Were you treated fairly?', 1, 9, '1', 1),
(77, 0, 1, 'Long wait time?', 1, 5, '1', 0),
(103, 7, 1, 'Were you respected?', 1, 4, '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `function_list`
--

CREATE TABLE `function_list` (
  `id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `function_list`
--

INSERT INTO `function_list` (`id`, `function_id`, `description`) VALUES
(0, 1, 'funtion out-patient'),
(1, 2, 'function ambassador'),
(2, 3, 'function amada');

-- --------------------------------------------------------

--
-- Table structure for table `hourly_rates`
--

CREATE TABLE `hourly_rates` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hourly_rates`
--

INSERT INTO `hourly_rates` (`id`, `name`, `display_name`) VALUES
(1, 'per-diem', 'Per-diem'),
(2, 'over-time', 'Over-time'),
(3, 'non-over-time', 'Non Over-time');

-- --------------------------------------------------------

--
-- Table structure for table `hourly_rate_shift`
--

CREATE TABLE `hourly_rate_shift` (
  `shift_id` int(11) NOT NULL,
  `hourly_rate_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ltm_translations`
--

INSERT INTO `ltm_translations` (`id`, `status`, `locale`, `group`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 0, 'en', 'questions', 'Treats you with respect', 'Treats you with respect', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(2, 0, 'en', 'questions', 'Listens to your needs', 'Listens to your needs', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(3, 0, 'en', 'questions', 'Clearly explains your care and/or treatment plan', 'Clearly explains your care and/or treatment plan', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(4, 0, 'en', 'questions', 'Makes you feel comfortable when discussing sensitive topics', 'Makes you feel comfortable when discussing sensitive topics', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(5, 0, 'en', 'questions', 'Provides you with compassionate care', 'Provides you with compassionate care', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(6, 0, 'en', 'questions', 'Knowledgeable -Listens to you and answers your questions', 'Knowledgeable -Listens to you and answers your questions', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(7, 0, 'en', 'questions', 'Quality of care provided', 'Quality of care provided', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(8, 0, 'en', 'questions', 'Takes the time to provide the care needed', 'Takes the time to provide the care needed', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(9, 0, 'en', 'questions', 'Compassionate and Respectful', 'Compassionate and Respectful', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(10, 0, 'en', 'questions', 'Explains treatment plan', 'Explains treatment plan', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(11, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(12, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(13, 0, 'en', 'survey', 'evaluate_your_caregiver', 'Evaluate your Caregiver', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(14, 0, 'en', 'survey', 'patient_satisfaction_survey', 'Patient Satisfaction Survey', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(15, 0, 'en', 'survey', 'patient', 'Patient', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(16, 0, 'en', 'survey', 'other', 'Other', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(17, 0, 'en', 'survey', 'i_am_the', 'I am the', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(18, 0, 'en', 'survey', 'family_member', 'Family member', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(19, 0, 'en', 'survey', 'dont_know_login_info', 'I don\'t know my login info', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(20, 0, 'en', 'survey', 'username', 'Username', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(21, 0, 'en', 'survey', 'password', 'Password', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(22, 0, 'en', 'survey', 'all_caregivers', 'All', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(23, 0, 'en', 'survey', 'nurses', 'Nurses', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(24, 0, 'en', 'survey', 'respiratories', 'Respiratory', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(25, 0, 'en', 'survey', 'rehab', 'Rehab', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(26, 0, 'en', 'survey', 'search_by_caregiver\'s_name', 'Search by Caregiver\'s Name', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(27, 0, 'en', 'survey', 'ok', 'Ok', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(28, 0, 'en', 'survey', 'good', 'Good', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(29, 0, 'en', 'survey', 'great', 'Great', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(30, 0, 'en', 'survey', 'fair', 'Fair', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(31, 0, 'en', 'survey', 'poor', 'Poor', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(32, 0, 'en', 'survey', 'are_you_sure', 'Are you sure you want to survey', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(33, 0, 'en', 'survey', 'cancel', 'Cancel', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(34, 0, 'en', 'survey', 'begin_survey', 'Begin Survey', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(35, 0, 'en', 'survey', 'home', 'Return home', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(36, 0, 'en', 'survey', 'thanks', 'THANK YOU', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(37, 0, 'en', 'survey', 'login', 'login', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(38, 0, 'en', 'survey', 'Please_Enter_Your_Login_Details', 'Please Enter Your Login Details', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(39, 0, 'en', 'survey', 'Please_Enter_Your_Contact_Details', 'Please Enter Your Contact Details', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(40, 0, 'en', 'survey', 'SUBMIT', 'SUBMIT', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(41, 0, 'en', 'survey', 'Or_go_to_login_section', 'Or go to login section', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(42, 0, 'en', 'survey', 'term_condition_title', 'Term and Conditions', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(43, 0, 'en', 'survey', 'i_accept_the', 'I accept the', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(44, 0, 'en', 'survey', 'term_condition', 'Term and Conditions', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(45, 0, 'en', 'survey', 'Oops', 'Oops, you forgot one step!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(46, 0, 'en', 'survey', 'feedbacks', 'Your feedback will give us insight on what we can do to ensure you receive the highest quality of care. ', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(47, 0, 'en', 'survey', 'Opps_Description', 'Please check the box to Agree the Terms and Conditions in order to login. Also remember this survey is anonymous and will be a secret between us!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(48, 0, 'en', 'survey', 'gohome', 'Please return to home and fill out the patient satisfaction survey or evaluate another caregiver. ', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(49, 0, 'en', 'survey', 'Or', 'Or', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(50, 0, 'en', 'survey', 'check_box_contact', 'I would like to be contacted about my patient experience.', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(51, 0, 'en', 'survey', 'comment_placeholder', 'Just a reminder that everything you share with Wambi remains anonymous.', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(52, 0, 'en', 'survey', 'title_experience', 'Please include any additional comments here about your experience!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(53, 0, 'en', 'survey', 'title_caregiver', 'Please include any additional comments here about your caregiver!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(54, 0, 'en', 'survey', 'error_max_survey', 'You have surveyed this caregiver the maximum amount of times within 24 hours. Please select another caregiver or return home to take the patient satisfaction survey.', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(55, 0, 'en', 'exit_questions', 'Physicians', 'Physicians', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(57, 0, 'en', 'exit_questions', 'Takes_enough_time_with_you', 'Takes enough time with you', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(58, 0, 'en', 'exit_questions', 'Explains_what_you_want_to_know', 'Explains what you want to know', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(59, 0, 'en', 'exit_questions', 'Provides_good_advice_and_treatment', 'Provides good advice and treatment', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(60, 0, 'en', 'exit_questions', 'Nursing_Staff', 'Nursing Staff', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(61, 0, 'en', 'exit_questions', 'Provides_good_nursing_care', 'Provides good nursing care', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(62, 0, 'en', 'exit_questions', 'Has_a_caring_attitude', 'Has a caring attitude', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(63, 0, 'en', 'exit_questions', 'Other_Therapy_Staff', 'Other Therapy Staff', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(64, 0, 'en', 'exit_questions', 'Friendly_and_helpful_to_you', 'Friendly and helpful to you', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(65, 0, 'en', 'exit_questions', 'Answers_your_questions', 'Answers your questions', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(66, 0, 'en', 'exit_questions', 'Explains_Treatment_Plan', 'Explains Treatment Plan', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(67, 0, 'en', 'exit_questions', 'Facility_Unit', 'Facility', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(68, 0, 'en', 'exit_questions', 'Neat_and_clean_building', 'Neat and clean building', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(69, 0, 'en', 'exit_questions', 'Unit_easily_accessible', 'Unit easily accessible', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(70, 0, 'en', 'exit_questions', 'Comfort_and_Safety', 'Comfort and Safety', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(71, 0, 'en', 'exit_questions', 'Privacy', 'Privacy', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(72, 0, 'en', 'exit_questions', 'Likelihood_of_referring_others', 'Likelihood of referring others', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(73, 0, 'en', 'exit_questions', 'hospital_mission_statement', '\"Hospital mission statement\"', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(74, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(75, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(76, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(77, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(78, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(79, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(80, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(81, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(82, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(83, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(84, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(85, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(86, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(87, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(88, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(89, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(90, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(91, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(92, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(93, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(94, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(95, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(96, 0, 'en', 'validation', 'filled', 'The :attribute field is required.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(97, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(98, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(99, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(100, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(101, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(102, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(103, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(104, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(105, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(106, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(107, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(108, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(109, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(110, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(111, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(112, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(113, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(114, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(115, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(116, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(117, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(118, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(119, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(120, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(121, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(122, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(123, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(124, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(125, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(126, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(127, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(128, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(129, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(130, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(131, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(132, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(133, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(134, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(135, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(136, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(137, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(138, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(139, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(140, 0, 'es', 'questions', 'Treats you with respect', 'Me trata respetuosamente', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(141, 0, 'es', 'questions', 'Listens to your needs', 'Atiende a mis necesidades', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(142, 0, 'es', 'questions', 'Clearly explains your care and/or treatment plan', 'Explica mi plan de cuidado y/o tratamiento con claridad', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(143, 0, 'es', 'questions', 'Makes you feel comfortable when discussing sensitive topics', 'Me hace sentir cómodo al discutir temas sensibles', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(144, 0, 'es', 'questions', 'Provides you with compassionate care', 'Me trata con compasión', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(145, 0, 'es', 'questions', 'Compassionate and Respectful', 'Compassionate and Respectful', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(146, 0, 'es', 'questions', 'Explains treatment plan', 'Explains treatment plan', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(147, 0, 'es', 'questions', 'Knowledgeable -Listens to you and answers your questions', 'Knowledgeable -Listens to you and answers your questions', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(148, 0, 'es', 'questions', 'Quality of care provided', 'Quality of care provided', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(149, 0, 'es', 'questions', 'Takes the time to provide the care needed', 'Takes the time to provide the care needed', '2017-02-07 03:11:18', '2017-02-15 04:14:46'),
(150, 0, 'es', 'auth', 'failed', 'These credentials do not match our records.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(151, 0, 'es', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(152, 0, 'es', 'survey', 'evaluate_your_caregiver', 'Encueste a su cuidador', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(153, 0, 'es', 'survey', 'patient_satisfaction_survey', 'Evalúe su experiencia', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(154, 0, 'es', 'survey', 'patient', 'Patient', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(155, 0, 'es', 'survey', 'other', 'Other', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(156, 0, 'es', 'survey', 'i_am_the', 'I am the', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(157, 0, 'es', 'survey', 'family_member', 'Miembro de la familia', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(158, 0, 'es', 'survey', 'dont_know_login_info', 'I don\'t know my login info', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(159, 0, 'es', 'survey', 'username', 'Nombre de usuario', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(160, 0, 'es', 'survey', 'password', 'Contrasena', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(161, 0, 'es', 'survey', 'all_caregivers', 'TODOS LOS CUIDADORES', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(162, 0, 'es', 'survey', 'begin_survey', 'Comenzará Encuesta', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(163, 0, 'es', 'survey', 'good', 'Bueno', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(164, 0, 'es', 'survey', 'are_you_sure', 'Está seguro que desea completar una encuesta sobre', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(165, 0, 'es', 'survey', 'cancel', 'Cancelar', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(166, 0, 'es', 'survey', 'poor', 'Deficiente', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(167, 0, 'es', 'survey', 'fair', 'Malo', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(168, 0, 'es', 'survey', 'ok', 'Regular', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(169, 0, 'es', 'survey', 'great', 'Excelente', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(170, 0, 'es', 'survey', 'search_by_caregiver\'s_name', 'Buscar por Nombre del Cuidador', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(171, 0, 'es', 'survey', 'nurses', 'ENFERMERAS', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(172, 0, 'es', 'survey', 'respiratories', 'RESPIRATORIO', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(173, 0, 'es', 'survey', 'rehab', 'REHABILITACION', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(174, 0, 'es', 'survey', 'home', 'Inicio', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(175, 0, 'es', 'survey', 'thanks', 'Gracias', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(176, 0, 'es', 'survey', 'login', 'INICIAR SESION', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(177, 0, 'es', 'survey', 'Please_Enter_Your_Login_Details', 'Please Enter Your Login Details', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(178, 0, 'es', 'survey', 'Please_Enter_Your_Contact_Details', 'Please Enter Your Contact Details', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(179, 0, 'es', 'survey', 'SUBMIT', 'SUBMIT', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(180, 0, 'es', 'survey', 'Or_go_to_login_section', 'Or go to login section', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(181, 0, 'es', 'survey', 'i_accept_the', 'I accept the', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(182, 0, 'es', 'survey', 'term_condition', 'Term and Conditions', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(183, 0, 'es', 'survey', 'term_condition_title', 'Term and Conditions', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(184, 0, 'es', 'survey', 'feedbacks', 'Your feedback will give us insight on what we can do to ensure you receive the highest quality of care. ', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(185, 0, 'es', 'survey', 'Oops', 'Oops, you forgot one step!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(186, 0, 'es', 'survey', 'Opps_Description', 'Please check the box to Agree the Terms and Conditions in order to login. Also remember this survey is anonymous and will be a secret between us!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(187, 0, 'es', 'survey', 'gohome', 'Please return to home and fill out the patient satisfaction survey or evaluate another caregiver. ', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(188, 0, 'es', 'survey', 'Or', 'Or', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(189, 0, 'es', 'survey', 'check_box_contact', 'I would like to be contacted about my patient experience.', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(190, 0, 'es', 'survey', 'comment_placeholder', 'Just a reminder that everything you share with Wambi remains anonymous.', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(191, 0, 'es', 'survey', 'title_experience', 'Please include any additional comments here about your experience!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(192, 0, 'es', 'survey', 'title_caregiver', 'Please include any additional comments here about your caregiver!', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(193, 0, 'es', 'survey', 'error_max_survey', 'You have surveyed this caregiver the maximum amount of times within 24 hours. Please select another caregiver or return home to take the patient satisfaction survey.', '2017-02-07 03:11:18', '2017-04-30 20:13:54'),
(194, 0, 'es', 'exit_questions', 'Physicians', 'Médicos', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(196, 0, 'es', 'exit_questions', 'Takes_enough_time_with_you', 'Toma bastante tiempo contigo', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(197, 0, 'es', 'exit_questions', 'Explains_what_you_want_to_know', 'Explica lo que quieres saber', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(198, 0, 'es', 'exit_questions', 'Provides_good_advice_and_treatment', 'Proporciona buenos consejos y tratamiento', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(199, 0, 'es', 'exit_questions', 'Nursing_Staff', 'Personal de enfermería', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(200, 0, 'es', 'exit_questions', 'Provides_good_nursing_care', 'Proporciona un buen cuidado de enfermería', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(201, 0, 'es', 'exit_questions', 'Has_a_caring_attitude', 'Tiene una actitud de cuidado', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(202, 0, 'es', 'exit_questions', 'Other_Therapy_Staff', 'Otro Personal de Terapia', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(203, 0, 'es', 'exit_questions', 'Friendly_and_helpful_to_you', 'Amable y servicial con usted', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(204, 0, 'es', 'exit_questions', 'Answers_your_questions', 'Responde a tus preguntas', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(205, 0, 'es', 'exit_questions', 'Explains_Treatment_Plan', 'Explica el plan de tratamiento', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(206, 0, 'es', 'exit_questions', 'Facility_Unit', 'Facility', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(207, 0, 'es', 'exit_questions', 'Neat_and_clean_building', 'Edificio limpio y ordenado', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(208, 0, 'es', 'exit_questions', 'Unit_easily_accessible', 'Unidad de fácil acceso', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(209, 0, 'es', 'exit_questions', 'Comfort_and_Safety', 'Comodidad y seguridad', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(210, 0, 'es', 'exit_questions', 'Privacy', 'Política de privacidad', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(211, 0, 'es', 'exit_questions', 'Likelihood_of_referring_others', 'Probabilidad de hacer referencia a otros', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(212, 0, 'es', 'exit_questions', 'hospital_mission_statement', '\"Hospital mission statement\"', '2017-02-07 03:11:18', '2017-02-15 04:14:39'),
(213, 0, 'es', 'validation', 'accepted', 'The :attribute must be accepted.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(214, 0, 'es', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(215, 0, 'es', 'validation', 'after', 'The :attribute must be a date after :date.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(216, 0, 'es', 'validation', 'alpha', 'The :attribute may only contain letters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(217, 0, 'es', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(218, 0, 'es', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(219, 0, 'es', 'validation', 'array', 'The :attribute must be an array.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(220, 0, 'es', 'validation', 'before', 'The :attribute must be a date before :date.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(221, 0, 'es', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(222, 0, 'es', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(223, 0, 'es', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(224, 0, 'es', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(225, 0, 'es', 'validation', 'boolean', 'The :attribute field must be true or false.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(226, 0, 'es', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(227, 0, 'es', 'validation', 'date', 'The :attribute is not a valid date.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(228, 0, 'es', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(229, 0, 'es', 'validation', 'different', 'The :attribute and :other must be different.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(230, 0, 'es', 'validation', 'digits', 'The :attribute must be :digits digits.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(231, 0, 'es', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(232, 0, 'es', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(233, 0, 'es', 'validation', 'email', 'The :attribute must be a valid email address.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(234, 0, 'es', 'validation', 'exists', 'The selected :attribute is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(235, 0, 'es', 'validation', 'filled', 'The :attribute field is required.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(236, 0, 'es', 'validation', 'image', 'The :attribute must be an image.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(237, 0, 'es', 'validation', 'in', 'The selected :attribute is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(238, 0, 'es', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(239, 0, 'es', 'validation', 'integer', 'The :attribute must be an integer.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(240, 0, 'es', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(241, 0, 'es', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(242, 0, 'es', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(243, 0, 'es', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(244, 0, 'es', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(245, 0, 'es', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(246, 0, 'es', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(247, 0, 'es', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(248, 0, 'es', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(249, 0, 'es', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(250, 0, 'es', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(251, 0, 'es', 'validation', 'not_in', 'The selected :attribute is invalid.', '2017-02-07 03:11:18', '2017-02-09 03:01:33'),
(252, 0, 'es', 'validation', 'numeric', 'The :attribute must be a number.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(253, 0, 'es', 'validation', 'present', 'The :attribute field must be present.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(254, 0, 'es', 'validation', 'regex', 'The :attribute format is invalid.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(255, 0, 'es', 'validation', 'required', 'The :attribute field is required.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(256, 0, 'es', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(257, 0, 'es', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(258, 0, 'es', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(259, 0, 'es', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(260, 0, 'es', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(261, 0, 'es', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(262, 0, 'es', 'validation', 'same', 'The :attribute and :other must match.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(263, 0, 'es', 'validation', 'size.numeric', 'The :attribute must be :size.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(264, 0, 'es', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(265, 0, 'es', 'validation', 'size.string', 'The :attribute must be :size characters.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(266, 0, 'es', 'validation', 'size.array', 'The :attribute must contain :size items.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(267, 0, 'es', 'validation', 'string', 'The :attribute must be a string.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(268, 0, 'es', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(269, 0, 'es', 'validation', 'unique', 'The :attribute has already been taken.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(270, 0, 'es', 'validation', 'url', 'The :attribute format is invalid.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(271, 0, 'es', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(272, 0, 'es', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(273, 0, 'es', 'passwords', 'reset', 'Your password has been reset!', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(274, 0, 'es', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(275, 0, 'es', 'passwords', 'token', 'This password reset token is invalid.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(276, 0, 'es', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(277, 0, 'es', 'pagination', 'previous', '&laquo; Previous', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(278, 0, 'es', 'pagination', 'next', 'Next &raquo;', '2017-02-07 03:11:19', '2017-02-09 03:01:33'),
(279, 0, 'en', 'exit_questions', 'Takes time to discuss your medication, diet and first physician appointment after discharge', 'Takes time to discuss your medication, diet and first physician appointment after discharge', '2017-02-11 17:28:50', '2017-02-15 04:14:39'),
(280, 0, 'es', 'exit_questions', 'Takes time to discuss your medication, diet and first physician appointment after discharge', 'Takes time to discuss your medication, diet and first physician appointment after discharge', '2017-02-11 17:28:59', '2017-02-15 04:14:39'),
(281, 0, 'en', 'exit_questions', 'Nursing Staff', 'Nursing Staff', '2017-02-11 17:32:41', '2017-02-15 04:14:39'),
(282, 0, 'en', 'exit_questions', 'Other Therapy Staff', 'Other Therapy Staff', '2017-02-11 17:32:41', '2017-02-15 04:14:39'),
(283, 0, 'en', 'exit_questions', 'Facility', 'Facility', '2017-02-11 17:32:41', '2017-02-15 04:14:39'),
(284, 0, 'es', 'exit_questions', 'Nursing Staff', 'Personal de enfermería', '2017-02-11 17:32:42', '2017-02-15 04:14:39'),
(285, 0, 'es', 'exit_questions', 'Other Therapy Staff', 'Otro Personal de Terapia', '2017-02-11 17:32:42', '2017-02-15 04:14:39'),
(286, 0, 'es', 'exit_questions', 'Facility', 'Facility', '2017-02-11 17:32:42', '2017-02-15 04:14:39'),
(293, 0, 'en', 'exit_questions', 'Listens_to_you_answers_questions', 'Listens to you and answers your questions', '2017-02-14 07:40:46', '2017-02-15 04:14:39'),
(290, 0, 'es', 'questions', 'Provides quality care', 'Provides quality care', '2017-02-12 02:59:54', '2017-02-15 04:14:46'),
(289, 0, 'en', 'questions', 'Provides quality care', 'Provides quality care', '2017-02-12 02:59:41', '2017-02-15 04:14:46'),
(294, 0, 'es', 'exit_questions', 'Listens_to_you_answers_questions', 'Escucha y responde a las preguntas', '2017-02-14 07:41:56', '2017-02-15 04:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_08_06_101820_entrust_setup_tables', 2),
('2016_08_14_043410_entrust_setup_tables', 3),
('2016_08_16_022612_create_jobs_table', 4),
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_08_06_101820_entrust_setup_tables', 2),
('2016_08_14_043410_entrust_setup_tables', 3),
('2016_08_16_022612_create_jobs_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed`
--

CREATE TABLE `newsfeed` (
  `id` int(11) NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `excerpt` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `units` varchar(1000) DEFAULT NULL,
  `fac_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed_comments`
--

CREATE TABLE `newsfeed_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed_likes`
--

CREATE TABLE `newsfeed_likes` (
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed_tags`
--

CREATE TABLE `newsfeed_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `news_id` int(11) NOT NULL,
  `users_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(20) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `css_class` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `display_name`, `icon`, `name`, `css_class`) VALUES
(1, '#pecks Pecks for taking shift', 'icon-check', 'peck_for_taking_shift', 'text-primary'),
(2, '#pecks Pecks for #award', 'icon-trophy', 'pecks_for_award', 'text-danger'),
(3, '#pecks Pecks for surveys', 'icon-note', 'pecks_for_surveys', 'text-info'),
(4, '#count Available shift(s) for #jobtitle', 'icon-clock', 'available_shifts', 'text-primary'),
(5, 'poor job', 'icon-red', 'score_notification', 'text-danger'),
(6, 'great job', 'icon-green', 'score_notification', NULL),
(7, 'top score', 'icon-badge', 'top_score_notification', NULL),
(8, 'award_request', 'icon-trophy', 'award_request', 'text-info');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_details`
--

CREATE TABLE `patient_details` (
  `pid` int(11) NOT NULL COMMENT 'Pid as Primary Key',
  `lid` int(11) NOT NULL,
  `fname` text NOT NULL,
  `lname` text,
  `dob` date DEFAULT NULL,
  `admitteddate` date DEFAULT NULL,
  `release` date DEFAULT NULL,
  `outcome` varchar(250) DEFAULT NULL,
  `ssn` int(250) NOT NULL,
  `pinno` int(250) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `code_date` datetime DEFAULT NULL,
  `patient_carrier` varchar(250) DEFAULT NULL,
  `fac_id` varchar(50) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `units` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`pid`, `lid`, `fname`, `lname`, `dob`, `admitteddate`, `release`, `outcome`, `ssn`, `pinno`, `email`, `mobile`, `insurance_id`, `code`, `code_date`, `patient_carrier`, `fac_id`, `type`, `units`) VALUES
(194, 1, '716', NULL, NULL, NULL, NULL, NULL, 9424, 1829, NULL, '(909) 864-4788', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(195, 1, '6094', NULL, NULL, NULL, NULL, NULL, 4134, 8755, NULL, '(951) 780-6566', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(196, 1, '1071', NULL, NULL, NULL, NULL, NULL, 9243, 6738, NULL, '(909) 635-9883', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(197, 1, '969', NULL, NULL, NULL, NULL, NULL, 9278, 9268, NULL, '(909) 623-5138', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(198, 1, '1136', NULL, NULL, NULL, NULL, NULL, 1211, 2812, NULL, '(909) 519-3480', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(199, 1, '5927', NULL, NULL, NULL, NULL, NULL, 3907, 5549, NULL, '(909) 374-3106', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(200, 1, '3956', NULL, NULL, NULL, NULL, NULL, 3676, 7018, NULL, '(000) 000-0000', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(201, 1, '4455', NULL, NULL, NULL, NULL, NULL, 9418, 7255, NULL, '(951) 446-8766', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(202, 1, '812', NULL, NULL, NULL, NULL, NULL, 1146, 5704, NULL, '(909) 205-7087', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(203, 1, '4155', NULL, NULL, NULL, NULL, NULL, 7769, 5619, NULL, '(760) 333-7172', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(204, 1, '5552', NULL, NULL, NULL, NULL, NULL, 8497, 8195, NULL, '(951) 212-6785', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(205, 1, '4154', NULL, NULL, NULL, NULL, NULL, 4453, 7587, NULL, '(909) 522-8247', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(206, 1, '4963', NULL, NULL, NULL, NULL, NULL, 6224, 1151, NULL, '(909) 659-3859', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(207, 1, '1569', NULL, NULL, NULL, NULL, NULL, 5663, 6114, NULL, '(909) 644-3876', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(208, 1, '5875', NULL, NULL, NULL, NULL, NULL, 4628, 7234, NULL, '(909) 393-6166', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(209, 1, '3190', NULL, NULL, NULL, NULL, NULL, 7652, 2225, NULL, '(951) 654-1251', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(210, 1, '1797', NULL, NULL, NULL, NULL, NULL, 3842, 5886, NULL, '(909) 252-1486', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(211, 1, '3911', NULL, NULL, NULL, NULL, NULL, 8918, 3911, NULL, '(909) 659-3589', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(212, 1, '1625', NULL, NULL, NULL, NULL, NULL, 2388, 5166, NULL, '(760) 905-4498', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(213, 1, '6064', NULL, NULL, NULL, NULL, NULL, 7779, 5241, NULL, '(951) 251-3278', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(214, 1, '3867', NULL, NULL, NULL, NULL, NULL, 5580, 1390, NULL, '(951) 399-5002', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(215, 1, '3730', NULL, NULL, NULL, NULL, NULL, 1493, 8328, NULL, '(714) 310-6039', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(216, 1, '3965', NULL, NULL, NULL, NULL, NULL, 5163, 1956, NULL, '(909) 379-8097', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(217, 1, '1507', NULL, NULL, NULL, NULL, NULL, 9389, 3083, NULL, '(909) 561-2912', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(218, 1, '1506', NULL, NULL, NULL, NULL, NULL, 8684, 7689, NULL, '(909) 561-2912', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(219, 1, '987', NULL, NULL, NULL, NULL, NULL, 9933, 2934, NULL, '(909) 889-4506', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(220, 1, '2290', NULL, NULL, NULL, NULL, NULL, 8191, 1443, NULL, '(909) 475-8441', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(221, 1, '808', NULL, NULL, NULL, NULL, NULL, 9738, 6233, NULL, '(909) 380-6978', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(222, 1, '2635', NULL, NULL, NULL, NULL, NULL, 2151, 4983, NULL, '(213) 663-7620', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(223, 1, '3092', NULL, NULL, NULL, NULL, NULL, 7790, 9827, NULL, '(909) 798-6593', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(224, 1, '852', NULL, NULL, NULL, NULL, NULL, 4688, 8362, NULL, '(951) 682-2212', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(225, 1, '1854', NULL, NULL, NULL, NULL, NULL, 6043, 2636, NULL, '(909) 890-2800', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(226, 1, '938', NULL, NULL, NULL, NULL, NULL, 2505, 2690, NULL, '(424) 222-2296', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(227, 1, '656', NULL, NULL, NULL, NULL, NULL, 7470, 5064, NULL, '(951) 834-3023', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(228, 1, '994', NULL, NULL, NULL, NULL, NULL, 5257, 5097, NULL, '(909) 864-2663', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(229, 1, '6246', NULL, NULL, NULL, NULL, NULL, 8523, 1327, NULL, '(909) 792-2285', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(230, 1, '6244', NULL, NULL, NULL, NULL, NULL, 3975, 3636, NULL, '(909) 792-2285', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(231, 1, '4045', NULL, NULL, NULL, NULL, NULL, 1620, 7910, NULL, '(909) 766-4796', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(232, 1, '5634', NULL, NULL, NULL, NULL, NULL, 3606, 1932, NULL, '(714) 454-3224', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(233, 1, '4783', NULL, NULL, NULL, NULL, NULL, 5619, 7297, NULL, '(951) 268-6616', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(234, 1, '5781', NULL, NULL, NULL, NULL, NULL, 4835, 9513, NULL, '(909) 728-0428', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(235, 1, '2364', NULL, NULL, NULL, NULL, NULL, 6546, 5168, NULL, '(909) 677-8519', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(236, 1, '3046', NULL, NULL, NULL, NULL, NULL, 9974, 3767, NULL, '(951) 667-1747', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(237, 1, '2479', NULL, NULL, NULL, NULL, NULL, 7226, 6637, NULL, '(909) 219-5580', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(238, 1, '1849', NULL, NULL, NULL, NULL, NULL, 2958, 4069, NULL, '(909) 329-1448', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(239, 1, '1746', NULL, NULL, NULL, NULL, NULL, 4884, 6604, NULL, '(000) 000-0000', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(240, 1, '5173', NULL, NULL, NULL, NULL, NULL, 3466, 8508, NULL, '(909) 682-3394', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(241, 1, '4964', NULL, NULL, NULL, NULL, NULL, 7067, 7904, NULL, '(909) 963-4268', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(242, 1, '790', NULL, NULL, NULL, NULL, NULL, 4147, 1045, NULL, '(909) 695-8203', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(243, 1, '1217', NULL, NULL, NULL, NULL, NULL, 6367, 5912, NULL, '(909) 572-4821', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(244, 1, '4807', NULL, NULL, NULL, NULL, NULL, 5802, 8461, NULL, '(909) 386-1202', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(245, 1, '4957', NULL, NULL, NULL, NULL, NULL, 4323, 6991, NULL, '(951) 347-5323', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(246, 1, '2949', NULL, NULL, NULL, NULL, NULL, 7947, 9438, NULL, '(626) 409-1040', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(247, 1, '5655', NULL, NULL, NULL, NULL, NULL, 3654, 2616, NULL, '(805) 319-2124', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(248, 1, '6143', NULL, NULL, NULL, NULL, NULL, 8831, 4921, NULL, '(760) 574-5234', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(249, 1, '5633', NULL, NULL, NULL, NULL, NULL, 5372, 7838, NULL, '(760) 574-5234', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(250, 1, '4767', NULL, NULL, NULL, NULL, NULL, 4029, 9427, NULL, '(909) 528-9009', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(251, 1, '3207', NULL, NULL, NULL, NULL, NULL, 4774, 7925, NULL, '(909) 665-5835', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(252, 1, '5251', NULL, NULL, NULL, NULL, NULL, 3678, 2764, NULL, '(713) 497-9734', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(253, 1, '1568', NULL, NULL, NULL, NULL, NULL, 4062, 7435, NULL, '(909) 746-1132', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(254, 1, '2042', NULL, NULL, NULL, NULL, NULL, 6867, 2719, NULL, '(760) 244-3992', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(255, 1, '5512', NULL, NULL, NULL, NULL, NULL, 5791, 7067, NULL, '(909) 810-7509', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(256, 1, '465', NULL, NULL, NULL, NULL, NULL, 1043, 3291, NULL, '(909) 797-9410', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(257, 1, '704', NULL, NULL, NULL, NULL, NULL, 4374, 7290, NULL, '(951) 248-0101', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(258, 1, '1488', NULL, NULL, NULL, NULL, NULL, 6900, 6969, NULL, '(909) 567-1615', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(259, 1, '4779', NULL, NULL, NULL, NULL, NULL, 7371, 2991, NULL, '(909) 434-4358', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(260, 1, '1610', NULL, NULL, NULL, NULL, NULL, 5930, 6371, NULL, '(626) 421-5217', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(261, 1, '4390', NULL, NULL, NULL, NULL, NULL, 7442, 2927, NULL, '(909) 762-3601', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(262, 1, '(951) 660-8384', NULL, NULL, NULL, NULL, NULL, 5475, 9938, NULL, '(951) 660-8384', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(263, 1, '(714) 720-3400', NULL, NULL, NULL, NULL, NULL, 4633, 3228, NULL, '(714) 720-3400', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(264, 1, '(714) 720-3099', NULL, NULL, NULL, NULL, NULL, 1341, 4869, NULL, '(714) 720-3099', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(265, 1, '(310) 844-2380', NULL, NULL, NULL, NULL, NULL, 8318, 8050, NULL, '(310) 844-2380', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"1\"]'),
(266, 1, '(323) 819-0482', NULL, NULL, NULL, NULL, NULL, 8203, 5782, NULL, '(323) 819-0482', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(267, 1, '(909) 225-0773', NULL, NULL, NULL, NULL, NULL, 5577, 8501, NULL, '(909) 225-0773', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(268, 1, '(909) 225-0772', NULL, NULL, NULL, NULL, NULL, 9218, 4578, NULL, '(909) 225-0772', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(269, 1, '(951) 609-6082', NULL, NULL, NULL, NULL, NULL, 4189, 5223, NULL, '(951) 609-6082', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(270, 1, '(714) 310-6039', NULL, NULL, NULL, NULL, NULL, 6940, 6167, NULL, '(714) 310-6039', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(271, 1, '(626) 833-9955', NULL, NULL, NULL, NULL, NULL, 8645, 4672, NULL, '(626) 833-9955', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(272, 1, '(626) 833-9955', NULL, NULL, NULL, NULL, NULL, 4834, 6111, NULL, '(626) 833-9955', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(273, 1, '(951) 834-3023', NULL, NULL, NULL, NULL, NULL, 6121, 2499, NULL, '(951) 834-3023', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(274, 1, '(360) 926-4909', NULL, NULL, NULL, NULL, NULL, 2599, 6180, NULL, '(360) 926-4909', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(275, 1, '(951) 201-2757', NULL, NULL, NULL, NULL, NULL, 1142, 5910, NULL, '(951) 201-2757', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(276, 1, '(909) 451-3146', NULL, NULL, NULL, NULL, NULL, 5948, 3970, NULL, '(909) 451-3146', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(277, 1, '(714) 454-3224', NULL, NULL, NULL, NULL, NULL, 2332, 1048, NULL, '(714) 454-3224', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(278, 1, '(949) 279-5475', NULL, NULL, NULL, NULL, NULL, 8091, 4019, NULL, '(949) 279-5475', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(279, 1, '(714) 655-9297', NULL, NULL, NULL, NULL, NULL, 6352, 5864, NULL, '(714) 655-9297', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(280, 1, '(562) 505-6063', NULL, NULL, NULL, NULL, NULL, 9902, 8455, NULL, '(562) 505-6063', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(281, 1, '(626) 409-1040', NULL, NULL, NULL, NULL, NULL, 1757, 5066, NULL, '(626) 409-1040', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(282, 1, '(626) 428-8403', NULL, NULL, NULL, NULL, NULL, 1069, 2386, NULL, '(626) 428-8403', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"1\"]'),
(283, 1, '(760) 574-5234', NULL, NULL, NULL, NULL, NULL, 3546, 9042, NULL, '(760) 574-5234', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(285, 1, '(760) 985-8025', NULL, NULL, NULL, NULL, NULL, 4145, 5750, NULL, '(760) 985-8025', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(287, 1, '(951) 813-9135', NULL, NULL, NULL, NULL, NULL, 8811, 1747, NULL, '(951) 813-9135', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"1\"]'),
(288, 1, '(951) 779-1095', NULL, NULL, NULL, NULL, NULL, 4658, 1774, NULL, '(951) 779-1095', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(289, 1, '(909) 762-3601', NULL, NULL, NULL, NULL, NULL, 9387, 2161, NULL, '(909) 762-3601', NULL, NULL, NULL, '', '1', 'ambassador', '[\"1\"]'),
(290, 2, '4181', NULL, NULL, NULL, NULL, NULL, 4589, 5726, NULL, '(936) 273-6047', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"2\"]'),
(291, 2, '715', NULL, NULL, NULL, NULL, NULL, 8664, 7019, NULL, '(936) 295-2920', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(292, 2, '1213', NULL, NULL, NULL, NULL, NULL, 1923, 3414, NULL, '(832) 523-8712', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(293, 2, '6108', NULL, NULL, NULL, NULL, NULL, 6904, 4570, NULL, '(936) 203-7094', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(294, 2, '5926', NULL, NULL, NULL, NULL, NULL, 5824, 6863, NULL, '(111) 111-1111', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(295, 2, '1374', NULL, NULL, NULL, NULL, NULL, 6124, 8039, NULL, '(832) 381-6667', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(296, 2, '978', NULL, NULL, NULL, NULL, NULL, 1056, 4009, NULL, '(281) 469-7805', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(297, 2, '2106', NULL, NULL, NULL, NULL, NULL, 3832, 8738, NULL, '(281) 734-9070', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(298, 2, '4576', NULL, NULL, NULL, NULL, NULL, 5785, 7138, NULL, '(936) 597-7633', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(299, 2, '3450', NULL, NULL, NULL, NULL, NULL, 4070, 5138, NULL, '(281) 354-3295', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(300, 2, '6163', NULL, NULL, NULL, NULL, NULL, 5885, 8812, NULL, '(936) 856-0171', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(301, 2, '3018', NULL, NULL, NULL, NULL, NULL, 9319, 1127, NULL, '(954) 237-1004', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(302, 2, '3586', NULL, NULL, NULL, NULL, NULL, 2721, 7515, NULL, '(281) 358-3081', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(303, 2, '6004', NULL, NULL, NULL, NULL, NULL, 9401, 2681, NULL, '(111) 111-1111', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(304, 2, '5620', NULL, NULL, NULL, NULL, NULL, 4299, 4897, NULL, '(281) 323-0994', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"2\"]'),
(305, 2, '5569', NULL, NULL, NULL, NULL, NULL, 4890, 9387, NULL, '(281) 376-0802', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(306, 2, '2292', NULL, NULL, NULL, NULL, NULL, 6017, 8993, NULL, '(936) 447-4967', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(307, 2, '5928', NULL, NULL, NULL, NULL, NULL, 8982, 3580, NULL, '(111) 111-1111', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(308, 2, '6181', NULL, NULL, NULL, NULL, NULL, 8614, 5181, NULL, '(936) 444-1700', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(309, 2, '6063', NULL, NULL, NULL, NULL, NULL, 3780, 4469, NULL, '(281) 516-9038', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(310, 2, '3907', NULL, NULL, NULL, NULL, NULL, 2384, 9943, NULL, '(832) 723-9498', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(311, 2, '6177', NULL, NULL, NULL, NULL, NULL, 7053, 4592, NULL, '(832) 776-6541', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(312, 2, '6122', NULL, NULL, NULL, NULL, NULL, 2627, 4998, NULL, '(281) 203-5083', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(313, 2, '5468', NULL, NULL, NULL, NULL, NULL, 2040, 3800, NULL, '(936) 447-9244', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"2\"]'),
(314, 2, '1733', NULL, NULL, NULL, NULL, NULL, 1212, 1658, NULL, '(936) 594-0305', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(315, 2, '3048', NULL, NULL, NULL, NULL, NULL, 9210, 6655, NULL, '(936) 327-7989', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(316, 2, '4969', NULL, NULL, NULL, NULL, NULL, 9165, 1379, NULL, '(936) 273-6254', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(317, 2, '4925', NULL, NULL, NULL, NULL, NULL, 1413, 7392, NULL, '(281) 351-9880', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(318, 2, '1364', NULL, NULL, NULL, NULL, NULL, 9616, 4588, NULL, '(281) 465-9152', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(319, 2, '5824', NULL, NULL, NULL, NULL, NULL, 4689, 7318, NULL, '(713) 466-6672', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"2\"]'),
(320, 2, '1290', NULL, NULL, NULL, NULL, NULL, 4801, 4841, NULL, '(281) 592-7161', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(321, 2, '1942', NULL, NULL, NULL, NULL, NULL, 6158, 1744, NULL, '(281) 446-8122', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"2\"]'),
(322, 2, '6241', NULL, NULL, NULL, NULL, NULL, 3203, 2121, NULL, '(111) 111-1111', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(323, 2, '2984', NULL, NULL, NULL, NULL, NULL, 9208, 5942, NULL, '(281) 443-2333', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(324, 2, '5449', NULL, NULL, NULL, NULL, NULL, 3417, 6026, NULL, '(936) 777-6867', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(325, 2, '2164', NULL, NULL, NULL, NULL, NULL, 9152, 3730, NULL, '(281) 469-3765', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(326, 2, '6075', NULL, NULL, NULL, NULL, NULL, 1273, 5926, NULL, '(111) 111-1111', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(327, 2, '6057', NULL, NULL, NULL, NULL, NULL, 9357, 7119, NULL, '(281) 731-6519', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(328, 2, '6005', NULL, NULL, NULL, NULL, NULL, 7196, 4873, NULL, '(405) 613-1369', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(329, 2, '3367', NULL, NULL, NULL, NULL, NULL, 6648, 4723, NULL, '(281) 213-9098', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(330, 2, '5180', NULL, NULL, NULL, NULL, NULL, 9032, 6381, NULL, '(936) 588-4871', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(331, 2, '3153', NULL, NULL, NULL, NULL, NULL, 8099, 9425, NULL, '(832) 764-5324', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(332, 2, '4535', NULL, NULL, NULL, NULL, NULL, 2417, 7731, NULL, '(832) 209-8846', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(333, 2, '5792', NULL, NULL, NULL, NULL, NULL, 1543, 7250, NULL, '(281) 825-2707', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"2\"]'),
(334, 2, '1149', NULL, NULL, NULL, NULL, NULL, 3830, 8973, NULL, '(281) 255-8180', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(335, 2, '1076', NULL, NULL, NULL, NULL, NULL, 2639, 5575, NULL, '(936) 588-4554', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(336, 2, '4976', NULL, NULL, NULL, NULL, NULL, 2106, 5016, NULL, '(281) 528-4839', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(337, 2, '(713) 882-4807', NULL, NULL, NULL, NULL, NULL, 5403, 8543, NULL, '(713) 882-4807', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(338, 2, '(979) 451-5644', NULL, NULL, NULL, NULL, NULL, 5448, 3783, NULL, '(979) 451-5644', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(339, 2, '(713) 416-6020', NULL, NULL, NULL, NULL, NULL, 1180, 7231, NULL, '(713) 416-6020', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(340, 2, '(936) 446-1009', NULL, NULL, NULL, NULL, NULL, 2048, 8036, NULL, '(936) 446-1009', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(341, 2, '(281) 468-8800', NULL, NULL, NULL, NULL, NULL, 5614, 7600, NULL, '(281) 468-8800', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(342, 2, '(936) 293-6277', NULL, NULL, NULL, NULL, NULL, 8276, 1113, NULL, '(936) 293-6277', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(343, 2, '(832) 948-2358', NULL, NULL, NULL, NULL, NULL, 2294, 1034, NULL, '(832) 948-2358', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(344, 2, '(817) 988-4241', NULL, NULL, NULL, NULL, NULL, 4149, 2494, NULL, '(817) 988-4241', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(345, 2, '(281) 389-0965', NULL, NULL, NULL, NULL, NULL, 6920, 4492, NULL, '(281) 389-0965', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(346, 2, '(281) 414-7772', NULL, NULL, NULL, NULL, NULL, 9260, 8225, NULL, '(281) 414-7772', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(347, 2, '(936) 597-5980', NULL, NULL, NULL, NULL, NULL, 3387, 8904, NULL, '(936) 597-5980', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(348, 2, '(713) 927-1121', NULL, NULL, NULL, NULL, NULL, 7641, 6601, NULL, '(713) 927-1121', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(349, 2, '(936) 777-4446', NULL, NULL, NULL, NULL, NULL, 2676, 9617, NULL, '(936) 777-4446', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(350, 2, '(832) 103-1022', NULL, NULL, NULL, NULL, NULL, 6409, 7906, NULL, '(832) 103-1022', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(351, 2, '(713) 540-0153', NULL, NULL, NULL, NULL, NULL, 2956, 4979, NULL, '(713) 540-0153', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(352, 2, '(713) 540-0156', NULL, NULL, NULL, NULL, NULL, 7359, 5954, NULL, '(713) 540-0156', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(353, 2, '(832) 233-3684', NULL, NULL, NULL, NULL, NULL, 2102, 2742, NULL, '(832) 233-3684', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(354, 2, '(832) 969-7209', NULL, NULL, NULL, NULL, NULL, 8424, 9419, NULL, '(832) 969-7209', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(355, 2, '(936) 444-5064', NULL, NULL, NULL, NULL, NULL, 2483, 9321, NULL, '(936) 444-5064', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(356, 2, '(281) 323-0994', NULL, NULL, NULL, NULL, NULL, 6766, 2379, NULL, '(281) 323-0994', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"2\"]'),
(357, 2, '(281) 451-6650', NULL, NULL, NULL, NULL, NULL, 7669, 8958, NULL, '(281) 451-6650', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(358, 2, '(512) 627-8214', NULL, NULL, NULL, NULL, NULL, 7333, 8680, NULL, '(512) 627-8214', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(359, 2, '(936) 447-4967', NULL, NULL, NULL, NULL, NULL, 8158, 4580, NULL, '(936) 447-4967', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(360, 2, '(281) 825-7596', NULL, NULL, NULL, NULL, NULL, 7526, 8796, NULL, '(281) 825-7596', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(361, 2, '(281) 386-6497', NULL, NULL, NULL, NULL, NULL, 4733, 2096, NULL, '(281) 386-6497', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(362, 2, '(832) 287-6655', NULL, NULL, NULL, NULL, NULL, 9264, 1755, NULL, '(832) 287-6655', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(363, 2, '(713) 730-8147', NULL, NULL, NULL, NULL, NULL, 4180, 6074, NULL, '(713) 730-8147', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"2\"]'),
(364, 2, '(832) 723-9498', NULL, NULL, NULL, NULL, NULL, 5349, 4045, NULL, '(832) 723-9498', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(365, 2, '(713) 992-0201', NULL, NULL, NULL, NULL, NULL, 7157, 6103, NULL, '(713) 992-0201', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(366, 2, '(281) 203-4201', NULL, NULL, NULL, NULL, NULL, 3374, 4974, NULL, '(281) 203-4201', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(367, 2, '(210) 262-9262', NULL, NULL, NULL, NULL, NULL, 4742, 7014, NULL, '(210) 262-9262', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(368, 2, '(936) 327-6536', NULL, NULL, NULL, NULL, NULL, 4831, 1040, NULL, '(936) 327-6536', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(369, 2, '(936) 202-0854', NULL, NULL, NULL, NULL, NULL, 5144, 6481, NULL, '(936) 202-0854', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(370, 2, '(281) 687-1809', NULL, NULL, NULL, NULL, NULL, 3778, 5792, NULL, '(281) 687-1809', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(371, 2, '(713) 805-6460', NULL, NULL, NULL, NULL, NULL, 9966, 9081, NULL, '(713) 805-6460', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(372, 2, '(832) 928-7173', NULL, NULL, NULL, NULL, NULL, 3876, 1695, NULL, '(832) 928-7173', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(373, 2, '(832) 867-1603', NULL, NULL, NULL, NULL, NULL, 8587, 6436, NULL, '(832) 867-1603', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(374, 2, '(832) 867-1601', NULL, NULL, NULL, NULL, NULL, 2162, 8358, NULL, '(832) 867-1601', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(375, 2, '(281) 782-7826', NULL, NULL, NULL, NULL, NULL, 1403, 8235, NULL, '(281) 782-7826', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(376, 2, '(832) 641-7133', NULL, NULL, NULL, NULL, NULL, 2726, 6096, NULL, '(832) 641-7133', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(377, 2, '(281) 684-5747', NULL, NULL, NULL, NULL, NULL, 9866, 1065, NULL, '(281) 684-5747', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(378, 2, '(512) 826-0581', NULL, NULL, NULL, NULL, NULL, 4427, 9520, NULL, '(512) 826-0581', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(379, 2, '(707) 496-3629', NULL, NULL, NULL, NULL, NULL, 1619, 4704, NULL, '(707) 496-3629', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(380, 2, '(281) 731-8471', NULL, NULL, NULL, NULL, NULL, 7425, 2264, NULL, '(281) 731-8471', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(381, 2, '(936) 446-9729', NULL, NULL, NULL, NULL, NULL, 8230, 6821, NULL, '(936) 446-9729', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(382, 2, '(713) 628-0552', NULL, NULL, NULL, NULL, NULL, 2711, 6426, NULL, '(713) 628-0552', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(383, 2, '(713) 817-0615', NULL, NULL, NULL, NULL, NULL, 8610, 2983, NULL, '(713) 817-0615', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(384, 2, '(713) 822-5496', NULL, NULL, NULL, NULL, NULL, 1678, 3896, NULL, '(713) 822-5496', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(385, 2, '(405) 613-1369', NULL, NULL, NULL, NULL, NULL, 5309, 8486, NULL, '(405) 613-1369', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(386, 2, '(979) 277-2604', NULL, NULL, NULL, NULL, NULL, 5548, 6543, NULL, '(979) 277-2604', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(387, 2, '(713) 302-1197', NULL, NULL, NULL, NULL, NULL, 9099, 9635, NULL, '(713) 302-1197', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(388, 2, '(936) 520-6226', NULL, NULL, NULL, NULL, NULL, 2760, 5503, NULL, '(936) 520-6226', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(389, 2, '(281) 467-6278', NULL, NULL, NULL, NULL, NULL, 2944, 9028, NULL, '(281) 467-6278', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(390, 2, '(936) 525-0710', NULL, NULL, NULL, NULL, NULL, 9258, 5305, NULL, '(936) 525-0710', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(392, 2, '(281) 825-2706', NULL, NULL, NULL, NULL, NULL, 7810, 2716, NULL, '(281) 825-2706', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"2\"]'),
(393, 2, '(281) 825-2711', NULL, NULL, NULL, NULL, NULL, 3848, 5275, NULL, '(281) 825-2711', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"2\"]'),
(394, 2, '(281) 825-7997', NULL, NULL, NULL, NULL, NULL, 1752, 4134, NULL, '(281) 825-7997', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"2\"]'),
(396, 2, '(281) 433-7565', NULL, NULL, NULL, NULL, NULL, 7431, 1439, NULL, '(281) 433-7565', NULL, NULL, NULL, '', '1', 'ambassador', '[\"2\"]'),
(397, 3, '1116', NULL, NULL, NULL, NULL, NULL, 9232, 4594, NULL, '(719) 650-0290', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(398, 3, '2923', NULL, NULL, NULL, NULL, NULL, 2504, 2536, NULL, '(719) 481-2901', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(399, 3, '5117', NULL, NULL, NULL, NULL, NULL, 2243, 5818, NULL, '(719) 392-0998', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(400, 3, '5541', NULL, NULL, NULL, NULL, NULL, 5492, 7304, NULL, '(714) 606-9606', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(401, 3, '4447', NULL, NULL, NULL, NULL, NULL, 5849, 8915, NULL, '(303) 987-3005', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(402, 3, '1202', NULL, NULL, NULL, NULL, NULL, 3857, 6894, NULL, '(719) 377-9120', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(403, 3, '5857', NULL, NULL, NULL, NULL, NULL, 4394, 6610, NULL, '(720) 484-2544', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(404, 3, '1326', NULL, NULL, NULL, NULL, NULL, 7751, 4742, NULL, '(719) 633-1112', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(405, 3, '3874', NULL, NULL, NULL, NULL, NULL, 1492, 9925, NULL, '(719) 596-4641', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(406, 3, '3234', NULL, NULL, NULL, NULL, NULL, 1258, 2525, NULL, '(719) 542-7100', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(407, 3, '199', NULL, NULL, NULL, NULL, NULL, 1220, 1777, NULL, '(719) 576-9178', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(408, 3, '5485', NULL, NULL, NULL, NULL, NULL, 7489, 2327, NULL, '(303) 363-8909', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(409, 3, '3608', NULL, NULL, NULL, NULL, NULL, 5109, 8787, NULL, '(720) 524-7061', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(410, 3, '5676', NULL, NULL, NULL, NULL, NULL, 7837, 3341, NULL, '(719) 473-3602', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(411, 3, '2972', NULL, NULL, NULL, NULL, NULL, 5131, 6347, NULL, '(719) 419-3992', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(412, 3, '1552', NULL, NULL, NULL, NULL, NULL, 2572, 3138, NULL, '(719) 488-2194', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(413, 3, '1553', NULL, NULL, NULL, NULL, NULL, 7346, 5309, NULL, '(719) 488-2194', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(414, 3, '1281', NULL, NULL, NULL, NULL, NULL, 5556, 8935, NULL, '(719) 651-5287', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(415, 3, '904', NULL, NULL, NULL, NULL, NULL, 2251, 8053, NULL, '(719) 597-4784', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(416, 3, '3299', NULL, NULL, NULL, NULL, NULL, 9996, 2000, NULL, '(303) 656-5087', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(417, 3, '4020', NULL, NULL, NULL, NULL, NULL, 2173, 8683, NULL, '(719) 434-5230', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(418, 3, '5896', NULL, NULL, NULL, NULL, NULL, 8911, 3816, NULL, '(303) 794-6737', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(419, 3, '5293', NULL, NULL, NULL, NULL, NULL, 1366, 2266, NULL, '(303) 681-3752', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(420, 3, '3073', NULL, NULL, NULL, NULL, NULL, 5573, 4705, NULL, '(719) 635-4742', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(421, 3, '2957', NULL, NULL, NULL, NULL, NULL, 2392, 8715, NULL, '(719) 392-7410', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(422, 3, '5525', NULL, NULL, NULL, NULL, NULL, 5636, 9746, NULL, '(719) 520-9889', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(423, 3, '4493', NULL, NULL, NULL, NULL, NULL, 4049, 8100, NULL, '(719) 566-4733', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(424, 3, '6162', NULL, NULL, NULL, NULL, NULL, 5303, 4157, NULL, '(719) 684-3585', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(425, 3, '1297', NULL, NULL, NULL, NULL, NULL, 5534, 1388, NULL, '(719) 630-3330', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(426, 3, '5924', NULL, NULL, NULL, NULL, NULL, 2415, 3263, NULL, '(303) 753-1130', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(427, 3, '1094', NULL, NULL, NULL, NULL, NULL, 1558, 4391, NULL, '(303) 237-4032', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(428, 3, '224', NULL, NULL, NULL, NULL, NULL, 7141, 1146, NULL, '(719) 598-4505', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(429, 3, '4392', NULL, NULL, NULL, NULL, NULL, 6397, 3792, NULL, '(719) 392-3762', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(430, 3, '5846', NULL, NULL, NULL, NULL, NULL, 3279, 9453, NULL, '(719) 481-3136', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(431, 3, '1258', NULL, NULL, NULL, NULL, NULL, 6584, 2907, NULL, '(719) 433-4907', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(432, 3, '2648', NULL, NULL, NULL, NULL, NULL, 5887, 8803, NULL, '(719) 634-6772', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(433, 3, '824', NULL, NULL, NULL, NULL, NULL, 3845, 3705, NULL, '(303) 688-9694', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(434, 3, '5415', NULL, NULL, NULL, NULL, NULL, 6542, 8443, NULL, '(720) 279-1815', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(435, 3, '3666', NULL, NULL, NULL, NULL, NULL, 9479, 8448, NULL, '(303) 730-1003', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(436, 3, '3693', NULL, NULL, NULL, NULL, NULL, 6822, 4540, NULL, '(719) 473-5971', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(437, 3, '8', NULL, NULL, NULL, NULL, NULL, 8869, 8975, NULL, '(719) 481-2368', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(438, 3, '5680', NULL, NULL, NULL, NULL, NULL, 7797, 6437, NULL, '(719) 636-3161', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(439, 3, '1572', NULL, NULL, NULL, NULL, NULL, 9657, 3620, NULL, '(719) 375-8175', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(440, 3, '5581', NULL, NULL, NULL, NULL, NULL, 5969, 2380, NULL, '(970) 209-5209', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(441, 3, '1139', NULL, NULL, NULL, NULL, NULL, 8044, 8296, NULL, '(719) 473-8181', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(442, 3, '5233', NULL, NULL, NULL, NULL, NULL, 1633, 5592, NULL, '(719) 392-0370', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(443, 3, '3086', NULL, NULL, NULL, NULL, NULL, 3885, 6620, NULL, '(720) 262-5002', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(445, 3, '4138', NULL, NULL, NULL, NULL, NULL, 9598, 9109, NULL, '(719) 632-6062', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(446, 3, '1300', NULL, NULL, NULL, NULL, NULL, 9415, 4997, NULL, '(719) 630-7578', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(447, 3, '4613', NULL, NULL, NULL, NULL, NULL, 9798, 3703, NULL, '(719) 495-0410', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(448, 3, '5615', NULL, NULL, NULL, NULL, NULL, 5673, 6832, NULL, '(719) 593-1115', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(450, 3, '1577', NULL, NULL, NULL, NULL, NULL, 6734, 1528, NULL, '(719) 310-8790', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(451, 3, '874', NULL, NULL, NULL, NULL, NULL, 6613, 6307, NULL, '(720) 737-5674', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(453, 3, '4056', NULL, NULL, NULL, NULL, NULL, 5387, 6424, NULL, '(719) 432-9730', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(454, 3, '1394', NULL, NULL, NULL, NULL, NULL, 2837, 4021, NULL, '(303) 794-3691', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(455, 3, '1739', NULL, NULL, NULL, NULL, NULL, 7549, 7087, NULL, '(719) 579-0115', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(456, 3, '5528', NULL, NULL, NULL, NULL, NULL, 2700, 3196, NULL, '(719) 310-7454', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(457, 3, '1968', NULL, NULL, NULL, NULL, NULL, 6803, 7506, NULL, '(303) 798-3343', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(458, 3, '829', NULL, NULL, NULL, NULL, NULL, 8020, 1036, NULL, '(719) 247-8911', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(459, 3, '5892', NULL, NULL, NULL, NULL, NULL, 5137, 3248, NULL, '(720) 331-4156', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(460, 3, '2328', NULL, NULL, NULL, NULL, NULL, 3291, 2910, NULL, '(303) 936-0109', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(461, 3, '5255', NULL, NULL, NULL, NULL, NULL, 7544, 4713, NULL, '(719) 229-5863', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(462, 3, '4560', NULL, NULL, NULL, NULL, NULL, 1826, 9588, NULL, '(719) 632-0535', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(464, 3, '3038', NULL, NULL, NULL, NULL, NULL, 8316, 6476, NULL, '(303) 979-4591', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(465, 3, '373', NULL, NULL, NULL, NULL, NULL, 5453, 3477, NULL, '(303) 922-3109', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(466, 3, '374', NULL, NULL, NULL, NULL, NULL, 5098, 8562, NULL, '(303) 922-3109', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(467, 3, '1767', NULL, NULL, NULL, NULL, NULL, 1035, 6785, NULL, '(719) 685-4110', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(468, 3, '3265', NULL, NULL, NULL, NULL, NULL, 6529, 8643, NULL, '(719) 685-4110', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(469, 3, '3986', NULL, NULL, NULL, NULL, NULL, 7977, 7556, NULL, '(719) 424-4296', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(470, 3, '6084', NULL, NULL, NULL, NULL, NULL, 6862, 7063, NULL, '(303) 771-4525', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(471, 3, '4540', NULL, NULL, NULL, NULL, NULL, 1139, 3352, NULL, '(719) 531-5516', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(472, 3, '6210', NULL, NULL, NULL, NULL, NULL, 3222, 6115, NULL, '(719) 491-2012', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(473, 3, '4573', NULL, NULL, NULL, NULL, NULL, 9442, 4282, NULL, '(303) 904-7414', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(474, 3, '624', NULL, NULL, NULL, NULL, NULL, 7753, 5290, NULL, '(719) 574-0089', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(475, 3, '3849', NULL, NULL, NULL, NULL, NULL, 8036, 4400, NULL, '(303) 794-3384', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(476, 3, '3719', NULL, NULL, NULL, NULL, NULL, 2816, 7948, NULL, '(719) 575-0948', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(477, 3, '468', NULL, NULL, NULL, NULL, NULL, 6711, 8864, NULL, '(303) 232-9227', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(478, 3, '5542', NULL, NULL, NULL, NULL, NULL, 6797, 6718, NULL, '(303) 232-9227', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(479, 3, '2878', NULL, NULL, NULL, NULL, NULL, 8597, 9160, NULL, '(303) 322-6758', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(480, 3, '5908', NULL, NULL, NULL, NULL, NULL, 8928, 7042, NULL, '(719) 689-2603', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(481, 3, '188', NULL, NULL, NULL, NULL, NULL, 9192, 1027, NULL, '(719) 635-3731', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(482, 3, '6253', NULL, NULL, NULL, NULL, NULL, 9568, 6324, NULL, '(719) 542-9056', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(483, 3, '5613', NULL, NULL, NULL, NULL, NULL, 5084, 2115, NULL, '(719) 262-9441', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(484, 3, '4435', NULL, NULL, NULL, NULL, NULL, 2758, 1587, NULL, '(719) 641-2719', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(485, 3, '5226', NULL, NULL, NULL, NULL, NULL, 7981, 5502, NULL, '(719) 633-1650', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(486, 3, '4991', NULL, NULL, NULL, NULL, NULL, 5243, 8659, NULL, '(719) 632-4839', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(489, 3, '2391', NULL, NULL, NULL, NULL, NULL, 1097, 2507, NULL, '(719) 471-3975', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(490, 3, '5879', NULL, NULL, NULL, NULL, NULL, 7287, 8920, NULL, '(303) 502-0259', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(491, 3, '1951', NULL, NULL, NULL, NULL, NULL, 7426, 8151, NULL, '(303) 715-3518', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(492, 3, '4898', NULL, NULL, NULL, NULL, NULL, 7654, 7354, NULL, '(719) 593-9688', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(493, 3, '3931', NULL, NULL, NULL, NULL, NULL, 9231, 3894, NULL, '(707) 292-9370', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(494, 3, '4701', NULL, NULL, NULL, NULL, NULL, 6437, 3987, NULL, '(719) 638-1465', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(495, 3, '2378', NULL, NULL, NULL, NULL, NULL, 5320, 7614, NULL, '(719) 596-1952', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(496, 3, '23', NULL, NULL, NULL, NULL, NULL, 7364, 3458, NULL, '(719) 473-1747', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(497, 3, '1595', NULL, NULL, NULL, NULL, NULL, 8486, 3227, NULL, '(719) 598-1871', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(498, 3, '5991', NULL, NULL, NULL, NULL, NULL, 8117, 9159, NULL, '(719) 440-5400', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(499, 3, '3810', NULL, NULL, NULL, NULL, NULL, 5213, 5373, NULL, '(303) 955-7775', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(500, 3, '5136', NULL, NULL, NULL, NULL, NULL, 2818, 3230, NULL, '(303) 653-5191', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(501, 3, '4550', NULL, NULL, NULL, NULL, NULL, 4629, 1897, NULL, '(719) 596-4209', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(502, 3, '4397', NULL, NULL, NULL, NULL, NULL, 8991, 4711, NULL, '(719) 597-2338', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(503, 3, '3233', NULL, NULL, NULL, NULL, NULL, 3130, 7890, NULL, '(805) 279-9454', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(504, 3, '5460', NULL, NULL, NULL, NULL, NULL, 1010, 8514, NULL, '(303) 663-6500', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(505, 3, '3356', NULL, NULL, NULL, NULL, NULL, 9379, 9793, NULL, '(719) 594-6518', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(506, 3, '828', NULL, NULL, NULL, NULL, NULL, 7478, 3706, NULL, '(303) 794-7866', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(507, 3, '827', NULL, NULL, NULL, NULL, NULL, 3636, 2687, NULL, '(303) 794-7866', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(508, 3, '4820', NULL, NULL, NULL, NULL, NULL, 8422, 2980, NULL, '(719) 632-5950', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(509, 3, '5396', NULL, NULL, NULL, NULL, NULL, 9085, 1986, NULL, '(719) 685-5565', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(510, 3, '4858', NULL, NULL, NULL, NULL, NULL, 3275, 6790, NULL, '(303) 248-4241', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(511, 3, '3174', NULL, NULL, NULL, NULL, NULL, 6052, 5044, NULL, '(719) 635-4452', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(512, 3, '3175', NULL, NULL, NULL, NULL, NULL, 3909, 8770, NULL, '(719) 635-4452', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(513, 3, '6219', NULL, NULL, NULL, NULL, NULL, 8474, 4511, NULL, '(469) 235-6835', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(514, 3, '5101', NULL, NULL, NULL, NULL, NULL, 7441, 2884, NULL, '(719) 599-9552', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(516, 3, '4827', NULL, NULL, NULL, NULL, NULL, 3077, 4543, NULL, '(719) 488-9738', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(517, 3, '147', NULL, NULL, NULL, NULL, NULL, 5417, 6574, NULL, '(719) 634-2375', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(519, 3, '5144', NULL, NULL, NULL, NULL, NULL, 8938, 9138, NULL, '(832) 439-1437', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(521, 3, '5800', NULL, NULL, NULL, NULL, NULL, 8633, 9298, NULL, '(303) 781-5394', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(522, 3, '6229', NULL, NULL, NULL, NULL, NULL, 6021, 7523, NULL, '(719) 205-7236', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(525, 3, '5767', NULL, NULL, NULL, NULL, NULL, 4886, 5015, NULL, '(303) 978-9632', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(526, 3, '3848', NULL, NULL, NULL, NULL, NULL, 8347, 2217, NULL, '(303) 730-2501', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(527, 3, '6233', NULL, NULL, NULL, NULL, NULL, 6483, 6977, NULL, '(303) 935-8029', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(528, 3, '118', NULL, NULL, NULL, NULL, NULL, 8255, 2846, NULL, '(303) 850-9323', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(529, 3, '4249', NULL, NULL, NULL, NULL, NULL, 9242, 7962, NULL, '(303) 804-5452', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(530, 3, '1319', NULL, NULL, NULL, NULL, NULL, 7495, 4136, NULL, '(719) 375-1380', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(531, 3, '5571', NULL, NULL, NULL, NULL, NULL, 7194, 1348, NULL, '(719) 633-3375', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(533, 3, '4817', NULL, NULL, NULL, NULL, NULL, 3118, 4875, NULL, '(719) 488-2399', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(534, 3, '4789', NULL, NULL, NULL, NULL, NULL, 7294, 2050, NULL, '(719) 540-4649', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(535, 3, '6190', NULL, NULL, NULL, NULL, NULL, 7191, 1406, NULL, '(719) 687-3623', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(536, 3, '1341', NULL, NULL, NULL, NULL, NULL, 9654, 2205, NULL, '(719) 598-1140', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(537, 3, '3395', NULL, NULL, NULL, NULL, NULL, 2407, 5548, NULL, '(719) 265-6962', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(538, 3, '5447', NULL, NULL, NULL, NULL, NULL, 5359, 9142, NULL, '(303) 717-8950', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(539, 3, '5592', NULL, NULL, NULL, NULL, NULL, 9473, 5557, NULL, '(719) 597-4039', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(541, 3, '3744', NULL, NULL, NULL, NULL, NULL, 1138, 8801, NULL, '(303) 798-0938', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(542, 3, '3870', NULL, NULL, NULL, NULL, NULL, 5355, 6077, NULL, '(303) 745-4357', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(543, 3, '1759', NULL, NULL, NULL, NULL, NULL, 6404, 8616, NULL, '(719) 749-0485', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(545, 3, '5820', NULL, NULL, NULL, NULL, NULL, 1867, 2348, NULL, '(719) 247-8041', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(546, 3, '2209', NULL, NULL, NULL, NULL, NULL, 4356, 2421, NULL, '(719) 487-7931', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(547, 3, '6230', NULL, NULL, NULL, NULL, NULL, 4199, 9156, NULL, '(719) 473-7558', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(548, 3, '2973', NULL, NULL, NULL, NULL, NULL, 5389, 7376, NULL, '(719) 493-9667', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(549, 3, '5097', NULL, NULL, NULL, NULL, NULL, 4016, 4463, NULL, '(719) 630-8888', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(550, 3, '5790', NULL, NULL, NULL, NULL, NULL, 3767, 8866, NULL, '(719) 237-9278', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(551, 3, '6226', NULL, NULL, NULL, NULL, NULL, 7540, 7399, NULL, '(303) 341-6298', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(552, 3, '5464', NULL, NULL, NULL, NULL, NULL, 6993, 4500, NULL, '(720) 344-2643', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(553, 3, '5621', NULL, NULL, NULL, NULL, NULL, 8334, 6492, NULL, '(720) 625-3795', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(554, 3, '5891', NULL, NULL, NULL, NULL, NULL, 9311, 7175, NULL, '(719) 778-5707', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(555, 3, '5967', NULL, NULL, NULL, NULL, NULL, 7589, 6539, NULL, '(719) 528-1758', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(556, 3, '5973', NULL, NULL, NULL, NULL, NULL, 2281, 5326, NULL, '(719) 528-1758', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(557, 3, '2968', NULL, NULL, NULL, NULL, NULL, 2594, 8557, NULL, '(719) 633-8181', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(558, 3, '5487', NULL, NULL, NULL, NULL, NULL, 4040, 9175, NULL, '(303) 644-3499', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(560, 3, '4799', NULL, NULL, NULL, NULL, NULL, 1141, 8352, NULL, '(303) 773-8992', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(561, 3, '3382', NULL, NULL, NULL, NULL, NULL, 8332, 9611, NULL, '(402) 639-3903', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(562, 3, '3635', NULL, NULL, NULL, NULL, NULL, 6475, 9330, NULL, '(402) 639-3903', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(563, 3, '32', NULL, NULL, NULL, NULL, NULL, 1263, 7525, NULL, '(719) 634-0265', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]');
INSERT INTO `patient_details` (`pid`, `lid`, `fname`, `lname`, `dob`, `admitteddate`, `release`, `outcome`, `ssn`, `pinno`, `email`, `mobile`, `insurance_id`, `code`, `code_date`, `patient_carrier`, `fac_id`, `type`, `units`) VALUES
(565, 3, '3832', NULL, NULL, NULL, NULL, NULL, 1091, 9841, NULL, '(719) 217-8917', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(566, 3, '4910', NULL, NULL, NULL, NULL, NULL, 4575, 5201, NULL, '(719) 481-4894', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(567, 3, '4393', NULL, NULL, NULL, NULL, NULL, 1744, 3283, NULL, '(719) 661-1885', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(568, 3, '5594', NULL, NULL, NULL, NULL, NULL, 6638, 5650, NULL, '(480) 766-3074', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(569, 3, '4312', NULL, NULL, NULL, NULL, NULL, 9575, 5655, NULL, '(719) 495-1439', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(571, 3, '2180', NULL, NULL, NULL, NULL, NULL, 3178, 4227, NULL, '(719) 694-9471', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(572, 3, '1162', NULL, NULL, NULL, NULL, NULL, 3440, 5664, NULL, '(720) 350-4546', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(573, 3, '4150', NULL, NULL, NULL, NULL, NULL, 2659, 9386, NULL, '(719) 488-3668', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(574, 3, '5024', NULL, NULL, NULL, NULL, NULL, 2181, 7636, NULL, '(719) 930-7394', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(575, 3, '562', NULL, NULL, NULL, NULL, NULL, 9608, 1773, NULL, '(719) 275-8275', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(576, 3, '5154', NULL, NULL, NULL, NULL, NULL, 1680, 5862, NULL, '(210) 326-8599', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(577, 3, '2356', NULL, NULL, NULL, NULL, NULL, 8007, 1447, NULL, '(719) 574-1972', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(578, 3, '5407', NULL, NULL, NULL, NULL, NULL, 4912, 4946, NULL, '(719) 650-1649', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(580, 3, '5842', NULL, NULL, NULL, NULL, NULL, 7971, 9561, NULL, '(719) 466-0332', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(581, 3, '2975', NULL, NULL, NULL, NULL, NULL, 2658, 9798, NULL, '(719) 266-2229', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(582, 3, '1769', NULL, NULL, NULL, NULL, NULL, 8284, 3956, NULL, '(719) 597-5814', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(583, 3, '5484', NULL, NULL, NULL, NULL, NULL, 7408, 4151, NULL, '(719) 377-9120', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(584, 3, '3769', NULL, NULL, NULL, NULL, NULL, 3710, 1888, NULL, '(303) 948-5443', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(585, 3, '3864', NULL, NULL, NULL, NULL, NULL, 4435, 7687, NULL, '(303) 697-8454', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(586, 3, '2247', NULL, NULL, NULL, NULL, NULL, 2382, 6717, NULL, '(303) 964-2229', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(587, 3, '1251', NULL, NULL, NULL, NULL, NULL, 7315, 7842, NULL, '(719) 632-5478', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(588, 3, '313', NULL, NULL, NULL, NULL, NULL, 6676, 6917, NULL, '(414) 732-7099', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(589, 3, '48', NULL, NULL, NULL, NULL, NULL, 9023, 3091, NULL, '(719) 591-8696', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(591, 3, '5675', NULL, NULL, NULL, NULL, NULL, 8426, 9653, NULL, '(303) 975-6266', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(592, 3, '155', NULL, NULL, NULL, NULL, NULL, 6458, 6831, NULL, '(719) 310-7960', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(593, 3, '4962', NULL, NULL, NULL, NULL, NULL, 5419, 7438, NULL, '(719) 632-7000', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(594, 3, '3803', NULL, NULL, NULL, NULL, NULL, 7678, 5412, NULL, '(303) 346-6540', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(595, 3, '1781', NULL, NULL, NULL, NULL, NULL, 1857, 8607, NULL, '(719) 495-4114', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(596, 3, '3963', NULL, NULL, NULL, NULL, NULL, 9459, 2946, NULL, '(719) 644-9893', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(597, 3, '650', NULL, NULL, NULL, NULL, NULL, 2472, 7256, NULL, '(719) 573-5898', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(598, 3, '2974', NULL, NULL, NULL, NULL, NULL, 6136, 3383, NULL, '(303) 797-0600', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(599, 3, '6264', NULL, NULL, NULL, NULL, NULL, 3232, 6107, NULL, '(702) 415-9742', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(600, 3, '4772', NULL, NULL, NULL, NULL, NULL, 8739, 3013, NULL, '(719) 481-3422', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(601, 3, '5028', NULL, NULL, NULL, NULL, NULL, 1595, 9099, NULL, '(303) 777-5920', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(602, 3, '1371', NULL, NULL, NULL, NULL, NULL, 8495, 5885, NULL, '(719) 275-2661', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(603, 3, '6261', NULL, NULL, NULL, NULL, NULL, 7088, 6985, NULL, '(702) 415-9742', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(605, 3, '5830', NULL, NULL, NULL, NULL, NULL, 6447, 1135, NULL, '(303) 799-3434', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(607, 3, '6231', NULL, NULL, NULL, NULL, NULL, 7198, 1802, NULL, '(719) 250-2364', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(608, 3, '5105', NULL, NULL, NULL, NULL, NULL, 7932, 8402, NULL, '(719) 330-4415', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(609, 3, '3061', NULL, NULL, NULL, NULL, NULL, 2094, 2978, NULL, '(303) 745-2062', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(610, 3, '4564', NULL, NULL, NULL, NULL, NULL, 6444, 4605, NULL, '(760) 742-0264', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(611, 3, '684', NULL, NULL, NULL, NULL, NULL, 8311, 9637, NULL, '(719) 520-0433', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(612, 3, '5897', NULL, NULL, NULL, NULL, NULL, 2518, 6313, NULL, '(303) 750-3077', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(613, 3, '3355', NULL, NULL, NULL, NULL, NULL, 7938, 4778, NULL, '(719) 596-0370', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(614, 3, '5503', NULL, NULL, NULL, NULL, NULL, 2703, 4545, NULL, '(719) 630-3330', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(615, 3, '220', NULL, NULL, NULL, NULL, NULL, 4054, 4504, NULL, '(719) 487-8707', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(616, 3, '5457', NULL, NULL, NULL, NULL, NULL, 7311, 6632, NULL, '(303) 758-1277', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(617, 3, '5458', NULL, NULL, NULL, NULL, NULL, 9774, 9296, NULL, '(303) 758-1277', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(618, 3, '1791', NULL, NULL, NULL, NULL, NULL, 5286, 5038, NULL, '(719) 598-9251', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(619, 3, '5377', NULL, NULL, NULL, NULL, NULL, 6113, 5140, NULL, '(720) 428-8647', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(620, 3, '5725', NULL, NULL, NULL, NULL, NULL, 6023, 6504, NULL, '(719) 375-0518', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(621, 3, '4388', NULL, NULL, NULL, NULL, NULL, 6187, 3089, NULL, '(303) 934-7660', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(623, 3, '2896', NULL, NULL, NULL, NULL, NULL, 3877, 8110, NULL, '(719) 338-9137', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(624, 3, '6115', NULL, NULL, NULL, NULL, NULL, 2824, 6142, NULL, '(303) 757-8324', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(625, 3, '6041', NULL, NULL, NULL, NULL, NULL, 4903, 5363, NULL, '(719) 205-7399', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(626, 3, '4871', NULL, NULL, NULL, NULL, NULL, 9352, 4828, NULL, '(719) 426-9930', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(627, 3, '2921', NULL, NULL, NULL, NULL, NULL, 7643, 1076, NULL, '(303) 263-8885', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(628, 3, '5348', NULL, NULL, NULL, NULL, NULL, 1624, 4881, NULL, '(719) 632-7239', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(629, 3, '2714', NULL, NULL, NULL, NULL, NULL, 6365, 8564, NULL, '(719) 200-7246', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(630, 3, '1315', NULL, NULL, NULL, NULL, NULL, 2642, 3944, NULL, '(719) 634-2133', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(631, 3, '581', NULL, NULL, NULL, NULL, NULL, 2688, 8011, NULL, '(719) 634-2133', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(633, 3, '1065', NULL, NULL, NULL, NULL, NULL, 6947, 4120, NULL, '(719) 488-2212', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(634, 3, '2924', NULL, NULL, NULL, NULL, NULL, 1016, 8304, NULL, '(719) 268-1427', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(635, 3, '3392', NULL, NULL, NULL, NULL, NULL, 6836, 9111, NULL, '(719) 576-5911', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(636, 3, '4289', NULL, NULL, NULL, NULL, NULL, 7037, 4737, NULL, '(719) 347-2118', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(638, 3, '6199', NULL, NULL, NULL, NULL, NULL, 9505, 7172, NULL, '(719) 308-2132', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(639, 3, '5747', NULL, NULL, NULL, NULL, NULL, 6151, 8309, NULL, '(303) 345-3519', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(640, 3, '5227', NULL, NULL, NULL, NULL, NULL, 6429, 8031, NULL, '(719) 368-7811', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(641, 3, '5683', NULL, NULL, NULL, NULL, NULL, 6305, 8679, NULL, '(719) 635-1038', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(642, 3, '5292', NULL, NULL, NULL, NULL, NULL, 4259, 1264, NULL, '(303) 798-0131', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(643, 3, '3433', NULL, NULL, NULL, NULL, NULL, 8859, 5904, NULL, '(719) 964-3136', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(644, 3, '89', NULL, NULL, NULL, NULL, NULL, 7240, 1659, NULL, '(303) 745-1976', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(645, 3, '6120', NULL, NULL, NULL, NULL, NULL, 6511, 4489, NULL, '(720) 839-9103', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(646, 3, '5527', NULL, NULL, NULL, NULL, NULL, 2361, 4686, NULL, '(719) 531-9045', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(647, 3, '3335', NULL, NULL, NULL, NULL, NULL, 1066, 8408, NULL, '(719) 488-2311', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(648, 3, '5418', NULL, NULL, NULL, NULL, NULL, 5881, 2578, NULL, '(719) 592-9104', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(649, 3, '5999', NULL, NULL, NULL, NULL, NULL, 6973, 1821, NULL, '(719) 577-4575', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(650, 3, '2655', NULL, NULL, NULL, NULL, NULL, 1467, 2173, NULL, '(719) 632-5604', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(652, 3, '2157', NULL, NULL, NULL, NULL, NULL, 7301, 4542, NULL, '(719) 633-2238', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(653, 3, '2158', NULL, NULL, NULL, NULL, NULL, 4672, 5189, NULL, '(719) 633-2238', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(654, 3, '2754', NULL, NULL, NULL, NULL, NULL, 7011, 6965, NULL, '(719) 390-7373', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(655, 3, '2905', NULL, NULL, NULL, NULL, NULL, 5810, 2071, NULL, '(719) 344-5336', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(656, 3, '1265', NULL, NULL, NULL, NULL, NULL, 4535, 2366, NULL, '(719) 597-7648', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(657, 3, '3353', NULL, NULL, NULL, NULL, NULL, 2819, 3114, NULL, '(719) 930-2822', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(658, 3, '1588', NULL, NULL, NULL, NULL, NULL, 4647, 4752, NULL, '(719) 594-9430', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(659, 3, '4557', NULL, NULL, NULL, NULL, NULL, 7757, 6027, NULL, '(719) 488-0905', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(660, 3, '4551', NULL, NULL, NULL, NULL, NULL, 3781, 3803, NULL, '(719) 488-0905', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(661, 3, '3829', NULL, NULL, NULL, NULL, NULL, 9177, 7437, NULL, '(303) 919-9155', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(662, 3, '344', NULL, NULL, NULL, NULL, NULL, 5450, 2746, NULL, '(719) 867-4616', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(663, 3, '6260', NULL, NULL, NULL, NULL, NULL, 4603, 3855, NULL, '(719) 488-0553', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(664, 3, '5228', NULL, NULL, NULL, NULL, NULL, 8941, 8401, NULL, '(720) 484-2541', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(665, 3, '3078', NULL, NULL, NULL, NULL, NULL, 5627, 6475, NULL, '(303) 368-4323', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(666, 3, '5895', NULL, NULL, NULL, NULL, NULL, 3544, 6833, NULL, '(940) 704-2701', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(667, 3, '(719) 484-9933', NULL, NULL, NULL, NULL, NULL, 5537, 8192, NULL, '(719) 484-9933', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(668, 3, '(719) 425-5498', NULL, NULL, NULL, NULL, NULL, 1805, 6557, NULL, '(719) 425-5498', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(669, 3, '(424) 202-2620', NULL, NULL, NULL, NULL, NULL, 3301, 2125, NULL, '(424) 202-2620', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(670, 3, '(303) 810-3252', NULL, NULL, NULL, NULL, NULL, 8730, 3922, NULL, '(303) 810-3252', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(671, 3, '(908) 421-3113', NULL, NULL, NULL, NULL, NULL, 1114, 1412, NULL, '(908) 421-3113', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(672, 3, '(719) 659-7289', NULL, NULL, NULL, NULL, NULL, 5813, 3950, NULL, '(719) 659-7289', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(673, 3, '(719) 659-7290', NULL, NULL, NULL, NULL, NULL, 9373, 3900, NULL, '(719) 659-7290', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(675, 3, '(719) 491-2616', NULL, NULL, NULL, NULL, NULL, 8704, 3112, NULL, '(719) 491-2616', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(676, 3, '(719) 440-1837', NULL, NULL, NULL, NULL, NULL, 6063, 8349, NULL, '(719) 440-1837', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(677, 3, '(719) 544-2289', NULL, NULL, NULL, NULL, NULL, 9344, 4744, NULL, '(719) 544-2289', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(678, 3, '(719) 362-3666', NULL, NULL, NULL, NULL, NULL, 7887, 7187, NULL, '(719) 362-3666', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(679, 3, '(719) 287-2633', NULL, NULL, NULL, NULL, NULL, 7574, 9424, NULL, '(719) 287-2633', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(680, 3, '(720) 841-6733', NULL, NULL, NULL, NULL, NULL, 7379, 8990, NULL, '(720) 841-6733', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(681, 3, '(815) 326-2298', NULL, NULL, NULL, NULL, NULL, 7957, 7173, NULL, '(815) 326-2298', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(682, 3, '(303) 713-0076', NULL, NULL, NULL, NULL, NULL, 2591, 6046, NULL, '(303) 713-0076', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(683, 3, '(720) 499-8362', NULL, NULL, NULL, NULL, NULL, 1163, 9479, NULL, '(720) 499-8362', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(684, 3, '(719) 473-3602', NULL, NULL, NULL, NULL, NULL, 9685, 8506, NULL, '(719) 473-3602', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(685, 3, '(513) 478-3883', NULL, NULL, NULL, NULL, NULL, 1637, 7295, NULL, '(513) 478-3883', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(686, 3, '(513) 478-3883', NULL, NULL, NULL, NULL, NULL, 6425, 6487, NULL, '(513) 478-3883', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(688, 3, '(719) 237-9278', NULL, NULL, NULL, NULL, NULL, 6929, 1532, NULL, '(719) 237-9278', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(689, 3, '(703) 370-4248', NULL, NULL, NULL, NULL, NULL, 3984, 2186, NULL, '(703) 370-4248', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(690, 3, '(719) 237-9278', NULL, NULL, NULL, NULL, NULL, 8098, 3899, NULL, '(719) 237-9278', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(691, 3, '(719) 651-5287', NULL, NULL, NULL, NULL, NULL, 1187, 5847, NULL, '(719) 651-5287', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(692, 3, '(719) 661-5326', NULL, NULL, NULL, NULL, NULL, 2923, 4517, NULL, '(719) 661-5326', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(693, 3, '(719) 331-6906', NULL, NULL, NULL, NULL, NULL, 7830, 4759, NULL, '(719) 331-6906', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(694, 3, '(719) 459-2128', NULL, NULL, NULL, NULL, NULL, 9307, 5514, NULL, '(719) 459-2128', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(695, 3, '(303) 378-9068', NULL, NULL, NULL, NULL, NULL, 5280, 8498, NULL, '(303) 378-9068', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(696, 3, '(303) 514-0889', NULL, NULL, NULL, NULL, NULL, 4918, 1377, NULL, '(303) 514-0889', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(698, 3, '(719) 459-1000', NULL, NULL, NULL, NULL, NULL, 5860, 3879, NULL, '(719) 459-1000', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(699, 3, '(719) 360-9394', NULL, NULL, NULL, NULL, NULL, 4953, 2006, NULL, '(719) 360-9394', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(700, 3, '(719) 966-6063', NULL, NULL, NULL, NULL, NULL, 8519, 9645, NULL, '(719) 966-6063', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(701, 3, '(303) 772-8672', NULL, NULL, NULL, NULL, NULL, 1582, 6764, NULL, '(303) 772-8672', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(702, 3, '(303) 886-5209', NULL, NULL, NULL, NULL, NULL, 2393, 8327, NULL, '(303) 886-5209', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(703, 3, '(720) 520-9889', NULL, NULL, NULL, NULL, NULL, 4870, 2563, NULL, '(720) 520-9889', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(705, 3, '(303) 883-0039', NULL, NULL, NULL, NULL, NULL, 1701, 7561, NULL, '(303) 883-0039', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(706, 3, '(719) 459-2968', NULL, NULL, NULL, NULL, NULL, 7609, 5336, NULL, '(719) 459-2968', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(707, 3, '(303) 346-4358', NULL, NULL, NULL, NULL, NULL, 8075, 6866, NULL, '(303) 346-4358', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(708, 3, '(303) 300-2255', NULL, NULL, NULL, NULL, NULL, 6780, 4290, NULL, '(303) 300-2255', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(709, 3, '(720) 936-5993', NULL, NULL, NULL, NULL, NULL, 9315, 6086, NULL, '(720) 936-5993', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(710, 3, '(720) 324-3255', NULL, NULL, NULL, NULL, NULL, 8635, 1298, NULL, '(720) 324-3255', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(711, 3, '(719) 649-4407', NULL, NULL, NULL, NULL, NULL, 8403, 2072, NULL, '(719) 649-4407', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(712, 3, '(970) 581-1475', NULL, NULL, NULL, NULL, NULL, 5313, 6099, NULL, '(970) 581-1475', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(714, 3, '(719) 510-1031', NULL, NULL, NULL, NULL, NULL, 8729, 9316, NULL, '(719) 510-1031', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(715, 3, '(719) 433-4907', NULL, NULL, NULL, NULL, NULL, 9300, 6692, NULL, '(719) 433-4907', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(716, 3, '(623) 258-1848', NULL, NULL, NULL, NULL, NULL, 4625, 8143, NULL, '(623) 258-1848', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(717, 3, '(623) 258-1848', NULL, NULL, NULL, NULL, NULL, 7459, 5355, NULL, '(623) 258-1848', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(718, 3, '(719) 633-9340', NULL, NULL, NULL, NULL, NULL, 6667, 5825, NULL, '(719) 633-9340', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(719, 3, '(919) 490-0300', NULL, NULL, NULL, NULL, NULL, 3570, 1826, NULL, '(919) 490-0300', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(720, 3, '(303) 278-8540', NULL, NULL, NULL, NULL, NULL, 9399, 9185, NULL, '(303) 278-8540', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(722, 3, '(303) 506-9440', NULL, NULL, NULL, NULL, NULL, 9999, 9880, NULL, '(303) 506-9440', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(723, 3, '(908) 745-1853', NULL, NULL, NULL, NULL, NULL, 4400, 7801, NULL, '(908) 745-1853', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(724, 3, '(719) 339-0126', NULL, NULL, NULL, NULL, NULL, 4873, 4900, NULL, '(719) 339-0126', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(725, 3, '(719) 337-9705', NULL, NULL, NULL, NULL, NULL, 5318, 2429, NULL, '(719) 337-9705', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(726, 3, '(719) 481-2368', NULL, NULL, NULL, NULL, NULL, 1708, 9428, NULL, '(719) 481-2368', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(728, 3, '(970) 204-0119', NULL, NULL, NULL, NULL, NULL, 8933, 7598, NULL, '(970) 204-0119', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(729, 3, '(816) 309-5416', NULL, NULL, NULL, NULL, NULL, 5300, 8976, NULL, '(816) 309-5416', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(730, 3, '(816) 516-3169', NULL, NULL, NULL, NULL, NULL, 7776, 2176, NULL, '(816) 516-3169', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(731, 3, '(970) 209-5209', NULL, NULL, NULL, NULL, NULL, 6439, 4308, NULL, '(970) 209-5209', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(732, 3, '(303) 898-8500', NULL, NULL, NULL, NULL, NULL, 9134, 5227, NULL, '(303) 898-8500', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(734, 3, '(719) 648-0609', NULL, NULL, NULL, NULL, NULL, 1383, 8107, NULL, '(719) 648-0609', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(736, 3, '(719) 235-3602', NULL, NULL, NULL, NULL, NULL, 3839, 8030, NULL, '(719) 235-3602', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(737, 3, '(719) 432-5903', NULL, NULL, NULL, NULL, NULL, 4551, 2252, NULL, '(719) 432-5903', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(738, 3, '(303) 798-0938', NULL, NULL, NULL, NULL, NULL, 7179, 8536, NULL, '(303) 798-0938', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(739, 3, '(719) 471-0817', NULL, NULL, NULL, NULL, NULL, 1479, 3521, NULL, '(719) 471-0817', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(740, 3, '(719) 322-6597', NULL, NULL, NULL, NULL, NULL, 6515, 4794, NULL, '(719) 322-6597', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(741, 3, '(719) 337-3265', NULL, NULL, NULL, NULL, NULL, 1564, 7352, NULL, '(719) 337-3265', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(742, 3, '(719) 930-9678', NULL, NULL, NULL, NULL, NULL, 2971, 1611, NULL, '(719) 930-9678', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(743, 3, '(719) 339-3283', NULL, NULL, NULL, NULL, NULL, 3359, 3035, NULL, '(719) 339-3283', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(744, 3, '(719) 637-2565', NULL, NULL, NULL, NULL, NULL, 5483, 9416, NULL, '(719) 637-2565', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(745, 3, '(719) 636-9341', NULL, NULL, NULL, NULL, NULL, 3254, 2569, NULL, '(719) 636-9341', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(746, 3, '(719) 314-9083', NULL, NULL, NULL, NULL, NULL, 1996, 5802, NULL, '(719) 314-9083', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(747, 3, '(210) 275-5997', NULL, NULL, NULL, NULL, NULL, 1312, 2312, NULL, '(210) 275-5997', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(748, 3, '(719) 238-3483', NULL, NULL, NULL, NULL, NULL, 2896, 7424, NULL, '(719) 238-3483', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(749, 3, '(719) 930-8043', NULL, NULL, NULL, NULL, NULL, 2203, 6680, NULL, '(719) 930-8043', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(751, 3, '(417) 209-9027', NULL, NULL, NULL, NULL, NULL, 8292, 6887, NULL, '(417) 209-9027', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(752, 3, '(303) 972-7786', NULL, NULL, NULL, NULL, NULL, 3163, 4586, NULL, '(303) 972-7786', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(753, 3, '(850) 623-3677', NULL, NULL, NULL, NULL, NULL, 5519, 3839, NULL, '(850) 623-3677', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(754, 3, '(719) 964-8683', NULL, NULL, NULL, NULL, NULL, 4028, 8451, NULL, '(719) 964-8683', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(755, 3, '(719) 287-9584', NULL, NULL, NULL, NULL, NULL, 8488, 2080, NULL, '(719) 287-9584', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(756, 3, '(720) 283-8859', NULL, NULL, NULL, NULL, NULL, 2023, 2549, NULL, '(720) 283-8859', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(757, 3, '(303) 549-0207', NULL, NULL, NULL, NULL, NULL, 7974, 6630, NULL, '(303) 549-0207', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(758, 3, '(720) 938-5726', NULL, NULL, NULL, NULL, NULL, 6273, 8027, NULL, '(720) 938-5726', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(759, 3, '(760) 703-2496', NULL, NULL, NULL, NULL, NULL, 3312, 5028, NULL, '(760) 703-2496', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(760, 3, '(303) 829-2492', NULL, NULL, NULL, NULL, NULL, 6076, 5938, NULL, '(303) 829-2492', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(761, 3, '(303) 842-4366', NULL, NULL, NULL, NULL, NULL, 4443, 8489, NULL, '(303) 842-4366', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(762, 3, '(719) 650-8353', NULL, NULL, NULL, NULL, NULL, 5427, 4824, NULL, '(719) 650-8353', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(763, 3, '(719) 475-7224', NULL, NULL, NULL, NULL, NULL, 2134, 5082, NULL, '(719) 475-7224', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(764, 3, '(303) 979-0736', NULL, NULL, NULL, NULL, NULL, 8275, 8147, NULL, '(303) 979-0736', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(765, 3, '(404) 403-5163', NULL, NULL, NULL, NULL, NULL, 7133, 6766, NULL, '(404) 403-5163', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(766, 3, '(405) 905-9430', NULL, NULL, NULL, NULL, NULL, 3812, 8406, NULL, '(405) 905-9430', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(767, 3, '(719) 229-9425', NULL, NULL, NULL, NULL, NULL, 1956, 1770, NULL, '(719) 229-9425', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(768, 3, '(719) 229-5863', NULL, NULL, NULL, NULL, NULL, 3859, 8772, NULL, '(719) 229-5863', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(769, 3, '(719) 597-2495', NULL, NULL, NULL, NULL, NULL, 6541, 2082, NULL, '(719) 597-2495', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(770, 3, '(719) 597-2495', NULL, NULL, NULL, NULL, NULL, 3788, 9709, NULL, '(719) 597-2495', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(771, 3, '(720) 938-6480', NULL, NULL, NULL, NULL, NULL, 3822, 8001, NULL, '(720) 938-6480', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(772, 3, '(303) 885-0455', NULL, NULL, NULL, NULL, NULL, 6467, 3455, NULL, '(303) 885-0455', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(773, 3, '(303) 589-6458', NULL, NULL, NULL, NULL, NULL, 7405, 5570, NULL, '(303) 589-6458', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(775, 3, '(303) 589-6458', NULL, NULL, NULL, NULL, NULL, 5552, 1198, NULL, '(303) 589-6458', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(776, 3, '(719) 510-2811', NULL, NULL, NULL, NULL, NULL, 2144, 6903, NULL, '(719) 510-2811', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(777, 3, '(719) 237-0301', NULL, NULL, NULL, NULL, NULL, 4623, 7009, NULL, '(719) 237-0301', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(778, 3, '(719) 685-4110', NULL, NULL, NULL, NULL, NULL, 3615, 3472, NULL, '(719) 685-4110', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(779, 3, '(719) 237-0301', NULL, NULL, NULL, NULL, NULL, 4584, 9119, NULL, '(719) 237-0301', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(780, 3, '(303) 912-3147', NULL, NULL, NULL, NULL, NULL, 5607, 8665, NULL, '(303) 912-3147', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(781, 3, '(719) 466-1536', NULL, NULL, NULL, NULL, NULL, 3995, 2575, NULL, '(719) 466-1536', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(782, 3, '(303) 525-5506', NULL, NULL, NULL, NULL, NULL, 8436, 6251, NULL, '(303) 525-5506', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(783, 3, '(719) 491-2012', NULL, NULL, NULL, NULL, NULL, 8120, 3316, NULL, '(719) 491-2012', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(784, 3, '(719) 271-0950', NULL, NULL, NULL, NULL, NULL, 3893, 9740, NULL, '(719) 271-0950', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(785, 3, '(303) 910-5008', NULL, NULL, NULL, NULL, NULL, 2765, 4677, NULL, '(303) 910-5008', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(786, 3, '(303) 204-9525', NULL, NULL, NULL, NULL, NULL, 6560, 8438, NULL, '(303) 204-9525', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(787, 3, '(719) 964-5440', NULL, NULL, NULL, NULL, NULL, 8848, 3685, NULL, '(719) 964-5440', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(788, 3, '(913) 904-6222', NULL, NULL, NULL, NULL, NULL, 5488, 7230, NULL, '(913) 904-6222', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(789, 3, '(303) 912-1578', NULL, NULL, NULL, NULL, NULL, 7607, 7965, NULL, '(303) 912-1578', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(790, 3, '(323) 652-0300', NULL, NULL, NULL, NULL, NULL, 9063, 1281, NULL, '(323) 652-0300', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(791, 3, '(203) 485-0550', NULL, NULL, NULL, NULL, NULL, 2078, 9390, NULL, '(203) 485-0550', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(792, 3, '(303) 518-7929', NULL, NULL, NULL, NULL, NULL, 2383, 3560, NULL, '(303) 518-7929', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(793, 3, '(303) 870-1044', NULL, NULL, NULL, NULL, NULL, 7009, 1043, NULL, '(303) 870-1044', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(794, 3, '(303) 721-9325', NULL, NULL, NULL, NULL, NULL, 6794, 3591, NULL, '(303) 721-9325', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(795, 3, '(303) 507-9325', NULL, NULL, NULL, NULL, NULL, 1687, 6882, NULL, '(303) 507-9325', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(796, 3, '(817) 773-8498', NULL, NULL, NULL, NULL, NULL, 1198, 9341, NULL, '(817) 773-8498', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(797, 3, '(720) 261-6602', NULL, NULL, NULL, NULL, NULL, 2398, 6454, NULL, '(720) 261-6602', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(798, 3, '(719) 599-5374', NULL, NULL, NULL, NULL, NULL, 9791, 7696, NULL, '(719) 599-5374', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(799, 3, '(970) 520-1916', NULL, NULL, NULL, NULL, NULL, 2938, 8392, NULL, '(970) 520-1916', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(800, 3, '(719) 568-6062', NULL, NULL, NULL, NULL, NULL, 4258, 9549, NULL, '(719) 568-6062', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(801, 3, '(719) 568-5110', NULL, NULL, NULL, NULL, NULL, 9151, 9958, NULL, '(719) 568-5110', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(802, 3, '(719) 761-7918', NULL, NULL, NULL, NULL, NULL, 6412, 9261, NULL, '(719) 761-7918', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(803, 3, '(719) 337-5693', NULL, NULL, NULL, NULL, NULL, 5415, 7542, NULL, '(719) 337-5693', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(804, 3, '(719) 510-3116', NULL, NULL, NULL, NULL, NULL, 6193, 4963, NULL, '(719) 510-3116', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(805, 3, '(719) 221-0296', NULL, NULL, NULL, NULL, NULL, 9562, 1361, NULL, '(719) 221-0296', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(807, 3, '(505) 471-3841', NULL, NULL, NULL, NULL, NULL, 6885, 8038, NULL, '(505) 471-3841', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(808, 3, '(719) 473-1846', NULL, NULL, NULL, NULL, NULL, 9557, 1446, NULL, '(719) 473-1846', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(809, 3, '(720) 936-6351', NULL, NULL, NULL, NULL, NULL, 5263, 3662, NULL, '(720) 936-6351', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(810, 3, '(970) 390-8605', NULL, NULL, NULL, NULL, NULL, 3237, 5004, NULL, '(970) 390-8605', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(811, 3, '(303) 881-5556', NULL, NULL, NULL, NULL, NULL, 6016, 2482, NULL, '(303) 881-5556', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(812, 3, '(970) 390-0514', NULL, NULL, NULL, NULL, NULL, 1009, 2529, NULL, '(970) 390-0514', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(813, 3, '(303) 881-5556', NULL, NULL, NULL, NULL, NULL, 2890, 1558, NULL, '(303) 881-5556', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(814, 3, '(719) 440-7321', NULL, NULL, NULL, NULL, NULL, 8794, 1503, NULL, '(719) 440-7321', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(816, 3, '(303) 502-0259', NULL, NULL, NULL, NULL, NULL, 9470, 3388, NULL, '(303) 502-0259', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(818, 3, '(303) 902-8960', NULL, NULL, NULL, NULL, NULL, 6812, 7038, NULL, '(303) 902-8960', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(819, 3, '(303) 524-2117', NULL, NULL, NULL, NULL, NULL, 9336, 1573, NULL, '(303) 524-2117', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(821, 3, '(818) 319-5458', NULL, NULL, NULL, NULL, NULL, 1085, 7477, NULL, '(818) 319-5458', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(822, 3, '(210) 563-1197', NULL, NULL, NULL, NULL, NULL, 4358, 6682, NULL, '(210) 563-1197', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(824, 3, '(719) 229-0120', NULL, NULL, NULL, NULL, NULL, 2284, 5845, NULL, '(719) 229-0120', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(825, 3, '(719) 597-0848', NULL, NULL, NULL, NULL, NULL, 2214, 2094, NULL, '(719) 597-0848', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(826, 3, '(719) 963-5658', NULL, NULL, NULL, NULL, NULL, 1932, 5122, NULL, '(719) 963-5658', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(827, 3, '(719) 459-5227', NULL, NULL, NULL, NULL, NULL, 4542, 7664, NULL, '(719) 459-5227', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(829, 3, '(808) 990-2433', NULL, NULL, NULL, NULL, NULL, 8753, 4854, NULL, '(808) 990-2433', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(830, 3, '(719) 659-1975', NULL, NULL, NULL, NULL, NULL, 3979, 4866, NULL, '(719) 659-1975', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(831, 3, '(801) 487-6735', NULL, NULL, NULL, NULL, NULL, 3587, 5188, NULL, '(801) 487-6735', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(832, 3, '(720) 284-8492', NULL, NULL, NULL, NULL, NULL, 8601, 3024, NULL, '(720) 284-8492', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(833, 3, '(303) 349-0129', NULL, NULL, NULL, NULL, NULL, 8974, 9077, NULL, '(303) 349-0129', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(834, 3, '(303) 204-4211', NULL, NULL, NULL, NULL, NULL, 1172, 7921, NULL, '(303) 204-4211', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(835, 3, '(303) 249-1977', NULL, NULL, NULL, NULL, NULL, 6798, 5200, NULL, '(303) 249-1977', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(838, 3, '(970) 345-6643', NULL, NULL, NULL, NULL, NULL, 4056, 3590, NULL, '(970) 345-6643', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(839, 3, '(719) 660-5019', NULL, NULL, NULL, NULL, NULL, 9060, 8205, NULL, '(719) 660-5019', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(840, 3, '(719) 360-6059', NULL, NULL, NULL, NULL, NULL, 5100, 9239, NULL, '(719) 360-6059', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"3\"]'),
(841, 3, '(949) 285-6034', NULL, NULL, NULL, NULL, NULL, 7608, 1660, NULL, '(949) 285-6034', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(842, 3, '(719) 661-2997', NULL, NULL, NULL, NULL, NULL, 3702, 7866, NULL, '(719) 661-2997', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(843, 3, '(805) 660-9409', NULL, NULL, NULL, NULL, NULL, 3208, 5202, NULL, '(805) 660-9409', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(844, 3, '(720) 281-7322', NULL, NULL, NULL, NULL, NULL, 1865, 6022, NULL, '(720) 281-7322', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(845, 3, '(303) 910-8925', NULL, NULL, NULL, NULL, NULL, 1576, 9367, NULL, '(303) 910-8925', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(846, 3, '(720) 281-7322', NULL, NULL, NULL, NULL, NULL, 4694, 2519, NULL, '(720) 281-7322', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(847, 3, '(303) 910-8925', NULL, NULL, NULL, NULL, NULL, 4312, 2862, NULL, '(303) 910-8925', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(848, 3, '(719) 649-4094', NULL, NULL, NULL, NULL, NULL, 5692, 7335, NULL, '(719) 649-4094', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(849, 3, '(719) 661-1686', NULL, NULL, NULL, NULL, NULL, 1847, 3325, NULL, '(719) 661-1686', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(850, 3, '(719) 210-2214', NULL, NULL, NULL, NULL, NULL, 9289, 7291, NULL, '(719) 210-2214', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(851, 3, '(303) 740-8183', NULL, NULL, NULL, NULL, NULL, 1598, 9079, NULL, '(303) 740-8183', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(852, 3, '(307) 214-9929', NULL, NULL, NULL, NULL, NULL, 3980, 4311, NULL, '(307) 214-9929', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(853, 3, '(719) 205-5281', NULL, NULL, NULL, NULL, NULL, 6959, 5407, NULL, '(719) 205-5281', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(854, 3, '(719) 205-5330', NULL, NULL, NULL, NULL, NULL, 7329, 6547, NULL, '(719) 205-5330', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(855, 3, '(719) 205-5281', NULL, NULL, NULL, NULL, NULL, 9587, 1690, NULL, '(719) 205-5281', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(856, 3, '(469) 235-6835', NULL, NULL, NULL, NULL, NULL, 5754, 6650, NULL, '(469) 235-6835', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(857, 3, '(760) 613-3142', NULL, NULL, NULL, NULL, NULL, 5905, 7031, NULL, '(760) 613-3142', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(858, 3, '(719) 649-1678', NULL, NULL, NULL, NULL, NULL, 6558, 2561, NULL, '(719) 649-1678', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(859, 3, '(719) 291-4066', NULL, NULL, NULL, NULL, NULL, 6621, 1812, NULL, '(719) 291-4066', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(861, 3, '(719) 217-8667', NULL, NULL, NULL, NULL, NULL, 4211, 3634, NULL, '(719) 217-8667', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(862, 3, '(719) 661-2254', NULL, NULL, NULL, NULL, NULL, 6122, 1424, NULL, '(719) 661-2254', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(863, 3, '(719) 217-8667', NULL, NULL, NULL, NULL, NULL, 1252, 1990, NULL, '(719) 217-8667', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(864, 3, '(719) 287-3992', NULL, NULL, NULL, NULL, NULL, 1034, 4444, NULL, '(719) 287-3992', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(865, 3, '(719) 469-2269', NULL, NULL, NULL, NULL, NULL, 9662, 5186, NULL, '(719) 469-2269', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(866, 3, '(561) 266-8971', NULL, NULL, NULL, NULL, NULL, 5559, 6800, NULL, '(561) 266-8971', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(867, 3, '(262) 574-9256', NULL, NULL, NULL, NULL, NULL, 6963, 9838, NULL, '(262) 574-9256', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(869, 3, '(720) 280-9410', NULL, NULL, NULL, NULL, NULL, 3092, 1839, NULL, '(720) 280-9410', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(870, 3, '(303) 832-9767', NULL, NULL, NULL, NULL, NULL, 3086, 1566, NULL, '(303) 832-9767', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(871, 3, '(720) 609-6321', NULL, NULL, NULL, NULL, NULL, 4642, 1340, NULL, '(720) 609-6321', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"3\"]'),
(872, 3, '(303) 514-4561', NULL, NULL, NULL, NULL, NULL, 4240, 2362, NULL, '(303) 514-4561', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(873, 3, '(720) 266-7783', NULL, NULL, NULL, NULL, NULL, 8721, 2169, NULL, '(720) 266-7783', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(874, 3, '(303) 885-4778', NULL, NULL, NULL, NULL, NULL, 6908, 2840, NULL, '(303) 885-4778', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(875, 3, '(415) 389-6632', NULL, NULL, NULL, NULL, NULL, 2641, 1857, NULL, '(415) 389-6632', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(876, 3, '(303) 929-3301', NULL, NULL, NULL, NULL, NULL, 4830, 7516, NULL, '(303) 929-3301', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(877, 3, '(720) 251-3772', NULL, NULL, NULL, NULL, NULL, 8786, 3681, NULL, '(720) 251-3772', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(879, 3, '(719) 330-2443', NULL, NULL, NULL, NULL, NULL, 7468, 7442, NULL, '(719) 330-2443', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(880, 3, '(719) 634-1043', NULL, NULL, NULL, NULL, NULL, 3870, 9544, NULL, '(719) 634-1043', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(882, 3, '(719) 632-8318', NULL, NULL, NULL, NULL, NULL, 1891, 5322, NULL, '(719) 632-8318', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(883, 3, '(719) 271-5488', NULL, NULL, NULL, NULL, NULL, 4976, 3712, NULL, '(719) 271-5488', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(884, 3, '(719) 528-8597', NULL, NULL, NULL, NULL, NULL, 5875, 4516, NULL, '(719) 528-8597', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(885, 3, '(719) 337-6155', NULL, NULL, NULL, NULL, NULL, 1559, 2535, NULL, '(719) 337-6155', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(886, 3, '(719) 495-2467', NULL, NULL, NULL, NULL, NULL, 3502, 2597, NULL, '(719) 495-2467', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(887, 3, '(954) 461-5535', NULL, NULL, NULL, NULL, NULL, 7093, 2920, NULL, '(954) 461-5535', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(888, 3, '(719) 306-8859', NULL, NULL, NULL, NULL, NULL, 6450, 8281, NULL, '(719) 306-8859', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(890, 3, '(503) 703-8718', NULL, NULL, NULL, NULL, NULL, 3186, 3166, NULL, '(503) 703-8718', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(891, 3, '(720) 732-0294', NULL, NULL, NULL, NULL, NULL, 5276, 4949, NULL, '(720) 732-0294', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(892, 3, '(719) 460-9957', NULL, NULL, NULL, NULL, NULL, 8186, 2083, NULL, '(719) 460-9957', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(893, 3, '(707) 567-8035', NULL, NULL, NULL, NULL, NULL, 8575, 1964, NULL, '(707) 567-8035', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(894, 3, '(303) 912-7904', NULL, NULL, NULL, NULL, NULL, 4660, 3427, NULL, '(303) 912-7904', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(895, 3, '(303) 365-2183', NULL, NULL, NULL, NULL, NULL, 1583, 3842, NULL, '(303) 365-2183', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(896, 3, '(719) 339-0663', NULL, NULL, NULL, NULL, NULL, 7235, 5389, NULL, '(719) 339-0663', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(897, 3, '(703) 568-5078', NULL, NULL, NULL, NULL, NULL, 4111, 8164, NULL, '(703) 568-5078', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(898, 3, '(703) 568-5078', NULL, NULL, NULL, NULL, NULL, 7899, 7971, NULL, '(703) 568-5078', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(899, 3, '(719) 209-6226', NULL, NULL, NULL, NULL, NULL, 5273, 9000, NULL, '(719) 209-6226', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(900, 3, '(703) 250-4878', NULL, NULL, NULL, NULL, NULL, 2488, 8678, NULL, '(703) 250-4878', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(901, 3, '(515) 971-4274', NULL, NULL, NULL, NULL, NULL, 9610, 5720, NULL, '(515) 971-4274', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(902, 3, '(719) 651-1239', NULL, NULL, NULL, NULL, NULL, 4318, 5545, NULL, '(719) 651-1239', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(903, 3, '(303) 842-7371', NULL, NULL, NULL, NULL, NULL, 8001, 5624, NULL, '(303) 842-7371', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(904, 3, '(719) 237-9278', NULL, NULL, NULL, NULL, NULL, 1927, 3581, NULL, '(719) 237-9278', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(905, 3, '(719) 237-9277', NULL, NULL, NULL, NULL, NULL, 7050, 2731, NULL, '(719) 237-9277', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(906, 3, '(303) 887-8375', NULL, NULL, NULL, NULL, NULL, 7223, 8382, NULL, '(303) 887-8375', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(907, 3, '(970) 988-3912', NULL, NULL, NULL, NULL, NULL, 1328, 8146, NULL, '(970) 988-3912', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(908, 3, '(719) 778-5707', NULL, NULL, NULL, NULL, NULL, 6177, 8378, NULL, '(719) 778-5707', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(909, 3, '(719) 543-8113', NULL, NULL, NULL, NULL, NULL, 1399, 5131, NULL, '(719) 543-8113', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(911, 3, '(719) 332-3908', NULL, NULL, NULL, NULL, NULL, 7686, 9959, NULL, '(719) 332-3908', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(912, 3, '(719) 492-4259', NULL, NULL, NULL, NULL, NULL, 5588, 8000, NULL, '(719) 492-4259', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(913, 3, '(719) 332-3908', NULL, NULL, NULL, NULL, NULL, 6291, 9739, NULL, '(719) 332-3908', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(915, 3, '(720) 810-6306', NULL, NULL, NULL, NULL, NULL, 4455, 9791, NULL, '(720) 810-6306', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(916, 3, '(720) 371-8624', NULL, NULL, NULL, NULL, NULL, 1327, 9714, NULL, '(720) 371-8624', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(917, 3, '(719) 339-1511', NULL, NULL, NULL, NULL, NULL, 1803, 1742, NULL, '(719) 339-1511', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(918, 3, '(719) 963-9890', NULL, NULL, NULL, NULL, NULL, 6358, 8897, NULL, '(719) 963-9890', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(919, 3, '(719) 210-0600', NULL, NULL, NULL, NULL, NULL, 6232, 4116, NULL, '(719) 210-0600', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(920, 3, '(719) 963-9804', NULL, NULL, NULL, NULL, NULL, 8912, 8314, NULL, '(719) 963-9804', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(921, 3, '(719) 963-9890', NULL, NULL, NULL, NULL, NULL, 1831, 5546, NULL, '(719) 963-9890', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(922, 3, '(719) 210-0600', NULL, NULL, NULL, NULL, NULL, 7597, 7870, NULL, '(719) 210-0600', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(924, 3, '(719) 313-1377', NULL, NULL, NULL, NULL, NULL, 4860, 7467, NULL, '(719) 313-1377', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(925, 3, '(719) 640-8173', NULL, NULL, NULL, NULL, NULL, 9781, 6711, NULL, '(719) 640-8173', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(926, 3, '(719) 659-3767', NULL, NULL, NULL, NULL, NULL, 6691, 4925, NULL, '(719) 659-3767', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(927, 3, '(719) 659-6672', NULL, NULL, NULL, NULL, NULL, 2233, 4627, NULL, '(719) 659-6672', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(928, 3, '(719) 661-1885', NULL, NULL, NULL, NULL, NULL, 5705, 1431, NULL, '(719) 661-1885', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(929, 3, '(719) 661-8191', NULL, NULL, NULL, NULL, NULL, 3567, 6172, NULL, '(719) 661-8191', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(930, 3, '(720) 219-2980', NULL, NULL, NULL, NULL, NULL, 4166, 9266, NULL, '(720) 219-2980', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(931, 3, '(609) 443-6083', NULL, NULL, NULL, NULL, NULL, 4167, 4862, NULL, '(609) 443-6083', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(932, 3, '(719) 216-2048', NULL, NULL, NULL, NULL, NULL, 7278, 7735, NULL, '(719) 216-2048', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(933, 3, '(719) 337-8753', NULL, NULL, NULL, NULL, NULL, 3541, 6994, NULL, '(719) 337-8753', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(934, 3, '(719) 650-3002', NULL, NULL, NULL, NULL, NULL, 9734, 3217, NULL, '(719) 650-3002', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(935, 3, '(719) 548-9177', NULL, NULL, NULL, NULL, NULL, 1052, 9260, NULL, '(719) 548-9177', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(936, 3, '(719) 687-5104', NULL, NULL, NULL, NULL, NULL, 2473, 4788, NULL, '(719) 687-5104', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(937, 3, '(719) 687-5104', NULL, NULL, NULL, NULL, NULL, 7675, 4462, NULL, '(719) 687-5104', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]');
INSERT INTO `patient_details` (`pid`, `lid`, `fname`, `lname`, `dob`, `admitteddate`, `release`, `outcome`, `ssn`, `pinno`, `email`, `mobile`, `insurance_id`, `code`, `code_date`, `patient_carrier`, `fac_id`, `type`, `units`) VALUES
(938, 3, '(650) 223-9426', NULL, NULL, NULL, NULL, NULL, 2052, 4155, NULL, '(650) 223-9426', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(940, 3, '(303) 523-6742', NULL, NULL, NULL, NULL, NULL, 8922, 9779, NULL, '(303) 523-6742', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(941, 3, '(719) 332-6556', NULL, NULL, NULL, NULL, NULL, 4469, 1511, NULL, '(719) 332-6556', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(942, 3, '(719) 821-8933', NULL, NULL, NULL, NULL, NULL, 9775, 2552, NULL, '(719) 821-8933', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(944, 3, '(719) 597-3934', NULL, NULL, NULL, NULL, NULL, 7918, 1900, NULL, '(719) 597-3934', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(945, 3, '(719) 351-0431', NULL, NULL, NULL, NULL, NULL, 5750, 8431, NULL, '(719) 351-0431', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(946, 3, '(719) 650-1649', NULL, NULL, NULL, NULL, NULL, 7824, 1448, NULL, '(719) 650-1649', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(947, 3, '(719) 466-0322', NULL, NULL, NULL, NULL, NULL, 9223, 6616, NULL, '(719) 466-0322', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(948, 3, '(405) 831-3563', NULL, NULL, NULL, NULL, NULL, 2864, 7839, NULL, '(405) 831-3563', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(949, 3, '(719) 948-1911', NULL, NULL, NULL, NULL, NULL, 7071, 1068, NULL, '(719) 948-1911', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(950, 3, '(720) 731-9399', NULL, NULL, NULL, NULL, NULL, 8913, 7504, NULL, '(720) 731-9399', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(951, 3, '(303) 697-8454', NULL, NULL, NULL, NULL, NULL, 4420, 1497, NULL, '(303) 697-8454', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(952, 3, '(720) 277-7195', NULL, NULL, NULL, NULL, NULL, 1934, 8587, NULL, '(720) 277-7195', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(953, 3, '(303) 332-6630', NULL, NULL, NULL, NULL, NULL, 3833, 9301, NULL, '(303) 332-6630', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(954, 3, '(303) 261-5294', NULL, NULL, NULL, NULL, NULL, 6968, 4178, NULL, '(303) 261-5294', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(955, 3, '(615) 496-6673', NULL, NULL, NULL, NULL, NULL, 5104, 3040, NULL, '(615) 496-6673', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(956, 3, '(719) 287-6477', NULL, NULL, NULL, NULL, NULL, 8990, 3895, NULL, '(719) 287-6477', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(957, 3, '(414) 732-7099', NULL, NULL, NULL, NULL, NULL, 4003, 8289, NULL, '(414) 732-7099', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(958, 3, '(719) 460-8182', NULL, NULL, NULL, NULL, NULL, 8359, 9392, NULL, '(719) 460-8182', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(960, 3, '(203) 733-5225', NULL, NULL, NULL, NULL, NULL, 4829, 6940, NULL, '(203) 733-5225', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(961, 3, '(303) 975-6266', NULL, NULL, NULL, NULL, NULL, 8623, 8429, NULL, '(303) 975-6266', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(962, 3, '(303) 718-7273', NULL, NULL, NULL, NULL, NULL, 2876, 3582, NULL, '(303) 718-7273', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(963, 3, '(719) 332-8776', NULL, NULL, NULL, NULL, NULL, 3501, 4829, NULL, '(719) 332-8776', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(964, 3, '(719) 439-9602', NULL, NULL, NULL, NULL, NULL, 8430, 2838, NULL, '(719) 439-9602', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(966, 3, '(303) 250-2318', NULL, NULL, NULL, NULL, NULL, 1433, 7902, NULL, '(303) 250-2318', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(967, 3, '(830) 630-0050', NULL, NULL, NULL, NULL, NULL, 5482, 3961, NULL, '(830) 630-0050', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(969, 3, '(719) 460-6161', NULL, NULL, NULL, NULL, NULL, 5621, 1534, NULL, '(719) 460-6161', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(970, 3, '(719) 460-6363', NULL, NULL, NULL, NULL, NULL, 1966, 4581, NULL, '(719) 460-6363', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(972, 3, '(719) 360-2378', NULL, NULL, NULL, NULL, NULL, 7269, 8390, NULL, '(719) 360-2378', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(973, 3, '(702) 415-9742', NULL, NULL, NULL, NULL, NULL, 7366, 7851, NULL, '(702) 415-9742', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(974, 3, '(303) 901-0181', NULL, NULL, NULL, NULL, NULL, 8201, 9848, NULL, '(303) 901-0181', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(975, 3, '(303) 435-7037', NULL, NULL, NULL, NULL, NULL, 3807, 7766, NULL, '(303) 435-7037', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(976, 3, '(305) 984-1029', NULL, NULL, NULL, NULL, NULL, 8709, 5547, NULL, '(305) 984-1029', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(977, 3, '(719) 347-2979', NULL, NULL, NULL, NULL, NULL, 5496, 4054, NULL, '(719) 347-2979', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(978, 3, '(719) 371-2347', NULL, NULL, NULL, NULL, NULL, 3189, 6154, NULL, '(719) 371-2347', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(979, 3, '(720) 244-4887', NULL, NULL, NULL, NULL, NULL, 9182, 3810, NULL, '(720) 244-4887', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(980, 3, '(719) 246-3274', NULL, NULL, NULL, NULL, NULL, 4655, 2091, NULL, '(719) 246-3274', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(981, 3, '(719) 330-7457', NULL, NULL, NULL, NULL, NULL, 6455, 5107, NULL, '(719) 330-7457', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(983, 3, '(719) 821-0590', NULL, NULL, NULL, NULL, NULL, 6696, 5890, NULL, '(719) 821-0590', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(984, 3, '(719) 330-4415', NULL, NULL, NULL, NULL, NULL, 2155, 6953, NULL, '(719) 330-4415', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(985, 3, '(303) 909-6907', NULL, NULL, NULL, NULL, NULL, 3802, 4537, NULL, '(303) 909-6907', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(986, 3, '(303) 909-8799', NULL, NULL, NULL, NULL, NULL, 2751, 2505, NULL, '(303) 909-8799', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(988, 3, '(760) 518-3740', NULL, NULL, NULL, NULL, NULL, 3063, 7811, NULL, '(760) 518-3740', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(989, 3, '(719) 337-0696', NULL, NULL, NULL, NULL, NULL, 9785, 8886, NULL, '(719) 337-0696', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(990, 3, '(720) 984-8207', NULL, NULL, NULL, NULL, NULL, 9252, 5711, NULL, '(720) 984-8207', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(992, 3, '(918) 810-7522', NULL, NULL, NULL, NULL, NULL, 4402, 8017, NULL, '(918) 810-7522', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(993, 3, '(760) 803-9007', NULL, NULL, NULL, NULL, NULL, 9727, 4366, NULL, '(760) 803-9007', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(994, 3, '(425) 968-5954', NULL, NULL, NULL, NULL, NULL, 2772, 9564, NULL, '(425) 968-5954', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(995, 3, '(719) 481-3975', NULL, NULL, NULL, NULL, NULL, 5616, 2642, NULL, '(719) 481-3975', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(996, 3, '(720) 941-2074', NULL, NULL, NULL, NULL, NULL, 2451, 3927, NULL, '(720) 941-2074', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(997, 3, '(719) 238-4650', NULL, NULL, NULL, NULL, NULL, 9202, 6850, NULL, '(719) 238-4650', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(998, 3, '(303) 504-0204', NULL, NULL, NULL, NULL, NULL, 4847, 2723, NULL, '(303) 504-0204', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(999, 3, '(720) 747-5541', NULL, NULL, NULL, NULL, NULL, 8534, 5184, NULL, '(720) 747-5541', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(1000, 3, '(303) 504-0204', NULL, NULL, NULL, NULL, NULL, 2609, 4420, NULL, '(303) 504-0204', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1001, 3, '(720) 747-5541', NULL, NULL, NULL, NULL, NULL, 1249, 2328, NULL, '(720) 747-5541', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(1004, 3, '(303) 898-3937', NULL, NULL, NULL, NULL, NULL, 1525, 8470, NULL, '(303) 898-3937', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1005, 3, '(303) 616-9505', NULL, NULL, NULL, NULL, NULL, 7731, 1353, NULL, '(303) 616-9505', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1006, 3, '(503) 680-3635', NULL, NULL, NULL, NULL, NULL, 9434, 6826, NULL, '(503) 680-3635', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1007, 3, '(719) 641-7899', NULL, NULL, NULL, NULL, NULL, 7773, 1259, NULL, '(719) 641-7899', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1008, 3, '(303) 332-6213', NULL, NULL, NULL, NULL, NULL, 1758, 7786, NULL, '(303) 332-6213', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1009, 3, '(925) 858-6646', NULL, NULL, NULL, NULL, NULL, 1722, 9305, NULL, '(925) 858-6646', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1010, 3, '(719) 660-5511', NULL, NULL, NULL, NULL, NULL, 3321, 2015, NULL, '(719) 660-5511', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1011, 3, '(719) 660-5572', NULL, NULL, NULL, NULL, NULL, 7293, 7245, NULL, '(719) 660-5572', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1012, 3, '(719) 332-9156', NULL, NULL, NULL, NULL, NULL, 8246, 5232, NULL, '(719) 332-9156', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1013, 3, '(619) 307-0789', NULL, NULL, NULL, NULL, NULL, 3808, 3644, NULL, '(619) 307-0789', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1014, 3, '(303) 564-8189', NULL, NULL, NULL, NULL, NULL, 4336, 1877, NULL, '(303) 564-8189', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(1015, 3, '(720) 218-8351', NULL, NULL, NULL, NULL, NULL, 6704, 8817, NULL, '(720) 218-8351', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1016, 3, '(920) 257-7314', NULL, NULL, NULL, NULL, NULL, 8737, 3460, NULL, '(920) 257-7314', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1017, 3, '(719) 337-3128', NULL, NULL, NULL, NULL, NULL, 5352, 7753, NULL, '(719) 337-3128', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1018, 3, '(303) 263-1510', NULL, NULL, NULL, NULL, NULL, 9504, 3708, NULL, '(303) 263-1510', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1019, 3, '(719) 390-6934', NULL, NULL, NULL, NULL, NULL, 7350, 5687, NULL, '(719) 390-6934', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1020, 3, '(646) 229-0848', NULL, NULL, NULL, NULL, NULL, 2931, 5950, NULL, '(646) 229-0848', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1021, 3, '(404) 447-2070', NULL, NULL, NULL, NULL, NULL, 3844, 6933, NULL, '(404) 447-2070', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1022, 3, '(719) 205-3718', NULL, NULL, NULL, NULL, NULL, 3069, 1030, NULL, '(719) 205-3718', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1023, 3, '(719) 473-2773', NULL, NULL, NULL, NULL, NULL, 7352, 6056, NULL, '(719) 473-2773', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(1024, 3, '(719) 205-3718', NULL, NULL, NULL, NULL, NULL, 9795, 9447, NULL, '(719) 205-3718', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1025, 3, '(719) 473-2773', NULL, NULL, NULL, NULL, NULL, 1796, 6333, NULL, '(719) 473-2773', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(1027, 3, '(719) 331-4513', NULL, NULL, NULL, NULL, NULL, 5746, 9603, NULL, '(719) 331-4513', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1028, 3, '(303) 809-2178', NULL, NULL, NULL, NULL, NULL, 8682, 3379, NULL, '(303) 809-2178', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1029, 3, '(719) 238-8605', NULL, NULL, NULL, NULL, NULL, 6009, 1729, NULL, '(719) 238-8605', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1030, 3, '(805) 895-2035', NULL, NULL, NULL, NULL, NULL, 2322, 9840, NULL, '(805) 895-2035', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1031, 3, '(719) 499-2699', NULL, NULL, NULL, NULL, NULL, 3060, 8237, NULL, '(719) 499-2699', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1032, 3, '(719) 459-7451', NULL, NULL, NULL, NULL, NULL, 7247, 7653, NULL, '(719) 459-7451', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1033, 3, '(719) 661-3406', NULL, NULL, NULL, NULL, NULL, 6476, 7541, NULL, '(719) 661-3406', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1034, 3, '(719) 332-0511', NULL, NULL, NULL, NULL, NULL, 2406, 5505, NULL, '(719) 332-0511', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1036, 3, '(719) 266-9809', NULL, NULL, NULL, NULL, NULL, 6917, 3464, NULL, '(719) 266-9809', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1037, 3, '(661) 993-8993', NULL, NULL, NULL, NULL, NULL, 3820, 9887, NULL, '(661) 993-8993', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1038, 3, '(719) 290-3528', NULL, NULL, NULL, NULL, NULL, 6764, 7357, NULL, '(719) 290-3528', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1039, 3, '(719) 460-6772', NULL, NULL, NULL, NULL, NULL, 1745, 9982, NULL, '(719) 460-6772', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1040, 3, '(941) 761-3240', NULL, NULL, NULL, NULL, NULL, 1527, 8534, NULL, '(941) 761-3240', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1041, 3, '(303) 520-0705', NULL, NULL, NULL, NULL, NULL, 7190, 2572, NULL, '(303) 520-0705', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1042, 3, '(303) 932-6407', NULL, NULL, NULL, NULL, NULL, 7016, 5063, NULL, '(303) 932-6407', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"3\"]'),
(1043, 3, '(303) 881-2722', NULL, NULL, NULL, NULL, NULL, 9024, 1397, NULL, '(303) 881-2722', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1045, 3, '(720) 839-9103', NULL, NULL, NULL, NULL, NULL, 4811, 7006, NULL, '(720) 839-9103', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1046, 3, '(303) 887-1630', NULL, NULL, NULL, NULL, NULL, 2733, 5370, NULL, '(303) 887-1630', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(1047, 3, '(719) 358-1912', NULL, NULL, NULL, NULL, NULL, 4464, 5594, NULL, '(719) 358-1912', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1048, 3, '(719) 360-8181', NULL, NULL, NULL, NULL, NULL, 7258, 9089, NULL, '(719) 360-8181', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(1049, 3, '(719) 313-3565', NULL, NULL, NULL, NULL, NULL, 1089, 4293, NULL, '(719) 313-3565', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1050, 3, '(719) 488-2311', NULL, NULL, NULL, NULL, NULL, 3494, 8366, NULL, '(719) 488-2311', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1052, 3, '(303) 596-6512', NULL, NULL, NULL, NULL, NULL, 7271, 4634, NULL, '(303) 596-6512', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1053, 3, '(719) 651-9554', NULL, NULL, NULL, NULL, NULL, 2500, 8287, NULL, '(719) 651-9554', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1054, 3, '(805) 229-1784', NULL, NULL, NULL, NULL, NULL, 4325, 4240, NULL, '(805) 229-1784', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(1055, 3, '(719) 481-9520', NULL, NULL, NULL, NULL, NULL, 7443, 5060, NULL, '(719) 481-9520', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1056, 3, '(719) 650-3002', NULL, NULL, NULL, NULL, NULL, 1352, 6100, NULL, '(719) 650-3002', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1057, 3, '(719) 651-2617', NULL, NULL, NULL, NULL, NULL, 6093, 5234, NULL, '(719) 651-2617', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1058, 3, '(214) 927-7006', NULL, NULL, NULL, NULL, NULL, 6586, 3338, NULL, '(214) 927-7006', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1060, 3, '(719) 635-0270', NULL, NULL, NULL, NULL, NULL, 3894, 7189, NULL, '(719) 635-0270', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1061, 3, '(719) 635-0270', NULL, NULL, NULL, NULL, NULL, 3985, 7684, NULL, '(719) 635-0270', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1062, 3, '(719) 360-9286', NULL, NULL, NULL, NULL, NULL, 1376, 6559, NULL, '(719) 360-9286', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1063, 3, '(719) 229-7373', NULL, NULL, NULL, NULL, NULL, 5716, 7661, NULL, '(719) 229-7373', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"3\"]'),
(1064, 3, '(719) 217-7872', NULL, NULL, NULL, NULL, NULL, 7205, 3001, NULL, '(719) 217-7872', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1065, 3, '(719) 339-6337', NULL, NULL, NULL, NULL, NULL, 8609, 8446, NULL, '(719) 339-6337', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1066, 3, '(719) 930-2822', NULL, NULL, NULL, NULL, NULL, 6789, 5809, NULL, '(719) 930-2822', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1067, 3, '(719) 216-6080', NULL, NULL, NULL, NULL, NULL, 2026, 9257, NULL, '(719) 216-6080', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1068, 3, '(303) 921-9083', NULL, NULL, NULL, NULL, NULL, 1785, 7841, NULL, '(303) 921-9083', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1069, 3, '(239) 592-1220', NULL, NULL, NULL, NULL, NULL, 8696, 8497, NULL, '(239) 592-1220', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1070, 3, '(303) 921-9083', NULL, NULL, NULL, NULL, NULL, 3009, 4821, NULL, '(303) 921-9083', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1071, 3, '(239) 592-1220', NULL, NULL, NULL, NULL, NULL, 6456, 1312, NULL, '(239) 592-1220', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1074, 3, '(719) 640-8673', NULL, NULL, NULL, NULL, NULL, 4181, 5146, NULL, '(719) 640-8673', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1075, 3, '(719) 459-5096', NULL, NULL, NULL, NULL, NULL, 7568, 9067, NULL, '(719) 459-5096', NULL, NULL, NULL, '', '1', 'ambassador', '[\"3\"]'),
(1076, 3, '(719) 213-3670', NULL, NULL, NULL, NULL, NULL, 1693, 4986, NULL, '(719) 213-3670', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1078, 3, '(720) 951-0475', NULL, NULL, NULL, NULL, NULL, 2321, 8997, NULL, '(720) 951-0475', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1079, 3, '(940) 704-2701', NULL, NULL, NULL, NULL, NULL, 4174, 6516, NULL, '(940) 704-2701', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1080, 3, '(940) 781-6018', NULL, NULL, NULL, NULL, NULL, 8795, 2871, NULL, '(940) 781-6018', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"3\"]'),
(1081, 4, '5880', NULL, NULL, NULL, NULL, NULL, 4104, 6403, NULL, '(970) 282-1321', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1082, 4, '4093', NULL, NULL, NULL, NULL, NULL, 5986, 6171, NULL, '(970) 820-7172', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"4\"]'),
(1083, 4, '4574', NULL, NULL, NULL, NULL, NULL, 3432, 8407, NULL, '(970) 266-2527', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1084, 4, '4156', NULL, NULL, NULL, NULL, NULL, 1980, 4646, NULL, '(970) 225-6380', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1085, 4, '4117', NULL, NULL, NULL, NULL, NULL, 4902, 4113, NULL, '(970) 217-3297', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1086, 4, '5597', NULL, NULL, NULL, NULL, NULL, 2845, 4202, NULL, '(970) 686-7507', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1088, 4, '4932', NULL, NULL, NULL, NULL, NULL, 8268, 1005, NULL, '(970) 449-5540', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1090, 4, '1813', NULL, NULL, NULL, NULL, NULL, 6957, 5250, NULL, '(970) 484-8437', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1093, 4, '4124', NULL, NULL, NULL, NULL, NULL, 8365, 4754, NULL, '(970) 223-3827', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1094, 4, '4088', NULL, NULL, NULL, NULL, NULL, 7014, 5642, NULL, '(970) 631-8743', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1095, 4, '5280', NULL, NULL, NULL, NULL, NULL, 4724, 7385, NULL, '(970) 278-4000', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1096, 4, '1244', NULL, NULL, NULL, NULL, NULL, 9009, 8216, NULL, '(970) 484-2594', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1097, 4, '3003', NULL, NULL, NULL, NULL, NULL, 7264, 3186, NULL, '(720) 855-7269', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1098, 4, '1167', NULL, NULL, NULL, NULL, NULL, 9885, 1429, NULL, '(970) 353-5466', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1099, 4, '3312', NULL, NULL, NULL, NULL, NULL, 2183, 5715, NULL, '(970) 330-6159', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1100, 4, '5274', NULL, NULL, NULL, NULL, NULL, 4349, 2917, NULL, '(888) 992-4464', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1102, 4, '1643', NULL, NULL, NULL, NULL, NULL, 5547, 7560, NULL, '(303) 709-5368', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1104, 4, '5397', NULL, NULL, NULL, NULL, NULL, 7763, 9234, NULL, '(720) 891-3045', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1105, 4, '3885', NULL, NULL, NULL, NULL, NULL, 6430, 7160, NULL, '(970) 352-1487', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1106, 4, '5649', NULL, NULL, NULL, NULL, NULL, 5565, 5172, NULL, '(970) 689-3804', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1107, 4, '5082', NULL, NULL, NULL, NULL, NULL, 2908, 7899, NULL, '(970) 223-3552', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1108, 4, '4635', NULL, NULL, NULL, NULL, NULL, 4493, 6442, NULL, '(970) 308-3118', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1111, 4, '5436', NULL, NULL, NULL, NULL, NULL, 2218, 4405, NULL, '(970) 568-7241', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1112, 4, '3407', NULL, NULL, NULL, NULL, NULL, 5710, 3694, NULL, '(714) 321-2560', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1113, 4, '3476', NULL, NULL, NULL, NULL, NULL, 2915, 8483, NULL, '(970) 484-0614', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1114, 4, '4702', NULL, NULL, NULL, NULL, NULL, 7707, 3828, NULL, '(970) 669-3100', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1115, 4, '5819', NULL, NULL, NULL, NULL, NULL, 4009, 2704, NULL, '(970) 204-1378', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1116, 4, '5988', NULL, NULL, NULL, NULL, NULL, 9045, 9989, NULL, '(970) 377-2355', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1117, 4, '5817', NULL, NULL, NULL, NULL, NULL, 9650, 2990, NULL, '(970) 339-8246', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1118, 4, '5858', NULL, NULL, NULL, NULL, NULL, 2329, 6112, NULL, '(720) 323-3210', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1119, 4, '6166', NULL, NULL, NULL, NULL, NULL, 3505, 1568, NULL, '(970) 226-3170', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1120, 4, '4304', NULL, NULL, NULL, NULL, NULL, 3033, 1385, NULL, '(970) 396-5287', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1121, 4, '5306', NULL, NULL, NULL, NULL, NULL, 3947, 6380, NULL, '(720) 239-1337', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1123, 4, '5312', NULL, NULL, NULL, NULL, NULL, 7934, 2944, NULL, '(970) 226-5017', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1124, 4, '6066', NULL, NULL, NULL, NULL, NULL, 5312, 5972, NULL, '(970) 416-1704', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1125, 4, '(970) 217-3454', NULL, NULL, NULL, NULL, NULL, 4954, 2085, NULL, '(970) 217-3454', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1126, 4, '(970) 310-9790', NULL, NULL, NULL, NULL, NULL, 4710, 6316, NULL, '(970) 310-9790', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1127, 4, '(970) 481-9724', NULL, NULL, NULL, NULL, NULL, 4605, 1494, NULL, '(970) 481-9724', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1129, 4, '(410) 382-0047', NULL, NULL, NULL, NULL, NULL, 2638, 6102, NULL, '(410) 382-0047', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1130, 4, '(206) 353-8500', NULL, NULL, NULL, NULL, NULL, 7513, 4799, NULL, '(206) 353-8500', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1132, 4, '(307) 534-5638', NULL, NULL, NULL, NULL, NULL, 9988, 1605, NULL, '(307) 534-5638', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1133, 4, '(970) 402-5520', NULL, NULL, NULL, NULL, NULL, 8580, 4783, NULL, '(970) 402-5520', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1134, 4, '(970) 545-2213', NULL, NULL, NULL, NULL, NULL, 2764, 9110, NULL, '(970) 545-2213', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"4\"]'),
(1136, 4, '(970) 631-3923', NULL, NULL, NULL, NULL, NULL, 8396, 6885, NULL, '(970) 631-3923', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"4\"]'),
(1139, 4, '(724) 882-6690', NULL, NULL, NULL, NULL, NULL, 6479, 8878, NULL, '(724) 882-6690', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1140, 4, '(970) 219-1909', NULL, NULL, NULL, NULL, NULL, 7276, 7931, NULL, '(970) 219-1909', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1141, 4, '(970) 222-4750', NULL, NULL, NULL, NULL, NULL, 5032, 8832, NULL, '(970) 222-4750', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1142, 4, '(970) 482-4371', NULL, NULL, NULL, NULL, NULL, 6567, 9519, NULL, '(970) 482-4371', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1143, 4, '(970) 988-4221', NULL, NULL, NULL, NULL, NULL, 3862, 8942, NULL, '(970) 988-4221', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1145, 4, '(719) 539-7071', NULL, NULL, NULL, NULL, NULL, 1931, 3751, NULL, '(719) 539-7071', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1147, 4, '(303) 808-9203', NULL, NULL, NULL, NULL, NULL, 2825, 8008, NULL, '(303) 808-9203', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1148, 4, '(303) 638-9968', NULL, NULL, NULL, NULL, NULL, 6649, 2326, NULL, '(303) 638-9968', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"4\"]'),
(1149, 4, '(970) 566-1770', NULL, NULL, NULL, NULL, NULL, 1497, 3150, NULL, '(970) 566-1770', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1150, 4, '(970) 217-8117', NULL, NULL, NULL, NULL, NULL, 8904, 5523, NULL, '(970) 217-8117', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1151, 4, '(303) 237-6490', NULL, NULL, NULL, NULL, NULL, 6847, 7702, NULL, '(303) 237-6490', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1152, 4, '(970) 388-3351', NULL, NULL, NULL, NULL, NULL, 5117, 2842, NULL, '(970) 388-3351', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1153, 4, '(970) 302-5635', NULL, NULL, NULL, NULL, NULL, 7391, 8657, NULL, '(970) 302-5635', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1154, 4, '(970) 590-0613', NULL, NULL, NULL, NULL, NULL, 8647, 1707, NULL, '(970) 590-0613', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1155, 4, '(970) 356-3722', NULL, NULL, NULL, NULL, NULL, 8323, 5751, NULL, '(970) 356-3722', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1156, 4, '(970) 219-7489', NULL, NULL, NULL, NULL, NULL, 1605, 5698, NULL, '(970) 219-7489', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1157, 4, '(970) 663-3290', NULL, NULL, NULL, NULL, NULL, 9477, 4360, NULL, '(970) 663-3290', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1158, 4, '(303) 709-5368', NULL, NULL, NULL, NULL, NULL, 9937, 4506, NULL, '(303) 709-5368', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1159, 4, '(562) 881-2598', NULL, NULL, NULL, NULL, NULL, 8662, 9846, NULL, '(562) 881-2598', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1160, 4, '(303) 452-9564', NULL, NULL, NULL, NULL, NULL, 5897, 6907, NULL, '(303) 452-9564', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"4\"]'),
(1161, 4, '(303) 907-9777', NULL, NULL, NULL, NULL, NULL, 7740, 4393, NULL, '(303) 907-9777', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1162, 4, '(720) 891-3045', NULL, NULL, NULL, NULL, NULL, 2366, 5762, NULL, '(720) 891-3045', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1163, 4, '(303) 601-8862', NULL, NULL, NULL, NULL, NULL, 3545, 1796, NULL, '(303) 601-8862', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1164, 4, '(303) 589-8456', NULL, NULL, NULL, NULL, NULL, 3770, 7788, NULL, '(303) 589-8456', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1165, 4, '(970) 381-6371', NULL, NULL, NULL, NULL, NULL, 1026, 1584, NULL, '(970) 381-6371', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1166, 4, '(970) 381-9440', NULL, NULL, NULL, NULL, NULL, 3014, 2532, NULL, '(970) 381-9440', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1167, 4, '(970) 590-0171', NULL, NULL, NULL, NULL, NULL, 3455, 4156, NULL, '(970) 590-0171', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1168, 4, '(970) 518-0140', NULL, NULL, NULL, NULL, NULL, 3738, 2081, NULL, '(970) 518-0140', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1169, 4, '(970) 689-3804', NULL, NULL, NULL, NULL, NULL, 4534, 1154, NULL, '(970) 689-3804', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1170, 4, '(970) 800-5500', NULL, NULL, NULL, NULL, NULL, 6018, 5784, NULL, '(970) 800-5500', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1171, 4, '(970) 685-9702', NULL, NULL, NULL, NULL, NULL, 5650, 7148, NULL, '(970) 685-9702', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1172, 4, '(970) 203-5761', NULL, NULL, NULL, NULL, NULL, 9246, 1780, NULL, '(970) 203-5761', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1173, 4, '(970) 800-5420', NULL, NULL, NULL, NULL, NULL, 7562, 6853, NULL, '(970) 800-5420', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1174, 4, '(719) 382-0110', NULL, NULL, NULL, NULL, NULL, 5985, 7920, NULL, '(719) 382-0110', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1175, 4, '(970) 214-0579', NULL, NULL, NULL, NULL, NULL, 6204, 5988, NULL, '(970) 214-0579', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1177, 4, '(970) 420-7592', NULL, NULL, NULL, NULL, NULL, 2695, 7933, NULL, '(970) 420-7592', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1178, 4, '(970) 371-7722', NULL, NULL, NULL, NULL, NULL, 7680, 4277, NULL, '(970) 371-7722', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1179, 4, '(303) 601-2987', NULL, NULL, NULL, NULL, NULL, 3165, 4606, NULL, '(303) 601-2987', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1180, 4, '(970) 405-1336', NULL, NULL, NULL, NULL, NULL, 3285, 2188, NULL, '(970) 405-1336', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"4\"]'),
(1182, 4, '(970) 443-2952', NULL, NULL, NULL, NULL, NULL, 3041, 3277, NULL, '(970) 443-2952', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1184, 4, '(970) 590-2417', NULL, NULL, NULL, NULL, NULL, 6293, 5170, NULL, '(970) 590-2417', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1185, 4, '(970) 393-0459', NULL, NULL, NULL, NULL, NULL, 9435, 9804, NULL, '(970) 393-0459', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"4\"]'),
(1186, 4, '(970) 744-0939', NULL, NULL, NULL, NULL, NULL, 7642, 6035, NULL, '(970) 744-0939', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1187, 4, '(970) 214-2695', NULL, NULL, NULL, NULL, NULL, 1347, 3514, NULL, '(970) 214-2695', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1188, 4, '(970) 685-9399', NULL, NULL, NULL, NULL, NULL, 4693, 8373, NULL, '(970) 685-9399', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1189, 4, '(970) 616-2144', NULL, NULL, NULL, NULL, NULL, 5171, 3519, NULL, '(970) 616-2144', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1190, 4, '(720) 323-3210', NULL, NULL, NULL, NULL, NULL, 6384, 7369, NULL, '(720) 323-3210', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1191, 4, '(970) 218-5027', NULL, NULL, NULL, NULL, NULL, 5838, 4729, NULL, '(970) 218-5027', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"4\"]'),
(1192, 4, '(970) 669-3247', NULL, NULL, NULL, NULL, NULL, 1706, 6852, NULL, '(970) 669-3247', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"4\"]'),
(1193, 4, '(970) 392-2915', NULL, NULL, NULL, NULL, NULL, 3370, 2321, NULL, '(970) 392-2915', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1194, 4, '(303) 898-0831', NULL, NULL, NULL, NULL, NULL, 2783, 1838, NULL, '(303) 898-0831', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1195, 4, '(970) 310-0536', NULL, NULL, NULL, NULL, NULL, 3539, 8914, NULL, '(970) 310-0536', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1196, 4, '(970) 800-5500', NULL, NULL, NULL, NULL, NULL, 7465, 4026, NULL, '(970) 800-5500', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1197, 4, '(435) 901-3318', NULL, NULL, NULL, NULL, NULL, 1876, 8049, NULL, '(435) 901-3318', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1198, 4, '(970) 221-1149', NULL, NULL, NULL, NULL, NULL, 1965, 8968, NULL, '(970) 221-1149', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1199, 4, '(970) 222-5338', NULL, NULL, NULL, NULL, NULL, 4119, 5579, NULL, '(970) 222-5338', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"4\"]'),
(1200, 4, '(970) 227-1761', NULL, NULL, NULL, NULL, NULL, 5936, 9777, NULL, '(970) 227-1761', NULL, NULL, NULL, '', '1', 'ambassador', '[\"4\"]'),
(1201, 5, '4174', NULL, NULL, NULL, NULL, NULL, 6969, 9011, NULL, '(248) 930-6723', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1202, 5, '4477', NULL, NULL, NULL, NULL, NULL, 9552, 1367, NULL, '(313) 802-6659', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1203, 5, '5008', NULL, NULL, NULL, NULL, NULL, 8970, 4332, NULL, '(313) 790-3522', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1204, 5, '4022', NULL, NULL, NULL, NULL, NULL, 2387, 2789, NULL, '(313) 828-0931', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1205, 5, '1522', NULL, NULL, NULL, NULL, NULL, 5088, 3737, NULL, '(313) 382-4537', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1206, 5, '2673', NULL, NULL, NULL, NULL, NULL, 3217, 4773, NULL, '(248) 851-6425', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1207, 5, '3266', NULL, NULL, NULL, NULL, NULL, 6981, 8452, NULL, '(248) 636-0657', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1208, 5, '1614', NULL, NULL, NULL, NULL, NULL, 1157, 6203, NULL, '(734) 467-3537', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1209, 5, '3298', NULL, NULL, NULL, NULL, NULL, 4268, 2684, NULL, '(313) 341-2588', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1210, 5, '2727', NULL, NULL, NULL, NULL, NULL, 8833, 2084, NULL, '(248) 625-6958', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1212, 5, '4430', NULL, NULL, NULL, NULL, NULL, 5799, 5475, NULL, '(248) 205-0092', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1214, 5, '2577', NULL, NULL, NULL, NULL, NULL, 4815, 5535, NULL, '(313) 835-8126', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1216, 5, '3685', NULL, NULL, NULL, NULL, NULL, 4489, 6512, NULL, '(586) 549-6544', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1217, 5, '2700', NULL, NULL, NULL, NULL, NULL, 2748, 3963, NULL, '(248) 719-7304', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1218, 5, '5380', NULL, NULL, NULL, NULL, NULL, 5826, 4741, NULL, '(248) 788-1042', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1219, 5, '1059', NULL, NULL, NULL, NULL, NULL, 5664, 8606, NULL, '(313) 220-1123', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1220, 5, '3424', NULL, NULL, NULL, NULL, NULL, 8489, 8507, NULL, '(231) 445-1828', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1221, 5, '2429', NULL, NULL, NULL, NULL, NULL, 3480, 5708, NULL, '(313) 978-2092', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1223, 5, '6218', NULL, NULL, NULL, NULL, NULL, 8458, 7741, NULL, '(734) 576-9976', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1224, 5, '1850', NULL, NULL, NULL, NULL, NULL, 9964, 5007, NULL, '(734) 391-7055', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1225, 5, '3194', NULL, NULL, NULL, NULL, NULL, 4201, 1049, NULL, '(313) 682-1405', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1226, 5, '5474', NULL, NULL, NULL, NULL, NULL, 1740, 6414, NULL, '(248) 574-1179', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1230, 5, '4639', NULL, NULL, NULL, NULL, NULL, 5783, 3167, NULL, '(313) 821-5778', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1231, 5, '1965', NULL, NULL, NULL, NULL, NULL, 4146, 7573, NULL, '(352) 540-1777', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1232, 5, '3336', NULL, NULL, NULL, NULL, NULL, 4578, 8753, NULL, '(734) 363-1182', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1233, 5, '4868', NULL, NULL, NULL, NULL, NULL, 9765, 2912, NULL, '(248) 650-2132', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1235, 5, '2515', NULL, NULL, NULL, NULL, NULL, 7310, 4977, NULL, '(313) 728-1780', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1237, 5, '2046', NULL, NULL, NULL, NULL, NULL, 2667, 7374, NULL, '(734) 444-4293', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1238, 5, '3193', NULL, NULL, NULL, NULL, NULL, 4921, 8573, NULL, '(248) 533-3679', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1239, 5, '1536', NULL, NULL, NULL, NULL, NULL, 3927, 9719, NULL, '(313) 291-8647', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1240, 5, '4233', NULL, NULL, NULL, NULL, NULL, 2656, 4007, NULL, '(734) 721-6204', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1241, 5, '5630', NULL, NULL, NULL, NULL, NULL, 2325, 3854, NULL, '(248) 238-6031', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1243, 5, '3249', NULL, NULL, NULL, NULL, NULL, 8287, 9125, NULL, '(313) 836-9558', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1244, 5, '4696', NULL, NULL, NULL, NULL, NULL, 5916, 1225, NULL, '(734) 259-8384', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1245, 5, '4956', NULL, NULL, NULL, NULL, NULL, 5502, 1071, NULL, '(989) 539-7523', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1246, 5, '2036', NULL, NULL, NULL, NULL, NULL, 5834, 4767, NULL, '(734) 595-8773', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1247, 5, '3728', NULL, NULL, NULL, NULL, NULL, 5083, 6259, NULL, '(248) 632-0246', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1249, 5, '5859', NULL, NULL, NULL, NULL, NULL, 5379, 4485, NULL, '(313) 398-3082', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1250, 5, '2918', NULL, NULL, NULL, NULL, NULL, 1044, 2931, NULL, '(586) 530-7647', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1251, 5, '3449', NULL, NULL, NULL, NULL, NULL, 9478, 8985, NULL, '(815) 871-9500', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1252, 5, '3768', NULL, NULL, NULL, NULL, NULL, 1754, 1445, NULL, '(313) 896-3659', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1254, 5, '2781', NULL, NULL, NULL, NULL, NULL, 3949, 5065, NULL, '(313) 838-4309', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1255, 5, '2770', NULL, NULL, NULL, NULL, NULL, 8313, 2230, NULL, '(248) 335-9801', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1256, 5, '4953', NULL, NULL, NULL, NULL, NULL, 8638, 9877, NULL, '(248) 231-4450', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1257, 5, '2516', NULL, NULL, NULL, NULL, NULL, 1648, 3765, NULL, '(586) 776-5315', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1258, 5, '2383', NULL, NULL, NULL, NULL, NULL, 3968, 6744, NULL, '(248) 262-7178', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1259, 5, '3162', NULL, NULL, NULL, NULL, NULL, 5317, 1162, NULL, '(248) 767-6615', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1260, 5, '3034', NULL, NULL, NULL, NULL, NULL, 6469, 6895, NULL, '(313) 871-1425', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1261, 5, '2597', NULL, NULL, NULL, NULL, NULL, 1999, 5127, NULL, '(313) 467-9019', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1262, 5, '2431', NULL, NULL, NULL, NULL, NULL, 6857, 8823, NULL, '(216) 224-1319', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1263, 5, '2797', NULL, NULL, NULL, NULL, NULL, 8612, 6628, NULL, '(734) 725-5870', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1264, 5, '3851', NULL, NULL, NULL, NULL, NULL, 4951, 5851, NULL, '(313) 388-1089', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1265, 5, '3488', NULL, NULL, NULL, NULL, NULL, 7856, 5382, NULL, '(248) 354-8278', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1267, 5, '2500', NULL, NULL, NULL, NULL, NULL, 7975, 9747, NULL, '(313) 872-3408', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1268, 5, '2917', NULL, NULL, NULL, NULL, NULL, 1822, 5964, NULL, '(313) 704-3110', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1269, 5, '3924', NULL, NULL, NULL, NULL, NULL, 9172, 6524, NULL, '(313) 478-4133', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1270, 5, '2899', NULL, NULL, NULL, NULL, NULL, 8778, 5916, NULL, '(248) 295-1074', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1271, 5, '5124', NULL, NULL, NULL, NULL, NULL, 7319, 2352, NULL, '(281) 692-8732', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1272, 5, '2459', NULL, NULL, NULL, NULL, NULL, 8884, 3890, NULL, '(248) 996-9676', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1273, 5, '5780', NULL, NULL, NULL, NULL, NULL, 8211, 3409, NULL, '(248) 476-7392', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1276, 5, '5265', NULL, NULL, NULL, NULL, NULL, 7605, 7572, NULL, '(248) 910-4403', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1277, 5, '1966', NULL, NULL, NULL, NULL, NULL, 2596, 2823, NULL, '(734) 953-3736', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1278, 5, '2883', NULL, NULL, NULL, NULL, NULL, 1607, 1427, NULL, '(313) 658-4194', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1279, 5, '2748', NULL, NULL, NULL, NULL, NULL, 4691, 1730, NULL, '(313) 461-4968', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1280, 5, '4379', NULL, NULL, NULL, NULL, NULL, 3732, 4097, NULL, '(248) 514-3178', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1281, 5, '5305', NULL, NULL, NULL, NULL, NULL, 6491, 7496, NULL, '(734) 258-8837', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1283, 5, '1516', NULL, NULL, NULL, NULL, NULL, 6970, 9170, NULL, '(313) 618-5527', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1284, 5, '4167', NULL, NULL, NULL, NULL, NULL, 5012, 3741, NULL, '(248) 515-0388', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1285, 5, '3248', NULL, NULL, NULL, NULL, NULL, 2586, 1543, NULL, '(313) 582-8183', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1288, 5, '2735', NULL, NULL, NULL, NULL, NULL, 1391, 5983, NULL, '(248) 332-0958', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1290, 5, '2422', NULL, NULL, NULL, NULL, NULL, 4276, 5776, NULL, '(586) 649-8279', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1291, 5, '2624', NULL, NULL, NULL, NULL, NULL, 6771, 5529, NULL, '(248) 943-7730', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1292, 5, '2239', NULL, NULL, NULL, NULL, NULL, 8366, 6668, NULL, '(248) 926-6426', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1293, 5, '3977', NULL, NULL, NULL, NULL, NULL, 1674, 9712, NULL, '(586) 268-6653', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1294, 5, '5868', NULL, NULL, NULL, NULL, NULL, 2750, 9869, NULL, '(313) 721-3296', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1295, 5, '3295', NULL, NULL, NULL, NULL, NULL, 4573, 8921, NULL, '(734) 728-4182', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1296, 5, '2129', NULL, NULL, NULL, NULL, NULL, 2204, 3849, NULL, '(734) 738-6170', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1297, 5, '5996', NULL, NULL, NULL, NULL, NULL, 4045, 2285, NULL, '(314) 218-0068', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1298, 5, '5259', NULL, NULL, NULL, NULL, NULL, 3509, 8925, NULL, '(248) 277-6617', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1299, 5, '6254', NULL, NULL, NULL, NULL, NULL, 4223, 6310, NULL, '(734) 686-1456', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1300, 5, '3238', NULL, NULL, NULL, NULL, NULL, 4242, 6928, NULL, '(313) 537-0860', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1301, 5, '5318', NULL, NULL, NULL, NULL, NULL, 2801, 1548, NULL, '(734) 516-2343', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1302, 5, '2535', NULL, NULL, NULL, NULL, NULL, 9618, 4402, NULL, '(586) 524-2360', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1303, 5, '2565', NULL, NULL, NULL, NULL, NULL, 7043, 5032, NULL, '(313) 436-5937', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1305, 5, '4100', NULL, NULL, NULL, NULL, NULL, 7487, 2127, NULL, '(313) 381-5385', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1306, 5, '2989', NULL, NULL, NULL, NULL, NULL, 6894, 7052, NULL, '(313) 282-9415', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1308, 5, '2726', NULL, NULL, NULL, NULL, NULL, 1677, 6865, NULL, '(248) 506-9403', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1309, 5, '4258', NULL, NULL, NULL, NULL, NULL, 7378, 1604, NULL, '(248) 229-8571', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1310, 5, '4611', NULL, NULL, NULL, NULL, NULL, 3777, 8849, NULL, '(248) 620-4753', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1312, 5, '5582', NULL, NULL, NULL, NULL, NULL, 1626, 3050, NULL, '(313) 784-5141', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1313, 5, '2551', NULL, NULL, NULL, NULL, NULL, 2727, 4455, NULL, '(313) 923-4275', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1314, 5, '1496', NULL, NULL, NULL, NULL, NULL, 1806, 4441, NULL, '(248) 569-6374', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1315, 5, '2885', NULL, NULL, NULL, NULL, NULL, 2105, 7481, NULL, '(313) 526-6950', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1316, 5, '5027', NULL, NULL, NULL, NULL, NULL, 6201, 7770, NULL, '(313) 897-2422', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1317, 5, '2592', NULL, NULL, NULL, NULL, NULL, 8085, 6240, NULL, '(847) 989-4629', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1318, 5, '3727', NULL, NULL, NULL, NULL, NULL, 8620, 6161, NULL, '(734) 422-2590', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1319, 5, '2578', NULL, NULL, NULL, NULL, NULL, 5903, 6997, NULL, '(313) 872-2475', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1321, 5, '6119', NULL, NULL, NULL, NULL, NULL, 4503, 4274, NULL, '(248) 737-8011', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1323, 5, '1659', NULL, NULL, NULL, NULL, NULL, 7026, 5380, NULL, '(248) 383-3215', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1324, 5, '2960', NULL, NULL, NULL, NULL, NULL, 4904, 8073, NULL, '(248) 644-0408', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1325, 5, '2426', NULL, NULL, NULL, NULL, NULL, 3357, 5609, NULL, '(313) 460-6086', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1326, 5, '2769', NULL, NULL, NULL, NULL, NULL, 2914, 4827, NULL, '(313) 867-5973', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1327, 5, '3661', NULL, NULL, NULL, NULL, NULL, 3620, 1274, NULL, '(678) 522-3148', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1328, 5, '3854', NULL, NULL, NULL, NULL, NULL, 4477, 1318, NULL, '(313) 826-4947', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1329, 5, '3795', NULL, NULL, NULL, NULL, NULL, 7403, 3350, NULL, '(734) 725-3773', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1331, 5, '3675', NULL, NULL, NULL, NULL, NULL, 7432, 4403, NULL, '(313) 285-8599', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1332, 5, '4389', NULL, NULL, NULL, NULL, NULL, 6719, 8379, NULL, '(313) 730-9177', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1335, 5, '3031', NULL, NULL, NULL, NULL, NULL, 3389, 6779, NULL, '(586) 843-3729', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1336, 5, '4021', NULL, NULL, NULL, NULL, NULL, 3864, 3974, NULL, '(586) 604-5563', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1338, 5, '3429', NULL, NULL, NULL, NULL, NULL, 3336, 1926, NULL, '(734) 354-3556', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1339, 5, '2864', NULL, NULL, NULL, NULL, NULL, 5925, 1987, NULL, '(248) 563-8432', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1340, 5, '5437', NULL, NULL, NULL, NULL, NULL, 9784, 8698, NULL, '(313) 658-5962', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]');
INSERT INTO `patient_details` (`pid`, `lid`, `fname`, `lname`, `dob`, `admitteddate`, `release`, `outcome`, `ssn`, `pinno`, `email`, `mobile`, `insurance_id`, `code`, `code_date`, `patient_carrier`, `fac_id`, `type`, `units`) VALUES
(1343, 5, '4262', NULL, NULL, NULL, NULL, NULL, 5059, 6071, NULL, '(586) 215-1931', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1344, 5, '2884', NULL, NULL, NULL, NULL, NULL, 2174, 5045, NULL, '(248) 636-0467', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1345, 5, '2518', NULL, NULL, NULL, NULL, NULL, 1771, 9512, NULL, '(313) 318-5271', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1346, 5, '2362', NULL, NULL, NULL, NULL, NULL, 6398, 9406, NULL, '(248) 214-6219', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1347, 5, '5585', NULL, NULL, NULL, NULL, NULL, 7532, 7739, NULL, '(313) 458-2332', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1348, 5, '4160', NULL, NULL, NULL, NULL, NULL, 1554, 9466, NULL, '(313) 933-8035', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1349, 5, '5077', NULL, NULL, NULL, NULL, NULL, 8772, 4547, NULL, '(313) 208-2443', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1350, 5, '2745', NULL, NULL, NULL, NULL, NULL, 3372, 1597, NULL, '(313) 974-1957', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1352, 5, '2823', NULL, NULL, NULL, NULL, NULL, 6835, 3009, NULL, '(248) 841-6865', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1353, 5, '3923', NULL, NULL, NULL, NULL, NULL, 7649, 8353, NULL, '(906) 322-4050', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1354, 5, '5559', NULL, NULL, NULL, NULL, NULL, 4173, 8580, NULL, '(313) 283-3877', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1357, 5, '(313) 802-6659', NULL, NULL, NULL, NULL, NULL, 4728, 1408, NULL, '(313) 802-6659', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1360, 5, '(313) 382-4537', NULL, NULL, NULL, NULL, NULL, 7910, 1322, NULL, '(313) 382-4537', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1361, 5, '(734) 301-3111', NULL, NULL, NULL, NULL, NULL, 2766, 5856, NULL, '(734) 301-3111', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1362, 5, '(248) 251-2201', NULL, NULL, NULL, NULL, NULL, 3310, 8716, NULL, '(248) 251-2201', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1363, 5, '(734) 467-3537', NULL, NULL, NULL, NULL, NULL, 7788, 2635, NULL, '(734) 467-3537', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1367, 5, '(313) 974-1634', NULL, NULL, NULL, NULL, NULL, 6140, 8347, NULL, '(313) 974-1634', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1368, 5, '(313) 282-2992', NULL, NULL, NULL, NULL, NULL, 3196, 7008, NULL, '(313) 282-2992', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1369, 5, '(586) 549-6544', NULL, NULL, NULL, NULL, NULL, 4547, 7404, NULL, '(586) 549-6544', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1370, 5, '(248) 545-3125', NULL, NULL, NULL, NULL, NULL, 3825, 2541, NULL, '(248) 545-3125', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1371, 5, '(313) 587-2326', NULL, NULL, NULL, NULL, NULL, 8300, 2854, NULL, '(313) 587-2326', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1372, 5, '(313) 231-0008', NULL, NULL, NULL, NULL, NULL, 5749, 4130, NULL, '(313) 231-0008', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1374, 5, '(313) 623-8193', NULL, NULL, NULL, NULL, NULL, 4198, 3143, NULL, '(313) 623-8193', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1376, 5, '(313) 342-4611', NULL, NULL, NULL, NULL, NULL, 7701, 8519, NULL, '(313) 342-4611', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1377, 5, '(313) 770-0068', NULL, NULL, NULL, NULL, NULL, 9900, 9255, NULL, '(313) 770-0068', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1380, 5, '(313) 682-1405', NULL, NULL, NULL, NULL, NULL, 2083, 5880, NULL, '(313) 682-1405', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1382, 5, '(248) 703-4181', NULL, NULL, NULL, NULL, NULL, 8650, 5274, NULL, '(248) 703-4181', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1383, 5, '(248) 515-7525', NULL, NULL, NULL, NULL, NULL, 2149, 3777, NULL, '(248) 515-7525', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1384, 5, '(810) 516-1117', NULL, NULL, NULL, NULL, NULL, 1985, 8789, NULL, '(810) 516-1117', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1385, 5, '(734) 453-1140', NULL, NULL, NULL, NULL, NULL, 1254, 3886, NULL, '(734) 453-1140', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1386, 5, '(313) 658-3301', NULL, NULL, NULL, NULL, NULL, 3013, 8130, NULL, '(313) 658-3301', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1387, 5, '(248) 996-4914', NULL, NULL, NULL, NULL, NULL, 3966, 9972, NULL, '(248) 996-4914', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1388, 5, '(352) 540-1777', NULL, NULL, NULL, NULL, NULL, 6101, 6265, NULL, '(352) 540-1777', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1389, 5, '(313) 212-1352', NULL, NULL, NULL, NULL, NULL, 1652, 6384, NULL, '(313) 212-1352', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1390, 5, '(248) 978-4574', NULL, NULL, NULL, NULL, NULL, 5220, 8569, NULL, '(248) 978-4574', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1391, 5, '(248) 720-9342', NULL, NULL, NULL, NULL, NULL, 9786, 9692, NULL, '(248) 720-9342', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1393, 5, '(248) 227-5760', NULL, NULL, NULL, NULL, NULL, 7457, 5093, NULL, '(248) 227-5760', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1394, 5, '(313) 978-6029', NULL, NULL, NULL, NULL, NULL, 7511, 1084, NULL, '(313) 978-6029', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1395, 5, '(248) 533-3265', NULL, NULL, NULL, NULL, NULL, 8554, 4250, NULL, '(248) 533-3265', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1398, 5, '(313) 421-2801', NULL, NULL, NULL, NULL, NULL, 5659, 7278, NULL, '(313) 421-2801', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1400, 5, '(734) 748-4983', NULL, NULL, NULL, NULL, NULL, 8812, 8957, NULL, '(734) 748-4983', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1401, 5, '(248) 238-6031', NULL, NULL, NULL, NULL, NULL, 3880, 1523, NULL, '(248) 238-6031', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1402, 5, '(313) 663-8772', NULL, NULL, NULL, NULL, NULL, 7560, 6434, NULL, '(313) 663-8772', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1404, 5, '(89) 539-7523', NULL, NULL, NULL, NULL, NULL, 8072, 7552, NULL, '(89) 539-7523', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1405, 5, '(734) 718-2551', NULL, NULL, NULL, NULL, NULL, 5926, 7913, NULL, '(734) 718-2551', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1406, 5, '(269) 214-2106', NULL, NULL, NULL, NULL, NULL, 8373, 6358, NULL, '(269) 214-2106', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1407, 5, '(269) 240-8042', NULL, NULL, NULL, NULL, NULL, 1815, 6095, NULL, '(269) 240-8042', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1408, 5, '(248) 499-8722', NULL, NULL, NULL, NULL, NULL, 1194, 2487, NULL, '(248) 499-8722', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1409, 5, '(586) 530-7647', NULL, NULL, NULL, NULL, NULL, 5736, 1870, NULL, '(586) 530-7647', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1410, 5, '(815) 871-9500', NULL, NULL, NULL, NULL, NULL, 9487, 3523, NULL, '(815) 871-9500', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1411, 5, '(313) 300-7849', NULL, NULL, NULL, NULL, NULL, 1850, 6889, NULL, '(313) 300-7849', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1413, 5, '(313) 247-9185', NULL, NULL, NULL, NULL, NULL, 1094, 7855, NULL, '(313) 247-9185', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1414, 5, '(734) 462-8441', NULL, NULL, NULL, NULL, NULL, 9965, 7198, NULL, '(734) 462-8441', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1415, 5, '(313) 424-2995', NULL, NULL, NULL, NULL, NULL, 5235, 2279, NULL, '(313) 424-2995', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1416, 5, '(248) 335-9801', NULL, NULL, NULL, NULL, NULL, 1460, 4910, NULL, '(248) 335-9801', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1417, 5, '(248) 231-1814', NULL, NULL, NULL, NULL, NULL, 7892, 6795, NULL, '(248) 231-1814', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1418, 5, '(313) 693-8894', NULL, NULL, NULL, NULL, NULL, 7569, 7509, NULL, '(313) 693-8894', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1419, 5, '(586) 201-7408', NULL, NULL, NULL, NULL, NULL, 9960, 1996, NULL, '(586) 201-7408', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1420, 5, '(248) 752-4348', NULL, NULL, NULL, NULL, NULL, 1869, 1099, NULL, '(248) 752-4348', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1421, 5, '(313) 629-2600', NULL, NULL, NULL, NULL, NULL, 6873, 6660, NULL, '(313) 629-2600', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1423, 5, '(313) 467-9019', NULL, NULL, NULL, NULL, NULL, 7768, 2620, NULL, '(313) 467-9019', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1424, 5, '(734) 788-8183', NULL, NULL, NULL, NULL, NULL, 8856, 8763, NULL, '(734) 788-8183', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1425, 5, '(313) 737-9174', NULL, NULL, NULL, NULL, NULL, 3258, 4907, NULL, '(313) 737-9174', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1426, 5, '(313) 388-1089', NULL, NULL, NULL, NULL, NULL, 4215, 9822, NULL, '(313) 388-1089', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1427, 5, '(248) 943-1138', NULL, NULL, NULL, NULL, NULL, 9549, 5635, NULL, '(248) 943-1138', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1428, 5, '(313) 921-4306', NULL, NULL, NULL, NULL, NULL, 2411, 6751, NULL, '(313) 921-4306', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1431, 5, '(313) 704-3110', NULL, NULL, NULL, NULL, NULL, 1585, 8387, NULL, '(313) 704-3110', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1432, 5, '(248) 295-1074', NULL, NULL, NULL, NULL, NULL, 3682, 1364, NULL, '(248) 295-1074', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1433, 5, '(586) 359-7387', NULL, NULL, NULL, NULL, NULL, 5067, 5777, NULL, '(586) 359-7387', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1434, 5, '(323) 823-0283', NULL, NULL, NULL, NULL, NULL, 5815, 5204, NULL, '(323) 823-0283', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1435, 5, '(517) 676-4939', NULL, NULL, NULL, NULL, NULL, 8853, 9715, NULL, '(517) 676-4939', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1436, 5, '(313) 213-0607', NULL, NULL, NULL, NULL, NULL, 7796, 8417, NULL, '(313) 213-0607', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1438, 5, '(313) 372-1634', NULL, NULL, NULL, NULL, NULL, 7559, 1341, NULL, '(313) 372-1634', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1439, 5, '(901) 517-5705', NULL, NULL, NULL, NULL, NULL, 7086, 3058, NULL, '(901) 517-5705', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1441, 5, '(248) 346-4074', NULL, NULL, NULL, NULL, NULL, 2898, 4185, NULL, '(248) 346-4074', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1443, 5, '(313) 331-5349', NULL, NULL, NULL, NULL, NULL, 8527, 4855, NULL, '(313) 331-5349', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1444, 5, '(248) 557-4340', NULL, NULL, NULL, NULL, NULL, 5506, 6480, NULL, '(248) 557-4340', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1445, 5, '(313) 910-8221', NULL, NULL, NULL, NULL, NULL, 3998, 8888, NULL, '(313) 910-8221', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1447, 5, '(734) 765-9234', NULL, NULL, NULL, NULL, NULL, 8845, 9288, NULL, '(734) 765-9234', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1448, 5, '(248) 332-0958', NULL, NULL, NULL, NULL, NULL, 5455, 9913, NULL, '(248) 332-0958', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1451, 5, '(248) 943-7730', NULL, NULL, NULL, NULL, NULL, 6999, 2633, NULL, '(248) 943-7730', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1452, 5, '(248) 926-6426', NULL, NULL, NULL, NULL, NULL, 4245, 4438, NULL, '(248) 926-6426', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1454, 5, '(313) 721-3296', NULL, NULL, NULL, NULL, NULL, 7538, 6500, NULL, '(313) 721-3296', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1456, 5, '(734) 718-2456', NULL, NULL, NULL, NULL, NULL, 9105, 9963, NULL, '(734) 718-2456', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1458, 5, '(248) 277-6617', NULL, NULL, NULL, NULL, NULL, 2195, 3556, NULL, '(248) 277-6617', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1459, 5, '(248) 820-8244', NULL, NULL, NULL, NULL, NULL, 7565, 2693, NULL, '(248) 820-8244', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1460, 5, '(313) 491-0163', NULL, NULL, NULL, NULL, NULL, 2673, 6528, NULL, '(313) 491-0163', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1461, 5, '(248) 443-8921', NULL, NULL, NULL, NULL, NULL, 1159, 4190, NULL, '(248) 443-8921', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1463, 5, '(248) 312-8023', NULL, NULL, NULL, NULL, NULL, 8655, 1834, NULL, '(248) 312-8023', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1464, 5, '(586) 291-8190', NULL, NULL, NULL, NULL, NULL, 1120, 9076, NULL, '(586) 291-8190', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1465, 5, '(313) 671-8396', NULL, NULL, NULL, NULL, NULL, 9510, 6780, NULL, '(313) 671-8396', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1467, 5, '(313) 381-5385', NULL, NULL, NULL, NULL, NULL, 2348, 2198, NULL, '(313) 381-5385', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1470, 5, '(248) 506-9403', NULL, NULL, NULL, NULL, NULL, 3982, 8360, NULL, '(248) 506-9403', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1471, 5, '(248) 821-8736', NULL, NULL, NULL, NULL, NULL, 1020, 9760, NULL, '(248) 821-8736', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1472, 5, '(313) 561-6988', NULL, NULL, NULL, NULL, NULL, 2737, 2562, NULL, '(313) 561-6988', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1473, 5, '(313) 208-3232', NULL, NULL, NULL, NULL, NULL, 8727, 9801, NULL, '(313) 208-3232', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1474, 5, '(313) 633-4756', NULL, NULL, NULL, NULL, NULL, 8331, 3531, NULL, '(313) 633-4756', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1475, 5, '(313) 701-2921', NULL, NULL, NULL, NULL, NULL, 8841, 3949, NULL, '(313) 701-2921', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1477, 5, '(248) 225-6993', NULL, NULL, NULL, NULL, NULL, 6508, 9107, NULL, '(248) 225-6993', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1478, 5, '(313) 779-0158', NULL, NULL, NULL, NULL, NULL, 4505, 5019, NULL, '(313) 779-0158', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1479, 5, '(31) 337-1859', NULL, NULL, NULL, NULL, NULL, 1111, 5163, NULL, '(31) 337-1859', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1481, 5, '(313) 361-3607', NULL, NULL, NULL, NULL, NULL, 2425, 9328, NULL, '(313) 361-3607', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1482, 5, '(847) 989-4629', NULL, NULL, NULL, NULL, NULL, 2259, 7287, NULL, '(847) 989-4629', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1483, 5, '(734) 377-0465', NULL, NULL, NULL, NULL, NULL, 3650, 2409, NULL, '(734) 377-0465', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1484, 5, '(734) 536-5228', NULL, NULL, NULL, NULL, NULL, 9412, 1352, NULL, '(734) 536-5228', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1485, 5, '(313) 872-2475', NULL, NULL, NULL, NULL, NULL, 1394, 3183, NULL, '(313) 872-2475', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1486, 5, '(248) 737-8011', NULL, NULL, NULL, NULL, NULL, 5935, 9201, NULL, '(248) 737-8011', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1487, 5, '(248) 669-4767', NULL, NULL, NULL, NULL, NULL, 7429, 2721, NULL, '(248) 669-4767', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1488, 5, '(248) 841-1348', NULL, NULL, NULL, NULL, NULL, 3672, 2330, NULL, '(248) 841-1348', NULL, NULL, NULL, '@comcastpcs.textmsg.com', '1', 'ambassador', '[\"5\"]'),
(1489, 5, '(248) 569-4751', NULL, NULL, NULL, NULL, NULL, 1030, 1816, NULL, '(248) 569-4751', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1490, 5, '(313) 320-1884', NULL, NULL, NULL, NULL, NULL, 4350, 2438, NULL, '(313) 320-1884', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1491, 5, '(313) 736-3505', NULL, NULL, NULL, NULL, NULL, 5675, 3205, NULL, '(313) 736-3505', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1492, 5, '(248) 320-1590', NULL, NULL, NULL, NULL, NULL, 5555, 1488, NULL, '(248) 320-1590', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1493, 5, '(313) 463-0176', NULL, NULL, NULL, NULL, NULL, 2110, 8414, NULL, '(313) 463-0176', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1494, 5, '(734) 444-8746', NULL, NULL, NULL, NULL, NULL, 7795, 4962, NULL, '(734) 444-8746', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1496, 5, '(313) 585-7624', NULL, NULL, NULL, NULL, NULL, 3292, 5481, NULL, '(313) 585-7624', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1497, 5, '(734) 486-6426', NULL, NULL, NULL, NULL, NULL, 4683, 6770, NULL, '(734) 486-6426', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1498, 5, '(586) 489-3132', NULL, NULL, NULL, NULL, NULL, 8987, 9703, NULL, '(586) 489-3132', NULL, NULL, NULL, '@tmomail.net', '1', 'ambassador', '[\"5\"]'),
(1499, 5, '(586) 997-4955', NULL, NULL, NULL, NULL, NULL, 3244, 2596, NULL, '(586) 997-4955', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1501, 5, '(248) 709-2239', NULL, NULL, NULL, NULL, NULL, 9589, 8709, NULL, '(248) 709-2239', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1502, 5, '(248) 444-4691', NULL, NULL, NULL, NULL, NULL, 2164, 6811, NULL, '(248) 444-4691', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1503, 5, '(614) 579-1336', NULL, NULL, NULL, NULL, NULL, 7479, 2689, NULL, '(614) 579-1336', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1504, 5, '(313) 658-5962', NULL, NULL, NULL, NULL, NULL, 9437, 7671, NULL, '(313) 658-5962', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1505, 5, '(248) 835-4213', NULL, NULL, NULL, NULL, NULL, 2360, 8089, NULL, '(248) 835-4213', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1506, 5, '(313) 915-8014', NULL, NULL, NULL, NULL, NULL, 4517, 6677, NULL, '(313) 915-8014', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1507, 5, '(586) 468-0009', NULL, NULL, NULL, NULL, NULL, 4229, 1603, NULL, '(586) 468-0009', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1508, 5, '(248) 240-3552', NULL, NULL, NULL, NULL, NULL, 2725, 8855, NULL, '(248) 240-3552', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1509, 5, '(313) 318-5271', NULL, NULL, NULL, NULL, NULL, 8723, 9518, NULL, '(313) 318-5271', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1511, 5, '(248) 214-6219', NULL, NULL, NULL, NULL, NULL, 4064, 8792, NULL, '(248) 214-6219', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1512, 5, '(313) 820-0542', NULL, NULL, NULL, NULL, NULL, 4351, 2802, NULL, '(313) 820-0542', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1515, 5, '(313) 974-1957', NULL, NULL, NULL, NULL, NULL, 3326, 7213, NULL, '(313) 974-1957', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]'),
(1517, 5, '(734) 646-9003', NULL, NULL, NULL, NULL, NULL, 8467, 7883, NULL, '(734) 646-9003', NULL, NULL, NULL, '@vtext.com', '1', 'ambassador', '[\"5\"]'),
(1518, 5, '(248) 334-0805', NULL, NULL, NULL, NULL, NULL, 1422, 4498, NULL, '(248) 334-0805', NULL, NULL, NULL, '', '1', 'ambassador', '[\"5\"]'),
(1520, 5, '(313) 208-1528', NULL, NULL, NULL, NULL, NULL, 3999, 6553, NULL, '(313) 208-1528', NULL, NULL, NULL, '@mymetropcs.com', '1', 'ambassador', '[\"5\"]');

-- --------------------------------------------------------

--
-- Table structure for table `patient_family`
--

CREATE TABLE `patient_family` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `numberphone` varchar(50) NOT NULL,
  `carrier` varchar(50) NOT NULL,
  `code` varchar(4) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'Access dashboard page', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(2, 'shift-add', 'Post shift', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(3, 'shift-edit', 'Edit shift', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(4, 'shift-delete', 'Delete shift', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(5, 'shift-approve', 'Approve shift', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(6, 'award-add', 'Add award', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(7, 'award-delete', 'Delete Award', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(8, 'award-approve', 'Approve Award', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(9, 'employee-add', 'Add Employee', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(10, 'employee-edit', 'Edit Employee', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(11, 'employee-delete', 'Delete Employee', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(12, 'patient-add', 'Add Patient', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(13, 'patient-edit', 'Edit Patient', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(14, 'patient-delete', 'Delete Patient', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(15, 'shift-manage', 'Manage Shifts', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(16, 'employee-manage', 'Manage Employees', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(17, 'patient-manage', 'Manage Patients', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(18, 'award-manage', 'Manage Awards', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(19, 'survey-manage', 'Manage Survey', NULL, '2016-08-16 00:58:46', '2016-08-16 00:58:46'),
(20, 'data-manage', 'Manage Data', NULL, NULL, NULL),
(21, 'reward-add', 'Add Reward', NULL, '2016-09-23 12:59:11', '2016-09-23 12:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`role_id`, `permission_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 15),
(2, 1),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(3, 14),
(3, 15),
(3, 16),
(3, 17),
(3, 18),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(5, 12),
(5, 13),
(5, 14),
(5, 17),
(6, 9),
(6, 10),
(6, 11),
(6, 16),
(7, 21);

-- --------------------------------------------------------

--
-- Table structure for table `qa`
--

CREATE TABLE `qa` (
  `id` int(50) NOT NULL,
  `qaid` varchar(50) NOT NULL,
  `question` text NOT NULL,
  `q_es` text,
  `anwser` text,
  `a_es` text,
  `utype` varchar(250) NOT NULL,
  `created_user` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_user` varchar(50) DEFAULT '',
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `qa`
--

INSERT INTO `qa` (`id`, `qaid`, `question`, `q_es`, `anwser`, `a_es`, `utype`, `created_user`, `created_at`, `updated_user`, `updated_at`) VALUES
(12, 'BE-GEN002', 'Support Email', '', '<font color=\"#337ab7\"><span style=\"background-color: rgb(244, 248, 251);\">support@wambi.org</span></font>', '', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', '4444', '0000-00-00 00:00:00', '4444', '0000-00-00 00:00:00'),
(13, 'BE-GEN001', '<h5 class=\"m-t-30\">General Information</h5>', '', 'If you have any questions please email help support at <a href=\"mailto:support@wambi.org\"><span style=\"color:#1155CC\">support@wambi.org</span></a>', '', '[\"1\",\"2\",\"3\",\"4\",\"5\",\"6\"]', '4444', '0000-00-00 00:00:00', '4444', '0000-00-00 00:00:00'),
(14, 'FE-001', '<p>General Instructions</p>', '', 'This survey is anonymous and will allow us to give proper feedback to the caregiver you have selected.\r\n<br><br>\r\nPlease answer the questions accurately and to the best of your ability. If you feel the need to add specific comments about your caregiver please do so in the comment box provided at the end of the survey.\r\n<br><br>\r\nIf you selected the wrong caregiver people Exit the survey (top right) and re-select the correct caregiver.  If you need assistance finding the correct individual that assisted you during your stay, please ask a staff member.', '', '[\"7\"]', '4444', '0000-00-00 00:00:00', '4444', '0000-00-00 00:00:00'),
(15, '00000089', '<p>jhsdhb sbgfbsd fsjh sdsdf</p>', '', '<p>Asdjkfsdmnf sdsdjnsdjmf</p>', '', '[\"2\",\"6\"]', '4444', '0000-00-00 00:00:00', '4444', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `css_class` varchar(255) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT '1',
  `fac_id` varchar(50) DEFAULT NULL,
  `orderby` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `qid`, `question`, `css_class`, `unit_id`, `enabled`, `fac_id`, `orderby`) VALUES
(181, 1, 'Was compassionate and charitable towards you', '#f4292d', 1, 1, '1', 1),
(182, 2, 'Was compassionate and charitable towards you', '#f4292d', 2, 1, '1', 1),
(183, 3, 'Was compassionate and charitable towards you', '#f4292d', 3, 1, '1', 1),
(184, 4, 'Was compassionate and charitable towards you', '#f4292d', 4, 1, '1', 1),
(185, 5, 'Was compassionate and charitable towards you', '#f4292d', 5, 1, '1', 1),
(186, 6, 'Helped to enhance the quality of your life', '#9e0dfe', 1, 1, '1', 2),
(187, 7, 'Helped to enhance the quality of your life', '#9e0dfe', 2, 1, '1', 2),
(188, 8, 'Helped to enhance the quality of your life', '#9e0dfe', 3, 1, '1', 2),
(189, 9, 'Helped to enhance the quality of your life', '#9e0dfe', 4, 1, '1', 2),
(190, 10, 'Helped to enhance the quality of your life', '#9e0dfe', 5, 1, '1', 2),
(191, 11, 'Communicated effectively', '#194df4', 1, 1, '1', 3),
(192, 12, 'Communicated effectively', '#194df4', 2, 1, '1', 3),
(193, 13, 'Communicated effectively', '#194df4', 3, 1, '1', 3),
(194, 14, 'Communicated effectively', '#194df4', 4, 1, '1', 3),
(195, 15, 'Communicated effectively', '#194df4', 5, 1, '1', 3),
(196, 16, 'Was respectful of your needs', '#149af4', 1, 1, '1', 4),
(197, 17, 'Was respectful of your needs', '#149af4', 2, 1, '1', 4),
(198, 18, 'Was respectful of your needs', '#149af4', 3, 1, '1', 4),
(199, 19, 'Was respectful of your needs', '#149af4', 4, 1, '1', 4),
(200, 20, 'Was respectful of your needs', '#149af4', 5, 1, '1', 4),
(201, 21, 'Was dedicated to enriching your life', '#0af43a', 1, 1, '1', 5),
(202, 22, 'Was dedicated to enriching your life', '#0af43a', 2, 1, '1', 5),
(203, 23, 'Was dedicated to enriching your life', '#0af43a', 3, 1, '1', 5),
(204, 24, 'Was dedicated to enriching your life', '#0af43a', 4, 1, '1', 5),
(205, 25, 'Was dedicated to enriching your life', '#0af43a', 5, 1, '1', 5),
(206, 26, 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', 1, 1, '1', 6),
(207, 27, 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', 2, 1, '1', 6),
(208, 28, 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', 3, 1, '1', 6),
(209, 29, 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', 4, 1, '1', 6),
(210, 30, 'Upholds the level of professionalism that you would expect from him/her', '#cd400d', 5, 1, '1', 6);

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `pecks` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `name`, `display_name`, `pecks`, `image`, `created_at`, `updated_at`, `unit_id`) VALUES
(1, NULL, NULL, 5, '1_$5_Starbucks_gift_card_copy.png', '2017-06-29 22:25:19', '2017-06-29 22:25:20', '1'),
(2, NULL, NULL, 10, '2_$10_Grocery_Card_copy.png', '2017-06-29 22:25:35', '2017-06-29 22:25:35', '1'),
(3, NULL, NULL, 10, '3_$10_In-n-out_Burger_Gift_Card_copy.png', '2017-06-29 22:27:38', '2017-06-29 22:27:38', '1'),
(4, NULL, NULL, 10, '4_$10_Walmart_gift_card_copy.png', '2017-06-29 22:27:49', '2017-06-29 22:27:49', '1'),
(5, NULL, NULL, 25, '5_$25_Amazon_Gift_Card_copy.png', '2017-06-29 22:27:59', '2017-06-29 22:27:59', '1'),
(6, NULL, NULL, 25, '6_$25_Gas_Gift_Card_copy.png', '2017-06-29 22:28:12', '2017-06-29 22:28:12', '1'),
(7, NULL, NULL, 25, '7_$25_Target_Gift_Card_copy.png', '2017-06-29 22:28:33', '2017-06-29 22:28:33', '1'),
(8, NULL, NULL, 25, '8_$25_Visa_Gift_Card_copy.png', '2017-06-29 22:28:47', '2017-06-29 22:28:48', '1'),
(9, NULL, NULL, 25, '9_$25_Walmart_Gift_Card_copy.png', '2017-06-29 22:29:08', '2017-06-29 22:29:08', '1'),
(10, NULL, NULL, 1, '10_1_hour_massage_gift_card_copy.png', '2017-06-29 22:29:33', '2017-06-29 22:29:33', '1'),
(12, NULL, NULL, 2, '12_2_Movie_Tickets_Gift_Card_copy.png', '2017-06-29 22:29:48', '2017-06-29 22:29:48', '1'),
(13, NULL, NULL, 1, '13_Car_wash_gift_card_copy.png', '2017-06-29 22:30:01', '2017-06-29 22:30:01', '1'),
(14, NULL, NULL, 30, '14_Mani_Pedi_Gift_Card_copy.png', '2017-06-29 22:30:11', '2017-06-29 22:30:11', '1'),
(15, NULL, NULL, 30, '15_Oil_Change_Gift_Card_copy.png', '2017-06-29 22:30:22', '2017-06-29 22:30:22', '1'),
(16, NULL, NULL, 5, '16_$5_Starbucks_gift_card_copy.png', '2017-06-29 22:32:18', '2017-06-29 22:32:18', '2'),
(17, NULL, NULL, 10, '17_$10_Amazon_Gift_Card_copy.png', '2017-06-29 22:32:27', '2017-06-29 22:32:27', '2'),
(18, NULL, NULL, 10, '18_$10_Walmart_gift_card_copy.png', '2017-06-29 22:32:37', '2017-06-29 22:32:37', '2'),
(19, NULL, NULL, 20, '19_$20_BBB_Gift_card_copy.png', '2017-06-29 22:32:46', '2017-06-29 22:32:46', '2'),
(20, NULL, NULL, 20, '20_$20_Gas_Gift_Card_copy.png', '2017-06-29 22:33:01', '2017-06-29 22:33:01', '2'),
(21, NULL, NULL, 25, '21_$25_Amazon_Gift_Card_copy.png', '2017-06-29 22:33:16', '2017-06-29 22:33:16', '2'),
(22, NULL, NULL, 25, '22_$25_Walmart_Gift_Card_copy.png', '2017-06-29 22:33:28', '2017-06-29 22:33:28', '2'),
(23, NULL, NULL, 50, '23_$50_BBB_gfit_card_copy.png', '2017-06-29 22:33:35', '2017-06-29 22:33:36', '2'),
(24, NULL, NULL, 50, '24_$50_Visa_Gift_Card_copy.png', '2017-06-29 22:33:43', '2017-06-29 22:33:43', '2'),
(25, NULL, NULL, 50, '25_$50_Walmart_Gift_Card_copy.png', '2017-06-29 22:33:56', '2017-06-29 22:33:56', '2'),
(26, NULL, NULL, 100, '26_$100_BBB_gift_card_copy.png', '2017-06-29 22:34:05', '2017-06-29 22:34:05', '2'),
(27, NULL, NULL, 5, '27_$5_Starbucks_gift_card.png', '2017-06-29 22:34:43', '2017-06-29 22:34:43', '3'),
(28, NULL, NULL, 10, '28_$10_Amazon_Gift_Card.png', '2017-06-29 22:34:50', '2017-06-29 22:34:50', '3'),
(29, NULL, NULL, 10, '29_$10_Gas_Gift_Card.png', '2017-06-29 22:34:58', '2017-06-29 22:34:59', '3'),
(30, NULL, NULL, 20, '30_$20_BBB_Gift_card.png', '2017-06-29 22:35:05', '2017-06-29 22:35:05', '3'),
(31, NULL, NULL, 20, '31_$20_Grocery_Gift_Card.png', '2017-06-29 22:35:14', '2017-06-29 22:35:14', '3'),
(32, NULL, NULL, 50, '32_$50_BBB_gfit_card.png', '2017-06-29 22:35:44', '2017-06-29 22:35:44', '3'),
(33, NULL, NULL, 100, '33_$100_Amazon_Gift_Card.png', '2017-06-29 22:35:52', '2017-06-29 22:35:52', '3'),
(34, NULL, NULL, 100, '34_$100_BBB_gift_card.png', '2017-06-29 22:36:00', '2017-06-29 22:36:01', '3'),
(35, NULL, NULL, 100, '35_2_Movie_Tickets_Gift_Card.png', '2017-06-29 22:36:11', '2017-06-29 22:36:11', '3'),
(36, NULL, NULL, 100, '36_PTO_Voucher.png', '2017-06-29 22:36:19', '2017-06-29 22:36:19', '3'),
(37, NULL, NULL, 10, '37_$10_Gas_Gift_Card.png', '2017-06-29 22:36:48', '2017-06-29 22:36:48', '4'),
(38, NULL, NULL, 10, '38_$10_Safeway_Gift_card.png', '2017-06-29 22:36:54', '2017-06-29 22:36:54', '4'),
(39, NULL, NULL, 20, '39_$20_BBB_Gift_card.png', '2017-06-29 22:37:01', '2017-06-29 22:37:01', '4'),
(40, NULL, NULL, 50, '40_$50_BBB_gfit_card.png', '2017-06-29 22:37:08', '2017-06-29 22:37:08', '4'),
(42, NULL, NULL, 50, '42_$50_Visa_Gift_Card.png', '2017-06-29 22:37:24', '2017-06-29 22:37:24', '4'),
(43, NULL, NULL, 100, '43_$100_BBB_gift_card.png', '2017-06-29 22:37:31', '2017-06-29 22:37:31', '4'),
(44, NULL, NULL, 100, '44_1_hour_massage_gift_card.png', '2017-06-29 22:37:39', '2017-06-29 22:37:39', '4'),
(45, NULL, NULL, 100, '45_2_Baseball_tickets_.png', '2017-06-29 22:37:46', '2017-06-29 22:37:46', '4'),
(46, NULL, NULL, 100, '46_2_Movie_Tickets_Gift_Card.png', '2017-06-29 22:37:53', '2017-06-29 22:37:53', '4'),
(47, NULL, NULL, 100, '47_4_baseball_tickets.png', '2017-06-29 22:38:01', '2017-06-29 22:38:01', '4'),
(48, NULL, NULL, 5, '48_$5_Starbucks_gift_card.png', '2017-06-29 22:38:52', '2017-06-29 22:38:52', '5'),
(49, NULL, NULL, 10, '49_$10_Gas_Gift_Card.png', '2017-06-29 22:38:59', '2017-06-29 22:38:59', '5'),
(50, NULL, NULL, 10, '50_$10_Walmart_gift_card.png', '2017-06-29 22:39:08', '2017-06-29 22:39:08', '5'),
(51, NULL, NULL, 20, '51_$20_BBB_Gift_card.png', '2017-06-29 22:39:14', '2017-06-29 22:39:14', '5'),
(52, NULL, NULL, 25, '52_$25_Amazon_Gift_Card.png', '2017-06-29 22:39:20', '2017-06-29 22:39:21', '5'),
(53, NULL, NULL, 50, '53_$50_BBB_gfit_card.png', '2017-06-29 22:39:29', '2017-06-29 22:39:29', '5'),
(54, NULL, NULL, 50, '54_$50_Visa_Gift_Card.png', '2017-06-29 22:39:36', '2017-06-29 22:39:36', '5'),
(55, NULL, NULL, 100, '55_$100_BBB_gift_card.png', '2017-06-29 22:39:43', '2017-06-29 22:39:43', '5'),
(56, NULL, NULL, 100, '56_1_hour_massage_gift_card.png', '2017-06-29 22:39:53', '2017-06-29 22:39:53', '5'),
(57, NULL, NULL, 100, '57_2_Movie_Tickets_Gift_Card.png', '2017-06-29 22:40:00', '2017-06-29 22:40:01', '5'),
(58, NULL, NULL, 100, '58_Dinner_with_Kevin_and_Greg_Gift_Card.png', '2017-06-29 22:40:10', '2017-06-29 22:40:10', '5');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'Super Admin', NULL, '2016-08-16 00:44:16', '2016-08-16 00:44:21'),
(2, 'admin', 'Admin', NULL, '2016-08-16 00:44:16', '2016-08-16 00:44:16'),
(3, 'employee-manager', 'Employee Manager', NULL, '2016-08-16 00:44:16', '2016-08-16 00:44:16'),
(4, 'scheduling-manager', 'Scheduling Manager', NULL, '2016-08-16 00:44:16', '2016-08-16 00:44:16'),
(5, 'patient-manager', 'Patient Manager', NULL, '2016-08-16 00:44:16', '2016-08-16 00:44:16'),
(6, 'employee', 'Employee', NULL, '2016-08-16 00:44:16', '2016-08-16 00:44:16'),
(7, 'super-executive', 'Super Executive User', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shift_master`
--

CREATE TABLE `shift_master` (
  `id` int(11) NOT NULL,
  `shift_unit` varchar(255) DEFAULT NULL,
  `shift_discipline` varchar(255) DEFAULT NULL,
  `shift_job_title` varchar(255) DEFAULT NULL,
  `shift_date` varchar(255) DEFAULT NULL,
  `shift_time` varchar(255) DEFAULT NULL,
  `shift_pecks` varchar(255) DEFAULT NULL,
  `shift_notes` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `fac_id` varchar(50) DEFAULT NULL,
  `shift_starttime` varchar(10) DEFAULT NULL,
  `shift_endtime` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift_master`
--

INSERT INTO `shift_master` (`id`, `shift_unit`, `shift_discipline`, `shift_job_title`, `shift_date`, `shift_time`, `shift_pecks`, `shift_notes`, `status`, `employee_id`, `user_id`, `created_at`, `updated_at`, `fac_id`, `shift_starttime`, `shift_endtime`) VALUES
(3, '1', '2', '2', '2017-06-27', NULL, '2', 'a adf', NULL, NULL, 19, '2017-06-27 14:29:54', NULL, '1', '00:00', '12:00'),
(4, '2', '1', '1', '2017-07-01', NULL, '2', '', NULL, NULL, 19, '2017-07-01 14:14:24', NULL, '1', '00:00', '12:55');

-- --------------------------------------------------------

--
-- Table structure for table `startsurvey`
--

CREATE TABLE `startsurvey` (
  `pid` int(11) NOT NULL,
  `incid` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `discipline` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `avg` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `avg_rating` decimal(11,0) DEFAULT NULL,
  `q1` int(11) NOT NULL DEFAULT '0',
  `q2` int(11) NOT NULL DEFAULT '0',
  `q3` int(11) NOT NULL DEFAULT '0',
  `q4` int(11) NOT NULL DEFAULT '0',
  `q5` int(11) NOT NULL DEFAULT '0',
  `q6` int(11) NOT NULL DEFAULT '0',
  `q7` int(11) NOT NULL DEFAULT '0',
  `q8` int(11) NOT NULL DEFAULT '0',
  `q9` int(11) NOT NULL DEFAULT '0',
  `q10` int(11) NOT NULL DEFAULT '0',
  `q_count` int(11) NOT NULL DEFAULT '0',
  `code` varchar(4) DEFAULT NULL,
  `fac_id` varchar(50) DEFAULT NULL,
  `insurance_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `qid` (`qid`,`pid`,`eid`,`unit_id`) USING BTREE,
  ADD KEY `pid` (`pid`) USING BTREE,
  ADD KEY `eid` (`eid`) USING BTREE,
  ADD KEY `lid` (`unit_id`) USING BTREE,
  ADD KEY `incid` (`incid`) USING BTREE,
  ADD KEY `etid` (`etid`) USING BTREE;

--
-- Indexes for table `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`owner`) USING BTREE;

--
-- Indexes for table `award_type`
--
ALTER TABLE `award_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carriers`
--
ALTER TABLE `carriers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD UNIQUE KEY `catid` (`catid`) USING BTREE,
  ADD KEY `etid` (`etid`) USING BTREE,
  ADD KEY `etid_2` (`etid`) USING BTREE;

--
-- Indexes for table `code_master`
--
ALTER TABLE `code_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coinmanager`
--
ALTER TABLE `coinmanager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config_peck`
--
ALTER TABLE `config_peck`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_function`
--
ALTER TABLE `customer_function`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_master`
--
ALTER TABLE `customer_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_master`
--
ALTER TABLE `employee_master`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etid` (`etid`,`units`(767)) USING BTREE,
  ADD KEY `etid_2` (`etid`,`units`(767)) USING BTREE,
  ADD KEY `etid_3` (`etid`,`units`(767)) USING BTREE,
  ADD KEY `lid` (`units`(767)) USING BTREE,
  ADD KEY `catid` (`catid`) USING BTREE;

--
-- Indexes for table `employee_notification`
--
ALTER TABLE `employee_notification`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `d` (`employee_id`,`jobtitle_id`,`notification_id`) USING BTREE;

--
-- Indexes for table `employee_shift`
--
ALTER TABLE `employee_shift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etid` (`id`) USING BTREE,
  ADD KEY `etid_2` (`id`) USING BTREE;

--
-- Indexes for table `exitsurvey`
--
ALTER TABLE `exitsurvey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exit_question`
--
ALTER TABLE `exit_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `function_list`
--
ALTER TABLE `function_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hourly_rates`
--
ALTER TABLE `hourly_rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hourly_rate_shift`
--
ALTER TABLE `hourly_rate_shift`
  ADD UNIQUE KEY `unique` (`shift_id`,`hourly_rate_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsfeed`
--
ALTER TABLE `newsfeed`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsfeed_comments`
--
ALTER TABLE `newsfeed_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsfeed_likes`
--
ALTER TABLE `newsfeed_likes`
  ADD PRIMARY KEY (`news_id`,`user_id`);

--
-- Indexes for table `newsfeed_tags`
--
ALTER TABLE `newsfeed_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `patient_details`
--
ALTER TABLE `patient_details`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pinno` (`pinno`) USING BTREE,
  ADD UNIQUE KEY `ssn` (`ssn`) USING BTREE,
  ADD KEY `pinno_2` (`pinno`) USING BTREE,
  ADD KEY `lid` (`lid`) USING BTREE;

--
-- Indexes for table `patient_family`
--
ALTER TABLE `patient_family`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `qa`
--
ALTER TABLE `qa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `shift_master`
--
ALTER TABLE `shift_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `startsurvey`
--
ALTER TABLE `startsurvey`
  ADD PRIMARY KEY (`incid`),
  ADD KEY `pid` (`pid`) USING BTREE;

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2372;
--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `award_type`
--
ALTER TABLE `award_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;
--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `code_master`
--
ALTER TABLE `code_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;
--
-- AUTO_INCREMENT for table `coinmanager`
--
ALTER TABLE `coinmanager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `config_peck`
--
ALTER TABLE `config_peck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_master`
--
ALTER TABLE `employee_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1304;
--
-- AUTO_INCREMENT for table `employee_notification`
--
ALTER TABLE `employee_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2450;
--
-- AUTO_INCREMENT for table `employee_shift`
--
ALTER TABLE `employee_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exitsurvey`
--
ALTER TABLE `exitsurvey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `exit_question`
--
ALTER TABLE `exit_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;
--
-- AUTO_INCREMENT for table `hourly_rates`
--
ALTER TABLE `hourly_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=295;
--
-- AUTO_INCREMENT for table `newsfeed`
--
ALTER TABLE `newsfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsfeed_comments`
--
ALTER TABLE `newsfeed_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `newsfeed_tags`
--
ALTER TABLE `newsfeed_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `patient_details`
--
ALTER TABLE `patient_details`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pid as Primary Key', AUTO_INCREMENT=1521;
--
-- AUTO_INCREMENT for table `patient_family`
--
ALTER TABLE `patient_family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `qa`
--
ALTER TABLE `qa`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `shift_master`
--
ALTER TABLE `shift_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `startsurvey`
--
ALTER TABLE `startsurvey`
  MODIFY `incid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`etid`) REFERENCES `employee_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
