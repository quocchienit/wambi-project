﻿CREATE TABLE  IF NOT EXISTS `employee_master` (
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
  PRIMARY KEY (`id`),
  KEY `etid` (`etid`,`units`(767)) USING BTREE,
  KEY `etid_2` (`etid`,`units`(767)) USING BTREE,
  KEY `etid_3` (`etid`,`units`(767)) USING BTREE,
  KEY `lid` (`units`(767)) USING BTREE,
  KEY `catid` (`catid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=latin1;
