-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 16, 2017 at 06:58 AM
-- Server version: 5.6.37
-- PHP Version: 5.6.30

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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
-- Table structure for table `employee_type`
--

DROP TABLE IF EXISTS `employee_type`;
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
(1, 'scheduling-manager', 'Scheduling Manager', 'upload/nursh.png', '[\"dashboard\"]', 0, 2),
(2, 'employee', 'Employee', 'upload/ffff.png', '[\"dashboard\"]', 0, 1),
(3, 'admin', 'Admin', '', '[\"dashboard\",\"newfeed\",\"coin\",\"addcoin\",\"list_approve_request\"]', 0, 5),
(4, 'super-admin', 'Super Admin', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]', 0, 6),
(5, 'patient-manager', 'Patient Manager', '', '[\"dashboard\",\"patient\"]', 0, 3),
(6, 'employee-manager', 'Employee Manager', '', '', 0, 4),
(7, 'super-executive', 'Super Executive User', '', '[\"dashboard\",\"employee_report\",\"patient\",\"employee\",\"newfeed\",\"survey\",\"coin\",\"addcoin\",\"redeem_coin\",\"list_approve_request\",\"shift\"]', 1, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `etid` (`id`) USING BTREE,
  ADD KEY `etid_2` (`id`) USING BTREE;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
