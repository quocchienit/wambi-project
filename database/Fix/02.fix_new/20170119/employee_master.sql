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
-- Table structure for table `employee_master`
--

CREATE TABLE IF NOT EXISTS `employee_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etid` int(11) NOT NULL,
  `clockid` int(250) NOT NULL,
  `units` varchar(1000) DEFAULT NULL,
  `catid` int(11) DEFAULT NULL,
  `disciplines` text NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `dob` date NOT NULL,
  `lastlogin` date NOT NULL,
  `hiredate` date NOT NULL,
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
  `upload_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etid` (`etid`,`units`(767)) USING BTREE,
  KEY `etid_2` (`etid`,`units`(767)) USING BTREE,
  KEY `etid_3` (`etid`,`units`(767)) USING BTREE,
  KEY `lid` (`units`(767)) USING BTREE,
  KEY `catid` (`catid`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=390 ;

--
-- Dumping data for table `employee_master`
--

INSERT INTO `employee_master` (`id`, `etid`, `clockid`, `units`, `catid`, `disciplines`, `firstname`, `lastname`, `dob`, `lastlogin`, `hiredate`, `address`, `shifts`, `email`, `mobile`, `image`, `password`, `employeeid`, `job`, `carrier`, `job_description`, `remember_token`, `pecks`, `image_new`, `status`, `upload_date`) VALUES
(19, 4, 4444, '["1","2","3"]', 1, '["1","2","3"]', 'Wambi', 'Superadmin', '2016-12-09', '2016-03-11', '2016-12-24', '96I6 - PLANTATION', '["3"]', 'tanphuqncrm@gmail.com', '9545527533', '4444_Wambibirdonly.png', '$2y$10$aabnTQhEGqDptc7N6cJOGewatM1ycgD0pHLFNHvQiWa0Lfgp2lctW', 4444, 1, '@mymetropcs.com', NULL, 'k3R9eWVC9gyZ9quc4Hn8OsUsuaFXrMyCD0RtIgTgVkHnRxz75Zm7OVWMKzj2', 0, NULL, 0, NULL),
(20, 3, 1771, '["2"]', 1, '["2"]', 'Wambi', 'Employee ', '2016-12-09', '2016-03-11', '2016-12-09', 'fdas', '["5"]', 'davidjonesmail@gmail.com', '9545527533', '1771_Wambibirdonly.png', '$2y$10$muGZAV4OSGBcW5jCYAr96OIaPqR8StAGdCbT7rtIZZkUna4j2dNeC', 1771, 5, '@sms.3rivers.net', NULL, 'Lys4vVvvuKnXfdGUBlaD59tC5Hv66VWX18xqwCcZIsntd2iE6n64WjkHqd6K', 0, NULL, 0, NULL),
(32, 3, 9588, '["1"]', 2, '["1"]', 'Beverly', 'Carson', '2016-12-09', '2016-03-11', '2016-12-09', '96I6 - PLANTATION', '["5"]', 'beverlycarson99@gmail.com', '9545527533', '9588_Screen Shot 2017-01-02 at 8.35.34 PM.png', '$2y$10$HAOFrICxTXHSm4t275YiDuvb4MBdavNgc6Qhajk3FYv0nfqaFZx3a', 9588, 1, '@mymetropcs.com', NULL, '2resw9YGjjxTJ1KT3T4dqb09nJZHH6Z1M9Dj0aQWg5NCq3k4Rkx3bjea9d7J', 0, '9588_Screen Shot 2017-01-02 at 8.35.34 PM.png', 0, NULL),
(160, 3, 1602, '["1"]', 1, '["1"]', 'Julian', 'Escalante', '2016-03-11', '2016-03-11', '2016-03-11', '10654 NW 16th st.', '["6"]', 'tanphuqncrm@gmail.com', '9545527533', '1602_Screen Shot 2017-01-09 at 11.42.54 AM.png', '$2y$10$A0vArvEIOyXRya1u4tpNoe6gOl67/pa.ner/iwuIxigYjpHHai11.', 1602, 1, '@mymetropcs.com', NULL, NULL, 0, NULL, 0, NULL),
(232, 3, 7787, '["1"]', NULL, '["2"]', 'Joanne ', 'Smith ', '0000-00-00', '0000-00-00', '2016-09-28', '2800 North Miami Ave ', '["5"]', 'tanphuqncrm@gmail.com', '3053333333', '7787_Screen Shot 2017-01-09 at 11.46.34 AM.png', '$2y$10$AqbyumVlnRUBK9IwuzT40ObuFeFfnGSZIY0EqrugvsZEI.G5ti5Ja', 7787, 6, '@message.alltel.com', NULL, NULL, 0, NULL, 0, NULL),
(234, 3, 5675, '["3"]', NULL, '["2"]', 'Roberto', 'Dutesco', '0000-00-00', '0000-00-00', '2016-10-12', '2800 North Miami Ave', '["5"]', 'tanphuqncrm@gmail.com', '9545527533', '', '$2y$10$B1.tx4oADM2rqcoCyZL0suqvbOFrqWQYnMckgeyqPDjyoyUrhFsXu', 5675, 6, '@txt.bellmobility.ca', NULL, 'EpLm3TlXXwsV5zvBsh0QcRaIF6Naou9dtacznu3JWyg6DlIcQSPQkctIPw7C', 0, NULL, 0, NULL),
(235, 3, 4389, '["3"]', NULL, '["2"]', 'Mark ', 'Daniel', '0000-00-00', '0000-00-00', '2016-10-13', '2800 North Miami Ave', '["4"]', 'tanphuqncrm@gmail.com', '9545527533', '', '$2y$10$9ObHDYCmZBkNg0oLO2xfAOe63vJCORFipRvmBCkj.xD8.2stjU0Oi', 4389, 5, '@message.alltel.com', NULL, 'Hd5GmD1eJSB9iZYtNRvSnyAoTXaG0rFXclHg5hcCbKqxrC9j5mJpfYa38Fn4', 0, NULL, 0, NULL),
(291, 5, 5111994, '["1"]', NULL, '["1"]', 'Alex', 'Cohen', '0000-00-00', '0000-00-00', '2017-01-02', '2299 w silver palm rd', '["3"]', 'alex@wambi.org', '3054945599', '', '$2y$10$MPASUiIblVNb3pSxOBYTb.0gvUrs3tAjX.oG90PnvcdHH0rex8DQG', 5111994, 1, '@vtext.com', NULL, 'xGZKSWNFRKMz4xbgQgjK69WNy4BAW8TLuEHKrcFD80XrMK0PR3OutLwE0boL', 0, NULL, 0, NULL),
(292, 5, 10112014, '["1"]', NULL, '["1"]', 'Huynh Tan', 'Phu', '0000-00-00', '0000-00-00', '2017-01-11', '145/24 Go Xoai Street, Binh Hung Hoa A Award, Binh Tan District', '["3"]', 'tanphuqncrm1@gmail.com', '983599071', '', '$2y$10$WARKyb/83AjPHlfzSyKeuei5f6oNwk.4VrwYzCDFZNigIz0Qd8yHK', 10112014, 1, '@mymetropcs.com', NULL, 'ULl7xFdxWSDT93rH5W3S4rkQ4jKiyLo8RnW8XvOp8oOqOafXhJReBfbXvVA6', 0, NULL, 0, NULL),
(294, 3, 400875, '["2"]', NULL, '["3"]', 'Duane', 'Christie', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'duane.christie@specialcareproviders.com', '9546100706', '', '$2y$10$DUFifKXi7tjCPL5DEyY18OW9QpEMOVYNA.s3JO7Va7bNDzLymdv9a', 400875, 5, '@tmomail.net', NULL, 'aXHPI8ylJjmobXzt98CeAtBq8sEcfKaVXcohWNG0b4gwULWOi3CczVCZmFHZ', 0, NULL, 0, NULL),
(342, 2, 400863, '["2"]', NULL, '["3"]', 'MICHAEL', 'ABLES', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'mikeuniquephotos@aol.com', '3059939690', 'Ables_Michael.jpg', '', 1367312, 6, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(343, 2, 400865, '["2"]', NULL, '["1"]', 'ALLISON', 'AGUILAR', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1","2"]', 'allimia@msn.com', '7862451593', 'Aguilar_Allison.jpg', '', 1461032, 1, '@myboostmobile.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(344, 2, 400866, '["2"]', NULL, '["1"]', 'GUERBIE', 'ALCIME', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'jguerbie@hotmail.com', '9542921891', 'Alcime_Guerbie.jpg', '', 1602353, 1, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(345, 2, 400868, '["2"]', NULL, '["1"]', 'NERLA', 'ANDOCLES', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'nerlaj1226@gmail.com', '9548221200', 'Andocles_Nerla.jpg', '', 1367322, 1, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(346, 2, 773961, '["2"]', NULL, '["2"]', 'JERMAINE', 'BELL', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'bell48439@yahoo.com', '5615773961', '', '', 1602377, 4, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(347, 2, 422319, '["2"]', NULL, '["1"]', 'MICHELENE', 'BOSSE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'bossmichelene@gmail.com', '9542957457', 'Bosse_Michelene.jpg', '', 1602365, 1, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(348, 2, 464464, '["2"]', NULL, '["1"]', 'ROBIN', 'BRIDGEWATER', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'admin_support@rabsnaturalrubs.com', '5613241539', 'Bridgewater_Robin.jpg', '', 1590959, 1, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(349, 2, 400874, '["2"]', NULL, '["1"]', 'IMMACULA', 'CHERY', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'ichery@comcast.net', '9542583293', '', '', 1367362, 1, '@txt.att.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(350, 2, 416121, '["2"]', NULL, '["2"]', 'MARC', 'CHRISTIE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'mchristie1219@yahoo.com', '9546827442', 'Christie_Marc.jpg', '', 1602354, 5, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(351, 2, 400876, '["2"]', NULL, '["1"]', 'MUSTAFA', 'CICEK', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1","2"]', 'othello1629@gmail.com', '9545601886', 'Cicek_Mustafa.jpg', '', 1367365, 1, '@txt.att.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(352, 2, 853504, '["2"]', NULL, '["2"]', 'ROBERT', 'CLARKE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'deebo2001@gmail.com', '3057853504', 'Clarke_Robert.jpg', '', 1602362, 7, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(353, 2, 400878, '["2"]', NULL, '["1"]', 'KATHIE', 'DESGRANGES', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'mariekate12@gmail.com', '7547079349', '', '', 1367367, 1, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(354, 2, 422669, '["2"]', NULL, '["1"]', 'CORNELIS', 'DEVROEDT', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'cornelisd@bellsouth.net', '', '', '', 1602366, 1, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(355, 2, 400879, '["2"]', NULL, '["3"]', 'MARCK', 'DOPHIN', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'mdophin@hotmail.com', '7862467471', 'Dophin_marck.jpg', '', 1367368, 6, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(356, 2, 714772, '["2"]', NULL, '["2"]', 'JAMES', 'DORANTE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'jamesdorante@gmail.com', '7862714772', 'Dorante_James.jpg', '', 1368718, 8, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(357, 2, 400881, '["2"]', NULL, '["1"]', 'ELSUZE', 'DORISCA', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'elsuz5@yahoo.com', '5615031507', 'Dorisca_Elsuze.jpg', '', 1367369, 1, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(358, 2, 400882, '["2"]', NULL, '["1"]', 'ROSLYN', 'EASTMAN', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'ramlaronimanning@gmail.com', '6175159028', 'Eastman_Rosyln.jpg', '', 1602342, 1, '@vtext.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(359, 2, 400883, '["2"]', NULL, '["2"]', 'JOSEPHUS', 'EGGELLETION', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'eggpt@hotmail.com', '9548683380', 'Eggelletion_Josephus.jpg', '', 1367372, 8, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(360, 2, 400884, '["2"]', NULL, '["1"]', 'LUCILLE', 'ERNE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'lucillerne@yahoo.com', '8023932080', '', '', 1460232, 1, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(361, 2, 400885, '["2"]', NULL, '["1"]', 'NERLANDE', 'FENELUS', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'nerlande30@hotmail.com', '5617408015', 'Fenelus_Nerlande.jpg', '', 1367313, 1, '@messaging.sprintpcs.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(362, 2, 400887, '["2"]', NULL, '["1"]', 'GUERDY', 'FRAGE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'guerdyfrage07@gmail.com', '9549342990', 'Frage_Guerdy.jpg', '', 1367315, 1, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(363, 2, 400888, '["2"]', NULL, '["2"]', 'RAQUEL', 'GARCIA', '0000-00-00', '0000-00-00', '2017-01-12', '', '', 'rokkigarcia@gmail.com', '7863994053', '', '', 1602343, 8, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(364, 2, 400890, '["2"]', NULL, '["1"]', 'YANICK', 'GILOT', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'residencetrinite@myacc.net', '9543496781', '', '', 1367317, 1, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(365, 2, 418096, '["2"]', NULL, '["1"]', 'PATRICIA', 'GIORDANO', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'crazygio@sbcglobal.net', '2036952628', 'Giordano_Patricia.jpg', '', 1602363, 1, '@vtext.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(366, 2, 464465, '["2"]', NULL, '["1"]', 'NADIA', 'GORDON', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'visitmeanytime@yahoo.com', '3057136499', 'Gordon_Nadia.jpg', '', 1367034, 2, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(367, 2, 464466, '["2"]', NULL, '["1"]', 'BEVERLY', 'GRANT-BRINSON', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'startattbb@gmail.com', '9546733994', '', '', 1379909, 2, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(368, 2, 400891, '["2"]', NULL, '["1"]', 'SANDRA', 'GREEN', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'romonaormsby@yahoo.com', '9548267862', 'Green_Sandra.jpg', '', 1602329, 2, '@messaging.sprintpcs.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(369, 2, 400976, '["2"]', NULL, '["1"]', 'FRANCEEN', 'HILL', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'frastacya07@comcast.net', '', 'Hill_Franceen.jpg', '', 1602317, 2, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(370, 2, 464467, '["2"]', NULL, '["1"]', 'ROSEMARIE', 'JOHNSON', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'roseforhen@aol.com', '9545152590', 'Johnson_Rosemarie.jpg', '', 1367035, 2, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(371, 2, 400896, '["2"]', NULL, '["1"]', 'RANO', 'KURBANOVA', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'ranokurbanova911@hotmail.com', '7725593134', 'Kurbanova_Rano.jpg', '', 1464254, 2, '@txt.att.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(372, 2, 464468, '["2"]', NULL, '["2"]', 'HENDRIKUS', 'MARTENS', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'h_martens@msn.com', '9544106468', 'Martens_Hendrikus.jpg', '', 1367037, 9, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(373, 2, 400900, '["2"]', NULL, '["3"]', 'MARLYN', 'MARTHELLY', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'mmarthelly@yahoo.com', '5613768633', 'Marthelly_Marlyn.jpg', '', 1467977, 6, '@messaging.sprintpcs.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(374, 2, 416163, '["2"]', NULL, '["2"]', 'OLDINE', 'MONDESIR', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'oldine79@hotmail.com', '9546615474', 'Mondesir_Oldine.jpg', '', 1602356, 12, '@messaging.sprintpcs.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(375, 2, 400902, '["2"]', NULL, '["1"]', 'BEVERLY', 'MORRIS', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'indianrose122@gmail.com', '9547090688', 'Morris_Beverly.jpg', '', 1367333, 2, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(376, 2, 400903, '["2"]', NULL, '["1"]', 'SHARON', 'MUNRO', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'sharonjmunro@bellsouth.net', '7864782106', 'Munro_Sharon.jpg', '', 1602315, 2, '@txt.att.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(377, 2, 416240, '["2"]', NULL, '["3"]', 'CHARLES', 'PIERRE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'charles_pierre27@hotmail.com', '9542976909', 'Pierre_Charles.jpg', '', 1602361, 6, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(378, 2, 416238, '["2"]', NULL, '["3"]', 'OPAL', 'POWE', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1","2"]', 'opalpowe@comcast.net', '9549730585', 'Powe_Opal.jpg', '', 1602360, 6, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(379, 2, 400906, '["2"]', NULL, '["1"]', 'MICHAEL', 'RABALAIS', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'Rabalais_87@hotmail.com', '9858522298', 'Rabalais_Michael.jpg', '', 1602350, 2, '@messaging.sprintpcs.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(380, 2, 431336, '["2"]', NULL, '["3"]', 'PAMELA', 'ROBERT', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1","2"]', 'pamicheli@yahoo.com', '9542480169', '', '', 1602369, 6, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(381, 2, 400910, '["2"]', NULL, '["3"]', 'NORMAN', 'SINCLAIR', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'tbearluv40@yahoo.com', '9548258417', 'Sinclair_Norman.jpg', '', 1367344, 10, '@txt.att.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(382, 2, 400911, '["2"]', NULL, '["1"]', 'BETH', 'SNYDER', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'Birdlvr23@aol.com', '9542057638', 'Snyder_Beth.jpg', '', 1602316, 2, '@txt.att.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(383, 2, 430560, '["2"]', NULL, '["3"]', 'DAWN', 'TABOR', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'cappi.tabor@gmail.com', '', '', '', 1602368, 10, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(384, 2, 468802, '["2"]', NULL, '["2"]', 'MARY', 'TARRER', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1","2"]', 'mkathryn3@aol.com', '2053826783', '', '', 1602379, 12, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(385, 2, 400912, '["2"]', NULL, '["3"]', 'ANTOINE', 'TELFORT', '0000-00-00', '0000-00-00', '2017-01-12', '', '["2"]', 'atelfort12@gmail.com', '9542137066', 'Telfort_Antoine.jpg', '', 1367347, 10, '@page.metrocall.com', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(386, 2, 464470, '["2"]', NULL, '["1"]', 'JANET', 'WATSON', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'dimpleswato@yahoo.com', '7542247789', 'Watson_Janet.jpg', '', 1367053, 11, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(387, 2, 400914, '["2"]', NULL, '["1"]', 'LATOYA', 'WEBB', '0000-00-00', '0000-00-00', '2017-01-12', '', '["1"]', 'shellyann0981@yahoo.com', '9543945846', 'Webb_Latoya.jpg', '', 1367348, 11, '@tmomail.net', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(388, 2, 438738, '["2"]', NULL, '["3"]', 'SANCHAY', 'WILLIAMS', '0000-00-00', '0000-00-00', '2017-01-12', '', '', 'sanjay401060@yahoo.com', '', '', '', 1602373, 10, '', '', '', 0, '', 0, '0000-00-00 00:00:00'),
(389, 3, 1994, '["2"]', NULL, '["1"]', 'Wambi', 'Admin', '0000-00-00', '0000-00-00', '2017-01-09', 'Plantation', '["3"]', 'betatestingmetz@gmail.com', '7862021799', '1994_Wambibirdonly.png', '$2y$10$6yvpAxhnCgkn4vadjV1RKeMEoSvM4UwUo90gHPKvUXX9igivwcXCO', 1994, 1, '@txt.att.net', NULL, NULL, 0, NULL, 0, NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
