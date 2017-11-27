-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 30, 2017 at 04:48 AM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wambiorg_scu`
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
(1, 1, 1, 342, 2, 3, 3, 0, 2, '2017-02-10 19:41:39', 'patient', NULL, 3),
(2, 2, 1, 342, 2, 3, 4, 0, 2, '2017-02-10 19:41:39', 'patient', NULL, 4),
(3, 3, 1, 342, 2, 3, 4, 0, 2, '2017-02-10 19:41:39', 'patient', NULL, 4),
(4, 4, 1, 342, 2, 3, 3, 0, 2, '2017-02-10 19:41:39', 'patient', NULL, 3),
(5, 5, 1, 342, 2, 3, 5, 0, 2, '2017-02-10 19:41:39', 'patient', NULL, 5),
(6, 1, 18, 379, 2, 1, 5, 0, 2, '2017-03-15 14:34:22', 'patient', NULL, 5),
(7, 2, 18, 379, 2, 1, 5, 0, 2, '2017-03-15 14:34:23', 'patient', NULL, 5),
(8, 3, 18, 379, 2, 1, 5, 0, 2, '2017-03-15 14:34:23', 'patient', NULL, 5),
(9, 4, 18, 379, 2, 1, 5, 0, 2, '2017-03-15 14:34:23', 'patient', NULL, 5),
(10, 5, 18, 379, 2, 1, 5, 0, 2, '2017-03-15 14:34:23', 'patient', NULL, 5),
(11, 1, 18, 355, 2, 2, 5, 0, 2, '2017-03-15 14:35:02', 'patient', NULL, 5),
(12, 2, 18, 355, 2, 2, 5, 0, 2, '2017-03-15 14:35:02', 'patient', NULL, 5),
(13, 3, 18, 355, 2, 2, 5, 0, 2, '2017-03-15 14:35:02', 'patient', NULL, 5),
(14, 4, 18, 355, 2, 2, 5, 0, 2, '2017-03-15 14:35:02', 'patient', NULL, 5),
(15, 5, 18, 355, 2, 2, 5, 0, 2, '2017-03-15 14:35:02', 'patient', NULL, 5),
(16, 1, 18, 370, 2, 1, 5, 0, 2, '2017-03-15 14:36:06', 'patient', NULL, 5),
(17, 2, 18, 370, 2, 1, 5, 0, 2, '2017-03-15 14:36:06', 'patient', NULL, 5),
(18, 3, 18, 370, 2, 1, 5, 0, 2, '2017-03-15 14:36:07', 'patient', NULL, 5),
(19, 4, 18, 370, 2, 1, 5, 0, 2, '2017-03-15 14:36:07', 'patient', NULL, 5),
(20, 5, 18, 370, 2, 1, 5, 0, 2, '2017-03-15 14:36:07', 'patient', NULL, 5),
(21, 1, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:52', 'patient', NULL, 5),
(22, 2, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:52', 'patient', NULL, 5),
(23, 3, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:52', 'patient', NULL, 5),
(24, 4, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:52', 'patient', NULL, 5),
(25, 5, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:52', 'patient', NULL, 5),
(26, 1, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:53', 'patient', NULL, 5),
(27, 2, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:53', 'patient', NULL, 5),
(28, 3, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:53', 'patient', NULL, 5),
(29, 4, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:53', 'patient', NULL, 5),
(30, 5, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:53', 'patient', NULL, 5),
(31, 6, 18, 386, 2, 1, 5, 0, 2, '2017-03-15 14:36:53', 'patient', NULL, 5),
(32, 1, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:15', 'patient', NULL, 5),
(33, 2, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:16', 'patient', NULL, 5),
(34, 3, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:16', 'patient', NULL, 5),
(35, 4, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:16', 'patient', NULL, 5),
(36, 5, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:16', 'patient', NULL, 5),
(37, 1, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:16', 'patient', NULL, 5),
(38, 2, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:16', 'patient', NULL, 5),
(39, 3, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:17', 'patient', NULL, 5),
(40, 4, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:17', 'patient', NULL, 5),
(41, 5, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:17', 'patient', NULL, 5),
(42, 6, 18, 344, 2, 1, 5, 0, 2, '2017-03-15 14:37:17', 'patient', NULL, 5),
(43, 1, 25, 342, 2, 2, 5, 0, 2, '2017-04-05 14:45:01', 'patient', NULL, 5),
(44, 2, 25, 342, 2, 2, 5, 0, 2, '2017-04-05 14:45:01', 'patient', NULL, 5),
(45, 3, 25, 342, 2, 2, 5, 0, 2, '2017-04-05 14:45:01', 'patient', NULL, 5),
(46, 4, 25, 342, 2, 2, 5, 0, 2, '2017-04-05 14:45:01', 'patient', NULL, 5),
(47, 5, 25, 342, 2, 2, 5, 0, 2, '2017-04-05 14:45:01', 'patient', NULL, 5),
(48, 1, 25, 343, 2, 1, 5, 0, 2, '2017-04-05 14:49:37', 'patient', NULL, 5),
(49, 2, 25, 343, 2, 1, 5, 0, 2, '2017-04-05 14:49:37', 'patient', NULL, 5),
(50, 3, 25, 343, 2, 1, 5, 0, 2, '2017-04-05 14:49:37', 'patient', NULL, 5),
(51, 4, 25, 343, 2, 1, 5, 0, 2, '2017-04-05 14:49:37', 'patient', NULL, 5),
(52, 5, 25, 343, 2, 1, 5, 0, 2, '2017-04-05 14:49:37', 'patient', NULL, 5),
(53, 1, 25, 344, 2, 1, 5, 0, 2, '2017-04-05 14:59:29', 'patient', NULL, 5),
(54, 2, 25, 344, 2, 1, 5, 0, 2, '2017-04-05 14:59:29', 'patient', NULL, 5),
(55, 3, 25, 344, 2, 1, 5, 0, 2, '2017-04-05 14:59:29', 'patient', NULL, 5),
(56, 4, 25, 344, 2, 1, 5, 0, 2, '2017-04-05 14:59:29', 'patient', NULL, 5),
(57, 5, 25, 344, 2, 1, 5, 0, 2, '2017-04-05 14:59:29', 'patient', NULL, 5),
(58, 1, 25, 345, 2, 1, 5, 0, 2, '2017-04-05 15:00:39', 'patient', NULL, 5),
(59, 2, 25, 345, 2, 1, 5, 0, 2, '2017-04-05 15:00:39', 'patient', NULL, 5),
(60, 3, 25, 345, 2, 1, 5, 0, 2, '2017-04-05 15:00:39', 'patient', NULL, 5),
(61, 4, 25, 345, 2, 1, 5, 0, 2, '2017-04-05 15:00:39', 'patient', NULL, 5),
(62, 5, 25, 345, 2, 1, 5, 0, 2, '2017-04-05 15:00:39', 'patient', NULL, 5),
(63, 1, 25, 347, 2, 1, 5, 0, 2, '2017-04-05 15:11:23', 'patient', NULL, 5),
(64, 2, 25, 347, 2, 1, 5, 0, 2, '2017-04-05 15:11:23', 'patient', NULL, 5),
(65, 3, 25, 347, 2, 1, 5, 0, 2, '2017-04-05 15:11:23', 'patient', NULL, 5),
(66, 4, 25, 347, 2, 1, 5, 0, 2, '2017-04-05 15:11:23', 'patient', NULL, 5),
(67, 5, 25, 347, 2, 1, 5, 0, 2, '2017-04-05 15:11:23', 'patient', NULL, 5),
(68, 1, 25, 349, 2, 1, 5, 0, 2, '2017-04-05 15:12:30', 'patient', NULL, 5),
(69, 2, 25, 349, 2, 1, 5, 0, 2, '2017-04-05 15:12:30', 'patient', NULL, 5),
(70, 3, 25, 349, 2, 1, 5, 0, 2, '2017-04-05 15:12:30', 'patient', NULL, 5),
(71, 4, 25, 349, 2, 1, 5, 0, 2, '2017-04-05 15:12:30', 'patient', NULL, 5),
(72, 5, 25, 349, 2, 1, 5, 0, 2, '2017-04-05 15:12:31', 'patient', NULL, 5),
(73, 1, 25, 351, 2, 1, 5, 0, 2, '2017-04-05 15:13:47', 'patient', NULL, 5),
(74, 2, 25, 351, 2, 1, 5, 0, 2, '2017-04-05 15:13:47', 'patient', NULL, 5),
(75, 3, 25, 351, 2, 1, 5, 0, 2, '2017-04-05 15:13:47', 'patient', NULL, 5),
(76, 4, 25, 351, 2, 1, 5, 0, 2, '2017-04-05 15:13:47', 'patient', NULL, 5),
(77, 5, 25, 351, 2, 1, 5, 0, 2, '2017-04-05 15:13:47', 'patient', NULL, 5),
(78, 1, 25, 357, 2, 1, 5, 0, 2, '2017-04-05 15:15:18', 'patient', NULL, 5),
(79, 2, 25, 357, 2, 1, 5, 0, 2, '2017-04-05 15:15:18', 'patient', NULL, 5),
(80, 3, 25, 357, 2, 1, 5, 0, 2, '2017-04-05 15:15:18', 'patient', NULL, 5),
(81, 4, 25, 357, 2, 1, 5, 0, 2, '2017-04-05 15:15:18', 'patient', NULL, 5),
(82, 5, 25, 357, 2, 1, 5, 0, 2, '2017-04-05 15:15:18', 'patient', NULL, 5),
(83, 1, 25, 361, 2, 1, 5, 0, 2, '2017-04-05 15:16:32', 'patient', NULL, 5),
(84, 2, 25, 361, 2, 1, 5, 0, 2, '2017-04-05 15:16:32', 'patient', NULL, 5),
(85, 3, 25, 361, 2, 1, 5, 0, 2, '2017-04-05 15:16:32', 'patient', NULL, 5),
(86, 4, 25, 361, 2, 1, 5, 0, 2, '2017-04-05 15:16:32', 'patient', NULL, 5),
(87, 5, 25, 361, 2, 1, 5, 0, 2, '2017-04-05 15:16:32', 'patient', NULL, 5),
(88, 1, 25, 364, 2, 1, 5, 0, 2, '2017-04-05 15:18:14', 'patient', NULL, 5),
(89, 2, 25, 364, 2, 1, 5, 0, 2, '2017-04-05 15:18:14', 'patient', NULL, 5),
(90, 3, 25, 364, 2, 1, 5, 0, 2, '2017-04-05 15:18:14', 'patient', NULL, 5),
(91, 4, 25, 364, 2, 1, 5, 0, 2, '2017-04-05 15:18:14', 'patient', NULL, 5),
(92, 5, 25, 364, 2, 1, 5, 0, 2, '2017-04-05 15:18:14', 'patient', NULL, 5),
(93, 1, 25, 365, 2, 1, 5, 0, 2, '2017-04-05 15:19:23', 'patient', NULL, 5),
(94, 2, 25, 365, 2, 1, 5, 0, 2, '2017-04-05 15:19:23', 'patient', NULL, 5),
(95, 3, 25, 365, 2, 1, 5, 0, 2, '2017-04-05 15:19:23', 'patient', NULL, 5),
(96, 4, 25, 365, 2, 1, 5, 0, 2, '2017-04-05 15:19:23', 'patient', NULL, 5),
(97, 5, 25, 365, 2, 1, 5, 0, 2, '2017-04-05 15:19:23', 'patient', NULL, 5),
(98, 1, 25, 370, 2, 1, 5, 0, 2, '2017-04-05 15:20:34', 'patient', NULL, 5),
(99, 2, 25, 370, 2, 1, 5, 0, 2, '2017-04-05 15:20:34', 'patient', NULL, 5),
(100, 3, 25, 370, 2, 1, 5, 0, 2, '2017-04-05 15:20:34', 'patient', NULL, 5),
(101, 4, 25, 370, 2, 1, 5, 0, 2, '2017-04-05 15:20:34', 'patient', NULL, 5),
(102, 5, 25, 370, 2, 1, 5, 0, 2, '2017-04-05 15:20:34', 'patient', NULL, 5),
(103, 1, 25, 372, 2, 3, 5, 0, 2, '2017-04-05 15:21:31', 'patient', NULL, 5),
(104, 2, 25, 372, 2, 3, 5, 0, 2, '2017-04-05 15:21:31', 'patient', NULL, 5),
(105, 3, 25, 372, 2, 3, 5, 0, 2, '2017-04-05 15:21:31', 'patient', NULL, 5),
(106, 4, 25, 372, 2, 3, 5, 0, 2, '2017-04-05 15:21:31', 'patient', NULL, 5),
(107, 5, 25, 372, 2, 3, 5, 0, 2, '2017-04-05 15:21:31', 'patient', NULL, 5),
(108, 1, 25, 374, 2, 3, 5, 0, 2, '2017-04-05 15:22:25', 'patient', NULL, 5),
(109, 2, 25, 374, 2, 3, 5, 0, 2, '2017-04-05 15:22:25', 'patient', NULL, 5),
(110, 3, 25, 374, 2, 3, 5, 0, 2, '2017-04-05 15:22:25', 'patient', NULL, 5),
(111, 4, 25, 374, 2, 3, 5, 0, 2, '2017-04-05 15:22:25', 'patient', NULL, 5),
(112, 5, 25, 374, 2, 3, 5, 0, 2, '2017-04-05 15:22:25', 'patient', NULL, 5),
(113, 1, 25, 378, 2, 2, 5, 0, 2, '2017-04-05 15:23:48', 'patient', NULL, 5),
(114, 2, 25, 378, 2, 2, 5, 0, 2, '2017-04-05 15:23:48', 'patient', NULL, 5),
(115, 3, 25, 378, 2, 2, 5, 0, 2, '2017-04-05 15:23:48', 'patient', NULL, 5),
(116, 4, 25, 378, 2, 2, 5, 0, 2, '2017-04-05 15:23:48', 'patient', NULL, 5),
(117, 5, 25, 378, 2, 2, 5, 0, 2, '2017-04-05 15:23:48', 'patient', NULL, 5),
(118, 1, 25, 379, 2, 1, 5, 0, 2, '2017-04-05 15:24:53', 'patient', NULL, 5),
(119, 2, 25, 379, 2, 1, 5, 0, 2, '2017-04-05 15:24:53', 'patient', NULL, 5),
(120, 3, 25, 379, 2, 1, 5, 0, 2, '2017-04-05 15:24:53', 'patient', NULL, 5),
(121, 4, 25, 379, 2, 1, 5, 0, 2, '2017-04-05 15:24:53', 'patient', NULL, 5),
(122, 5, 25, 379, 2, 1, 5, 0, 2, '2017-04-05 15:24:53', 'patient', NULL, 5),
(123, 1, 25, 380, 2, 2, 5, 0, 2, '2017-04-05 15:26:32', 'patient', NULL, 5),
(124, 2, 25, 380, 2, 2, 5, 0, 2, '2017-04-05 15:26:32', 'patient', NULL, 5),
(125, 3, 25, 380, 2, 2, 5, 0, 2, '2017-04-05 15:26:32', 'patient', NULL, 5),
(126, 4, 25, 380, 2, 2, 5, 0, 2, '2017-04-05 15:26:32', 'patient', NULL, 5),
(127, 5, 25, 380, 2, 2, 5, 0, 2, '2017-04-05 15:26:32', 'patient', NULL, 5),
(128, 1, 25, 385, 2, 2, 5, 0, 2, '2017-04-05 15:27:31', 'patient', NULL, 5),
(129, 2, 25, 385, 2, 2, 5, 0, 2, '2017-04-05 15:27:31', 'patient', NULL, 5),
(130, 3, 25, 385, 2, 2, 5, 0, 2, '2017-04-05 15:27:31', 'patient', NULL, 5),
(131, 4, 25, 385, 2, 2, 5, 0, 2, '2017-04-05 15:27:31', 'patient', NULL, 5),
(132, 5, 25, 385, 2, 2, 5, 0, 2, '2017-04-05 15:27:31', 'patient', NULL, 5),
(133, 1, 25, 355, 2, 2, 5, 0, 2, '2017-04-06 17:11:18', 'patient', NULL, 5),
(134, 2, 25, 355, 2, 2, 5, 0, 2, '2017-04-06 17:11:18', 'patient', NULL, 5),
(135, 3, 25, 355, 2, 2, 5, 0, 2, '2017-04-06 17:11:18', 'patient', NULL, 5),
(136, 4, 25, 355, 2, 2, 5, 0, 2, '2017-04-06 17:11:18', 'patient', NULL, 5),
(137, 5, 25, 355, 2, 2, 5, 0, 2, '2017-04-06 17:11:18', 'patient', NULL, 5),
(138, 1, 25, 386, 2, 1, 5, 0, 2, '2017-04-06 17:13:13', 'patient', NULL, 5),
(139, 2, 25, 386, 2, 1, 5, 0, 2, '2017-04-06 17:13:13', 'patient', NULL, 5),
(140, 3, 25, 386, 2, 1, 5, 0, 2, '2017-04-06 17:13:13', 'patient', NULL, 5),
(141, 4, 25, 386, 2, 1, 5, 0, 2, '2017-04-06 17:13:14', 'patient', NULL, 5),
(142, 5, 25, 386, 2, 1, 5, 0, 2, '2017-04-06 17:13:14', 'patient', NULL, 5),
(143, 1, 26, 366, 2, 1, 1, 0, 2, '2017-04-06 17:52:24', 'patient', NULL, 1),
(144, 2, 26, 366, 2, 1, 1, 0, 2, '2017-04-06 17:52:24', 'patient', NULL, 1),
(145, 3, 26, 366, 2, 1, 1, 0, 2, '2017-04-06 17:52:24', 'patient', NULL, 1),
(146, 4, 26, 366, 2, 1, 1, 0, 2, '2017-04-06 17:52:24', 'patient', NULL, 1),
(147, 5, 26, 366, 2, 1, 1, 0, 2, '2017-04-06 17:52:24', 'patient', NULL, 1),
(148, 1, 26, 342, 2, 2, 4, 0, 2, '2017-04-06 17:54:33', 'patient', NULL, 4),
(149, 2, 26, 342, 2, 2, 4, 0, 2, '2017-04-06 17:54:33', 'patient', NULL, 4),
(150, 3, 26, 342, 2, 2, 4, 0, 2, '2017-04-06 17:54:33', 'patient', NULL, 4),
(151, 4, 26, 342, 2, 2, 4, 0, 2, '2017-04-06 17:54:33', 'patient', NULL, 4),
(152, 5, 26, 342, 2, 2, 4, 0, 2, '2017-04-06 17:54:33', 'patient', NULL, 4),
(153, 1, 26, 355, 2, 2, 4, 0, 2, '2017-04-06 17:55:22', 'patient', NULL, 4),
(154, 2, 26, 355, 2, 2, 4, 0, 2, '2017-04-06 17:55:22', 'patient', NULL, 4),
(155, 3, 26, 355, 2, 2, 4, 0, 2, '2017-04-06 17:55:22', 'patient', NULL, 4),
(156, 4, 26, 355, 2, 2, 4, 0, 2, '2017-04-06 17:55:22', 'patient', NULL, 4),
(157, 5, 26, 355, 2, 2, 4, 0, 2, '2017-04-06 17:55:22', 'patient', NULL, 4),
(158, 1, 26, 378, 2, 2, 5, 0, 2, '2017-04-06 17:56:10', 'patient', NULL, 5),
(159, 2, 26, 378, 2, 2, 5, 0, 2, '2017-04-06 17:56:10', 'patient', NULL, 5),
(160, 3, 26, 378, 2, 2, 5, 0, 2, '2017-04-06 17:56:11', 'patient', NULL, 5),
(161, 4, 26, 378, 2, 2, 5, 0, 2, '2017-04-06 17:56:11', 'patient', NULL, 5),
(162, 5, 26, 378, 2, 2, 5, 0, 2, '2017-04-06 17:56:11', 'patient', NULL, 5),
(163, 1, 26, 379, 2, 1, 4, 0, 2, '2017-04-06 17:56:57', 'patient', NULL, 4),
(164, 2, 26, 379, 2, 1, 4, 0, 2, '2017-04-06 17:56:57', 'patient', NULL, 4),
(165, 3, 26, 379, 2, 1, 4, 0, 2, '2017-04-06 17:56:57', 'patient', NULL, 4),
(166, 4, 26, 379, 2, 1, 4, 0, 2, '2017-04-06 17:56:57', 'patient', NULL, 4),
(167, 5, 26, 379, 2, 1, 4, 0, 2, '2017-04-06 17:56:57', 'patient', NULL, 4),
(168, 1, 26, 349, 2, 1, 2, 0, 2, '2017-04-06 17:57:38', 'patient', NULL, 2),
(169, 2, 26, 349, 2, 1, 1, 0, 2, '2017-04-06 17:57:38', 'patient', NULL, 1),
(170, 3, 26, 349, 2, 1, 1, 0, 2, '2017-04-06 17:57:38', 'patient', NULL, 1),
(171, 4, 26, 349, 2, 1, 2, 0, 2, '2017-04-06 17:57:38', 'patient', NULL, 2),
(172, 5, 26, 349, 2, 1, 1, 0, 2, '2017-04-06 17:57:38', 'patient', NULL, 1),
(173, 1, 26, 347, 2, 1, 5, 0, 2, '2017-04-06 17:58:13', 'patient', NULL, 5),
(174, 2, 26, 347, 2, 1, 5, 0, 2, '2017-04-06 17:58:13', 'patient', NULL, 5),
(175, 3, 26, 347, 2, 1, 5, 0, 2, '2017-04-06 17:58:13', 'patient', NULL, 5),
(176, 4, 26, 347, 2, 1, 5, 0, 2, '2017-04-06 17:58:13', 'patient', NULL, 5),
(177, 5, 26, 347, 2, 1, 5, 0, 2, '2017-04-06 17:58:13', 'patient', NULL, 5),
(178, 1, 26, 386, 2, 1, 3, 0, 2, '2017-04-06 18:00:22', 'patient', NULL, 3),
(179, 2, 26, 386, 2, 1, 3, 0, 2, '2017-04-06 18:00:22', 'patient', NULL, 3),
(180, 3, 26, 386, 2, 1, 3, 0, 2, '2017-04-06 18:00:22', 'patient', NULL, 3),
(181, 4, 26, 386, 2, 1, 2, 0, 2, '2017-04-06 18:00:22', 'patient', NULL, 2),
(182, 5, 26, 386, 2, 1, 3, 0, 2, '2017-04-06 18:00:22', 'patient', NULL, 3),
(183, 1, 26, 343, 2, 1, 4, 0, 2, '2017-04-06 18:03:07', 'patient', NULL, 4),
(184, 2, 26, 343, 2, 1, 4, 0, 2, '2017-04-06 18:03:07', 'patient', NULL, 4),
(185, 3, 26, 343, 2, 1, 4, 0, 2, '2017-04-06 18:03:07', 'patient', NULL, 4),
(186, 4, 26, 343, 2, 1, 4, 0, 2, '2017-04-06 18:03:07', 'patient', NULL, 4),
(187, 5, 26, 343, 2, 1, 3, 0, 2, '2017-04-06 18:03:07', 'patient', NULL, 3),
(188, 1, 26, 382, 2, 1, 4, 0, 2, '2017-04-06 18:04:22', 'patient', NULL, 4),
(189, 2, 26, 382, 2, 1, 4, 0, 2, '2017-04-06 18:04:22', 'patient', NULL, 4),
(190, 3, 26, 382, 2, 1, 4, 0, 2, '2017-04-06 18:04:22', 'patient', NULL, 4),
(191, 4, 26, 382, 2, 1, 4, 0, 2, '2017-04-06 18:04:22', 'patient', NULL, 4),
(192, 5, 26, 382, 2, 1, 4, 0, 2, '2017-04-06 18:04:22', 'patient', NULL, 4),
(193, 1, 26, 365, 2, 1, 1, 0, 2, '2017-04-06 18:07:33', 'patient', NULL, 1),
(194, 2, 26, 365, 2, 1, 1, 0, 2, '2017-04-06 18:07:33', 'patient', NULL, 1),
(195, 3, 26, 365, 2, 1, 1, 0, 2, '2017-04-06 18:07:33', 'patient', NULL, 1),
(196, 4, 26, 365, 2, 1, 1, 0, 2, '2017-04-06 18:07:33', 'patient', NULL, 1),
(197, 5, 26, 365, 2, 1, 1, 0, 2, '2017-04-06 18:07:33', 'patient', NULL, 1),
(198, 1, 26, 344, 2, 1, 4, 0, 2, '2017-04-06 18:08:12', 'patient', NULL, 4),
(199, 2, 26, 344, 2, 1, 4, 0, 2, '2017-04-06 18:08:12', 'patient', NULL, 4),
(200, 3, 26, 344, 2, 1, 4, 0, 2, '2017-04-06 18:08:12', 'patient', NULL, 4),
(201, 4, 26, 344, 2, 1, 4, 0, 2, '2017-04-06 18:08:12', 'patient', NULL, 4),
(202, 5, 26, 344, 2, 1, 4, 0, 2, '2017-04-06 18:08:12', 'patient', NULL, 4),
(203, 1, 17, 365, 2, 1, 5, 0, 2, '2017-04-06 18:19:50', 'patient', NULL, 5),
(204, 2, 17, 365, 2, 1, 5, 0, 2, '2017-04-06 18:19:51', 'patient', NULL, 5),
(205, 3, 17, 365, 2, 1, 5, 0, 2, '2017-04-06 18:19:51', 'patient', NULL, 5),
(206, 4, 17, 365, 2, 1, 5, 0, 2, '2017-04-06 18:19:51', 'patient', NULL, 5),
(207, 5, 17, 365, 2, 1, 5, 0, 2, '2017-04-06 18:19:51', 'patient', NULL, 5),
(208, 1, 17, 342, 2, 2, 4, 0, 2, '2017-04-06 18:24:21', 'patient', NULL, 4),
(209, 2, 17, 342, 2, 2, 5, 0, 2, '2017-04-06 18:24:22', 'patient', NULL, 5),
(210, 3, 17, 342, 2, 2, 4, 0, 2, '2017-04-06 18:24:22', 'patient', NULL, 4),
(211, 4, 17, 342, 2, 2, 4, 0, 2, '2017-04-06 18:24:22', 'patient', NULL, 4),
(212, 5, 17, 342, 2, 2, 5, 0, 2, '2017-04-06 18:24:22', 'patient', NULL, 5),
(213, 1, 17, 343, 2, 1, 4, 0, 2, '2017-04-06 18:27:04', 'patient', NULL, 4),
(214, 2, 17, 343, 2, 1, 4, 0, 2, '2017-04-06 18:27:04', 'patient', NULL, 4),
(215, 3, 17, 343, 2, 1, 4, 0, 2, '2017-04-06 18:27:04', 'patient', NULL, 4),
(216, 4, 17, 343, 2, 1, 4, 0, 2, '2017-04-06 18:27:04', 'patient', NULL, 4),
(217, 5, 17, 343, 2, 1, 4, 0, 2, '2017-04-06 18:27:04', 'patient', NULL, 4),
(218, 1, 17, 366, 2, 1, 4, 0, 2, '2017-04-06 18:28:10', 'patient', NULL, 4),
(219, 2, 17, 366, 2, 1, 4, 0, 2, '2017-04-06 18:28:10', 'patient', NULL, 4),
(220, 3, 17, 366, 2, 1, 4, 0, 2, '2017-04-06 18:28:10', 'patient', NULL, 4),
(221, 4, 17, 366, 2, 1, 4, 0, 2, '2017-04-06 18:28:10', 'patient', NULL, 4),
(222, 5, 17, 366, 2, 1, 4, 0, 2, '2017-04-06 18:28:10', 'patient', NULL, 4),
(223, 1, 17, 350, 2, 3, 4, 0, 2, '2017-04-06 18:28:45', 'patient', NULL, 4),
(224, 2, 17, 350, 2, 3, 4, 0, 2, '2017-04-06 18:28:45', 'patient', NULL, 4),
(225, 3, 17, 350, 2, 3, 4, 0, 2, '2017-04-06 18:28:45', 'patient', NULL, 4),
(226, 4, 17, 350, 2, 3, 4, 0, 2, '2017-04-06 18:28:45', 'patient', NULL, 4),
(227, 5, 17, 350, 2, 3, 4, 0, 2, '2017-04-06 18:28:45', 'patient', NULL, 4),
(228, 1, 17, 370, 2, 1, 4, 0, 2, '2017-04-06 18:41:18', 'patient', NULL, 4),
(229, 2, 17, 370, 2, 1, 3, 0, 2, '2017-04-06 18:41:18', 'patient', NULL, 3),
(230, 3, 17, 370, 2, 1, 3, 0, 2, '2017-04-06 18:41:18', 'patient', NULL, 3),
(231, 4, 17, 370, 2, 1, 4, 0, 2, '2017-04-06 18:41:18', 'patient', NULL, 4),
(232, 5, 17, 370, 2, 1, 4, 0, 2, '2017-04-06 18:41:18', 'patient', NULL, 4),
(233, 1, 26, 350, 2, 3, 4, 0, 2, '2017-04-23 17:41:16', 'patient', NULL, 4),
(234, 2, 26, 350, 2, 3, 4, 0, 2, '2017-04-23 17:41:16', 'patient', NULL, 4),
(235, 3, 26, 350, 2, 3, 4, 0, 2, '2017-04-23 17:41:16', 'patient', NULL, 4),
(236, 4, 26, 350, 2, 3, 4, 0, 2, '2017-04-23 17:41:16', 'patient', NULL, 4),
(237, 5, 26, 350, 2, 3, 4, 0, 2, '2017-04-23 17:41:16', 'patient', NULL, 4),
(238, 1, 26, 357, 2, 1, 1, 0, 2, '2017-04-23 17:42:01', 'patient', NULL, 1),
(239, 2, 26, 357, 2, 1, 1, 0, 2, '2017-04-23 17:42:02', 'patient', NULL, 1),
(240, 3, 26, 357, 2, 1, 1, 0, 2, '2017-04-23 17:42:02', 'patient', NULL, 1),
(241, 4, 26, 357, 2, 1, 1, 0, 2, '2017-04-23 17:42:02', 'patient', NULL, 1),
(242, 5, 26, 357, 2, 1, 1, 0, 2, '2017-04-23 17:42:02', 'patient', NULL, 1),
(243, 1, 26, 361, 2, 1, 1, 0, 2, '2017-04-23 17:42:39', 'patient', NULL, 1),
(244, 2, 26, 361, 2, 1, 1, 0, 2, '2017-04-23 17:42:40', 'patient', NULL, 1),
(245, 3, 26, 361, 2, 1, 1, 0, 2, '2017-04-23 17:42:40', 'patient', NULL, 1),
(246, 4, 26, 361, 2, 1, 1, 0, 2, '2017-04-23 17:42:40', 'patient', NULL, 1),
(247, 5, 26, 361, 2, 1, 1, 0, 2, '2017-04-23 17:42:40', 'patient', NULL, 1),
(248, 1, 26, 386, 2, 1, 4, 0, 2, '2017-04-23 17:43:50', 'patient', NULL, 4),
(249, 2, 26, 386, 2, 1, 4, 0, 2, '2017-04-23 17:43:50', 'patient', NULL, 4),
(250, 3, 26, 386, 2, 1, 4, 0, 2, '2017-04-23 17:43:50', 'patient', NULL, 4),
(251, 4, 26, 386, 2, 1, 4, 0, 2, '2017-04-23 17:43:50', 'patient', NULL, 4),
(252, 5, 26, 386, 2, 1, 4, 0, 2, '2017-04-23 17:43:50', 'patient', NULL, 4),
(253, 1, 26, 344, 2, 1, 3, 0, 2, '2017-04-23 17:45:37', 'patient', NULL, 3),
(254, 2, 26, 344, 2, 1, 3, 0, 2, '2017-04-23 17:45:37', 'patient', NULL, 3),
(255, 3, 26, 344, 2, 1, 2, 0, 2, '2017-04-23 17:45:37', 'patient', NULL, 2),
(256, 4, 26, 344, 2, 1, 2, 0, 2, '2017-04-23 17:45:37', 'patient', NULL, 2),
(257, 5, 26, 344, 2, 1, 3, 0, 2, '2017-04-23 17:45:37', 'patient', NULL, 3);

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
(1, '1', 'employee', 'Top Scoring Employee', '1', NULL),
(2, '2', 'employee', 'No missed punches', '1', NULL),
(3, '3', 'employee', 'Special Situations', '1', NULL),
(4, '1', 'employee', 'Top Scoring Employee', '2', NULL),
(5, '2', 'employee', 'No missed punches', '2', NULL),
(6, '3', 'employee', 'Special Situations', '2', NULL),
(7, '1', 'employee', 'Top Scoring Employee 3', '3', NULL),
(8, '2', 'employee', 'No missed punches', '3', NULL),
(9, '3', 'employee', 'Special Situations', '3', NULL),
(10, '1', 'unit', 'No falls', '1', NULL),
(11, '2', 'unit', 'No Clautis', '1', NULL),
(12, '3', 'unit', 'No Hap u’s', '1', NULL),
(13, '4', 'unit', 'No Vap’s', '1', NULL),
(14, '5', 'unit', 'No Agency Use', '1', NULL),
(15, '1', 'unit', 'No falls', '2', NULL),
(16, '2', 'unit', 'No Clautis', '2', NULL),
(17, '3', 'unit', 'No Hap u’s', '2', NULL),
(18, '4', 'unit', 'No Vap’s', '2', NULL),
(19, '5', 'unit', 'No Agency Use', '2', 'default'),
(20, '1', 'unit', 'No falls', '3', NULL),
(21, '2', 'unit', 'No Clautis', '3', NULL),
(22, '3', 'unit', 'No Hap u’s', '3', NULL),
(23, '4', 'unit', 'No Vap’s', '3', NULL),
(24, '5', 'unit', 'No Agency Use', '3', NULL),
(25, '6', 'unit', 'Positive spot check of restraints', '2', 'default');

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
(110, 'job_title', '10', 'RRT', '2', 'RRT - REGISTERED RESPIRATORY THERAPIST'),
(111, 'csstype', 'default', 'Default', NULL, NULL),
(112, 'csstype', 'primary', 'Primary', NULL, NULL),
(113, 'csstype', 'info', 'Info', NULL, NULL),
(114, 'csstype', 'success', 'Success', NULL, NULL),
(115, 'csstype', 'warning', 'Warning', NULL, NULL),
(116, 'csstype', 'danger', 'Danger', NULL, NULL),
(117, 'csstype', 'pink', 'Pink', NULL, NULL),
(118, 'csstype', 'purple', 'Purple', NULL, NULL);

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
(1, 'Prop response AIDS significantly in her breathing and treatment\r\n', 342, 25, '', '', '', '', '2017-04-05 14:46:04'),
(2, 'Jessica Homblette keen observations at the  heart monitor allowed her to detect subtle differences in her read outs  and alert the necessary response personnel saving her life.\r\n\r\n\r\nLeica Leakey  is so wonderful at her position making certain every aspect of patient care is arranged for.', NULL, 25, '', '', '', '', '2017-04-05 15:09:33'),
(3, 'Patti is a very compassionate caregiver and was very sensitive to my wife\'s health care needs. She went out of her way to be helpful with taking care and also in providing information to me regarding my wife at any time I requested. She gets five stars from me and my family. ', 365, 17, '', '', '', '', '2017-04-06 18:23:35'),
(4, 'Mike has been very helpful with making my wife feel comfortable with her treatment and listened to her concerns. Mike has just been great!! ', 342, 17, '', '', '', '', '2017-04-06 18:26:38'),
(5, 'He has been very helpful in providing special care for the physical therapy needs for my wife. This was greatly needed and he made a major effort to cause improvement. \r\n\r\nI would also like to recognize Jessica at the nurse desk station for her very helpful attitude and willingness to help all the time. ', 350, 17, '', '', '', '', '2017-04-06 18:40:33'),
(6, 'Cornelis, Nurse Manger \r\nAs unit manager at SCU, Cornelis makes certain patient care is coordinated smoothly and efficiently. Assures individualized needs are promptly met. Recently, my mother underwent two consecutive surgical procedures that necessitated SICU. Cornelis offered such kindness and compassion easing my burden significantly \r\n\r\n\r\n\r\nTed, RT Since no picture, wanted to provide top rankings in all the survey categories ', NULL, 25, '', '', '', '', '2017-04-12 11:53:17');

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
(1, '1', 1, 2, 3, 4, 5, 2400, 4000, 6400, 0, 59, 60, 69, 70, 79, 80, 89, 90, 100),
(6, '2', 1, 2, 3, 4, 5, 2400, 4000, 6400, 0, 59, 60, 69, 70, 79, 80, 89, 90, 100),
(15, '3', 1, 2, 3, 4, 5, 2400, 4000, 6400, 0, 59, 60, 69, 70, 79, 80, 89, 90, 100);

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
(0, 1, 1, 1);

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
(19, 4, 4444, '[\"2\",\"3\"]', 1, '[\"1\",\"2\",\"3\"]', 'Wambi', 'Superadmin', '2016-12-09', '2016-03-11', '2016-12-24 00:00:00', '96I6 - PLANTATION', '[\"3\"]', 'tanphuqncrm@gmail.com', '9545527533', '4444_Wambibirdonly.png', '$2y$10$aabnTQhEGqDptc7N6cJOGewatM1ycgD0pHLFNHvQiWa0Lfgp2lctW', 4444, 1, '@mymetropcs.com', NULL, 'PiXZ9O55VYMQdlTIMF9nC1amZTTyLhHaVsEYH3IQzbAsnKZlADV237iKFPCa', 0, NULL, 0, NULL),
(32, 3, 9588, '[\"1\"]', 2, '[\"1\"]', 'Wambi', 'Admin', '2016-12-09', '2016-03-11', '2016-12-09 00:00:00', '96I6 - PLANTATION', '[\"5\"]', 'beverlycarson99@gmail.com', '9545527533', '9588_Screen Shot 2017-01-11 at 12.00.52 AM.png', '$2y$10$HAOFrICxTXHSm4t275YiDuvb4MBdavNgc6Qhajk3FYv0nfqaFZx3a', 9588, 1, '@mymetropcs.com', NULL, '2resw9YGjjxTJ1KT3T4dqb09nJZHH6Z1M9Dj0aQWg5NCq3k4Rkx3bjea9d7J', 765, '9588_Screen Shot 2017-01-02 at 8.35.34 PM.png', 0, NULL),
(234, 3, 5675, '[\"3\"]', NULL, '[\"2\"]', 'Roberto', 'Dutesco', '0000-00-00', '0000-00-00', '2016-10-12 00:00:00', '2800 North Miami Ave', '[\"5\"]', 'tanphuqncrm@gmail.com', '9545527533', '', '$2y$10$B1.tx4oADM2rqcoCyZL0suqvbOFrqWQYnMckgeyqPDjyoyUrhFsXu', 5675, 6, '@txt.bellmobility.ca', NULL, 'EpLm3TlXXwsV5zvBsh0QcRaIF6Naou9dtacznu3JWyg6DlIcQSPQkctIPw7C', 765, NULL, 0, NULL),
(235, 3, 4389, '[\"3\"]', NULL, '[\"2\"]', 'Mark ', 'Daniel', '0000-00-00', '0000-00-00', '2016-10-13 00:00:00', '2800 North Miami Ave', '[\"4\"]', 'tanphuqncrm@gmail.com', '9545527533', '', '$2y$10$9ObHDYCmZBkNg0oLO2xfAOe63vJCORFipRvmBCkj.xD8.2stjU0Oi', 4389, 5, '@message.alltel.com', NULL, 'Hd5GmD1eJSB9iZYtNRvSnyAoTXaG0rFXclHg5hcCbKqxrC9j5mJpfYa38Fn4', 765, NULL, 0, NULL),
(292, 5, 10112014, '[\"1\"]', NULL, '[\"1\"]', 'Wambi', 'Patient Manager', '0000-00-00', '0000-00-00', '2017-01-11 00:00:00', '', '[\"3\"]', 'tanphuqncrm1@gmail.com', '983599071', '10112014_Screen Shot 2017-01-11 at 12.00.52 AM.png', '$2y$10$WARKyb/83AjPHlfzSyKeuei5f6oNwk.4VrwYzCDFZNigIz0Qd8yHK', 10112014, 1, '@mymetropcs.com', NULL, 'ULl7xFdxWSDT93rH5W3S4rkQ4jKiyLo8RnW8XvOp8oOqOafXhJReBfbXvVA6', 765, NULL, 0, NULL),
(294, 3, 400875, '[\"2\"]', NULL, '[\"3\"]', 'Duane', 'Christie', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'duane.christie@specialcareproviders.com', '9546100706', '', '$2y$10$jm/qLT9noCF5FN8iOr7BPu4EHIRRFAZ0Qp1/cmAbVzrx/hstdpMd.', 400875, 4, '@tmomail.net', NULL, 'kQzcljdMVO75XrX8w3uolg49DRvsDQbr507C42uNnZRsDLS96UvBvwntN5VL', 765, NULL, 0, NULL),
(342, 2, 400863, '[\"2\"]', NULL, '[\"2\"]', 'Michael', 'Ables', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'mikeuniquephotos@aol.com', '3059939690', 'Ables_Michael.jpg', '', 400863, 6, '@page.metrocall.com', '', '', 86, '', 0, '0000-00-00 00:00:00'),
(343, 2, 400865, '[\"2\"]', NULL, '[\"1\"]', 'Allison', 'Aguilar', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\",\"2\"]', 'allimia@msn.com', '7862451593', '400865_Screen Shot 2017-03-13 at 5.57.19 PM.png', '', 400865, 1, '@myboostmobile.com', '', '', 64, '', 0, '0000-00-00 00:00:00'),
(344, 2, 400866, '[\"2\"]', NULL, '[\"1\"]', 'Guerbie', 'Alcime', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'jguerbie@hotmail.com', '9542921891', 'Alcime_Guerbie.jpg', '', 400866, 1, '@tmomail.net', '', '2rMXy1hAuGTCvEKsJ6y8cV6X3hiAZUoW7T56TSZm9c83cBqfv2hY1r6EGzUi', 113, '', 0, '0000-00-00 00:00:00'),
(345, 2, 400868, '[\"2\"]', NULL, '[\"1\"]', 'Nerla', 'Andocles', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'nerlaj1226@gmail.com', '9548221200', '400868_Screen Shot 2017-03-13 at 5.56.19 PM.png', '', 400868, 1, '@mymetropcs.com', '', '', 25, '', 0, '0000-00-00 00:00:00'),
(347, 2, 422319, '[\"2\"]', NULL, '[\"1\"]', 'Michelene', 'Bosse', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'bossmichelene@gmail.com', '9542957457', '422319_Screen Shot 2017-03-13 at 6.02.22 PM.png', '', 422319, 1, '@page.metrocall.com', '', '', 50, '', 0, '0000-00-00 00:00:00'),
(348, 2, 464464, '[\"2\"]', NULL, '[\"1\"]', 'Robin', 'Bridgewater', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'admin_support@rabsnaturalrubs.com', '5613241539', '464464_Screen Shot 2017-03-13 at 6.03.06 PM.png', '', 464464, 2, '@txt.att.net', '', 'OuA5vFZiyu4uhlkxZTuWZAbacx9mmw0tcIzkbYi98RJYiUtcSZzQnCmLohZJ', 0, '', 0, '0000-00-00 00:00:00'),
(349, 2, 400874, '[\"2\"]', NULL, '[\"1\"]', 'Immacula ', 'Chery ', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'ichery@comcast.net', '9542583293', '', '', 400874, 1, '@txt.att.net', '', '', 32, '', 0, '0000-00-00 00:00:00'),
(350, 2, 416121, '[\"2\"]', NULL, '[\"3\"]', 'Marc', 'Christie', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'mchristie1219@yahoo.com', '9546827442', 'Christie_Marc.jpg', '', 416121, 5, '@tmomail.net', '', 'hjH5zsYds7tSqtBkthIHeMfSGfkUIbWCeCLxJACxJOIsqtqSid13Q32wSMMk', 40, '', 0, '0000-00-00 00:00:00'),
(351, 2, 400876, '[\"2\"]', NULL, '[\"1\"]', 'Mustafa ', 'Cicek ', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\",\"2\"]', 'othello1629@gmail.com', '9545601886', '400876_Screen Shot 2017-03-13 at 6.05.44 PM.png', '', 400876, 2, '@txt.att.net', '', '', 25, '', 0, '0000-00-00 00:00:00'),
(352, 2, 853504, '[\"2\"]', NULL, '[\"3\"]', 'Robert', 'Clarke', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'deebo2001@gmail.com', '3057853504', 'Clarke_Robert.jpg', '', 853504, 7, '@tmomail.net', '', 'k07oMZ7c0uA2AlGlyVidt6EEZ0LnExkBrXg9B5raMo58ZhUV1S0RAd9PblFa', 0, '', 0, '0000-00-00 00:00:00'),
(353, 2, 400878, '[\"2\"]', NULL, '[\"1\"]', 'Kathie', 'Desgranges', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'mariekate12@gmail.com', '7547079349', '', '', 400878, 2, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(354, 4, 422669, '[\"2\"]', NULL, '[\"1\"]', 'Cornelis', 'Devroedt', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'ccdevroedt@browardhealth.org', '9542612236', '', '$2y$10$xbyFN/VCoGkCaEtj6RHxU.7hQPV6Y8hXswazDe5LnAqO3SNeub6Rq', 422669, 1, '@txt.att.net', '', 'D63PJo1T0eFbQRbKmjiHT6ZMr9o8ISWbBW8xyAXgtndUUWat1ltCrARVQ559', 0, '', 0, '0000-00-00 00:00:00'),
(355, 2, 400879, '[\"2\"]', NULL, '[\"2\"]', 'Marck', 'Dophin ', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'mdophin@hotmail.com', '7862467471', '400879_Screen Shot 2017-03-13 at 7.07.54 PM.png', '', 400879, 6, '@tmomail.net', '', '0m7XDe0eiRjsAqsrLBJF5BKkICle3bmreIVJTeGAz157t4odM79NfMmwe6et', 70, '400879_20160410_134043.jpg', 0, '0000-00-00 00:00:00'),
(356, 2, 714772, '[\"2\"]', NULL, '[\"3\"]', 'James', 'Dorante', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'jamesdorante@gmail.com', '7862714772', '714772_Screen Shot 2017-03-13 at 6.57.03 PM.png', '', 714772, 8, '@tmomail.net', '', 'jrUeZueqh26iPglfp9ax1fei63eT6obkGKi9o2ANfXOCWVvaU3dWhYk5HzZY', 0, '', 0, '0000-00-00 00:00:00'),
(357, 2, 400881, '[\"2\"]', NULL, '[\"1\"]', 'Elsuze', 'Dorisca', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'elsuz5@yahoo.com', '5615031507', '400881_Screen Shot 2017-03-13 at 6.09.20 PM.png', '', 400881, 2, '@page.metrocall.com', '', '', 30, '400881_20161225_111111_HDR~3.jpg', 0, '0000-00-00 00:00:00'),
(358, 2, 400882, '[\"2\"]', NULL, '[\"1\"]', 'Roslyn', 'Eastman', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'ramlaronimanning@gmail.com', '6175159028', 'Eastman_Rosyln.jpg', '', 400882, 1, '@vtext.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(359, 2, 400883, '[\"2\"]', NULL, '[\"3\"]', 'Josephus', 'Eggelletion', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'eggpt@hotmail.com', '9548683380', '400883_Screen Shot 2017-03-13 at 5.22.48 PM.png', '', 400883, 9, '@vtext.com', '', 'rBcGmQVXwUTPf07YpHjPpY3vlpxyMDXqtP55wROZrdUBUjVJvM6PJE4XYWeQ', 0, '400883_Screen Shot 2017-03-13 at 5.22.48 PM.png', 0, '0000-00-00 00:00:00'),
(361, 2, 400885, '[\"2\"]', NULL, '[\"1\"]', 'Nerlande ', 'Fenelus', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'nerlande30@hotmail.com', '5617408015', 'Fenelus_Nerlande.jpg', '', 400885, 1, '@messaging.sprintpcs.com', '', '', 30, '', 0, '0000-00-00 00:00:00'),
(362, 2, 400887, '[\"2\"]', NULL, '[\"1\"]', 'Guerdy', 'Frage', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'guerdyfrage07@gmail.com', '9549342990', '400887_Screen Shot 2017-03-13 at 5.25.14 PM.png', '', 400887, 2, '@tmomail.net', '', 'stgxL6mtylJmUZGkRj58pI4SzefETya2F9ssDTHUxH6KJrwlMXOFiGTdd77d', 0, '400887_Screen Shot 2017-03-13 at 5.25.14 PM.png', 0, '0000-00-00 00:00:00'),
(363, 2, 400888, '[\"2\"]', NULL, '[\"3\"]', 'Raquel', 'Garcia', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"3\"]', 'rokkigarcia@gmail.com', '7863994053', '', '', 400888, 12, '@tmomail.net', '', 'kx73GfszPOgDr3I8n01DFKwTWFkT2nL5GgpY00YRS7IawZbcYLunTu4fQF7i', 0, '', 0, '0000-00-00 00:00:00'),
(364, 2, 400890, '[\"2\"]', NULL, '[\"1\"]', 'Yanick', 'Gilot', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'residencetrinite@myacc.net', '9543496781', '', '', 400890, 1, '@paging.acswireless.com', '', '', 25, '', 0, '0000-00-00 00:00:00'),
(365, 2, 418096, '[\"2\"]', NULL, '[\"1\"]', 'Patricia', 'Giordano', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'crazygio@sbcglobal.net', '2036952628', '418096_Screen Shot 2017-03-13 at 6.13.21 PM.png', '', 418096, 1, '@vtext.com', '', '', 55, '', 0, '0000-00-00 00:00:00'),
(366, 2, 464465, '[\"2\"]', NULL, '[\"1\"]', 'Nadia', 'Gordon', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'visitmeanytime@yahoo.com', '3057136499', '464465_Screen Shot 2017-03-13 at 5.26.40 PM.png', '', 464465, 1, '@tmomail.net', '', 'R7SUnZRuhrZuAS6UtwNa1Au4BABEiLc1ainzzYYiI5CPnbNZ1nHerWNkAXA5', 25, '464465_Screen Shot 2017-03-13 at 5.26.40 PM.png', 0, '0000-00-00 00:00:00'),
(368, 2, 400891, '[\"2\"]', NULL, '[\"1\"]', 'Sandra', 'Green', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'romonaormsby@yahoo.com', '9548267862', 'Green_Sandra.jpg', '', 400891, 2, '@messaging.sprintpcs.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(370, 2, 464467, '[\"2\"]', NULL, '[\"1\"]', 'Rosemarie', 'Johnson', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'roseforhen@aol.com', '9545152590', '464467_Screen Shot 2017-03-13 at 5.28.08 PM.png', '', 464467, 2, '@tmomail.net', '', 'yoWk6XKkIkqeVj5zHF2KBUWT0s5bqL90f3PM8H1gtvOG9903MeORMmZBhiXI', 68, '464467_Screen Shot 2017-03-13 at 5.28.08 PM.png', 0, '0000-00-00 00:00:00'),
(371, 2, 400896, '[\"2\"]', NULL, '[\"1\"]', 'Rano', 'Kurbanova ', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'ranokurbanova911@hotmail.com', '7725593134', '400896_Screen Shot 2017-03-13 at 7.27.59 PM.png', '', 400896, 1, '@txt.att.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(372, 2, 464468, '[\"2\"]', NULL, '[\"3\"]', 'Hendrikus', 'Martens', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'h_martens@msn.com', '9544106468', '464468_Screen Shot 2017-03-13 at 5.29.21 PM.png', '', 464468, 8, '@tmomail.net', '', 'T0SXxR0xy9zxH54UpJaH5PEdOGkxjvtjVrMcXl4qY7AJRwtUkHcqMMnu8QVX', 25, '464468_Screen Shot 2017-03-13 at 5.29.21 PM.png', 0, '0000-00-00 00:00:00'),
(373, 2, 400900, '[\"2\"]', NULL, '[\"2\"]', 'Marlyn', 'Marthelly ', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'mmarthelly@yahoo.com', '5613768633', '400900_Screen Shot 2017-03-13 at 7.09.33 PM.png', '', 400900, 6, '@messaging.sprintpcs.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(374, 2, 416163, '[\"2\"]', NULL, '[\"3\"]', 'Oldine', 'Mondesir', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'oldine79@hotmail.com', '9546615474', 'Mondesir_Oldine.jpg', '', 416163, 8, '@messaging.sprintpcs.com', '', '', 25, '', 0, '0000-00-00 00:00:00'),
(375, 2, 400902, '[\"2\"]', NULL, '[\"1\"]', 'Beverly', 'Morris', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'indianrose122@gmail.com', '9547090688', '400902_Screen Shot 2017-03-13 at 6.38.00 PM.png', '', 400902, 2, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(377, 2, 416240, '[\"2\"]', NULL, '[\"2\"]', 'Charles', 'Pierre', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'charles_pierre27@hotmail.com', '9542976909', '416240_Screen Shot 2017-03-13 at 6.39.12 PM.png', '', 416240, 6, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(378, 2, 416238, '[\"2\"]', NULL, '[\"2\"]', 'Opal', 'Powe', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\",\"2\"]', 'opalpowe@comcast.net', '9549730585', '416238_Screen Shot 2017-03-13 at 7.21.49 PM.png', '', 416238, 10, '@tmomail.net', '', '', 50, '', 0, '0000-00-00 00:00:00'),
(379, 2, 400906, '[\"2\"]', NULL, '[\"1\"]', 'Michael', 'Rabalais ', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'Rabalais_87@hotmail.com', '9858522298', '400906_Screen Shot 2017-03-13 at 7.12.05 PM.png', '', 400906, 11, '@messaging.sprintpcs.com', '', '', 70, '', 0, '0000-00-00 00:00:00'),
(380, 2, 431336, '[\"2\"]', NULL, '[\"2\"]', 'Pamela', 'Robert', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\",\"2\"]', 'pamicheli@yahoo.com', '9542480169', '', '', 431336, 10, '@tmomail.net', '', 'n7ymHzBOpI82XF7dNzwQIFqC685VCOKYXl2pLXZnRst3DHAy3hbYGDSKCF3W', 25, '', 0, '0000-00-00 00:00:00'),
(381, 3, 400910, '[\"2\"]', NULL, '[\"2\"]', 'Norman', 'Sinclair', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'tbearluv40@yahoo.com', '9548258417', 'Sinclair_Norman.jpg', '$2y$10$9vi1oQgPo2U8jCqfulZHjOgMZcwOCw3e20CR6DRK0dDWqJBNSR6u.', 400910, 4, '@txt.att.net', '', '', 765, '', 0, '0000-00-00 00:00:00'),
(382, 2, 400911, '[\"2\"]', NULL, '[\"1\"]', 'Beth', 'Snyder', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'Birdlvr23@aol.com', '9542057638', '400911_Screen Shot 2017-03-13 at 6.36.38 PM.png', '', 400911, 1, '@txt.att.net', '', 'nb68vr1vi60DRWOQXxF9x68B5RsYZHfR531aB8On0A0tIRVgpk9IX4xCQeor', 20, '', 0, '0000-00-00 00:00:00'),
(384, 2, 468802, '[\"2\"]', NULL, '[\"3\"]', 'Mary', 'Tarrer', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\",\"2\"]', 'mkathryn3@aol.com', '2053826783', '468802_Screen Shot 2017-04-21 at 3.55.04 PM.png', '', 468802, 12, '@txt.att.net', '', 'gz5yvw5tJwBOncgZDaEu8sUeiWNmPE93sAIFAzpIhdCmc6cExFir6s2ulLhN', 0, '', 0, '0000-00-00 00:00:00'),
(385, 2, 400912, '[\"2\"]', NULL, '[\"2\"]', 'Antoine', 'Telfort ', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"2\"]', 'atelfort12@gmail.com', '9542137066', '400912_Screen Shot 2017-03-13 at 6.35.20 PM.png', '', 400912, 6, '@page.metrocall.com', '', '', 25, '', 0, '0000-00-00 00:00:00'),
(386, 2, 464470, '[\"2\"]', NULL, '[\"1\"]', 'Janet', 'Watson', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'dimpleswato@yahoo.com', '7542247789', '464470_Screen Shot 2017-03-13 at 5.31.48 PM.png', '', 464470, 1, '@messaging.sprintpcs.com', '', 'mFv9T5APEgu5CSMtnCTN9QdA0cK2q7wb31i84QdoDwuV7VtTVwpvrLi7I99J', 114, '464470_Screen Shot 2017-03-13 at 5.31.48 PM.png', 0, '0000-00-00 00:00:00'),
(387, 2, 400914, '[\"2\"]', NULL, '[\"1\"]', 'Latoya', 'Webb', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"1\"]', 'shellyann0981@yahoo.com', '9543945846', '400914_Screen Shot 2017-03-13 at 7.05.29 PM.png', '', 400914, 2, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(388, 2, 438738, '[\"2\"]', NULL, '[\"2\"]', 'Sanchay', 'Williams', '0000-00-00', '0000-00-00', '2017-01-12 00:00:00', '', '[\"5\"]', 'sanjay401060@yahoo.com', '000000000', '', '', 438738, 10, '@message.alltel.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(389, 3, 1994, '[\"2\"]', NULL, '[\"1\"]', 'Wambi', 'Admin', '0000-00-00', '0000-00-00', '2017-01-09 00:00:00', 'Plantation', '[\"3\"]', 'betatestingmetz@gmail.com', '7862021799', '1994_Wambibirdonly.png', '$2y$10$mlZs8aaONrwfkIJB1LjMZ.2sENE4OaqdmxmOBCdUIoaDist7vWnqO', 1994, 1, '@txt.att.net', NULL, 'c7nbYmkS8vkKUyIFPXwbDU4UoxFRLiYw9DfuA5uaEjEwGujBsnjJkT8DxwnJ', 765, NULL, 0, NULL),
(390, 4, 121786, '[\"2\"]', NULL, '[\"1\",\"2\",\"3\"]', 'Erik', 'Rozynes', '0000-00-00', '0000-00-00', '2016-10-01 00:00:00', '', '[\"1\"]', 'erik.rozynes@specialcareproviders.com', '9546514961', '', '$2y$10$ZZiSt5tNnCBKRIXEb7LBR.tGpXPaGSvOc.X/Kqviwq.mBv5EICutq', 121786, 1, '@txt.att.net', NULL, 'N86O9u7G7jHCRnht123oYmAJLXXLeNnDv6hQHvyuu9W7J6FTbaIjfGtoKRyj', 0, NULL, 0, NULL),
(391, 5, 400897, '[\"2\"]', NULL, '[\"1\"]', 'Lecia', 'Leaky', '0000-00-00', '0000-00-00', '2017-01-18 00:00:00', '', '[\"1\"]', 'Lleakey@browardhealth.org', '9548159896', '', '$2y$10$zWYqYn.8gn1ecGGq8d78TuDLZx85uGmgAyejZPlXqDWomYjAKlF1e', 400897, 1, '@vtext.com', NULL, 'WNgFZxO8walPfI9R3lEeVwP8tRVUR38YBL6ofWTOxEyK1DC6nU2mlzmbp4yE', 765, NULL, 0, NULL),
(392, 1, 400892, '[\"2\"]', NULL, '[\"1\"]', 'Jessica', 'Homblette', '0000-00-00', '0000-00-00', NULL, '', '[\"1\"]', 'jessicadawn51@yahoo.com', '5614410121', '400892_Screen Shot 2017-03-27 at 10.51.52 AM.png', '$2y$10$Ck0/pbSIdtGoDV8mNTLZVeOd/qHEBV6CfzME7y3m84olahPhn15Ge', 400892, 11, '@txt.att.net', NULL, 'j8fxv3xdTvxNkUwUqD0qsFlhxqqc8sipSzTbCDwD3AqDs077ty6ybkbMLRgG', 0, NULL, 0, NULL),
(393, 2, 492581, '[\"2\"]', NULL, '[\"1\"]', 'Ricardo', 'Nieves', '0000-00-00', '0000-00-00', NULL, '', '[\"1\"]', 'rick48224@yahoo.com', '4405068829', '', '', 492581, 1, '@messaging.sprintpcs.com', NULL, NULL, 0, NULL, 0, NULL);

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
(1, 342, 3, '{\"peck\":19,\"survey_id\":1}', '2017-02-11 00:41:39', NULL, 'NOT_SEEN', NULL),
(2, 342, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(3, 343, 4, '4', '2017-03-13 15:49:54', '2017-04-07 18:07:00', 'SEEN_BUT_UNREAD', 1),
(4, 344, 4, '4', '2017-03-13 15:49:54', '2017-03-28 17:26:00', 'SEEN_BUT_UNREAD', 1),
(5, 345, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(7, 347, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(8, 348, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(9, 349, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(10, 350, 4, '4', '2017-03-13 15:49:54', '2017-04-07 18:07:32', 'SEEN_BUT_UNREAD', 1),
(11, 351, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(12, 352, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(13, 353, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(14, 355, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(15, 356, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(16, 357, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(17, 358, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(18, 359, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(20, 361, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(21, 362, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(22, 363, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(23, 364, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(24, 365, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(25, 366, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(27, 368, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(29, 370, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(30, 371, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(31, 372, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(32, 373, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(33, 374, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(34, 375, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(36, 377, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(37, 378, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(38, 379, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(39, 380, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(40, 382, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(42, 384, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(43, 385, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(44, 386, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(45, 387, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(46, 388, 4, '4', '2017-03-13 15:49:54', '2017-03-13 15:49:54', 'NOT_SEEN', 1),
(272, 379, 3, '{\"peck\":25,\"survey_id\":2}', '2017-03-15 18:34:23', NULL, 'NOT_SEEN', NULL),
(273, 355, 3, '{\"peck\":25,\"survey_id\":3}', '2017-03-15 18:35:02', NULL, 'NOT_SEEN', NULL),
(274, 370, 3, '{\"peck\":25,\"survey_id\":4}', '2017-03-15 18:36:07', NULL, 'NOT_SEEN', NULL),
(275, 386, 3, '{\"peck\":25,\"survey_id\":5}', '2017-03-15 18:36:52', NULL, 'NOT_SEEN', NULL),
(276, 386, 3, '{\"peck\":30,\"survey_id\":6}', '2017-03-15 18:36:53', NULL, 'NOT_SEEN', NULL),
(277, 344, 3, '{\"peck\":25,\"survey_id\":7}', '2017-03-15 18:37:16', '2017-03-28 17:26:00', 'SEEN_BUT_UNREAD', NULL),
(278, 344, 3, '{\"peck\":30,\"survey_id\":8}', '2017-03-15 18:37:17', '2017-03-28 17:26:00', 'SEEN_BUT_UNREAD', NULL),
(280, 342, 3, '{\"peck\":25,\"survey_id\":9}', '2017-04-05 18:45:01', NULL, 'NOT_SEEN', NULL),
(281, 343, 3, '{\"peck\":25,\"survey_id\":10}', '2017-04-05 18:49:37', '2017-04-07 18:07:11', NULL, NULL),
(282, 344, 3, '{\"peck\":25,\"survey_id\":11}', '2017-04-05 18:59:29', NULL, 'NOT_SEEN', NULL),
(283, 345, 3, '{\"peck\":25,\"survey_id\":12}', '2017-04-05 19:00:39', NULL, 'NOT_SEEN', NULL),
(284, 347, 3, '{\"peck\":25,\"survey_id\":13}', '2017-04-05 19:11:23', NULL, 'NOT_SEEN', NULL),
(285, 349, 3, '{\"peck\":25,\"survey_id\":14}', '2017-04-05 19:12:31', NULL, 'NOT_SEEN', NULL),
(286, 351, 3, '{\"peck\":25,\"survey_id\":15}', '2017-04-05 19:13:47', NULL, 'NOT_SEEN', NULL),
(287, 357, 3, '{\"peck\":25,\"survey_id\":16}', '2017-04-05 19:15:18', NULL, 'NOT_SEEN', NULL),
(288, 361, 3, '{\"peck\":25,\"survey_id\":17}', '2017-04-05 19:16:32', NULL, 'NOT_SEEN', NULL),
(289, 364, 3, '{\"peck\":25,\"survey_id\":18}', '2017-04-05 19:18:14', NULL, 'NOT_SEEN', NULL),
(290, 365, 3, '{\"peck\":25,\"survey_id\":19}', '2017-04-05 19:19:23', NULL, 'NOT_SEEN', NULL),
(291, 370, 3, '{\"peck\":25,\"survey_id\":20}', '2017-04-05 19:20:34', NULL, 'NOT_SEEN', NULL),
(292, 372, 3, '{\"peck\":25,\"survey_id\":21}', '2017-04-05 19:21:31', NULL, 'NOT_SEEN', NULL),
(293, 374, 3, '{\"peck\":25,\"survey_id\":22}', '2017-04-05 19:22:25', NULL, 'NOT_SEEN', NULL),
(294, 378, 3, '{\"peck\":25,\"survey_id\":23}', '2017-04-05 19:23:48', NULL, 'NOT_SEEN', NULL),
(295, 379, 3, '{\"peck\":25,\"survey_id\":24}', '2017-04-05 19:24:53', NULL, 'NOT_SEEN', NULL),
(296, 380, 3, '{\"peck\":25,\"survey_id\":25}', '2017-04-05 19:26:32', NULL, 'NOT_SEEN', NULL),
(297, 385, 3, '{\"peck\":25,\"survey_id\":26}', '2017-04-05 19:27:31', NULL, 'NOT_SEEN', NULL),
(298, 355, 3, '{\"peck\":25,\"survey_id\":27}', '2017-04-06 21:11:18', NULL, 'NOT_SEEN', NULL),
(299, 386, 3, '{\"peck\":25,\"survey_id\":28}', '2017-04-06 21:13:14', NULL, 'NOT_SEEN', NULL),
(300, 366, 3, '{\"peck\":5,\"survey_id\":29}', '2017-04-06 21:52:24', NULL, 'NOT_SEEN', NULL),
(301, 342, 3, '{\"peck\":20,\"survey_id\":30}', '2017-04-06 21:54:33', NULL, 'NOT_SEEN', NULL),
(302, 355, 3, '{\"peck\":20,\"survey_id\":31}', '2017-04-06 21:55:22', NULL, 'NOT_SEEN', NULL),
(303, 378, 3, '{\"peck\":25,\"survey_id\":32}', '2017-04-06 21:56:11', NULL, 'NOT_SEEN', NULL),
(304, 379, 3, '{\"peck\":20,\"survey_id\":33}', '2017-04-06 21:56:57', NULL, 'NOT_SEEN', NULL),
(305, 349, 3, '{\"peck\":7,\"survey_id\":34}', '2017-04-06 21:57:38', NULL, 'NOT_SEEN', NULL),
(306, 347, 3, '{\"peck\":25,\"survey_id\":35}', '2017-04-06 21:58:13', NULL, 'NOT_SEEN', NULL),
(307, 386, 3, '{\"peck\":14,\"survey_id\":36}', '2017-04-06 22:00:22', NULL, 'NOT_SEEN', NULL),
(308, 343, 3, '{\"peck\":19,\"survey_id\":37}', '2017-04-06 22:03:07', '2017-04-07 18:07:00', 'SEEN_BUT_UNREAD', NULL),
(309, 382, 3, '{\"peck\":20,\"survey_id\":38}', '2017-04-06 22:04:22', NULL, 'NOT_SEEN', NULL),
(310, 365, 3, '{\"peck\":5,\"survey_id\":39}', '2017-04-06 22:07:33', NULL, 'NOT_SEEN', NULL),
(311, 344, 3, '{\"peck\":20,\"survey_id\":40}', '2017-04-06 22:08:12', NULL, 'NOT_SEEN', NULL),
(312, 365, 3, '{\"peck\":25,\"survey_id\":41}', '2017-04-06 22:19:51', NULL, 'NOT_SEEN', NULL),
(313, 342, 3, '{\"peck\":22,\"survey_id\":42}', '2017-04-06 22:24:22', NULL, 'NOT_SEEN', NULL),
(314, 343, 3, '{\"peck\":20,\"survey_id\":43}', '2017-04-06 22:27:04', '2017-04-07 18:07:00', 'SEEN_BUT_UNREAD', NULL),
(315, 366, 3, '{\"peck\":20,\"survey_id\":44}', '2017-04-06 22:28:10', NULL, 'NOT_SEEN', NULL),
(316, 350, 3, '{\"peck\":20,\"survey_id\":45}', '2017-04-06 22:28:45', '2017-04-07 18:07:32', 'SEEN_BUT_UNREAD', NULL),
(317, 370, 3, '{\"peck\":18,\"survey_id\":46}', '2017-04-06 22:41:18', NULL, 'NOT_SEEN', NULL),
(318, 350, 3, '{\"peck\":20,\"survey_id\":47}', '2017-04-23 21:41:16', NULL, 'NOT_SEEN', NULL),
(319, 357, 3, '{\"peck\":5,\"survey_id\":48}', '2017-04-23 21:42:02', NULL, 'NOT_SEEN', NULL),
(320, 361, 3, '{\"peck\":5,\"survey_id\":49}', '2017-04-23 21:42:40', NULL, 'NOT_SEEN', NULL),
(321, 386, 3, '{\"peck\":20,\"survey_id\":50}', '2017-04-23 21:43:50', NULL, 'NOT_SEEN', NULL),
(322, 344, 3, '{\"peck\":13,\"survey_id\":51}', '2017-04-23 21:45:37', NULL, 'NOT_SEEN', NULL);

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
(1, 18, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 'patient', '2017-03-15 14:38:05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
(2, 25, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 'patient', '2017-04-05 15:03:16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
(3, 25, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 'patient', '2017-04-12 11:46:01', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0),
(4, 26, 2, 1, 3, 2, 1, 1, 2, 1, 4, 4, 4, 4, 2, 2, 2, 2, 1, 'patient', '2017-04-23 17:39:51', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17, 0);

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
(12, 1, 1, 'Listens_to_you_answers_questions', 1, 1),
(13, 2, 1, 'Takes_enough_time_with_you', 1, 1),
(14, 3, 1, 'Explains_what_you_want_to_know', 1, 1),
(15, 4, 1, 'Provides_good_advice_and_treatment', 1, 1),
(16, 1, 2, 'Listens_to_you_answers_questions', 1, 1),
(17, 2, 2, 'Provides_good_nursing_care', 1, 1),
(18, 3, 2, 'Takes_enough_time_with_you', 1, 1),
(19, 4, 2, 'Has_a_caring_attitude', 1, 1),
(20, 1, 3, 'Friendly_and_helpful_to_you', 1, 1),
(21, 2, 3, 'Answers_your_questions', 1, 1),
(22, 3, 3, 'Explains_Treatment_Plan', 1, 1),
(23, 4, 3, 'Has_a_caring_attitude', 1, 1),
(24, 1, 4, 'Neat_and_clean_building', 1, 1),
(25, 2, 4, 'Unit_easily_accessible', 1, 1),
(26, 3, 4, 'Comfort_and_Safety', 1, 1),
(27, 4, 4, 'Privacy', 1, 1),
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
(62, 5, 4, 'Likelihood_of_referring_others', 1, 3);

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
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 3),
(6, 2),
(7, 3);

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
(1, 0, 'en', 'questions', 'Treats you with respect', 'Treats you with respect', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(2, 0, 'en', 'questions', 'Listens to your needs', 'Listens to your needs', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(3, 0, 'en', 'questions', 'Clearly explains your care and/or treatment plan', 'Clearly explains your care and/or treatment plan', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(4, 0, 'en', 'questions', 'Makes you feel comfortable when discussing sensitive topics', 'Makes you feel comfortable when discussing sensitive topics', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(5, 0, 'en', 'questions', 'Provides you with compassionate care', 'Provides you with compassionate care', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(6, 0, 'en', 'questions', 'Knowledgeable -Listens to you and answers your questions', 'Knowledgeable -Listens to you and answers your questions', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(7, 0, 'en', 'questions', 'Quality of care provided', 'Quality of care provided', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(8, 0, 'en', 'questions', 'Takes the time to provide the care needed', 'Takes the time to provide the care needed', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(9, 0, 'en', 'questions', 'Compassionate and Respectful', 'Compassionate and Respectful', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(10, 0, 'en', 'questions', 'Explains treatment plan', 'Explains treatment plan', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(11, 0, 'en', 'auth', 'failed', 'These credentials do not match our records.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(12, 0, 'en', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(13, 0, 'en', 'survey', 'evaluate_your_caregiver', 'Evaluate your Caregiver', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(14, 0, 'en', 'survey', 'patient_satisfaction_survey', 'Patient Satisfaction Survey', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(15, 0, 'en', 'survey', 'patient', 'Patient', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(16, 0, 'en', 'survey', 'other', 'Other', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(17, 0, 'en', 'survey', 'i_am_the', 'I am the', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(18, 0, 'en', 'survey', 'family_member', 'Family member', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(19, 0, 'en', 'survey', 'dont_know_login_info', 'I don\'t know my login info', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(20, 0, 'en', 'survey', 'username', 'Username', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(21, 0, 'en', 'survey', 'password', 'Password', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(22, 0, 'en', 'survey', 'all_caregivers', 'All Caregivers', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(23, 0, 'en', 'survey', 'nurses', 'Nurses', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(24, 0, 'en', 'survey', 'respiratories', 'Respiratory', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(25, 0, 'en', 'survey', 'rehab', 'Rehab', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(26, 0, 'en', 'survey', 'search_by_caregiver\'s_name', 'Search by Caregiver\'s Name', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(27, 0, 'en', 'survey', 'ok', 'Ok', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(28, 0, 'en', 'survey', 'good', 'Good', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(29, 0, 'en', 'survey', 'great', 'Great', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(30, 0, 'en', 'survey', 'fair', 'Fair', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(31, 0, 'en', 'survey', 'poor', 'Poor', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(32, 0, 'en', 'survey', 'are_you_sure', 'Are you sure you want to survey', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(33, 0, 'en', 'survey', 'cancel', 'Cancel', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(34, 0, 'en', 'survey', 'begin_survey', 'Begin Survey', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(35, 0, 'en', 'survey', 'home', 'Return home', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(36, 0, 'en', 'survey', 'thanks', 'THANK YOU', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(37, 0, 'en', 'survey', 'login', 'login', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(38, 0, 'en', 'survey', 'Please_Enter_Your_Login_Details', 'Please Enter Your Login Details', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(39, 0, 'en', 'survey', 'Please_Enter_Your_Contact_Details', 'Please Enter Your Contact Details', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(40, 0, 'en', 'survey', 'SUBMIT', 'SUBMIT', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(41, 0, 'en', 'survey', 'Or_go_to_login_section', 'Or go to login section', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(42, 0, 'en', 'survey', 'term_condition_title', 'Term and Conditions', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(43, 0, 'en', 'survey', 'i_accept_the', 'I accept the', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(44, 0, 'en', 'survey', 'term_condition', 'Term and Conditions', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(45, 0, 'en', 'survey', 'Oops', 'Oops, you forgot one step!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(46, 0, 'en', 'survey', 'feedbacks', 'Your feedback will give us insight on what we can do to ensure you receive the highest quality of care. ', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(47, 0, 'en', 'survey', 'Opps_Description', 'Please check the box to Agree the Terms and Conditions in order to login. Also remember this survey is anonymous and will be a secret between us!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(48, 0, 'en', 'survey', 'gohome', 'Please return to home and fill out the patient satisfaction survey or evaluate another caregiver. ', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(49, 0, 'en', 'survey', 'Or', 'Or', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(50, 0, 'en', 'survey', 'check_box_contact', 'I would like to be contacted about my patient experience.', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(51, 0, 'en', 'survey', 'comment_placeholder', 'Just a reminder that everything you share with Wambi remains anonymous.', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(52, 0, 'en', 'survey', 'title_experience', 'Please include any additional comments here about your experience!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(53, 0, 'en', 'survey', 'title_caregiver', 'Please include any additional comments here about your caregiver!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(54, 0, 'en', 'survey', 'error_max_survey', 'You have surveyed this caregiver the maximum amount of times within 24 hours. Please select another caregiver or return home to take the patient satisfaction survey.', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(55, 0, 'en', 'exit_questions', 'Physicians', 'Physicians', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(56, 0, 'en', 'exit_questions', 'Listens_to_you_answers_questions', 'Listens to you and answers your questions', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(57, 0, 'en', 'exit_questions', 'Takes_enough_time_with_you', 'Takes enough time with you', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(58, 0, 'en', 'exit_questions', 'Explains_what_you_want_to_know', 'Explains what you want to know', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(59, 0, 'en', 'exit_questions', 'Provides_good_advice_and_treatment', 'Provides good advice and treatment', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(282, 0, 'es', 'exit_questions', 'Other Therapy Staff', 'Otro Personal de Terapia', '2017-02-11 00:44:24', '2017-02-14 15:58:43'),
(61, 0, 'en', 'exit_questions', 'Provides_good_nursing_care', 'Provides good nursing care', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(62, 0, 'en', 'exit_questions', 'Has_a_caring_attitude', 'Has a caring attitude', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(286, 0, 'en', 'exit_questions', 'Nursing_Staff', 'Nursing Staff', '2017-02-14 15:58:36', '2017-02-14 15:58:43'),
(64, 0, 'en', 'exit_questions', 'Friendly_and_helpful_to_you', 'Friendly and helpful to you', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(65, 0, 'en', 'exit_questions', 'Answers_your_questions', 'Answers your questions', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(66, 0, 'en', 'exit_questions', 'Explains_Treatment_Plan', 'Explains Treatment Plan', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(287, 0, 'en', 'exit_questions', 'Other_Therapy_Staff', 'Other Therapy Staff', '2017-02-14 15:58:36', '2017-02-14 15:58:43'),
(68, 0, 'en', 'exit_questions', 'Neat_and_clean_building', 'Neat and clean building', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(69, 0, 'en', 'exit_questions', 'Unit_easily_accessible', 'Unit easily accessible', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(70, 0, 'en', 'exit_questions', 'Comfort_and_Safety', 'Comfort and Safety', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(71, 0, 'en', 'exit_questions', 'Privacy', 'Privacy', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(72, 0, 'en', 'exit_questions', 'Likelihood_of_referring_others', 'Likelihood of referring others', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(73, 0, 'en', 'exit_questions', 'hospital_mission_statement', '\"Hospital mission statement\"', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(74, 0, 'en', 'validation', 'accepted', 'The :attribute must be accepted.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(75, 0, 'en', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(76, 0, 'en', 'validation', 'after', 'The :attribute must be a date after :date.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(77, 0, 'en', 'validation', 'alpha', 'The :attribute may only contain letters.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(78, 0, 'en', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(79, 0, 'en', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(80, 0, 'en', 'validation', 'array', 'The :attribute must be an array.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(81, 0, 'en', 'validation', 'before', 'The :attribute must be a date before :date.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(82, 0, 'en', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(83, 0, 'en', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(84, 0, 'en', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(85, 0, 'en', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(86, 0, 'en', 'validation', 'boolean', 'The :attribute field must be true or false.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(87, 0, 'en', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(88, 0, 'en', 'validation', 'date', 'The :attribute is not a valid date.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(89, 0, 'en', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(90, 0, 'en', 'validation', 'different', 'The :attribute and :other must be different.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(91, 0, 'en', 'validation', 'digits', 'The :attribute must be :digits digits.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(92, 0, 'en', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(93, 0, 'en', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(94, 0, 'en', 'validation', 'email', 'The :attribute must be a valid email address.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(95, 0, 'en', 'validation', 'exists', 'The selected :attribute is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(96, 0, 'en', 'validation', 'filled', 'The :attribute field is required.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(97, 0, 'en', 'validation', 'image', 'The :attribute must be an image.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(98, 0, 'en', 'validation', 'in', 'The selected :attribute is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(99, 0, 'en', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(100, 0, 'en', 'validation', 'integer', 'The :attribute must be an integer.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(101, 0, 'en', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(102, 0, 'en', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(103, 0, 'en', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(104, 0, 'en', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(105, 0, 'en', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(106, 0, 'en', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(107, 0, 'en', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(108, 0, 'en', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(109, 0, 'en', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(110, 0, 'en', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(111, 0, 'en', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(112, 0, 'en', 'validation', 'not_in', 'The selected :attribute is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(113, 0, 'en', 'validation', 'numeric', 'The :attribute must be a number.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(114, 0, 'en', 'validation', 'present', 'The :attribute field must be present.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(115, 0, 'en', 'validation', 'regex', 'The :attribute format is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(116, 0, 'en', 'validation', 'required', 'The :attribute field is required.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(117, 0, 'en', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(118, 0, 'en', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(119, 0, 'en', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(120, 0, 'en', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(121, 0, 'en', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(122, 0, 'en', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(123, 0, 'en', 'validation', 'same', 'The :attribute and :other must match.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(124, 0, 'en', 'validation', 'size.numeric', 'The :attribute must be :size.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(125, 0, 'en', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(126, 0, 'en', 'validation', 'size.string', 'The :attribute must be :size characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(127, 0, 'en', 'validation', 'size.array', 'The :attribute must contain :size items.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(128, 0, 'en', 'validation', 'string', 'The :attribute must be a string.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(129, 0, 'en', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(130, 0, 'en', 'validation', 'unique', 'The :attribute has already been taken.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(131, 0, 'en', 'validation', 'url', 'The :attribute format is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(132, 0, 'en', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(133, 0, 'en', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(134, 0, 'en', 'passwords', 'reset', 'Your password has been reset!', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(135, 0, 'en', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(136, 0, 'en', 'passwords', 'token', 'This password reset token is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(137, 0, 'en', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(138, 0, 'en', 'pagination', 'previous', '&laquo; Previous', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(139, 0, 'en', 'pagination', 'next', 'Next &raquo;', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(140, 0, 'es', 'questions', 'Treats you with respect', 'Me trata respetuosamente', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(141, 0, 'es', 'questions', 'Listens to your needs', 'Atiende a mis necesidades', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(142, 0, 'es', 'questions', 'Clearly explains your care and/or treatment plan', 'Explica mi plan de cuidado y/o tratamiento con claridad', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(143, 0, 'es', 'questions', 'Makes you feel comfortable when discussing sensitive topics', 'Me hace sentir cómodo al discutir temas sensibles', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(144, 0, 'es', 'questions', 'Provides you with compassionate care', 'Me trata con compasión', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(145, 0, 'es', 'questions', 'Compassionate and Respectful', 'Compassionate and Respectful', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(146, 0, 'es', 'questions', 'Explains treatment plan', 'Explains treatment plan', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(147, 0, 'es', 'questions', 'Knowledgeable -Listens to you and answers your questions', 'Knowledgeable -Listens to you and answers your questions', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(148, 0, 'es', 'questions', 'Quality of care provided', 'Quality of care provided', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(149, 0, 'es', 'questions', 'Takes the time to provide the care needed', 'Takes the time to provide the care needed', '2017-02-06 15:10:39', '2017-02-14 15:58:50'),
(150, 0, 'es', 'auth', 'failed', 'These credentials do not match our records.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(151, 0, 'es', 'auth', 'throttle', 'Too many login attempts. Please try again in :seconds seconds.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(152, 0, 'es', 'survey', 'evaluate_your_caregiver', 'Encueste a su cuidador', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(153, 0, 'es', 'survey', 'patient_satisfaction_survey', 'Evalúe su experiencia', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(154, 0, 'es', 'survey', 'patient', 'Patient', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(155, 0, 'es', 'survey', 'other', 'Other', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(156, 0, 'es', 'survey', 'i_am_the', 'I am the', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(157, 0, 'es', 'survey', 'family_member', 'Miembro de la familia', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(158, 0, 'es', 'survey', 'dont_know_login_info', 'I don\'t know my login info', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(159, 0, 'es', 'survey', 'username', 'Nombre de usuario', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(160, 0, 'es', 'survey', 'password', 'Contrasena', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(161, 0, 'es', 'survey', 'all_caregivers', 'TODOS LOS CUIDADORES', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(162, 0, 'es', 'survey', 'begin_survey', 'Comenzará Encuesta', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(163, 0, 'es', 'survey', 'good', 'Bueno', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(164, 0, 'es', 'survey', 'are_you_sure', 'Está seguro que desea completar una encuesta sobre', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(165, 0, 'es', 'survey', 'cancel', 'Cancelar', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(166, 0, 'es', 'survey', 'poor', 'Deficiente', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(167, 0, 'es', 'survey', 'fair', 'Malo', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(168, 0, 'es', 'survey', 'ok', 'Regular', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(169, 0, 'es', 'survey', 'great', 'Excelente', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(170, 0, 'es', 'survey', 'search_by_caregiver\'s_name', 'Buscar por Nombre del Cuidador', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(171, 0, 'es', 'survey', 'nurses', 'ENFERMERAS', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(172, 0, 'es', 'survey', 'respiratories', 'RESPIRATORIO', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(173, 0, 'es', 'survey', 'rehab', 'REHABILITACION', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(174, 0, 'es', 'survey', 'home', 'Inicio', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(175, 0, 'es', 'survey', 'thanks', 'Gracias', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(176, 0, 'es', 'survey', 'login', 'INICIAR SESION', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(177, 0, 'es', 'survey', 'Please_Enter_Your_Login_Details', 'Please Enter Your Login Details', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(178, 0, 'es', 'survey', 'Please_Enter_Your_Contact_Details', 'Please Enter Your Contact Details', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(179, 0, 'es', 'survey', 'SUBMIT', 'SUBMIT', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(180, 0, 'es', 'survey', 'Or_go_to_login_section', 'Or go to login section', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(181, 0, 'es', 'survey', 'i_accept_the', 'I accept the', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(182, 0, 'es', 'survey', 'term_condition', 'Term and Conditions', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(183, 0, 'es', 'survey', 'term_condition_title', 'Term and Conditions', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(184, 0, 'es', 'survey', 'feedbacks', 'Your feedback will give us insight on what we can do to ensure you receive the highest quality of care. ', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(185, 0, 'es', 'survey', 'Oops', 'Oops, you forgot one step!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(186, 0, 'es', 'survey', 'Opps_Description', 'Please check the box to Agree the Terms and Conditions in order to login. Also remember this survey is anonymous and will be a secret between us!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(187, 0, 'es', 'survey', 'gohome', 'Please return to home and fill out the patient satisfaction survey or evaluate another caregiver. ', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(188, 0, 'es', 'survey', 'Or', 'Or', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(189, 0, 'es', 'survey', 'check_box_contact', 'I would like to be contacted about my patient experience.', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(190, 0, 'es', 'survey', 'comment_placeholder', 'Just a reminder that everything you share with Wambi remains anonymous.', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(191, 0, 'es', 'survey', 'title_experience', 'Please include any additional comments here about your experience!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(192, 0, 'es', 'survey', 'title_caregiver', 'Please include any additional comments here about your caregiver!', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(193, 0, 'es', 'survey', 'error_max_survey', 'You have surveyed this caregiver the maximum amount of times within 24 hours. Please select another caregiver or return home to take the patient satisfaction survey.', '2017-02-06 15:10:39', '2017-02-08 15:01:01'),
(194, 0, 'es', 'exit_questions', 'Physicians', 'Médicos', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(195, 0, 'es', 'exit_questions', 'Listens_to_you_answers_questions', 'Escucha y responde a las preguntas', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(196, 0, 'es', 'exit_questions', 'Takes_enough_time_with_you', 'Toma bastante tiempo contigo', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(197, 0, 'es', 'exit_questions', 'Explains_what_you_want_to_know', 'Explica lo que quieres saber', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(198, 0, 'es', 'exit_questions', 'Provides_good_advice_and_treatment', 'Proporciona buenos consejos y tratamiento', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(281, 0, 'en', 'exit_questions', 'Other Therapy Staff', 'Other Therapy Staff', '2017-02-11 00:44:14', '2017-02-14 15:58:43'),
(200, 0, 'es', 'exit_questions', 'Provides_good_nursing_care', 'Proporciona un buen cuidado de enfermería', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(201, 0, 'es', 'exit_questions', 'Has_a_caring_attitude', 'Tiene una actitud de cuidado', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(285, 0, 'en', 'questions', 'Provides quality care', 'Provides quality care', '2017-02-14 15:58:36', '2017-02-14 15:58:50'),
(203, 0, 'es', 'exit_questions', 'Friendly_and_helpful_to_you', 'Amable y servicial con usted', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(204, 0, 'es', 'exit_questions', 'Answers_your_questions', 'Responde a tus preguntas', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(205, 0, 'es', 'exit_questions', 'Explains_Treatment_Plan', 'Explica el plan de tratamiento', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(284, 0, 'es', 'exit_questions', 'Facility', 'Facility', '2017-02-11 00:45:24', '2017-02-14 15:58:43'),
(207, 0, 'es', 'exit_questions', 'Neat_and_clean_building', 'Edificio limpio y ordenado', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(208, 0, 'es', 'exit_questions', 'Unit_easily_accessible', 'Unidad de fácil acceso', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(209, 0, 'es', 'exit_questions', 'Comfort_and_Safety', 'Comodidad y seguridad', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(210, 0, 'es', 'exit_questions', 'Privacy', 'Política de privacidad', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(211, 0, 'es', 'exit_questions', 'Likelihood_of_referring_others', 'Probabilidad de hacer referencia a otros', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(212, 0, 'es', 'exit_questions', 'hospital_mission_statement', '\"Hospital mission statement\"', '2017-02-06 15:10:39', '2017-02-14 15:58:43'),
(213, 0, 'es', 'validation', 'accepted', 'The :attribute must be accepted.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(214, 0, 'es', 'validation', 'active_url', 'The :attribute is not a valid URL.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(215, 0, 'es', 'validation', 'after', 'The :attribute must be a date after :date.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(216, 0, 'es', 'validation', 'alpha', 'The :attribute may only contain letters.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(217, 0, 'es', 'validation', 'alpha_dash', 'The :attribute may only contain letters, numbers, and dashes.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(218, 0, 'es', 'validation', 'alpha_num', 'The :attribute may only contain letters and numbers.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(219, 0, 'es', 'validation', 'array', 'The :attribute must be an array.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(220, 0, 'es', 'validation', 'before', 'The :attribute must be a date before :date.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(221, 0, 'es', 'validation', 'between.numeric', 'The :attribute must be between :min and :max.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(222, 0, 'es', 'validation', 'between.file', 'The :attribute must be between :min and :max kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(223, 0, 'es', 'validation', 'between.string', 'The :attribute must be between :min and :max characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(224, 0, 'es', 'validation', 'between.array', 'The :attribute must have between :min and :max items.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(225, 0, 'es', 'validation', 'boolean', 'The :attribute field must be true or false.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(226, 0, 'es', 'validation', 'confirmed', 'The :attribute confirmation does not match.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(227, 0, 'es', 'validation', 'date', 'The :attribute is not a valid date.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(228, 0, 'es', 'validation', 'date_format', 'The :attribute does not match the format :format.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(229, 0, 'es', 'validation', 'different', 'The :attribute and :other must be different.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(230, 0, 'es', 'validation', 'digits', 'The :attribute must be :digits digits.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(231, 0, 'es', 'validation', 'digits_between', 'The :attribute must be between :min and :max digits.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(232, 0, 'es', 'validation', 'distinct', 'The :attribute field has a duplicate value.', '2017-02-06 15:10:39', '2017-02-08 15:00:48'),
(233, 0, 'es', 'validation', 'email', 'The :attribute must be a valid email address.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(234, 0, 'es', 'validation', 'exists', 'The selected :attribute is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(235, 0, 'es', 'validation', 'filled', 'The :attribute field is required.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(236, 0, 'es', 'validation', 'image', 'The :attribute must be an image.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(237, 0, 'es', 'validation', 'in', 'The selected :attribute is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(238, 0, 'es', 'validation', 'in_array', 'The :attribute field does not exist in :other.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(239, 0, 'es', 'validation', 'integer', 'The :attribute must be an integer.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(240, 0, 'es', 'validation', 'ip', 'The :attribute must be a valid IP address.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(241, 0, 'es', 'validation', 'json', 'The :attribute must be a valid JSON string.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(242, 0, 'es', 'validation', 'max.numeric', 'The :attribute may not be greater than :max.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(243, 0, 'es', 'validation', 'max.file', 'The :attribute may not be greater than :max kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(244, 0, 'es', 'validation', 'max.string', 'The :attribute may not be greater than :max characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(245, 0, 'es', 'validation', 'max.array', 'The :attribute may not have more than :max items.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(246, 0, 'es', 'validation', 'mimes', 'The :attribute must be a file of type: :values.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(247, 0, 'es', 'validation', 'min.numeric', 'The :attribute must be at least :min.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(248, 0, 'es', 'validation', 'min.file', 'The :attribute must be at least :min kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(249, 0, 'es', 'validation', 'min.string', 'The :attribute must be at least :min characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(250, 0, 'es', 'validation', 'min.array', 'The :attribute must have at least :min items.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(251, 0, 'es', 'validation', 'not_in', 'The selected :attribute is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(252, 0, 'es', 'validation', 'numeric', 'The :attribute must be a number.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(253, 0, 'es', 'validation', 'present', 'The :attribute field must be present.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(254, 0, 'es', 'validation', 'regex', 'The :attribute format is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(255, 0, 'es', 'validation', 'required', 'The :attribute field is required.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(256, 0, 'es', 'validation', 'required_if', 'The :attribute field is required when :other is :value.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(257, 0, 'es', 'validation', 'required_unless', 'The :attribute field is required unless :other is in :values.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(258, 0, 'es', 'validation', 'required_with', 'The :attribute field is required when :values is present.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(259, 0, 'es', 'validation', 'required_with_all', 'The :attribute field is required when :values is present.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(260, 0, 'es', 'validation', 'required_without', 'The :attribute field is required when :values is not present.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(261, 0, 'es', 'validation', 'required_without_all', 'The :attribute field is required when none of :values are present.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(262, 0, 'es', 'validation', 'same', 'The :attribute and :other must match.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(263, 0, 'es', 'validation', 'size.numeric', 'The :attribute must be :size.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(264, 0, 'es', 'validation', 'size.file', 'The :attribute must be :size kilobytes.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(265, 0, 'es', 'validation', 'size.string', 'The :attribute must be :size characters.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(266, 0, 'es', 'validation', 'size.array', 'The :attribute must contain :size items.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(267, 0, 'es', 'validation', 'string', 'The :attribute must be a string.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(268, 0, 'es', 'validation', 'timezone', 'The :attribute must be a valid zone.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(269, 0, 'es', 'validation', 'unique', 'The :attribute has already been taken.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(270, 0, 'es', 'validation', 'url', 'The :attribute format is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(271, 0, 'es', 'validation', 'custom.attribute-name.rule-name', 'custom-message', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(272, 0, 'es', 'passwords', 'password', 'Passwords must be at least six characters and match the confirmation.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(273, 0, 'es', 'passwords', 'reset', 'Your password has been reset!', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(274, 0, 'es', 'passwords', 'sent', 'We have e-mailed your password reset link!', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(275, 0, 'es', 'passwords', 'token', 'This password reset token is invalid.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(276, 0, 'es', 'passwords', 'user', 'We can\'t find a user with that e-mail address.', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(277, 0, 'es', 'pagination', 'previous', '&laquo; Previous', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(278, 0, 'es', 'pagination', 'next', 'Next &raquo;', '2017-02-06 15:10:39', '2017-02-08 15:00:49'),
(279, 0, 'en', 'exit_questions', 'Nursing Staff', 'Nursing Staff', '2017-02-11 00:43:36', '2017-02-14 15:58:43'),
(280, 0, 'es', 'exit_questions', 'Nursing Staff', 'Personal de enfermería', '2017-02-11 00:43:45', '2017-02-14 15:58:43'),
(283, 0, 'en', 'exit_questions', 'Facility', 'Facility', '2017-02-11 00:44:46', '2017-02-14 15:58:43'),
(288, 0, 'en', 'exit_questions', 'Facility_Unit', 'Facility', '2017-02-14 15:58:36', '2017-02-14 15:58:43'),
(289, 0, 'en', 'exit_questions', 'Takes time to discuss your medication, diet and first physician appointment after discharge', 'Takes time to discuss your medication, diet and first physician appointment after discharge', '2017-02-14 15:58:36', '2017-02-14 15:58:43'),
(290, 0, 'es', 'questions', 'Provides quality care', 'Provides quality care', '2017-02-14 15:58:36', '2017-02-14 15:58:50'),
(291, 0, 'es', 'exit_questions', 'Nursing_Staff', 'Personal de enfermería', '2017-02-14 15:58:36', '2017-02-14 15:58:43'),
(292, 0, 'es', 'exit_questions', 'Other_Therapy_Staff', 'Otro Personal de Terapia', '2017-02-14 15:58:36', '2017-02-14 15:58:43'),
(293, 0, 'es', 'exit_questions', 'Facility_Unit', 'Facility', '2017-02-14 15:58:36', '2017-02-14 15:58:43'),
(294, 0, 'es', 'exit_questions', 'Takes time to discuss your medication, diet and first physician appointment after discharge', 'Takes time to discuss your medication, diet and first physician appointment after discharge', '2017-02-14 15:58:36', '2017-02-14 15:58:43');

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
(1, '<p>Hi All,</p><p>Next week on March 29th and again on March 31st Beth Ann Bor, Regional Manager of  Broward Health\'s patient experience team,  will be bringing a mandatory skills lab to SCU employees here on 7 east. She will be arriving on the unit at 6:30 am in order to catch both day and night shift employees.  You will be introduced to AIDET and other key components to ensure we are providing the best possible experience for our patients and their families.  Thank you in advance for your participation.</p><p><br></p><p>Cornelis deVroedt RN</p><p>Nurse Manager SCU</p>', '2017-03-21 19:29:51', 'Skills Lab', 'Screen Shot 2017-04-24 at 4.33.08 PM.png', NULL, '2017-04-24 20:33:25', '[\"2\"]');

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
(1, 2, 19, 'test', '2017-03-29 06:05:49', '2017-03-29 06:05:49');

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
(1, 2, '10112014', '', '0000-00-00', '2017-01-14', NULL, '', 3967, 9569, 'tanphuqncrm@gmail.com', '9545527533', 1, '7659', '2017-02-14 11:00:29', '@mymetropcs.com'),
(4, 2, '567686', '', '0000-00-00', '2017-01-17', NULL, '', 3036, 6496, '', '9176863415', 0, NULL, NULL, '@vtext.com'),
(7, 2, '981509', '', '0000-00-00', '2017-01-16', NULL, '', 3145, 4639, '', '9547981500', 0, NULL, NULL, '@txt.att.net'),
(8, 2, '270136311', '', '0000-00-00', '2017-01-24', NULL, '', 1528, 6362, 'geasha75@aol.com', '954-821-9037', 24, '6180', '2017-02-22 10:59:49', '@txt.att.net'),
(9, 2, '270146287', '', '0000-00-00', '2017-01-27', NULL, '', 2006, 9657, 'Jzac513@gmail.com', '9543045817', 11, '1682', '2017-02-22 10:59:57', '@txt.att.net'),
(10, 2, '270136141', '', '0000-00-00', '2017-01-24', NULL, '', 8993, 3210, 'Suzie1003@att.net', '3057763712', 24, '0949', '2017-02-22 10:59:40', '@txt.att.net'),
(11, 2, '270160859', '', '0000-00-00', '2017-02-01', NULL, '', 6914, 2379, 'Kristentru@gmail.com', '9544781287', 24, '4061', '2017-02-22 11:00:05', '@tmomail.net'),
(12, 2, '270446841', '', '0000-00-00', '2017-02-13', NULL, '', 6355, 5560, 'bdcct803@yahoo.com', '9547527434', 24, '8875', '2017-04-05 14:56:08', '@txt.att.net'),
(13, 2, '270447023', '', '0000-00-00', '2017-02-13', NULL, '', 6078, 7614, 'alwaysintouch@bellsouth.net', '9544787111', 24, '3840', '2017-02-22 11:00:14', '@tmomail.net'),
(14, 2, '270468527', '', '0000-00-00', '2017-02-20', NULL, '', 2133, 1639, 'bolitu@hotmail.com', '954-260-7062', 24, '2977', '2017-02-22 11:00:19', '@txt.att.net'),
(15, 2, '270470998', '', '0000-00-00', '2017-02-21', NULL, '', 3593, 2092, 'ajbernal814@icloud.com', '786-897-6434', 24, '6224', '2017-02-23 14:32:17', '@messaging.sprintpcs.com'),
(16, 2, '270552196', '', '0000-00-00', '2017-02-24', NULL, '', 1836, 7446, 'a.lacertosa@gmail.com', '561-866-0152', 24, '5999', '2017-03-15 12:52:49', '@txt.att.net'),
(17, 2, '270598951', '', '0000-00-00', '2017-03-11', NULL, '', 7636, 4798, 'kuldeep.hajela@gmail.com', '9543032863', 11, '9232', '2017-04-06 18:13:45', '@txt.att.net'),
(18, 2, '270593828', '', '0000-00-00', '2017-03-09', NULL, '', 2033, 3741, 'khama2411@yahoo.com', '954-297-0589', 11, '3596', '2017-03-15 14:30:37', '@mymetropcs.com'),
(19, 2, '270576036', '', '0000-00-00', '2017-03-04', NULL, '', 4554, 6512, 'abaworks1@gmail.com', '703-966-7899', 7, '5577', '2017-03-15 12:52:44', '@vtext.com'),
(20, 2, '2705752000', '', '0000-00-00', '2017-03-04', NULL, '', 6366, 6835, 'u_rifia@icloud.com', '4072358612', 2, '5932', '2017-03-15 12:58:01', '@messaging.sprintpcs.com'),
(21, 2, '12345', '', '0000-00-00', '2017-03-27', NULL, '', 1103, 8527, '', '7862021799', 0, '1274', '2017-03-23 14:05:09', '@vtext.com'),
(22, 2, '270657958', '', '0000-00-00', '2017-03-20', NULL, '', 6487, 2346, 'edhbigdog02@gmail.com', '2087511963', 7, '1234', '2017-03-23 16:23:18', '@messaging.sprintpcs.com'),
(23, 2, '270472109', '', '0000-00-00', '2017-02-21', NULL, '', 3009, 1865, 'aaapoet@gmail.com', '9542746236', 7, '7328', '2017-03-28 16:19:01', '@mymetropcs.com'),
(24, 2, '270684122', '', '0000-00-00', '2017-03-28', NULL, '', 9148, 3870, 'UNIIMPWM@aol.com', '9548578004', 24, '0203', '2017-03-29 12:22:29', '@txt.att.net'),
(25, 2, '05111994', '', '0000-00-00', '2017-04-04', NULL, '', 2168, 4589, 'alex@wambi.org', '3054945599', 2, '3054', '2017-04-20 10:34:55', '@vtext.com'),
(26, 2, '270435998', '', '0000-00-00', '2017-02-09', NULL, '', 5637, 9423, '', '7547795849', 24, '8468', '2017-04-23 17:36:32', '@mymetropcs.com'),
(27, 2, '270992021', '', '0000-00-00', '2017-04-21', NULL, '', 2855, 5339, 'Costello9672@Bellsouth.net', '9544784638', 24, '9573', '2017-04-24 16:18:36', '@tmomail.net');

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

--
-- Dumping data for table `patient_family`
--

INSERT INTO `patient_family` (`id`, `pid`, `fullname`, `numberphone`, `carrier`, `code`, `date`) VALUES
(2, 24, 'Son', '2676143058', '@vtext.com', NULL, NULL);

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
(1, 1, 'Treats you with respect', 'info', 1, 1),
(2, 2, 'Listens to your needs', 'pink', 1, 1),
(3, 3, 'Clearly explains your care and/or treatment plan', 'primary', 1, 1),
(4, 4, 'Makes you feel comfortable when discussing sensitive topics', 'success', 1, 1),
(5, 5, 'Provides you with compassionate care', 'warning', 1, 1),
(6, 1, 'Treats you with respect', 'info', 2, 1),
(7, 2, 'Listens to your needs', 'pink', 2, 1),
(8, 3, 'Clearly explains your care and/or treatment plan', 'primary', 2, 1),
(9, 4, 'Makes you feel comfortable when discussing sensitive topics', 'success', 2, 1),
(10, 5, 'Provides you with compassionate care', 'warning', 2, 1),
(11, 1, 'Knowledgeable -Listens to you and answers your questions', 'info', 3, 1),
(12, 2, 'Quality of care provided', 'pink', 3, 1),
(13, 3, 'Takes the time to provide the care needed', 'primary', 3, 1),
(14, 4, 'Compassionate and Respectful', 'success', 3, 1),
(15, 5, 'Explains treatment plan', 'warning', 3, 1),
(16, 0, 'test', NULL, 1, 0),
(17, 0, 'test', NULL, 2, 0),
(18, 0, 'test', NULL, 3, 0);

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
(1, NULL, NULL, 1800, '1_am-ex-giftcard.jpg', NULL, '2017-01-11 12:01:03'),
(2, NULL, NULL, 2400, '2_visa-gift-card.gif', NULL, '2017-01-11 12:01:22'),
(3, NULL, NULL, 4000, '3_200-gift-card.jpg', NULL, '2017-01-11 12:01:37');

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
(2, '2', '1', '1', '2017-03-15', '1', '1', 'first come first serve', NULL, NULL, 354, '2017-03-13 15:44:52', NULL),
(4, '2', '1', '1', '2017-03-13', '2', '2', 'please call the unit to schedule too!', NULL, NULL, 354, '2017-03-13 15:47:35', NULL),
(5, '2', '1', '1', '2017-03-14', '2', '1', '', NULL, NULL, 354, '2017-03-13 15:49:53', NULL);

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
(1, 1, 342, 2, 2, 19, 'patient', 4, '2017-02-11 00:41:39', '2017-04-08 23:23:11', '76', 3, 4, 4, 3, 5, 0, 0, 0, 0, 0, 5, '5928'),
(2, 18, 379, 1, 2, 25, 'patient', 5, '2017-03-15 18:34:22', '2017-03-15 18:34:23', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(3, 18, 355, 2, 2, 25, 'patient', 5, '2017-03-15 18:35:02', '2017-03-15 18:35:02', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(4, 18, 370, 1, 2, 25, 'patient', 5, '2017-03-15 18:36:06', '2017-03-15 18:36:07', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(5, 18, 386, 1, 2, 25, 'patient', 5, '2017-03-15 18:36:52', '2017-03-15 18:36:52', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(6, 18, 386, 1, 2, 30, 'patient', 5, '2017-03-15 18:36:53', '2017-03-15 18:36:53', '100', 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 6, NULL),
(7, 18, 344, 1, 2, 25, 'patient', 5, '2017-03-15 18:37:15', '2017-03-15 18:37:16', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, NULL),
(8, 18, 344, 1, 2, 30, 'patient', 5, '2017-03-15 18:37:16', '2017-03-15 18:37:17', '100', 5, 5, 5, 5, 5, 5, 0, 0, 0, 0, 6, NULL),
(9, 25, 342, 2, 2, 25, 'patient', 5, '2017-04-05 18:45:01', '2017-04-05 18:45:01', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '8202'),
(10, 25, 343, 1, 2, 25, 'patient', 5, '2017-04-05 18:49:37', '2017-04-05 18:49:37', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '8202'),
(11, 25, 344, 1, 2, 25, 'patient', 5, '2017-04-05 18:59:29', '2017-04-05 18:59:29', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(12, 25, 345, 1, 2, 25, 'patient', 5, '2017-04-05 19:00:39', '2017-04-05 19:00:39', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(13, 25, 347, 1, 2, 25, 'patient', 5, '2017-04-05 19:11:23', '2017-04-05 19:11:23', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(14, 25, 349, 1, 2, 25, 'patient', 5, '2017-04-05 19:12:30', '2017-04-05 19:12:31', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(15, 25, 351, 1, 2, 25, 'patient', 5, '2017-04-05 19:13:47', '2017-04-05 19:13:47', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(16, 25, 357, 1, 2, 25, 'patient', 5, '2017-04-05 19:15:18', '2017-04-05 19:15:18', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(17, 25, 361, 1, 2, 25, 'patient', 5, '2017-04-05 19:16:32', '2017-04-05 19:16:32', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(18, 25, 364, 1, 2, 25, 'patient', 5, '2017-04-05 19:18:14', '2017-04-05 19:18:14', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(19, 25, 365, 1, 2, 25, 'patient', 5, '2017-04-05 19:19:23', '2017-04-05 19:19:23', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(20, 25, 370, 1, 2, 25, 'patient', 5, '2017-04-05 19:20:34', '2017-04-05 19:20:34', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(21, 25, 372, 3, 2, 25, 'patient', 5, '2017-04-05 19:21:31', '2017-04-05 19:21:31', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(22, 25, 374, 3, 2, 25, 'patient', 5, '2017-04-05 19:22:25', '2017-04-05 19:22:25', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(23, 25, 378, 2, 2, 25, 'patient', 5, '2017-04-05 19:23:48', '2017-04-05 19:23:48', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(24, 25, 379, 1, 2, 25, 'patient', 5, '2017-04-05 19:24:53', '2017-04-05 19:24:53', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(25, 25, 380, 2, 2, 25, 'patient', 5, '2017-04-05 19:26:32', '2017-04-05 19:26:32', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(26, 25, 385, 2, 2, 25, 'patient', 5, '2017-04-05 19:27:31', '2017-04-05 19:27:31', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '3041'),
(27, 25, 355, 2, 2, 25, 'patient', 5, '2017-04-06 21:11:18', '2017-04-06 21:11:18', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '6583'),
(28, 25, 386, 1, 2, 25, 'patient', 5, '2017-04-06 21:13:13', '2017-04-06 21:13:14', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '6583'),
(29, 26, 366, 1, 2, 5, 'patient', 1, '2017-04-06 21:52:24', '2017-04-06 21:52:24', '20', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 5, '4857'),
(30, 26, 342, 2, 2, 20, 'patient', 4, '2017-04-06 21:54:33', '2017-04-06 21:54:33', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '4857'),
(31, 26, 355, 2, 2, 20, 'patient', 4, '2017-04-06 21:55:22', '2017-04-06 21:55:22', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '4857'),
(32, 26, 378, 2, 2, 25, 'patient', 5, '2017-04-06 21:56:10', '2017-04-06 21:56:11', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '4857'),
(33, 26, 379, 1, 2, 20, 'patient', 4, '2017-04-06 21:56:57', '2017-04-06 21:56:57', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '4857'),
(34, 26, 349, 1, 2, 7, 'patient', 1, '2017-04-06 21:57:38', '2017-04-06 21:57:38', '28', 2, 1, 1, 2, 1, 0, 0, 0, 0, 0, 5, '4857'),
(35, 26, 347, 1, 2, 25, 'patient', 5, '2017-04-06 21:58:13', '2017-04-06 21:58:13', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '4857'),
(36, 26, 386, 1, 2, 14, 'patient', 3, '2017-04-06 22:00:22', '2017-04-06 22:00:22', '56', 3, 3, 3, 2, 3, 0, 0, 0, 0, 0, 5, '4857'),
(37, 26, 343, 1, 2, 19, 'patient', 4, '2017-04-06 22:03:07', '2017-04-06 22:03:07', '76', 4, 4, 4, 4, 3, 0, 0, 0, 0, 0, 5, '4857'),
(38, 26, 382, 1, 2, 20, 'patient', 4, '2017-04-06 22:04:22', '2017-04-06 22:04:22', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '4857'),
(39, 26, 365, 1, 2, 5, 'patient', 1, '2017-04-06 22:07:33', '2017-04-06 22:07:33', '20', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 5, '3187'),
(40, 26, 344, 1, 2, 20, 'patient', 4, '2017-04-06 22:08:12', '2017-04-06 22:08:12', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '3187'),
(41, 17, 365, 1, 2, 25, 'patient', 5, '2017-04-06 22:19:50', '2017-04-06 22:19:51', '100', 5, 5, 5, 5, 5, 0, 0, 0, 0, 0, 5, '9232'),
(42, 17, 342, 2, 2, 22, 'patient', 4, '2017-04-06 22:24:21', '2017-04-06 22:24:22', '88', 4, 5, 4, 4, 5, 0, 0, 0, 0, 0, 5, '9232'),
(43, 17, 343, 1, 2, 20, 'patient', 4, '2017-04-06 22:27:04', '2017-04-06 22:27:04', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '9232'),
(44, 17, 366, 1, 2, 20, 'patient', 4, '2017-04-06 22:28:10', '2017-04-06 22:28:10', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '9232'),
(45, 17, 350, 3, 2, 20, 'patient', 4, '2017-04-06 22:28:45', '2017-04-06 22:28:45', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '9232'),
(46, 17, 370, 1, 2, 18, 'patient', 4, '2017-04-06 22:41:18', '2017-04-06 22:41:18', '72', 4, 3, 3, 4, 4, 0, 0, 0, 0, 0, 5, '9232'),
(47, 26, 350, 3, 2, 20, 'patient', 4, '2017-04-23 21:41:16', '2017-04-23 21:41:16', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '8468'),
(48, 26, 357, 1, 2, 5, 'patient', 1, '2017-04-23 21:42:01', '2017-04-23 21:42:02', '20', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 5, '8468'),
(49, 26, 361, 1, 2, 5, 'patient', 1, '2017-04-23 21:42:39', '2017-04-23 21:42:40', '20', 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 5, '8468'),
(50, 26, 386, 1, 2, 20, 'patient', 4, '2017-04-23 21:43:50', '2017-04-23 21:43:50', '80', 4, 4, 4, 4, 4, 0, 0, 0, 0, 0, 5, '8468'),
(51, 26, 344, 1, 2, 13, 'patient', 3, '2017-04-23 21:45:37', '2017-04-23 21:45:37', '52', 3, 3, 2, 2, 3, 0, 0, 0, 0, 0, 5, '8468');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;
--
-- AUTO_INCREMENT for table `awards`
--
ALTER TABLE `awards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `award_type`
--
ALTER TABLE `award_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `carriers`
--
ALTER TABLE `carriers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;
--
-- AUTO_INCREMENT for table `code_master`
--
ALTER TABLE `code_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;
--
-- AUTO_INCREMENT for table `coinmanager`
--
ALTER TABLE `coinmanager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `config_peck`
--
ALTER TABLE `config_peck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employee_master`
--
ALTER TABLE `employee_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=394;
--
-- AUTO_INCREMENT for table `employee_notification`
--
ALTER TABLE `employee_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;
--
-- AUTO_INCREMENT for table `employee_shift`
--
ALTER TABLE `employee_shift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exitsurvey`
--
ALTER TABLE `exitsurvey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `exit_question`
--
ALTER TABLE `exit_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pid as Primary Key', AUTO_INCREMENT=28;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `shift_master`
--
ALTER TABLE `shift_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `startsurvey`
--
ALTER TABLE `startsurvey`
  MODIFY `incid` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
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
