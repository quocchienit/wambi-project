CREATE TABLE  IF NOT EXISTS `patient_family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `numberphone` varchar(50) NOT NULL,
  `carrier` varchar(50) NOT NULL,
  `code` varchar(4) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
