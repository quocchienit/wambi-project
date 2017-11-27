CREATE TABLE  IF NOT EXISTS `patient_details` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Pid as Primary Key',
  `lid` int(11) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `dob` date NOT NULL,
  `admitteddate` date NOT NULL,
  `release` date DEFAULT NULL,
  `outcome` varchar(250) NOT NULL,
  `ssn` int(250) NOT NULL,
  `pinno` int(250) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pinno` (`pinno`) USING BTREE,
  UNIQUE KEY `ssn` (`ssn`) USING BTREE,
  KEY `pinno_2` (`pinno`) USING BTREE,
  KEY `lid` (`lid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
