CREATE TABLE  IF NOT EXISTS `startsurvey` (
  `pid` int(11) NOT NULL,
  `incid` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  PRIMARY KEY (`incid`),
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;
