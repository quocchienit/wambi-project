-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2017 at 04:49 AM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wambiorg_santaanita`
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
  `answer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `qid`, `pid`, `eid`, `unit_id`, `catid`, `peck`, `incid`, `etid`, `date`, `user_type`, `survey_id`, `answer_id`) VALUES
(1, 1, 133, 254, 1, 2, 15, 0, 2, '2017-03-17 13:46:12', 'patient', NULL, 3),
(2, 2, 133, 254, 1, 2, 15, 0, 2, '2017-03-17 13:46:12', 'patient', NULL, 3),
(3, 3, 133, 254, 1, 2, 0, 0, 2, '2017-03-17 13:46:12', 'patient', NULL, 1),
(4, 4, 133, 254, 1, 2, 15, 0, 2, '2017-03-17 13:46:12', 'patient', NULL, 3),
(5, 5, 133, 254, 1, 2, 0, 0, 2, '2017-03-17 13:46:13', 'patient', NULL, 1),
(6, 1, 132, 250, 1, 3, 25, 0, 2, '2017-03-22 16:11:41', 'patient', NULL, 5),
(7, 2, 132, 250, 1, 3, 25, 0, 2, '2017-03-22 16:11:41', 'patient', NULL, 5),
(8, 3, 132, 250, 1, 3, 25, 0, 2, '2017-03-22 16:11:41', 'patient', NULL, 5),
(9, 4, 132, 250, 1, 3, 25, 0, 2, '2017-03-22 16:11:41', 'patient', NULL, 5),
(10, 5, 132, 250, 1, 3, 25, 0, 2, '2017-03-22 16:11:41', 'patient', NULL, 5),
(11, 1, 132, 245, 1, 2, 25, 0, 2, '2017-03-22 16:13:43', 'patient', NULL, 5),
(12, 2, 132, 245, 1, 2, 20, 0, 2, '2017-03-22 16:13:43', 'patient', NULL, 4),
(13, 3, 132, 245, 1, 2, 20, 0, 2, '2017-03-22 16:13:43', 'patient', NULL, 4),
(14, 4, 132, 245, 1, 2, 20, 0, 2, '2017-03-22 16:13:43', 'patient', NULL, 4),
(15, 5, 132, 245, 1, 2, 20, 0, 2, '2017-03-22 16:13:43', 'patient', NULL, 4),
(16, 1, 132, 246, 1, 2, 25, 0, 2, '2017-03-22 16:14:29', 'patient', NULL, 5),
(17, 2, 132, 246, 1, 2, 25, 0, 2, '2017-03-22 16:14:29', 'patient', NULL, 5),
(18, 3, 132, 246, 1, 2, 25, 0, 2, '2017-03-22 16:14:29', 'patient', NULL, 5),
(19, 4, 132, 246, 1, 2, 25, 0, 2, '2017-03-22 16:14:29', 'patient', NULL, 5),
(20, 5, 132, 246, 1, 2, 25, 0, 2, '2017-03-22 16:14:29', 'patient', NULL, 5),
(21, 1, 153, 248, 1, 2, 25, 0, 2, '2017-03-24 13:23:04', 'patient', NULL, 5),
(22, 2, 153, 248, 1, 2, 25, 0, 2, '2017-03-24 13:23:04', 'patient', NULL, 5),
(23, 3, 153, 248, 1, 2, 25, 0, 2, '2017-03-24 13:23:04', 'patient', NULL, 5),
(24, 4, 153, 248, 1, 2, 25, 0, 2, '2017-03-24 13:23:04', 'patient', NULL, 5),
(25, 5, 153, 248, 1, 2, 25, 0, 2, '2017-03-24 13:23:04', 'patient', NULL, 5),
(26, 1, 153, 244, 1, 2, 25, 0, 2, '2017-03-24 13:25:08', 'patient', NULL, 5),
(27, 2, 153, 244, 1, 2, 25, 0, 2, '2017-03-24 13:25:08', 'patient', NULL, 5),
(28, 3, 153, 244, 1, 2, 20, 0, 2, '2017-03-24 13:25:08', 'patient', NULL, 4),
(29, 4, 153, 244, 1, 2, 20, 0, 2, '2017-03-24 13:25:08', 'patient', NULL, 4),
(30, 5, 153, 244, 1, 2, 25, 0, 2, '2017-03-24 13:25:08', 'patient', NULL, 5),
(31, 1, 167, 251, 1, 3, 25, 0, 2, '2017-03-31 13:57:17', 'patient', NULL, 5),
(32, 2, 167, 251, 1, 3, 20, 0, 2, '2017-03-31 13:57:17', 'patient', NULL, 4),
(33, 3, 167, 251, 1, 3, 25, 0, 2, '2017-03-31 13:57:17', 'patient', NULL, 5),
(34, 4, 167, 251, 1, 3, 25, 0, 2, '2017-03-31 13:57:17', 'patient', NULL, 5),
(35, 5, 167, 251, 1, 3, 20, 0, 2, '2017-03-31 13:57:17', 'patient', NULL, 4),
(36, 1, 137, 244, 1, 2, 25, 0, 2, '2017-04-20 17:26:55', 'patient', NULL, 5),
(37, 2, 137, 244, 1, 2, 25, 0, 2, '2017-04-20 17:26:55', 'patient', NULL, 5),
(38, 3, 137, 244, 1, 2, 25, 0, 2, '2017-04-20 17:26:55', 'patient', NULL, 5),
(39, 4, 137, 244, 1, 2, 25, 0, 2, '2017-04-20 17:26:55', 'patient', NULL, 5),
(40, 5, 137, 244, 1, 2, 25, 0, 2, '2017-04-20 17:26:55', 'patient', NULL, 5),
(41, 1, 137, 247, 1, 2, 20, 0, 2, '2017-04-20 17:42:17', 'patient', NULL, 4),
(42, 2, 137, 247, 1, 2, 20, 0, 2, '2017-04-20 17:42:17', 'patient', NULL, 4),
(43, 3, 137, 247, 1, 2, 20, 0, 2, '2017-04-20 17:42:18', 'patient', NULL, 4),
(44, 4, 137, 247, 1, 2, 20, 0, 2, '2017-04-20 17:42:18', 'patient', NULL, 4),
(45, 5, 137, 247, 1, 2, 20, 0, 2, '2017-04-20 17:42:18', 'patient', NULL, 4),
(46, 1, 184, 266, 1, 2, 20, 0, 2, '2017-04-24 18:22:29', 'patient', NULL, 4),
(47, 2, 184, 266, 1, 2, 0, 0, 2, '2017-04-24 18:22:29', 'patient', NULL, 1),
(48, 3, 184, 266, 1, 2, 0, 0, 2, '2017-04-24 18:22:30', 'patient', NULL, 1),
(49, 4, 184, 266, 1, 2, 25, 0, 2, '2017-04-24 18:22:30', 'patient', NULL, 5),
(50, 1, 175, 247, 1, 2, 25, 0, 2, '2017-04-25 13:40:00', 'family_member', NULL, 5),
(51, 2, 175, 247, 1, 2, 25, 0, 2, '2017-04-25 13:40:00', 'family_member', NULL, 5),
(52, 3, 175, 247, 1, 2, 15, 0, 2, '2017-04-25 13:40:00', 'family_member', NULL, 3),
(53, 4, 175, 247, 1, 2, 25, 0, 2, '2017-04-25 13:40:00', 'family_member', NULL, 5),
(54, 1, 180, 247, 1, 2, 15, 0, 2, '2017-04-25 13:57:34', 'patient', NULL, 3),
(55, 2, 180, 247, 1, 2, 20, 0, 2, '2017-04-25 13:57:34', 'patient', NULL, 4),
(56, 3, 180, 247, 1, 2, 0, 0, 2, '2017-04-25 13:57:34', 'patient', NULL, 1),
(57, 4, 180, 247, 1, 2, 20, 0, 2, '2017-04-25 13:57:34', 'patient', NULL, 4);

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
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `awards`
--

INSERT INTO `awards` (`id`, `user_id`, `owner`, `owner_name`, `peck`, `redemcoin`, `balancecoin`, `date_created`, `enterytype`, `approval`, `note`, `type`, `period`, `award`, `status`) VALUES
(12, 19, 1, NULL, 5, NULL, NULL, '2017-03-01 05:00:00', NULL, '', NULL, 'unit_award', 1, 4, 'Accepted'),
(13, 19, 1, NULL, 5, NULL, NULL, '2017-03-01 05:00:00', NULL, '', NULL, 'unit_award', 1, 6, 'Accepted'),
(14, 20, 1, NULL, 10, NULL, NULL, '2017-03-03 05:00:00', NULL, '', NULL, 'unit_award', 1, 6, 'Accepted'),
(15, 19, 244, NULL, 456, NULL, NULL, '2017-03-03 05:00:00', NULL, '', NULL, 'employee_award', 2, 2, 'Accepted'),
(16, 20, 244, NULL, 432, NULL, NULL, '2017-03-03 05:00:00', NULL, '', NULL, 'employee_award', 1, 2, 'Accepted'),
(17, 20, 1, NULL, 222, NULL, NULL, '2017-03-03 05:00:00', NULL, '', NULL, 'unit_award', 2, 5, 'Accepted');

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
(26, '1', 'employee', 'Top Scoring Employee', '1', NULL),
(27, '1', 'unit', 'No Falls', '1', NULL),
(28, '2', 'unit', 'No Hap U\'s', '1', NULL),
(29, '3', 'unit', 'No Vap\'s', '1', NULL),
(30, '4', 'unit', 'No Clautis', '1', NULL),
(31, '2', 'employee', 'No Missed Punches', '1', NULL),
(32, '3', 'employee', 'Special Situations', '1', NULL),
(33, '5', 'unit', 'No Agency Use', '1', NULL),
(34, '6', 'unit', 'Introducing Wambi', '1', NULL);

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
(49, 'Sprint', '@messaging.sprintpcs.com'),
(50, 'Sumcom', '@tms.suncom.com'),
(51, 'Surewest Communicaitons', '@mobile.surewest.com'),
(52, 'T-Mobile', '@tmomail.net'),
(53, 'Telus', '@msg.telus.com'),
(54, 'Tracfone', '@txt.att.net'),
(55, 'Triton', '@tms.suncom.com'),
(56, 'Unicel', '@utext.com'),
(57, 'US Cellular', '@email.uscc.net'),
(58, 'Solo Mobile', '@txt.bell.ca'),
(59, 'Sprint', '@messaging.sprintpcs.com'),
(60, 'Sumcom', '@tms.suncom.com'),
(61, 'Surewest Communicaitons', '@mobile.surewest.com'),
(62, 'T-Mobile', '@tmomail.net'),
(63, 'Telus', '@msg.telus.com'),
(64, 'Triton', '@tms.suncom.com'),
(65, 'Unicel', '@utext.com'),
(66, 'US Cellular', '@email.uscc.net'),
(67, 'US West', '@uswestdatamail.com'),
(68, 'Verizon', '@vtext.com'),
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
  `display_name` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `code_master`
--

INSERT INTO `code_master` (`id`, `type`, `key`, `value`, `notes`, `display_name`) VALUES
(1, 'job_title', '1', 'R.N', '1', NULL),
(2, 'job_title', '2', 'C.N.A', '2', NULL),
(3, 'job_title', '3', 'L.V.N ', '3', NULL),
(7, 'discipline', '1', 'R.N', NULL, NULL),
(8, 'discipline', '2', 'C.N.A', NULL, NULL),
(9, 'discipline', '3', 'L.V.N', NULL, NULL),
(10, 'shift_pecks', '1', '15', '15', 'Urgent-'),
(11, 'shift_pecks', '2', '25', '25', 'Very Urgent-'),
(12, 'shift_pecks', '3', '30', '35', 'Extremely Urgent-'),
(14, 'shift_time', '1', '6:30 am - 3:00 pm', NULL, NULL),
(15, 'shift_time', '2', '7:00 am - 3:30 pm', NULL, NULL),
(16, 'shift_time', '3', '3:00 pm- 11:00 pm', NULL, NULL),
(17, 'shift_time', '4', '11:00 am- 7:00 am', NULL, NULL),
(20, 'unit', '1', '500', '1', NULL),
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
(102, 'exit_survey', '2', 'Nursing_Staff', 'nursingstaff', NULL),
(103, 'exit_survey', '3', 'Other_Therapy_Staff', 'othertherapystaff', NULL),
(104, 'exit_survey', '4', 'Facility_Unit', 'facility_unit', NULL),
(105, 'insurance', '42', 'HCP', NULL, NULL),
(106, 'insurance', '43', 'MCAL', NULL, NULL),
(107, 'insurance', '44', 'MCARE', NULL, NULL),
(112, 'csstype', 'default', 'Default', NULL, NULL),
(113, 'csstype', 'primary', 'Primary', NULL, NULL),
(114, 'csstype', 'info', 'Info', NULL, NULL),
(115, 'csstype', 'success', 'Success', NULL, NULL),
(116, 'csstype', 'warning', 'Warning', NULL, NULL),
(117, 'csstype', 'danger', 'Danger', NULL, NULL),
(118, 'csstype', 'pink', 'Pink', NULL, NULL),
(119, 'csstype', 'purple', 'Purple', NULL, NULL);

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
(1, 'Request comfort wheelchair \r\nCell phone gone for 3 days- charging for 3 days\r\nMs Martinez has it \r\nPoor communication with nurse about foot doctor and other appt \r\nHow much longer until he is discharged \r\n', NULL, 146, '', '', '', '', '2017-03-16 14:45:04'),
(2, 'She needs to get her act together. I wanted to get into bed at 8p.m. But she was to busy and didn\'t put me into bed until 10p.m. She needs to be more professional. I do not understand she is always eating. I have called her a couple of times she says she will come back, but she never comes back. Sometimes the call light does not work so I have to shout for her. Even after shooting she still doesn\'t come right away. ', 254, 133, '', '', '', '', '2017-03-17 13:50:14'),
(3, 'She is the best, makes you feel at one. God bless her!', 250, 132, '', '', '', '', '2017-03-22 16:12:11'),
(4, 'Very inspirational, helped me while I was really feeling down.', 245, 132, '', '', '', '', '2017-03-22 16:14:06'),
(5, 'We need more nurses like her. Very inspiring, very caring, very helpful. She was not even assigned to me but anytime she is in my room she helps me.', 246, 132, '', '', '', '', '2017-03-22 16:15:39'),
(6, 'Case manager Joseph was never around when I needed him, I left 3 messages from him and never showed up. The 1st day he came in I was very out of it, never seen him after that. Eli is the best! She has helped me fill out paperwork for work and all my necessities. When I came in I was depressed didn\'t want to be here, now I\'m sad I\'m leaving but happy to be going home. The nurse I had last night 3/21/17 from 3-11 he was very proactive would come and always ask if needed anything, really gentle. Th', NULL, 132, '', '', '', '', '2017-03-22 16:37:14'),
(7, 'I am a smoker, my daughter had brought my cigarettes. I stepped outside to smoke one and came back to my room to find that it had been searched without my permission or knowing that they wanted to search. I was just outside and no one came to find me. Social services had not once explained my resident rights to me and that if you smoked in the facility the nurses need to keep the cigarettes and lighter with them in the medicine cart. I thought someone had stole them out of my drawer. All of the ', NULL, 158, '', '', '', '', '2017-03-22 17:31:35'),
(8, 'Very comfortable here. Janet made me very happy and very comfortable. All fine looking here.', NULL, 157, '', '', '', '', '2017-03-22 17:42:21'),
(9, 'He is very amazing, she is very gentle with my mom, very caring and that\'s what like to most! Very easy to approach, Makes you very comfortable and listens to everything. Really amazing. Called him an angel!', 248, 153, '', '', '', '', '2017-03-24 13:24:38'),
(10, 'He was really good helping out.', 244, 153, '', '', '', '', '2017-03-24 13:25:36'),
(11, 'First off no one spoke to us regarding co-pay. The nurses are amazing, everyone in general is caring. I really noticed a lot of good things! ', NULL, 153, '', '', '', '', '2017-03-24 13:31:45'),
(12, 'The staff ias very friendly. They truly seem like they care and all my concerns were heard, they made me feel comfortable and at home.', 266, 184, '', '', '', '', '2017-04-24 18:25:22'),
(13, 'Everyone is wonderful when I need help with something if they are not able to assist me right away they find ways to accommodate  me.', NULL, 184, '', '', '', '', '2017-04-24 18:31:13'),
(14, 'Great attitude ', 247, 175, '', '', '', '', '2017-04-25 13:40:15'),
(15, 'Need to be more attentive.  They do not show like they want to put in the effort', NULL, 177, '', '', '', '', '2017-04-25 13:49:46');

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
  `to_exceptional` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `config_peck`
--

INSERT INTO `config_peck` (`id`, `unit_id`, `poor`, `fair`, `ok`, `good`, `great`, `urgent`, `v_urgent`, `e_urgent`, `from_need`, `to_need`, `from_sactisfactory`, `to_sactisfactory`, `from_good`, `to_good`, `from_excellent`, `to_excellent`, `from_exceptional`, `to_exceptional`) VALUES
(1, '1', 0, 10, 15, 20, 25, 100, 200, 350, 0, 59, 60, 69, 70, 79, 80, 89, 90, 100),
(6, '2', 1, 2, 3, 4, 5, 15, 25, 30, 0, 59, 60, 69, 70, 79, 80, 89, 90, 100),
(15, '3', 1, 2, 3, 4, 5, 15, 25, 30, 0, 59, 60, 69, 70, 79, 80, 89, 90, 100);

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
(0, 1, 1, 0);

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
(1, 1, 'out-patient', 0),
(2, 2, 'santaanita.wambi.org', 1);

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
  `address` varchar(250) NOT NULL,
  `shifts` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mobile` varchar(250) NOT NULL,
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
  `upload_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_master`
--

INSERT INTO `employee_master` (`id`, `etid`, `clockid`, `units`, `catid`, `disciplines`, `firstname`, `lastname`, `dob`, `lastlogin`, `hiredate`, `address`, `shifts`, `email`, `mobile`, `image`, `password`, `employeeid`, `job`, `carrier`, `job_description`, `remember_token`, `pecks`, `image_new`, `status`, `upload_date`) VALUES
(19, 4, 4444, '[\"1\"]', 1, '[\"1\",\"2\",\"3\"]', 'Super', 'Admin', '2016-12-09', '2016-03-11', '2016-12-24 00:00:00', '96I6 - PLANTATION', '[\"1\"]', 'tanphuqncrm@gmail.com', '9545527533', '4444_Screen Shot 2017-02-21 at 1.41.06 PM.png', '$2y$10$muGZAV4OSGBcW5jCYAr96OIaPqR8StAGdCbT7rtIZZkUna4j2dNeC', 4444, 1, '@mymetropcs.com', NULL, 'KpiSqjhet0ROEifrdt30pBIhaLSmXAqDNOF9LQSOizWTZVtGwh3ZFexVYmb7', 0, NULL, 0, NULL),
(20, 3, 3333, '[\"1\"]', 1, '[\"2\"]', 'Admin', 'User', '2016-12-09', '2016-03-11', '2016-12-09 00:00:00', 'fdas', '[\"1\"]', 'davidjonesmail@gmail.com', '9545527533', '3333_Screen Shot 2017-02-21 at 1.41.06 PM.png', '$2y$10$muGZAV4OSGBcW5jCYAr96OIaPqR8StAGdCbT7rtIZZkUna4j2dNeC', 3333, 2, '@mymetropcs.com', NULL, 'RqmGSA64EiNGSNnrChntE2xvMGSorOf1ZaRuqWVhAKvlmAxuFfFxgF614cX7', 180, NULL, 0, NULL),
(244, 2, 6216, '[\"1\"]', NULL, '[\"2\"]', 'Edgar', 'Carrasco', '0000-00-00', '0000-00-00', '2005-09-26 00:00:00', '1560 S. Otterbein Ave # 39, Rowland Heights, CA  91748', '[\"1\"]', 'temp@wcmssolutions.com', '6262417932', '6216_Screen Shot 2017-03-16 at 4.58.34 PM.png', '', 6216, 2, '@mymetropcs.com', '', 'ElQ4hg9ETpnGPogwQS9unmxhCH09fTSP7Qju4X9JLMMti5cWDMNsJ4uu48KF', 1365, '6216_IMG_0013.JPG', 0, '0000-00-00 00:00:00'),
(245, 2, 7444, '[\"1\"]', NULL, '[\"2\"]', 'Beatriz', 'Hernandez', '0000-00-00', '0000-00-00', '2016-09-09 00:00:00', '11324 Orachard Street, El Monte, CA  91731', '[\"1\"]', 'bhernandez121@live.com', '6263299453', '7444_Screen Shot 2017-03-16 at 5.05.54 PM.png', '', 7444, 2, '@tmomail.net', '', 'cdO8DfJ2mSNhpY0nlu6qSFIdUU0sqYGlEOPMeZcOUj8H2aaVPRkk7RGu3ND0', 342, '7444_20150816_145034.jpg', 0, '0000-00-00 00:00:00'),
(246, 2, 4018, '[\"1\"]', NULL, '[\"2\"]', 'Maricela', 'Hernandez', '0000-00-00', '0000-00-00', '1993-06-07 00:00:00', '502 Ledford Avenue,       La Puente, CA   91744', '[\"1\"]', 'temp@wcmssolutions.com', '6269617270', '', '', 4018, 2, '@mymetropcs.com', '', '', 362, '', 0, '0000-00-00 00:00:00'),
(247, 2, 6563, '[\"1\"]', NULL, '[\"2\"]', 'Janet', 'Sanchez', '0000-00-00', '0000-00-00', '2007-10-26 00:00:00', '2325 Angela ST, #4, Pomona, CA   91766', '[\"1\"]', 'temp@wcmssolutions.com', '9095486910', '6563_Screen Shot 2017-03-16 at 5.09.13 PM.png', '', 6563, 2, '@mymetropcs.com', '', 'Vtu0vkRywHlcMu4RvACNhyQ9OSO7NlGVYG8C86fnobzRxVhjfDTDxYqZa875', 482, '6563_IMG_0003.JPG', 0, '0000-00-00 00:00:00'),
(248, 2, 5841, '[\"1\"]', NULL, '[\"2\"]', 'Emilio ', 'Soriano', '0000-00-00', '0000-00-00', '2003-03-07 00:00:00', '3524 Durfee Ave., Apt #7, El Monte, CA  91732', '[\"1\"]', 'temp@wcmssolutions.com', '6262537851', '', '', 5841, 2, '@mymetropcs.com', '', '', 362, '', 0, '0000-00-00 00:00:00'),
(249, 2, 6833, '[\"1\"]', NULL, '[\"3\"]', 'Vivia ', 'Espinal', '0000-00-00', '0000-00-00', '2016-03-28 00:00:00', '236 N. Michigan Avenue, Pasadena,  CA  91106', '[\"2\"]', 'temp@wcmssolutions.com', '6267928027', '6833_Screen Shot 2017-03-16 at 5.13.40 PM.png', '', 6833, 3, '@mymetropcs.com', '', 'yiVmb9TejYJxv5rn9PpUevLcoeuB9PovEzdi4Zgx5elLEcQab5OXvmm98JkJ', 237, '6833_IMG_0009.JPG', 0, '0000-00-00 00:00:00'),
(250, 2, 7449, '[\"1\"]', NULL, '[\"3\"]', 'Mariza', 'Guzman', '0000-00-00', '0000-00-00', '2002-10-08 00:00:00', '9540 Olney Avenue, Rosemead,  CA   91770', '[\"2\"]', 'temp@wcmssolutions.com', '6264439548', '', '', 7449, 3, '@mymetropcs.com', '', 'ioxcvGZDpvBI4wDm3V27pqonb8GTnfWdxXsdSTU6xhVXgOpcyttTCLOfns22', 362, '', 0, '0000-00-00 00:00:00'),
(251, 2, 7458, '[\"1\"]', NULL, '[\"3\"]', 'Ophalyn', 'Lee', '0000-00-00', '0000-00-00', '2016-10-17 00:00:00', '4804 Hallifax Road, Temple City, CA  91780', '[\"2\"]', 'Ophalynvn12@gmail.com', '6263427183', '7458_Screen Shot 2017-03-27 at 4.23.33 PM.png', '', 7458, 3, '@tmomail.net', '', 'LFY8UmX9AwYYPum3InDH9hiu3uM0n2dpS8DZV4BKIC7i6iwNAVqVaOQjGSN7', 352, '7458_IMG_0016.JPG', 0, '0000-00-00 00:00:00'),
(252, 2, 6603, '[\"1\"]', NULL, '[\"3\"]', 'Zhi (Kelly)', 'Wang', '0000-00-00', '0000-00-00', '2008-02-26 00:00:00', '16603 Dawn Haven Road, Hacienda Heights, CA  91745', '[\"2\"]', 'temp@wcmssolutions.com', '6266608391', '6603_Screen Shot 2017-03-16 at 5.16.12 PM.png', '', 6603, 3, '@mymetropcs.com', '', 'jcpGVljxZrda0bscZeY2JVa1jMcuJfWiRrsd1wdHmNdIOlJ8DnfNdTh6dpUe', 237, '6603_IMG_0007.JPG', 0, '0000-00-00 00:00:00'),
(253, 2, 7355, '[\"1\"]', NULL, '[\"2\"]', 'Aracela', 'Aragon', '0000-00-00', '0000-00-00', '2016-03-04 00:00:00', 'P. O. Box 2105, Rosemead, CA  91770', '[\"3\"]', 'temp@wcmssolutions.com', '6266506913', '', '', 7355, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(254, 2, 5093, '[\"1\"]', NULL, '[\"2\"]', 'Gloria', 'Diaz', '0000-00-00', '0000-00-00', '1999-08-27 00:00:00', '2520 Tamara Avenue,     El Monte, CA   91733', '[\"3\"]', 'temp@wcmssolutions.com', '6265753445', '', '', 5093, 2, '@mymetropcs.com', '', '', 282, '', 0, '0000-00-00 00:00:00'),
(255, 2, 7130, '[\"1\"]', NULL, '[\"2\"]', 'Arely', 'Fuentes', '0000-00-00', '0000-00-00', '2014-07-23 00:00:00', '5620 Welland Ave., Apt 2A, Temple City, CA  91780', '[\"3\"]', 'temp@wcmssolutions.com', '6264475386', '', '', 7130, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(256, 2, 6970, '[\"1\"]', NULL, '[\"2\"]', 'Sandra', 'Ramirez', '0000-00-00', '0000-00-00', '2012-06-14 00:00:00', '22 1/2 S. Marguerita Ave., Alhambra, CA  91801', '[\"3\"]', 'temp@wcmssolutions.com', '6262813304', '', '', 6970, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(257, 2, 4916, '[\"1\"]', NULL, '[\"2\"]', 'Jorge', 'Rayos', '0000-00-00', '0000-00-00', '1958-11-09 00:00:00', '3537 Cosbey Street, Baldwin Park, CA   91706', '[\"3\"]', 'temp@wcmssolutions.com', '6266400579', '', '', 4916, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(258, 2, 6526, '[\"1\"]', NULL, '[\"2\"]', 'Gloria', 'Villacorta', '0000-00-00', '0000-00-00', '2007-09-06 00:00:00', '13927 Barrydale Street, La Puente, C  91746', '[\"3\"]', 'temp@wcmssolutions.com', '6266927897', '', '', 6526, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(259, 2, 7454, '[\"1\"]', NULL, '[\"3\"]', 'Jason ', 'Ganiron', '0000-00-00', '0000-00-00', '2016-09-22 00:00:00', '4618 York Boulevard,    Los Angeles, CA   90041', '[\"3\"]', 'temp@wcmssolutions.com', '3234748518', '', '', 7454, 3, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(260, 2, 6438, '[\"1\"]', NULL, '[\"3\"]', 'Sheryl', 'Moreno', '0000-00-00', '0000-00-00', '2007-03-02 00:00:00', '11364 Azure Ct.,    Fontana, CA    92337', '[\"3\"]', 'temp@wcmssolutions.com', '6263832787', '', '', 6438, 3, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(261, 2, 7336, '[\"1\"]', NULL, '[\"3\"]', 'Li', 'Zhen', '0000-00-00', '0000-00-00', '2016-03-09 00:00:00', '8526 Klingerman Street, El Monte, CA   91732', '[\"3\"]', 'temp@wcmssolutions.com', '6268729872', '', '', 7336, 3, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(262, 2, 6712, '[\"1\"]', NULL, '[\"1\"]', 'Carmen', 'Dolorito', '0000-00-00', '0000-00-00', '2008-10-28 00:00:00', '612 N. 1st Avenue, Arcadia, CA  91006', '[\"3\"]', 'temp@wcmssolutions.com', '6264461225', '', '', 6712, 1, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(263, 2, 4153, '[\"1\"]', NULL, '[\"1\"]', 'Wendy', 'Shieh', '0000-00-00', '0000-00-00', '1994-05-11 00:00:00', 'P. O. Box 460,          Temple City, CA  91780', '[\"3\"]', 'temp@wcmssolutions.com', '6264519940', '', '', 4153, 1, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(264, 2, 7462, '[\"1\"]', NULL, '[\"2\"]', 'Dewi', 'Arjani', '0000-00-00', '0000-00-00', '2016-10-19 00:00:00', '225 Evergreen Ct.    Azusa, CA 91702', '[\"4\"]', 'temp@wcmssolutions.com', '3232067357', '', '', 7462, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(265, 2, 7449, '[\"1\"]', NULL, '[\"2\"]', 'Destiny', 'Juarez', '0000-00-00', '0000-00-00', '2016-09-14 00:00:00', '20951 Delphine Drive, Walnut, CA   91789', '[\"4\"]', 'temp@wcmssolutions.com', '9095411112', '', '', 7449, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(266, 2, 7461, '[\"1\"]', NULL, '[\"2\"]', 'Jessica', 'Montes', '0000-00-00', '0000-00-00', '2016-10-18 00:00:00', '11728 1/2 Bryant Road, El Monte, CA  91732', '[\"4\"]', 'temp@wcmssolutions.com', '6263241533', '', '', 7461, 2, '@mymetropcs.com', '', '', 282, '', 0, '0000-00-00 00:00:00'),
(267, 2, 6741, '[\"1\"]', NULL, '[\"2\"]', 'Avelina', 'Sanchez', '0000-00-00', '0000-00-00', '2009-04-02 00:00:00', '5017 Peck Road, # 10,     El Monte, CA  91732', '[\"4\"]', 'temp@wcmssolutions.com', '6266521164', '', '', 6741, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(268, 2, 4109, '[\"1\"]', NULL, '[\"2\"]', 'Martha', 'Sanchez', '0000-00-00', '0000-00-00', '1994-01-12 00:00:00', '5017 Gayhurst Avenue, Baldwin Park, Ca  91706', '[\"4\"]', 'temp@wcmssolutions.com', '6265396292', '', '', 4109, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(269, 2, 7178, '[\"1\"]', NULL, '[\"2\"]', 'Manuel', 'Serrano', '0000-00-00', '0000-00-00', '2015-01-29 00:00:00', '4675 York Blvd., Apt A, Los Angeles, CA   90041', '[\"4\"]', 'temp@wcmssolutions.com', '3232445799', '', '', 7178, 2, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(270, 2, 7309, '[\"1\"]', NULL, '[\"3\"]', 'Maria', 'Serrano', '0000-00-00', '0000-00-00', '2015-12-18 00:00:00', '4675 York Blvd., Apt A, Los Angeles, CA   90041', '[\"4\"]', 'temp@wcmssolutions.com', '3235326355', '', '', 7309, 3, '@mymetropcs.com', '', '', 237, '', 0, '0000-00-00 00:00:00'),
(271, 1, 1669, '[\"1\"]', NULL, '[\"1\"]', 'Scheduling ', 'Manager', '0000-00-00', '0000-00-00', '2017-02-06 00:00:00', '', '[\"1\"]', 'alexandracoren@gmail.com', '3054945599', '', '$2y$10$pa6SWiIhB8ybDNyVichnYeKdASftzCNANhxaskbJEHv9t9D58RRQu', 1669, 1, '@vtext.com', NULL, 'snmffllSfKNqzlt0azl45eewFw3LbhHCPfiLztk2N9i0gKyJu6s9l8KpIMk9', 0, NULL, 0, NULL),
(272, 5, 1668, '[\"1\"]', NULL, '[\"1\"]', 'Patient', 'Manager', '0000-00-00', '0000-00-00', '2017-02-05 00:00:00', '', '[\"2\"]', 'rebecca@wambi.org', '3054945599', '', '$2y$10$DPzq8pZ3Bh1mo/S4C8NY1O4qQa2u6SvOP4kVMP71.AmYvxG/.uXIO', 1668, 1, '@vtext.com', NULL, 'CaFnZZsKCZM1FunpqhP6C5DiuLHHXH8jxOjxoqtBLX6IhWTiqPaEffEUyVUg', 180, NULL, 0, NULL),
(273, 4, 7177, '[\"1\"]', NULL, '[\"1\"]', 'Wendy', 'Rivas', '0000-00-00', '0000-00-00', '2017-02-27 00:00:00', '', '[\"1\"]', 'wrivas@gshci.com', '6268635198', '', '$2y$10$VcLOcEq0v8A9dk0oeDicHeDYmE5T7rjlBmzmGyig9ExhzUh0lsjEm', 7177, 1, '@tmomail.net', NULL, 'n40RgyNAtlITDYrECAZFXUuwA6quq3VVsHsq99XPE4nb7D0DdVQB5TEsoc0u', 0, NULL, 0, NULL),
(274, 4, 7097, '[\"1\"]', NULL, '[\"1\"]', 'Tova', 'Altmann', '0000-00-00', '0000-00-00', '0014-03-17 00:00:00', '', '[\"1\"]', 'tshallman@gmail.com', '3107569116', '', '$2y$10$snJqJ0DsWrqJ81nxcFfKcudZh3YzAlW2Ga0suSs24S7VzdcF78052', 7097, 1, '@tmomail.net', NULL, NULL, 0, NULL, 0, NULL),
(275, 4, 6924, '[\"1\"]', NULL, '[\"1\"]', 'Gabby', 'McDonald', '0000-00-00', '0000-00-00', '0011-11-14 00:00:00', '', '[\"1\"]', 'gabriellem@santaanitaconvalescent.com', '6266982705', '', '$2y$10$M9ncuNtB4ETykCQOP8ah3umUfSqroTJtdskiJlhhbnUN4bHaUnNIG', 6924, 1, '@tmomail.net', NULL, 'TPHa0PIjDEMclTzlmMPptRgS6AD9LqUnVjykTlRPn7D7KewKdnWaoO291VbB', 15, NULL, 0, NULL),
(276, 5, 7204, '[\"1\"]', NULL, '[\"1\"]', 'Charlene', 'Ramirez', '0000-00-00', '0000-00-00', '0015-03-30 00:00:00', '', '[\"1\"]', 'charlene.ramirez@rocketmail.com', '6265864582', '', '$2y$10$/XlnoYL4FhQ9pbhyggBDgOPp3tsaIL1Bf.VbnCzx4EIKMBqB.LDte', 7204, 1, '@tmomail.net', NULL, NULL, 180, NULL, 0, NULL),
(277, 6, 4754, '[\"1\"]', NULL, '[\"1\"]', 'Kathy', 'Bell', '0000-00-00', '0000-00-00', '0098-04-01 00:00:00', '', '[\"1\"]', 'kbell@gshci.com', '6268265044', '', '$2y$10$4dl9fDolCqmiLbltt1JgheSP505szHjwOrbwOz9FpYvSeMlEnqQze', 4754, 1, '@vtext.com', NULL, NULL, 0, NULL, 0, NULL),
(278, 1, 3150, '[\"1\"]', NULL, '[\"1\"]', 'Helga', 'Castillo', '0000-00-00', '0000-00-00', '0089-12-18 00:00:00', '', '[\"1\"]', 'hcastillo@gshci.com', '6268040578', '', '$2y$10$og4mXh0aulTKN7R5CnRct.e3RMu93iP/xV9ay/4yoiZ44Iq0jO4.O', 3150, 1, '@tmomail.net', NULL, 'n848Ua2vzf9vxan77R5gsy0jCTqYsmh6gkV9lh17YmHut3GKp21jyEz9vHCr', 0, NULL, 0, NULL),
(279, 4, 7221, '[\"1\"]', NULL, '[\"1\"]', 'Natalie', 'Rivas', '0000-00-00', '0000-00-00', '0016-04-25 00:00:00', '', '[\"1\"]', 'nataliechrystine@yahoo.com', '6264000607', '', '$2y$10$rkKeDY5phGMAnlIRWwMCiuqaJeD01C2SWm4HmdntCdoNE9iZh8ffi', 7221, 1, '@tmomail.net', NULL, '3H6qW1tv98gT8QOi701uXmlBe7eurrwjEIUWxicCgy2RGAObjVRC3a2o4BDj', 15, NULL, 0, NULL),
(280, 5, 7374, '[\"1\"]', NULL, '[\"1\"]', 'Brianna', 'Viloria', '0000-00-00', '0000-00-00', '0016-05-09 00:00:00', '', '[\"1\"]', 'admissions@gshci.com', '6262156451', '', '$2y$10$pIKrL7/1cYhIwd.8fjcqVu7/VRofblWNNs15/e6bZpDnLHkKp4qaa', 7374, 1, '@tmomail.net', NULL, '4wAN9mNVl3tS2DXIHXSpiUvN2epFlb2Wwvita4MQSQQV7bMNCKMRtaRsv3aK', 180, NULL, 0, NULL);

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
(28, 244, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', '2017-02-25 14:50:02', 'SEEN_BUT_UNREAD', NULL),
(30, 246, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(31, 247, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', '2017-03-01 22:42:13', 'SEEN_BUT_UNREAD', NULL),
(32, 248, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(33, 249, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', '2017-03-24 18:15:37', 'SEEN_BUT_UNREAD', NULL),
(34, 250, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(35, 251, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', '2017-02-27 22:46:18', NULL, NULL),
(36, 252, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(37, 253, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(38, 254, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(39, 255, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(40, 256, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(41, 257, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(42, 258, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(43, 259, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(44, 260, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(45, 261, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(46, 262, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(47, 263, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(48, 264, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(49, 265, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(50, 266, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(51, 267, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(52, 268, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(53, 269, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(54, 270, 2, '{\"peck\":6666,\"award\":\"No Vap\'s\"}', '2017-02-25 14:46:54', NULL, 'NOT_SEEN', NULL),
(55, 244, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:42', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(57, 246, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(58, 247, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', '2017-03-01 22:42:13', 'SEEN_BUT_UNREAD', NULL),
(59, 248, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(60, 249, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', '2017-03-24 18:15:37', 'SEEN_BUT_UNREAD', NULL),
(61, 250, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(62, 251, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', '2017-02-28 04:59:43', 'SEEN_BUT_UNREAD', NULL),
(63, 252, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(64, 253, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(65, 254, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(66, 255, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(67, 256, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(68, 257, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(69, 258, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(70, 259, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(71, 260, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(72, 261, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(73, 262, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(74, 263, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(75, 264, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(76, 265, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(77, 266, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(78, 267, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(79, 268, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(80, 269, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(81, 270, 2, '{\"peck\":112,\"award\":\"No Falls\"}', '2017-02-28 02:09:43', NULL, 'NOT_SEEN', NULL),
(82, 244, 2, '{\"peck\":33,\"award\":\"No Missed Punches\"}', '2017-02-28 02:10:03', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(83, 244, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(85, 246, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(86, 247, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', '2017-03-01 22:42:13', 'SEEN_BUT_UNREAD', NULL),
(87, 248, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(88, 249, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', '2017-03-24 18:15:37', 'SEEN_BUT_UNREAD', NULL),
(89, 250, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(90, 251, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', '2017-02-28 04:59:43', 'SEEN_BUT_UNREAD', NULL),
(91, 252, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(92, 253, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(93, 254, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(94, 255, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(95, 256, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(96, 257, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(97, 258, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(98, 259, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(99, 260, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(100, 261, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(101, 262, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(102, 263, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(103, 264, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(104, 265, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(105, 266, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(106, 267, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(107, 268, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(108, 269, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(109, 270, 2, '{\"peck\":1234,\"award\":\"No Hap U\'s\"}', '2017-02-28 02:16:25', NULL, 'NOT_SEEN', NULL),
(110, 244, 2, '{\"peck\":34,\"award\":\"No Missed Punches\"}', '2017-02-28 02:17:47', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(111, 244, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(113, 246, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(114, 247, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', '2017-03-01 22:42:13', 'SEEN_BUT_UNREAD', NULL),
(115, 248, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(116, 249, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', '2017-03-24 18:15:37', 'SEEN_BUT_UNREAD', NULL),
(117, 250, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(118, 251, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', '2017-03-04 19:20:37', 'SEEN_BUT_UNREAD', NULL),
(119, 252, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(120, 253, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(121, 254, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(122, 255, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(123, 256, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(124, 257, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(125, 258, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(126, 259, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(127, 260, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(128, 261, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(129, 262, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(130, 263, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(131, 264, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(132, 265, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(133, 266, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(134, 267, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(135, 268, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(136, 269, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(137, 270, 2, '{\"peck\":5,\"award\":\"No Clautis\"}', '2017-03-01 21:04:56', NULL, 'NOT_SEEN', NULL),
(138, 19, 8, '1', '2017-03-03 23:01:56', '2017-03-03 23:05:27', 'SEEN_BUT_UNREAD', NULL),
(140, 274, 8, '1', '2017-03-03 23:01:56', NULL, 'NOT_SEEN', NULL),
(141, 244, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(143, 246, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(144, 247, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', '2017-03-16 17:44:16', 'SEEN_BUT_UNREAD', NULL),
(145, 248, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(146, 249, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', '2017-03-24 18:15:37', 'SEEN_BUT_UNREAD', NULL),
(147, 250, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(148, 251, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', '2017-03-04 19:20:48', NULL, NULL),
(149, 252, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(150, 253, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(151, 254, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(152, 255, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(153, 256, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(154, 257, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(155, 258, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(156, 259, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(157, 260, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(158, 261, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(159, 262, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(160, 263, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(161, 264, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(162, 265, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(163, 266, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(164, 267, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(165, 268, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(166, 269, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(167, 270, 2, '{\"peck\":10,\"award\":\"Introducing Wambi\"}', '2017-03-03 23:05:22', NULL, 'NOT_SEEN', NULL),
(168, 244, 2, '{\"peck\":456,\"award\":\"No Missed Punches\"}', '2017-03-03 23:10:11', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(169, 19, 8, '1', '2017-03-03 23:11:09', '2017-03-05 15:19:27', 'SEEN_BUT_UNREAD', NULL),
(171, 274, 8, '1', '2017-03-03 23:11:09', NULL, 'NOT_SEEN', NULL),
(172, 244, 2, '{\"peck\":432,\"award\":\"No Missed Punches\"}', '2017-03-03 23:11:36', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(173, 19, 8, '1', '2017-03-03 23:22:08', '2017-03-05 15:19:27', 'SEEN_BUT_UNREAD', NULL),
(175, 274, 8, '1', '2017-03-03 23:22:08', NULL, 'NOT_SEEN', NULL),
(176, 244, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', '2017-03-16 17:56:07', 'SEEN_BUT_UNREAD', NULL),
(178, 246, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', NULL, 'NOT_SEEN', NULL),
(179, 247, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', '2017-03-16 17:44:16', 'SEEN_BUT_UNREAD', NULL),
(180, 248, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', NULL, 'NOT_SEEN', NULL),
(181, 249, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', '2017-03-24 18:15:37', 'SEEN_BUT_UNREAD', NULL),
(182, 250, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', NULL, 'NOT_SEEN', NULL),
(183, 251, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', '2017-03-04 19:20:42', NULL, NULL),
(184, 252, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:28', NULL, 'NOT_SEEN', NULL),
(185, 253, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(186, 254, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(187, 255, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(188, 256, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(189, 257, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(190, 258, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(191, 259, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(192, 260, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(193, 261, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(194, 262, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(195, 263, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(196, 264, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(197, 265, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(198, 266, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(199, 267, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(200, 268, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(201, 269, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(202, 270, 2, '{\"peck\":222,\"award\":\"No Agency Use\"}', '2017-03-03 23:22:29', NULL, 'NOT_SEEN', NULL),
(203, 254, 3, '{\"peck\":45,\"survey_id\":1}', '2017-03-17 17:46:13', NULL, 'NOT_SEEN', NULL),
(204, 250, 3, '{\"peck\":125,\"survey_id\":2}', '2017-03-22 20:11:41', NULL, 'NOT_SEEN', NULL),
(206, 246, 3, '{\"peck\":125,\"survey_id\":4}', '2017-03-22 20:14:29', NULL, 'NOT_SEEN', NULL),
(207, 248, 3, '{\"peck\":125,\"survey_id\":5}', '2017-03-24 17:23:04', NULL, 'NOT_SEEN', NULL),
(208, 244, 3, '{\"peck\":115,\"survey_id\":6}', '2017-03-24 17:25:08', NULL, 'NOT_SEEN', NULL),
(209, 251, 3, '{\"peck\":115,\"survey_id\":7}', '2017-03-31 17:57:17', NULL, 'NOT_SEEN', NULL),
(210, 244, 3, '{\"peck\":125,\"survey_id\":8}', '2017-04-20 21:26:55', NULL, 'NOT_SEEN', NULL),
(211, 247, 3, '{\"peck\":100,\"survey_id\":9}', '2017-04-20 21:42:18', NULL, 'NOT_SEEN', NULL),
(212, 266, 3, '{\"peck\":45,\"survey_id\":10}', '2017-04-24 22:22:30', NULL, 'NOT_SEEN', NULL),
(213, 247, 3, '{\"peck\":90,\"survey_id\":11}', '2017-04-25 17:40:00', NULL, 'NOT_SEEN', NULL),
(214, 247, 3, '{\"peck\":55,\"survey_id\":12}', '2017-04-25 17:57:34', NULL, 'NOT_SEEN', NULL);

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
  `permission` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_type`
--

INSERT INTO `employee_type` (`id`, `type`, `name`, `icon`, `permission`) VALUES
(1, 'scheduling-manager', 'Scheduling Manager', 'upload/nursh.png', '[\"dashboard\"]'),
(2, 'employee', 'Employee', 'upload/ffff.png', '[\"dashboard\"]'),
(3, 'admin', 'Admin', '', '[\"dashboard\",\"newfeed\",\"coin\",\"addcoin\",\"list_approve_request\"]'),
(4, 'super-admin', 'Super Admin', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]'),
(5, 'patient-manager', 'Patient Manager', '', '[\"dashboard\",\"patient\"]'),
(6, 'employee-manager', 'Employee Manager', '', '');

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
  `q18` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exitsurvey`
--

INSERT INTO `exitsurvey` (`id`, `pid`, `q1`, `q2`, `q3`, `q4`, `q5`, `q6`, `q7`, `q8`, `q9`, `q10`, `q11`, `q12`, `q13`, `q14`, `q15`, `q16`, `q17`, `type`, `date`, `q19`, `q20`, `q21`, `q22`, `q23`, `q24`, `q25`, `q26`, `q27`, `q28`, `q29`, `q30`, `qcount`, `q18`) VALUES
(6, 133, 4, 1, 1, 3, 5, 5, 5, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 'patient', '2017-03-17 13:53:35', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 5),
(7, 132, 5, 5, 5, 5, 1, 1, 1, 1, 1, 5, 5, 5, 5, 5, 4, 4, 5, 'patient', '2017-03-22 16:19:01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 5),
(8, 158, 1, 1, 1, 1, 3, 3, 3, 3, 3, 5, 5, 5, 5, 4, 4, 4, 4, 'patient', '2017-03-22 17:26:33', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 4),
(9, 157, 4, 4, 4, 4, 4, 4, 4, 4, 3, 4, 4, 4, 4, 4, 4, 4, 4, 'patient', '2017-03-22 17:39:19', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 4),
(10, 153, 4, 4, 4, 4, 5, 5, 5, 5, 3, 5, 5, 5, 5, 4, 4, 4, 4, 'patient', '2017-03-24 13:29:23', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18, 4),
(11, 184, 5, 5, 5, 1, 5, 1, 5, 5, 5, 4, 5, 4, 4, 5, 5, 5, 5, 'patient', '2017-04-24 18:30:30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
(12, 175, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 'family_member', '2017-04-25 13:38:27', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
(13, 177, 3, 1, 4, 1, 2, 3, 4, 4, 4, 3, 1, 1, 2, 3, 3, 3, 2, 'patient', '2017-04-25 13:49:01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
(14, 180, 3, 3, 3, 1, 4, 1, 3, 2, 3, 3, 3, 2, 3, 2, 4, 4, 4, 'patient', '2017-04-25 13:55:34', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
(15, 175, 4, 4, 4, 1, 3, 1, 3, 3, 4, 3, 3, 1, 2, 3, 4, 4, 2, 'patient', '2017-04-26 19:18:37', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0);

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
  `unit_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `exit_question`
--

INSERT INTO `exit_question` (`id`, `qid`, `type`, `question`, `enabled`, `unit_id`) VALUES
(12, 1, 1, 'If you have concerns about the facility, do you know whom to address those concerns?', 1, 1),
(13, 2, 1, 'Takes enough time with you', 1, 1),
(14, 3, 1, 'Explains Patients Rights', 1, 1),
(15, 4, 1, 'Addressed Advance Directives', 1, 1),
(16, 1, 2, 'You feel the staff treats you with respect and dignity', 1, 1),
(17, 2, 2, 'You are asked to attend care plan meetings to discuss your care', 1, 1),
(18, 3, 2, 'The call light is answered in a timely manner', 1, 1),
(19, 4, 2, 'You have voiced concerns and have received immediate feedback from the staff', 1, 1),
(20, 1, 3, 'Friendly_and_helpful_to_you', 1, 1),
(21, 2, 3, 'Answers_your_questions', 1, 1),
(22, 3, 3, 'Explains_Treatment_Plan', 1, 1),
(23, 4, 3, 'Has_a_caring_attitude', 1, 1),
(24, 1, 4, 'You have been given information about your rights as a resident', 1, 1),
(25, 2, 4, 'You have easy access to the call light whenever you want it', 1, 1),
(26, 3, 4, 'Comfort_and_Safety', 1, 1),
(27, 4, 4, 'Privacy', 0, 1),
(28, 5, 4, 'Likelihood_of_referring_others', 1, 1),
(29, 1, 1, 'Listens_to_you_answers_questions', 1, 2),
(30, 2, 1, 'Takes_enough_time_with_you', 1, 2),
(31, 3, 1, 'Explains_what_you_want_to_know', 1, 2),
(32, 4, 1, 'Provides_good_advice_and_treatment', 1, 2),
(33, 1, 2, 'Listens_to_you_answers_questions', 1, 2),
(34, 2, 2, 'Provides_good_nursing_care', 1, 2),
(35, 3, 2, 'Takes_enough_time_with_you', 1, 2),
(36, 4, 2, 'Has_a_caring_attitude', 1, 2),
(37, 1, 3, 'Friendly_and_helpful_to_you', 1, 2),
(38, 2, 3, 'Answers_your_questions', 1, 2),
(39, 3, 3, 'Explains_Treatment_Plan', 1, 2),
(40, 4, 3, 'Has_a_caring_attitude', 1, 2),
(41, 1, 4, 'Neat_and_clean_building', 1, 2),
(42, 2, 4, 'Unit_easily_accessible', 1, 2),
(43, 3, 4, 'Comfort_and_Safety', 1, 2),
(44, 4, 4, 'Privacy', 1, 2),
(45, 5, 4, 'Likelihood_of_referring_others', 1, 2),
(46, 1, 1, 'Listens_to_you_answers_questions', 1, 3),
(47, 2, 1, 'Takes_enough_time_with_you', 1, 3),
(48, 3, 1, 'Explains_what_you_want_to_know', 1, 3),
(49, 4, 1, 'Provides_good_advice_and_treatment', 1, 3),
(50, 1, 2, 'Listens_to_you_answers_questions', 1, 3),
(51, 2, 2, 'Provides_good_nursing_care', 1, 3),
(52, 3, 2, 'Takes_enough_time_with_you', 1, 3),
(53, 4, 2, 'Has_a_caring_attitude', 1, 3),
(54, 1, 3, 'Friendly_and_helpful_to_you', 1, 3),
(55, 2, 3, 'Answers_your_questions', 1, 3),
(56, 3, 3, 'Explains_Treatment_Plan', 1, 3),
(57, 4, 3, 'Has_a_caring_attitude', 1, 3),
(58, 1, 4, 'Neat_and_clean_building', 1, 3),
(59, 2, 4, 'Unit_easily_accessible', 1, 3),
(60, 3, 4, 'Comfort_and_Safety', 1, 3),
(61, 4, 4, 'Privacy', 1, 3),
(62, 5, 4, 'Likelihood_of_referring_others', 1, 3),
(63, 5, 2, 'Overall would say this is a good facility to recieve care', 1, 1);

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
(0, 1, 'funtion out-patient');

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

--
-- Dumping data for table `hourly_rate_shift`
--

INSERT INTO `hourly_rate_shift` (`shift_id`, `hourly_rate_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

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
(1, 0, 'en', 'questions', 'Treats you with respect', 'Treats you with respect', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(2, 0, 'en', 'questions', 'Listens to your needs', 'Listens to your needs', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(3, 0, 'en', 'questions', 'Clearly explains your care and/or treatment plan', 'Clearly explains your care and/or treatment plan', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(4, 0, 'en', 'questions', 'Makes you feel comfortable when discussing sensitive topics', 'Makes you feel comfortable when discussing sensitive topics', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(5, 0, 'en', 'questions', 'Provides you with compassionate care', 'Provides you with compassionate care', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(6, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2016-10-03 14:53:48', '2016-11-06 14:42:36'),
(7, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2016-10-03 14:53:48', '2016-11-06 14:42:36'),
(8, 0, 'en', 'survey', 'evaluate_your_caregiver', 'Evaluate your Caregiver', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(9, 0, 'en', 'survey', 'patient_satisfaction_survey', 'Patient Satisfaction Survey', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(10, 0, 'en', 'survey', 'patient', 'Patient', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(11, 0, 'en', 'survey', 'other', 'Other', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(12, 0, 'en', 'survey', 'i_am_the', 'I am the', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(13, 0, 'en', 'survey', 'family_member', 'Family member', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(14, 0, 'en', 'survey', 'dont_know_login_info', 'I don\'t know my login info', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(15, 0, 'en', 'survey', 'username', 'Username', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(16, 0, 'en', 'survey', 'password', 'Password', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(17, 0, 'en', 'survey', 'all_caregivers', 'All Caregivers', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(18, 0, 'en', 'survey', 'nurses', 'R.N', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(19, 0, 'en', 'survey', 'respiratories', 'C.N.A', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(20, 0, 'en', 'survey', 'rehab', 'L.V.N', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(21, 0, 'en', 'survey', 'search_by_caregiver\'s_name', 'Search by Caregiver\'s Name', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(22, 0, 'en', 'survey', 'ok', 'Ok', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(23, 0, 'en', 'survey', 'good', 'Good', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(24, 0, 'en', 'survey', 'great', 'Great', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(25, 0, 'en', 'survey', 'fair', 'Fair', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(26, 0, 'en', 'survey', 'poor', 'Poor', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(27, 0, 'en', 'survey', 'are_you_sure', 'Are you sure you want to survey', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(28, 0, 'en', 'survey', 'cancel', 'Cancel', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(29, 0, 'en', 'survey', 'begin_survey', 'Begin Survey', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(30, 0, 'en', 'survey', 'home', 'Return home', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(31, 0, 'en', 'survey', 'thanks', 'THANK YOU', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(32, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(33, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(34, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(35, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(36, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(37, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(38, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(39, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(40, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(41, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(42, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(43, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(44, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(45, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(46, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(47, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(48, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(49, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(50, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(51, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(52, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(53, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(54, 0, 'en', 'validation', 'filled', 'The :attribute field is required.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(55, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(56, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(57, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(58, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(59, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(60, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(61, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(62, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(63, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(64, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(65, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(66, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(67, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(68, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(69, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(70, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(71, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(72, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(73, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(74, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(75, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(76, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(77, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(78, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(79, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(80, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(81, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(82, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(83, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(84, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(85, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(86, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(87, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(88, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(89, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(90, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(91, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(92, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(93, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(94, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(95, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(96, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2016-10-03 14:53:48', '2016-11-06 14:42:20'),
(97, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2016-10-03 14:53:48', '2016-11-06 14:42:20'),
(98, 0, 'es', 'questions', 'Treats you with respect', 'Me trata respetuosamente', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(99, 0, 'es', 'questions', 'Listens to your needs', 'Atiende a mis necesidades', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(100, 0, 'es', 'questions', 'Clearly explains your care and/or treatment plan', 'Explica mi plan de cuidado y/o tratamiento con claridad', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(101, 0, 'es', 'questions', 'Makes you feel comfortable when discussing sensitive topics', 'Me hace sentir cómodo al discutir temas sensibles', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(102, 0, 'es', 'questions', 'Provides you with compassionate care', 'Me trata con compasión', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(103, 0, 'es', 'auth', 'failed', 'These credentials do not match our records.', '2016-10-03 14:53:48', '2016-11-06 14:42:36'),
(104, 0, 'es', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2016-10-03 14:53:48', '2016-11-06 14:42:36'),
(105, 0, 'es', 'survey', 'evaluate_your_caregiver', 'Encueste a su cuidador', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(106, 0, 'es', 'survey', 'patient_satisfaction_survey', 'Evalúe su experiencia', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(107, 0, 'es', 'survey', 'patient', 'Patient', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(108, 0, 'es', 'survey', 'other', 'Other', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(109, 0, 'es', 'survey', 'i_am_the', 'I am the', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(110, 0, 'es', 'survey', 'family_member', 'Miembro de la familia', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(111, 0, 'es', 'survey', 'dont_know_login_info', 'I don\'t know my login info', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(112, 0, 'es', 'survey', 'username', 'Nombre de usuario', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(113, 0, 'es', 'survey', 'password', 'Contrasena', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(114, 0, 'es', 'survey', 'all_caregivers', 'TODOS LOS CUIDADORES', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(115, 0, 'es', 'survey', 'begin_survey', 'Comenzará Encuesta', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(116, 0, 'es', 'survey', 'good', 'Bueno', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(117, 0, 'es', 'survey', 'are_you_sure', 'Está seguro que desea completar una encuesta sobre', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(118, 0, 'es', 'survey', 'cancel', 'Cancelar', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(119, 0, 'es', 'survey', 'poor', 'Deficiente', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(120, 0, 'es', 'survey', 'fair', 'Malo', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(121, 0, 'es', 'survey', 'ok', 'Regular', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(122, 0, 'es', 'survey', 'great', 'Excelente', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(123, 0, 'es', 'survey', 'search_by_caregiver\'s_name', 'Buscar por Nombre del Cuidador', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(124, 0, 'es', 'survey', 'nurses', 'R.N', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(125, 0, 'es', 'survey', 'respiratories', 'C.N.A', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(126, 0, 'es', 'survey', 'rehab', 'L.V.N', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(127, 0, 'es', 'survey', 'home', 'Inicio', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(128, 0, 'es', 'survey', 'thanks', 'Gracias', '2016-10-03 14:53:48', '2017-03-28 10:27:30'),
(129, 0, 'es', 'validation', 'accepted', 'The :attribute must be accepted.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(130, 0, 'es', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(131, 0, 'es', 'validation', 'after', 'The :attribute must be a date after :date.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(132, 0, 'es', 'validation', 'alpha', 'The :attribute may only contain letters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(133, 0, 'es', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(134, 0, 'es', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(135, 0, 'es', 'validation', 'array', 'The :attribute must be an array.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(136, 0, 'es', 'validation', 'before', 'The :attribute must be a date before :date.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(137, 0, 'es', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(138, 0, 'es', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(139, 0, 'es', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(140, 0, 'es', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(141, 0, 'es', 'validation', 'boolean', 'The :attribute field must be true or false.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(142, 0, 'es', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(143, 0, 'es', 'validation', 'date', 'The :attribute is not a valid date.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(144, 0, 'es', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(145, 0, 'es', 'validation', 'different', 'The :attribute and :other must be different.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(146, 0, 'es', 'validation', 'digits', 'The :attribute must be :digits digits.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(147, 0, 'es', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(148, 0, 'es', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(149, 0, 'es', 'validation', 'email', 'The :attribute must be a valid email address.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(150, 0, 'es', 'validation', 'exists', 'The selected :attribute is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(151, 0, 'es', 'validation', 'filled', 'The :attribute field is required.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(152, 0, 'es', 'validation', 'image', 'The :attribute must be an image.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(153, 0, 'es', 'validation', 'in', 'The selected :attribute is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(154, 0, 'es', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(155, 0, 'es', 'validation', 'integer', 'The :attribute must be an integer.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(156, 0, 'es', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(157, 0, 'es', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(158, 0, 'es', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(159, 0, 'es', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(160, 0, 'es', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(161, 0, 'es', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(162, 0, 'es', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(163, 0, 'es', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(164, 0, 'es', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(165, 0, 'es', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(166, 0, 'es', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(167, 0, 'es', 'validation', 'not_in', 'The selected :attribute is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(168, 0, 'es', 'validation', 'numeric', 'The :attribute must be a number.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(169, 0, 'es', 'validation', 'present', 'The :attribute field must be present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(170, 0, 'es', 'validation', 'regex', 'The :attribute format is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(171, 0, 'es', 'validation', 'required', 'The :attribute field is required.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(172, 0, 'es', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(173, 0, 'es', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(174, 0, 'es', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(175, 0, 'es', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(176, 0, 'es', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(177, 0, 'es', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(178, 0, 'es', 'validation', 'same', 'The :attribute and :other must match.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(179, 0, 'es', 'validation', 'size.numeric', 'The :attribute must be :size.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(180, 0, 'es', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(181, 0, 'es', 'validation', 'size.string', 'The :attribute must be :size characters.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(182, 0, 'es', 'validation', 'size.array', 'The :attribute must contain :size items.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(183, 0, 'es', 'validation', 'string', 'The :attribute must be a string.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(184, 0, 'es', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(185, 0, 'es', 'validation', 'unique', 'The :attribute has already been taken.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(186, 0, 'es', 'validation', 'url', 'The :attribute format is invalid.', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(187, 0, 'es', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2016-10-03 14:53:48', '2016-11-01 15:05:38'),
(188, 0, 'es', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(189, 0, 'es', 'passwords', 'reset', 'Your password has been reset!', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(190, 0, 'es', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(191, 0, 'es', 'passwords', 'token', 'This password reset token is invalid.', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(192, 0, 'es', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2016-10-03 14:53:48', '2016-10-03 14:54:18'),
(193, 0, 'es', 'pagination', 'previous', '&laquo; Previous', '2016-10-03 14:53:48', '2016-11-06 14:42:20'),
(194, 0, 'es', 'pagination', 'next', 'Next &raquo;', '2016-10-03 14:53:48', '2016-11-06 14:42:20'),
(196, 0, 'en', 'survey', 'login', 'login', '2016-10-05 15:10:08', '2017-03-28 10:27:30'),
(197, 0, 'es', 'survey', 'login', 'INICIAR SESION', '2016-10-05 15:10:28', '2017-03-28 10:27:30'),
(198, 0, 'en', 'survey', 'Please_Enter_Your_Login_Details', 'Please Enter Your Login Details', '2016-10-05 15:12:21', '2017-03-28 10:27:30'),
(199, 0, 'es', 'survey', 'Please_Enter_Your_Login_Details', 'Please Enter Your Login Details', '2016-10-05 15:12:34', '2017-03-28 10:27:30'),
(200, 0, 'en', 'survey', 'Please_Enter_Your_Contact_Details', 'Please Enter Your Contact Details', '2016-10-05 15:13:25', '2017-03-28 10:27:30'),
(201, 0, 'es', 'survey', 'Please_Enter_Your_Contact_Details', 'Please Enter Your Contact Details', '2016-10-05 15:13:39', '2017-03-28 10:27:30'),
(202, 0, 'en', 'survey', 'SUBMIT', 'SUBMIT', '2016-10-05 15:14:01', '2017-03-28 10:27:30'),
(203, 0, 'es', 'survey', 'SUBMIT', 'SUBMIT', '2016-10-05 15:14:14', '2017-03-28 10:27:30'),
(204, 0, 'en', 'survey', 'Or_go_to_login_section', 'Or go to login section', '2016-10-05 15:14:47', '2017-03-28 10:27:30'),
(205, 0, 'es', 'survey', 'Or_go_to_login_section', 'Or go to login section', '2016-10-05 15:15:03', '2017-03-28 10:27:30'),
(212, 0, 'en', 'survey', 'term_condition_title', 'Term and Conditions', '2016-10-15 14:32:21', '2017-03-28 10:27:30'),
(210, 0, 'es', 'survey', 'i_accept_the', 'I accept the', '2016-10-15 14:31:08', '2017-03-28 10:27:30'),
(208, 0, 'en', 'survey', 'i_accept_the', 'I accept the', '2016-10-15 14:30:49', '2017-03-28 10:27:30'),
(209, 0, 'en', 'survey', 'term_condition', 'Term and Conditions', '2016-10-15 14:30:54', '2017-03-28 10:27:30'),
(211, 0, 'es', 'survey', 'term_condition', 'Term and Conditions', '2016-10-15 14:31:17', '2017-03-28 10:27:30'),
(224, 0, 'en', 'survey', 'content_condition', 'Content condition', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(214, 0, 'es', 'survey', 'term_condition_title', 'Term and Conditions', '2016-10-15 14:32:51', '2017-03-28 10:27:30'),
(226, 0, 'en', 'survey', 'Listens_to_you_answers_questions', 'Listens to you \'& answers questions', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(225, 0, 'en', 'survey', 'Physicians', 'Physicians', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(216, 0, 'en', 'survey', 'Oops', 'Oops, you forgot one step!', '2016-11-01 15:25:22', '2017-03-28 10:27:30'),
(221, 0, 'es', 'survey', 'feedbacks', 'Your feedback will give us insight on what we can do to ensure you receive the highest quality of care. ', '2016-11-01 15:30:13', '2017-03-28 10:27:30'),
(220, 0, 'en', 'survey', 'feedbacks', 'Your feedback will give us insight on what we can do to ensure you receive the highest quality of care. ', '2016-11-01 15:29:32', '2017-03-28 10:27:30'),
(217, 0, 'en', 'survey', 'Opps_Description', 'Please check the box to Agree the Terms and Conditions in order to login. Also remember this survey is anonymous and will be a secret between us!', '2016-11-01 15:25:30', '2017-03-28 10:27:30'),
(218, 0, 'es', 'survey', 'Oops', 'Oops, you forgot one step!', '2016-11-01 15:25:51', '2017-03-28 10:27:30'),
(219, 0, 'es', 'survey', 'Opps_Description', 'Please check the box to Agree the Terms and Conditions in order to login. Also remember this survey is anonymous and will be a secret between us!', '2016-11-01 15:26:16', '2017-03-28 10:27:30'),
(222, 0, 'en', 'survey', 'gohome', 'Please return to home and fill out the patient satisfaction survey or evaluate another caregiver. ', '2016-11-06 14:36:27', '2017-03-28 10:27:30'),
(223, 0, 'es', 'survey', 'gohome', 'Please return to home and fill out the patient satisfaction survey or evaluate another caregiver. ', '2016-11-06 14:36:27', '2017-03-28 10:27:30'),
(227, 0, 'en', 'survey', 'Takes_enough_time_with_you', 'Takes enough time with you', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(228, 0, 'en', 'survey', 'Explains_what_you_want_to_know', 'Explains what you want to know', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(229, 0, 'en', 'survey', 'Provides_good_advice_and_treatment', 'Provides good advice and treatment', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(230, 0, 'en', 'survey', 'Nursing_Staff', 'Nursing Staff', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(231, 0, 'en', 'survey', 'Provides_good_nursing_care', 'Provides good nursing care', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(232, 0, 'en', 'survey', 'Has_a_caring_attitude', 'Has a caring attitude', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(233, 0, 'en', 'survey', 'Other_Therapy_Staff', 'Other Therapy Staff', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(234, 0, 'en', 'survey', 'Friendly_and_helpful_to_you', 'Friendly and helpful to you', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(235, 0, 'en', 'survey', 'Answers_your_questions', 'Answers your questions', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(236, 0, 'en', 'survey', 'Explains_Treatment_Plan', 'Explains Treatment Plan', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(237, 0, 'en', 'survey', 'Facility_Unit', 'Facility \'/ Unit', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(238, 0, 'en', 'survey', 'Neat_and_clean_building', 'Neat and clean building', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(239, 0, 'en', 'survey', 'Unit_easily_accessible', 'Unit easily accessible', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(240, 0, 'en', 'survey', 'Comfort_and_Safety', 'Comfort and Safety', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(241, 0, 'en', 'survey', 'Privacy', 'Privacy', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(242, 0, 'en', 'survey', 'Likelihood_of_referring_others', 'Likelihood of referring others', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(243, 0, 'es', 'survey', 'Physicians', 'Physicians', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(244, 0, 'es', 'survey', 'Listens_to_you_answers_questions', 'Listens to you \'& answers questions', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(245, 0, 'es', 'survey', 'Takes_enough_time_with_you', 'Takes enough time with you', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(246, 0, 'es', 'survey', 'Explains_what_you_want_to_know', 'Explains what you want to know', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(247, 0, 'es', 'survey', 'Provides_good_advice_and_treatment', 'Provides good advice and treatment', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(248, 0, 'es', 'survey', 'Nursing_Staff', 'Nursing Staff', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(249, 0, 'es', 'survey', 'Provides_good_nursing_care', 'Provides good nursing care', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(250, 0, 'es', 'survey', 'Has_a_caring_attitude', 'Has a caring attitude', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(251, 0, 'es', 'survey', 'Other_Therapy_Staff', 'Other Therapy Staff', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(252, 0, 'es', 'survey', 'Friendly_and_helpful_to_you', 'Friendly and helpful to you', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(253, 0, 'es', 'survey', 'Answers_your_questions', 'Answers your questions', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(254, 0, 'es', 'survey', 'Explains_Treatment_Plan', 'Explains Treatment Plan', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(255, 0, 'es', 'survey', 'Facility_Unit', 'Facility \'/ Unit', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(256, 0, 'es', 'survey', 'Neat_and_clean_building', 'Neat and clean building', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(257, 0, 'es', 'survey', 'Unit_easily_accessible', 'Unit easily accessible', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(258, 0, 'es', 'survey', 'Comfort_and_Safety', 'Comfort and Safety', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(259, 0, 'es', 'survey', 'Privacy', 'Privacy', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(260, 0, 'es', 'survey', 'Likelihood_of_referring_others', 'Likelihood of referring others', '2016-11-16 16:07:01', '2017-03-28 10:27:30'),
(261, 0, 'en', 'questions', 'Knowledgeable -Listens to you and answers your questions', 'Knowledgeable -Listens to you and answers your questions', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(262, 0, 'en', 'questions', 'Quality of care provided', 'Quality of care provided', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(263, 0, 'en', 'questions', 'Takes the time to provide the care needed', 'Takes the time to provide the care needed', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(264, 0, 'en', 'questions', 'Compassionate and Respectful', 'Compassionate and Respectful', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(265, 0, 'en', 'questions', 'Explains treatment plan', 'Explains treatment plan', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(266, 0, 'en', 'survey', 'hospital_mission_statement', '\"Hospital mission statement\"', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(267, 0, 'en', 'survey', 'Or', 'Or', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(268, 0, 'en', 'survey', 'check_box_contact', 'I would like to be contacted about my patient experience.', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(269, 0, 'en', 'survey', 'comment_placeholder', 'Just a reminder that everything you share with Wambi remains anonymous.', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(270, 0, 'en', 'survey', 'title_experience', 'Please include any additional comments here about your experience!', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(271, 0, 'en', 'survey', 'title_caregiver', 'Please include any additional comments here about your caregiver!', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(272, 0, 'es', 'questions', 'Compassionate and Respectful', 'Compassionate and Respectful', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(273, 0, 'es', 'questions', 'Explains treatment plan', 'Explains treatment plan', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(274, 0, 'es', 'questions', 'Knowledgeable -Listens to you and answers your questions', 'Knowledgeable -Listens to you and answers your questions', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(275, 0, 'es', 'questions', 'Quality of care provided', 'Quality of care provided', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(276, 0, 'es', 'questions', 'Takes the time to provide the care needed', 'Takes the time to provide the care needed', '2016-11-30 11:04:42', '2016-12-01 15:42:32'),
(277, 0, 'es', 'survey', 'hospital_mission_statement', '\"Hospital mission statement\"', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(278, 0, 'es', 'survey', 'Or', 'Or', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(279, 0, 'es', 'survey', 'check_box_contact', 'I would like to be contacted about my patient experience.', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(280, 0, 'es', 'survey', 'comment_placeholder', 'Just a reminder that everything you share with Wambi remains anonymous.', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(281, 0, 'es', 'survey', 'title_experience', 'Please include any additional comments here about your experience!', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(282, 0, 'es', 'survey', 'title_caregiver', 'Please include any additional comments here about your caregiver!', '2016-11-30 11:04:42', '2017-03-28 10:27:30'),
(283, 0, 'en', 'survey', 'error_max_survey', 'You have surveyed this caregiver the maximum amount of times within 24 hours. Please select another caregiver or return home to take the patient satisfaction survey.', '2016-12-27 16:34:22', '2017-03-28 10:27:30'),
(284, 0, 'es', 'survey', 'error_max_survey', 'You have surveyed this caregiver the maximum amount of times within 24 hours. Please select another caregiver or return home to take the patient satisfaction survey.', '2016-12-27 16:34:22', '2017-03-28 10:27:30'),
(285, 0, 'en', 'survey', 'survey.tanphu test', 'david jones', '2016-12-27 16:35:00', '2017-03-28 10:27:30'),
(286, 0, 'es', 'survey', 'survey.tanphu test', 'spanish', '2016-12-27 16:35:24', '2017-03-28 10:27:30'),
(287, 1, 'en', 'questions', 'Provides quality care', 'Provides quality care', '2017-02-19 15:23:56', '2017-02-19 15:23:56'),
(288, 0, 'en', 'exit_questions', 'Physicians', 'Social Services', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(339, 0, 'en', 'exit_questions', 'Addressed discharge concerns', 'Addressed discharge concerns', '2017-03-17 09:46:44', '2017-03-17 10:33:48'),
(349, 0, 'es', 'exit_questions', 'Explains Patients Rights', 'Explains Patients Rights', '2017-03-17 09:51:26', '2017-03-17 10:33:48'),
(350, 0, 'en', 'exit_questions', 'Has_a_caring_attitude', 'Has a caring attitude', '2017-03-17 10:32:58', '2017-03-17 10:33:48'),
(292, 0, 'en', 'exit_questions', 'Nursing_Staff', 'Case Management', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(341, 0, 'es', 'exit_questions', 'Has anyone spoken to you about your copay', 'Has anyone spoken to you about your copay', '2017-03-17 09:47:05', '2017-03-17 10:33:48'),
(337, 0, 'en', 'exit_questions', 'Listens to you, answers questions', 'Listens to you, answers questions', '2017-03-17 09:46:44', '2017-03-17 10:33:48'),
(295, 0, 'en', 'exit_questions', 'Other_Therapy_Staff', 'Other Therapy Staff', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(296, 0, 'en', 'exit_questions', 'Friendly_and_helpful_to_you', 'Friendly and helpful to you', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(297, 0, 'en', 'exit_questions', 'Answers_your_questions', 'Answers your questions', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(298, 0, 'en', 'exit_questions', 'Explains_Treatment_Plan', 'Explains Treatment Plan', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(299, 0, 'en', 'exit_questions', 'Facility_Unit', 'Facility', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(300, 0, 'en', 'exit_questions', 'Neat_and_clean_building', 'Neat and clean building', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(301, 0, 'en', 'exit_questions', 'Unit_easily_accessible', 'Unit easily accessible', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(302, 0, 'en', 'exit_questions', 'Comfort_and_Safety', 'Comfort and Safety', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(303, 0, 'en', 'exit_questions', 'Privacy', 'Privacy', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(304, 0, 'en', 'exit_questions', 'Likelihood_of_referring_others', 'Likelihood of referring others', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(305, 0, 'en', 'exit_questions', 'hospital_mission_statement', '\"Hospital mission statement\"', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(306, 0, 'en', 'exit_questions', 'Takes time to discuss your medication, diet and first physician appointment after discharge', 'Takes time to discuss your medication, diet and first physician appointment after discharge', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(351, 0, 'es', 'exit_questions', 'Has_a_caring_attitude', 'Has a caring attitude', '2017-03-17 10:33:15', '2017-03-17 10:33:48'),
(342, 0, 'es', 'exit_questions', 'Addressed discharge concerns', 'Addressed discharge concerns', '2017-03-17 09:47:22', '2017-03-17 10:33:48'),
(311, 1, 'es', 'questions', 'Provides quality care', 'Provides quality care', '2017-02-19 15:23:56', '2017-02-19 15:23:56'),
(312, 0, 'es', 'exit_questions', 'Physicians', 'Médicos', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(338, 0, 'en', 'exit_questions', 'Takes enough time with you', 'Takes enough time with you', '2017-03-17 09:46:44', '2017-03-17 10:33:48'),
(348, 0, 'es', 'exit_questions', 'Addressed Advance Directives', 'Addressed Advance Directives', '2017-03-17 09:51:19', '2017-03-17 10:33:48'),
(346, 0, 'en', 'exit_questions', 'Explains Patients Rights', 'Explains Patients Rights', '2017-03-17 09:51:07', '2017-03-17 10:33:48'),
(347, 0, 'en', 'exit_questions', 'Addressed Advance Directives', 'Addressed Advance Directives', '2017-03-17 09:51:07', '2017-03-17 10:33:48'),
(316, 0, 'es', 'exit_questions', 'Nursing_Staff', 'Personal de enfermería', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(340, 0, 'en', 'exit_questions', 'Has anyone spoken to you about your copay', 'Has anyone spoken to you about your copay', '2017-03-17 09:46:44', '2017-03-17 10:33:48'),
(336, 0, 'en', 'exit_questions', 'Have you met your case manager', 'Have you met your case manager', '2017-03-17 09:46:44', '2017-03-17 10:33:48'),
(319, 0, 'es', 'exit_questions', 'Other_Therapy_Staff', 'Otro Personal de Terapia', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(320, 0, 'es', 'exit_questions', 'Friendly_and_helpful_to_you', 'Amable y servicial con usted', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(321, 0, 'es', 'exit_questions', 'Answers_your_questions', 'Responde a tus preguntas', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(322, 0, 'es', 'exit_questions', 'Explains_Treatment_Plan', 'Explica el plan de tratamiento', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(323, 0, 'es', 'exit_questions', 'Facility_Unit', 'Facility', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(324, 0, 'es', 'exit_questions', 'Neat_and_clean_building', 'Edificio limpio y ordenado', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(325, 0, 'es', 'exit_questions', 'Unit_easily_accessible', 'Unidad de fácil acceso', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(326, 0, 'es', 'exit_questions', 'Comfort_and_Safety', 'Comodidad y seguridad', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(327, 0, 'es', 'exit_questions', 'Privacy', 'Política de privacidad', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(328, 0, 'es', 'exit_questions', 'Likelihood_of_referring_others', 'Probabilidad de hacer referencia a otros', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(329, 0, 'es', 'exit_questions', 'hospital_mission_statement', '\"Hospital mission statement\"', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(330, 0, 'es', 'exit_questions', 'Takes time to discuss your medication, diet and first physician appointment after discharge', 'Takes time to discuss your medication, diet and first physician appointment after discharge', '2017-02-19 15:23:56', '2017-03-17 10:33:48'),
(335, 0, 'en', 'survey', '$title', NULL, '2017-03-17 09:24:05', '2017-03-17 09:24:05'),
(343, 0, 'es', 'exit_questions', 'Takes enough time with you', 'Takes enough time with you', '2017-03-17 09:47:32', '2017-03-17 10:33:48'),
(344, 0, 'es', 'exit_questions', 'Listens to you, answers questions', 'Listens to you, answers questions', '2017-03-17 09:47:41', '2017-03-17 10:33:48'),
(345, 0, 'es', 'exit_questions', 'Have you met your case manager', 'Have you met your case manager', '2017-03-17 09:47:49', '2017-03-17 10:33:48');

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
  `units` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newsfeed`
--

INSERT INTO `newsfeed` (`id`, `content`, `created_at`, `title`, `image`, `excerpt`, `updated_at`, `units`) VALUES
(4, 'We are so excited to introduce Wambi to your unit! Everyone is getting 5 pecks to get started :)&nbsp;', '2017-02-27 20:30:37', 'Introducing Wambi! ', 'email-logo.png', NULL, '2017-02-27 20:30:37', '[\"1\"]'),
(8, 'Congratulations to 500, who has been awarded 5 PECKS for No Clautis this Month', '2017-03-01 21:04:56', 'Unit Award', 'award.png', NULL, '2017-03-01 21:04:56', '\"1\"'),
(9, 'Congratulations to 500, who has been awarded 10 PECKS for Introducing Wambi this Month', '2017-03-03 23:05:22', 'Unit Award', 'award.png', NULL, '2017-03-03 23:19:34', '\"1\"'),
(10, 'Congratulations to 500, who has been awarded 222 PECKS for No Agency Use this Quarter', '2017-03-03 23:22:29', 'Unit Award', 'award.png', NULL, '2017-03-05 15:07:51', '\"1\"');

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

--
-- Dumping data for table `newsfeed_comments`
--

INSERT INTO `newsfeed_comments` (`id`, `news_id`, `user_id`, `comment`, `created_at`, `updated_at`) VALUES
(1, 4, 251, '', '2017-02-28 05:05:45', '2017-02-28 05:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `newsfeed_likes`
--

CREATE TABLE `newsfeed_likes` (
  `news_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `newsfeed_likes`
--

INSERT INTO `newsfeed_likes` (`news_id`, `user_id`) VALUES
(4, 19),
(4, 251),
(8, 19),
(10, 19);

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
  `lname` text NOT NULL,
  `dob` date NOT NULL,
  `admitteddate` date NOT NULL,
  `release` date DEFAULT NULL,
  `outcome` varchar(250) NOT NULL,
  `ssn` int(250) NOT NULL,
  `pinno` int(250) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `code_date` datetime DEFAULT NULL,
  `patient_carrier` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patient_details`
--

INSERT INTO `patient_details` (`pid`, `lid`, `fname`, `lname`, `dob`, `admitteddate`, `release`, `outcome`, `ssn`, `pinno`, `email`, `mobile`, `insurance_id`, `code`, `code_date`, `patient_carrier`) VALUES
(175, 1, '13003', '', '0000-00-00', '2016-09-26', NULL, '', 5909, 9006, '', '', 43, NULL, NULL, ''),
(176, 1, '17152', '', '0000-00-00', '2017-04-21', NULL, '', 4628, 1365, '', '', 42, NULL, NULL, ''),
(177, 1, '17147', '', '0000-00-00', '2017-03-27', NULL, '', 3714, 8830, '', '', 42, NULL, NULL, ''),
(178, 1, '17108', '', '0000-00-00', '2017-03-03', NULL, '', 5555, 1199, '', '', 42, NULL, NULL, ''),
(179, 1, '17150', '', '0000-00-00', '2017-04-18', NULL, '', 6991, 3078, '', '', 42, NULL, NULL, ''),
(180, 1, '17131', '', '0000-00-00', '2017-04-11', NULL, '', 9074, 7800, '', '', 42, NULL, NULL, ''),
(181, 1, '17098', '', '0000-00-00', '2017-04-13', NULL, '', 4154, 6598, '', '', 42, NULL, NULL, ''),
(182, 1, '17115', '', '0000-00-00', '2017-03-08', NULL, '', 1955, 3313, '', '', 42, NULL, NULL, ''),
(183, 1, '17105', '', '0000-00-00', '2017-04-04', NULL, '', 8437, 3010, '', '', 42, NULL, NULL, ''),
(184, 1, '17000', '', '0000-00-00', '2017-04-22', NULL, '', 2701, 4769, '', '', 42, NULL, NULL, '');

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
  `date` datetime DEFAULT NULL
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
(1, 'dashboard', 'Access dashboard page', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(2, 'shift-add', 'Post shift', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(3, 'shift-edit', 'Edit shift', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(4, 'shift-delete', 'Delete shift', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(5, 'shift-approve', 'Approve shift', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(6, 'award-add', 'Add award', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(7, 'award-delete', 'Delete Award', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(8, 'award-approve', 'Approve Award', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(9, 'employee-add', 'Add Employee', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(10, 'employee-edit', 'Edit Employee', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(11, 'employee-delete', 'Delete Employee', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(12, 'patient-add', 'Add Patient', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(13, 'patient-edit', 'Edit Patient', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(14, 'patient-delete', 'Delete Patient', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(15, 'shift-manage', 'Manage Shifts', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(16, 'employee-manage', 'Manage Employees', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(17, 'patient-manage', 'Manage Patients', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(18, 'award-manage', 'Manage Awards', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(19, 'survey-manage', 'Manage Survey', NULL, '2016-08-15 02:58:46', '2016-08-15 02:58:46'),
(20, 'data-manage', 'Manage Data', NULL, NULL, NULL),
(21, 'reward-add', 'Add Reward', NULL, '2016-09-22 14:59:11', '2016-09-22 14:59:15');

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
(6, 16);

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
  `enabled` tinyint(4) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `qid`, `question`, `css_class`, `unit_id`, `enabled`) VALUES
(1, 1, 'You enjoy the activities that are offered', 'info', 1, 1),
(2, 2, 'The food taste good and is served at proper temperature', 'pink', 1, 1),
(3, 3, 'Your Copay has been discussed with you by Business Office', 'primary', 1, 1),
(4, 4, 'Makes you feel comfortable when discussing sensitive topics', 'success', 1, 1),
(5, 5, '', 'warning', 1, 0),
(6, 1, 'Treats you with respect', 'info', 2, 1),
(7, 2, 'Listens to your needs', 'pink', 2, 1),
(8, 3, 'Clearly explains your care and/or treatment plan', 'primary', 2, 1),
(9, 4, 'Makes you feel comfortable when discussing sensitive topics', 'success', 2, 1),
(10, 5, 'Provides you with compassionate care', 'warning', 2, 1),
(11, 1, 'Knowledgeable -Listens to you and answers your questions', 'info', 3, 1),
(12, 2, 'Quality of care provided', 'pink', 3, 1),
(13, 3, 'Takes the time to provide the care needed', 'primary', 3, 1),
(14, 4, 'Compassionate and Respectful', 'success', 3, 1),
(15, 5, 'Explains treatment plan', 'warning', 3, 1);

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
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `name`, `display_name`, `pecks`, `image`, `created_at`, `updated_at`) VALUES
(9, NULL, NULL, 10000, '9_starbucks.png', '2017-02-27 20:04:07', '2017-02-27 20:29:11'),
(11, NULL, NULL, 25000, '11_visa.png', '2017-02-27 20:07:57', '2017-02-27 23:27:29'),
(12, NULL, NULL, 10000, '12_mcdonalds.jpg', '2017-02-27 20:10:04', '2017-02-27 23:27:45'),
(13, NULL, NULL, 25000, '13_Pump-Pass.jpg', '2017-02-27 20:18:03', '2017-02-27 23:27:08'),
(14, NULL, NULL, 50000, '14_2017-02-27_12_18_47-visa_50_gift_card_-_Google_Search.png', '2017-02-27 20:19:15', '2017-02-27 23:28:04'),
(15, NULL, NULL, 100000, '15_2017-02-27_12_20_00-$75_visa_gift_card_-_Google_Search.png', '2017-02-27 20:20:22', '2017-02-27 23:28:18'),
(16, NULL, NULL, 25000, '16_2017-02-27_12_21_08-target_25_dollar_gift_card_-_Google_Search.png', '2017-02-27 20:21:27', '2017-02-27 23:28:34'),
(17, NULL, NULL, 25000, '17_walmart.png', '2017-02-27 20:23:29', '2017-02-27 23:28:50'),
(18, NULL, NULL, 10000, '18_2017-02-27_12_25_57-Presentation1_-_PowerPoint.png', '2017-02-27 20:26:30', '2017-02-27 23:29:04'),
(19, NULL, NULL, 300000, '19_2017-02-27_12_27_15-2_tickets_to_disneyland_-_Google_Search.png', '2017-02-27 20:28:00', '2017-02-27 23:29:34'),
(20, NULL, NULL, 10000, '20_vend-gift-card-design-2.png', '2017-02-27 21:51:20', '2017-02-27 23:29:58');

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
(1, 'super-admin', 'Super Admin', NULL, '2016-08-15 02:44:16', '2016-08-15 02:44:21'),
(2, 'admin', 'Admin', NULL, '2016-08-15 02:44:16', '2016-08-15 02:44:16'),
(3, 'employee-manager', 'Employee Manager', NULL, '2016-08-15 02:44:16', '2016-08-15 02:44:16'),
(4, 'scheduling-manager', 'Scheduling Manager', NULL, '2016-08-15 02:44:16', '2016-08-15 02:44:16'),
(5, 'patient-manager', 'Patient Manager', NULL, '2016-08-15 02:44:16', '2016-08-15 02:44:16'),
(6, 'employee', 'Employee', NULL, '2016-08-15 02:44:16', '2016-08-15 02:44:16');

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
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `shift_master`
--

INSERT INTO `shift_master` (`id`, `shift_unit`, `shift_discipline`, `shift_job_title`, `shift_date`, `shift_time`, `shift_pecks`, `shift_notes`, `status`, `employee_id`, `user_id`, `created_at`, `updated_at`) VALUES
(3, '1', '1', '1', '2017-02-21', '3', '1', 'tanphuqn test', NULL, NULL, 20, '2017-02-21 15:49:28', NULL);

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
  `code` varchar(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `surveys`
--

INSERT INTO `surveys` (`id`, `patient_id`, `employee_id`, `discipline`, `unit_id`, `total`, `type`, `avg`, `created_at`, `updated_at`, `avg_rating`, `q1`, `q2`, `q3`, `q4`, `q5`, `q6`, `q7`, `q8`, `q9`, `q10`, `q_count`, `code`) VALUES
(1, 133, 254, 2, 1, 45, 'patient', 9, '2017-03-17 17:46:12', '2017-03-17 17:46:13', '44', 3, 3, 1, 3, 1, 0, 0, 0, 0, 0, 5, NULL),
(2, 132, 250, 3, 1, 125, 'patient', 25, '2017-03-22 20:11:41', '2017-03-22 20:11:41', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(3, 132, 245, 2, 1, 105, 'patient', 21, '2017-03-22 20:13:43', '2017-03-22 20:13:43', '84', 5, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, NULL),
(4, 132, 246, 2, 1, 125, 'patient', 25, '2017-03-22 20:14:29', '2017-03-22 20:14:29', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(5, 153, 248, 2, 1, 125, 'patient', 25, '2017-03-24 17:23:04', '2017-03-24 17:23:04', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(6, 153, 244, 2, 1, 115, 'patient', 23, '2017-03-24 17:25:08', '2017-03-24 17:25:08', '92', 5, 5, 4, 4, 5, 0, 0, 0, 0, 0, 5, NULL),
(7, 167, 251, 3, 1, 115, 'patient', 23, '2017-03-31 17:57:17', '2017-03-31 17:57:17', '92', 5, 4, 5, 5, 4, 0, 0, 0, 0, 0, 5, NULL),
(8, 137, 244, 2, 1, 125, 'patient', 25, '2017-04-20 21:26:55', '2017-04-20 21:26:55', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(9, 137, 247, 2, 1, 100, 'patient', 20, '2017-04-20 21:42:17', '2017-04-20 21:42:18', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, NULL),
(10, 184, 266, 2, 1, 45, 'patient', 11, '2017-04-24 22:22:29', '2017-04-24 22:22:30', '55', 4, 1, 1, 5, 0, 0, 0, 0, 0, 0, 4, NULL),
(11, 175, 247, 2, 1, 90, 'family_member', 23, '2017-04-25 17:40:00', '2017-04-25 17:40:00', '90', 5, 5, 3, 5, 0, 0, 0, 0, 0, 0, 4, NULL),
(12, 180, 247, 2, 1, 55, 'patient', 14, '2017-04-25 17:57:34', '2017-04-25 17:57:34', '60', 3, 4, 1, 4, 0, 0, 0, 0, 0, 0, 4, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;
--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `award_type`
--
ALTER TABLE `award_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `code_master`
--
ALTER TABLE `code_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;
--
-- AUTO_INCREMENT for table `coinmanager`
--
ALTER TABLE `coinmanager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `config_peck`
--
ALTER TABLE `config_peck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee_master`
--
ALTER TABLE `employee_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;
--
-- AUTO_INCREMENT for table `employee_notification`
--
ALTER TABLE `employee_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
--
-- AUTO_INCREMENT for table `employee_shift`
--
ALTER TABLE `employee_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exitsurvey`
--
ALTER TABLE `exitsurvey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `exit_question`
--
ALTER TABLE `exit_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `hourly_rates`
--
ALTER TABLE `hourly_rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=353;
--
-- AUTO_INCREMENT for table `newsfeed`
--
ALTER TABLE `newsfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `newsfeed_comments`
--
ALTER TABLE `newsfeed_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pid as Primary Key', AUTO_INCREMENT=185;
--
-- AUTO_INCREMENT for table `patient_family`
--
ALTER TABLE `patient_family`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shift_master`
--
ALTER TABLE `shift_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `startsurvey`
--
ALTER TABLE `startsurvey`
  MODIFY `incid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
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
