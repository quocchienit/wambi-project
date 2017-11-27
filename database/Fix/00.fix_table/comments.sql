CREATE TABLE  IF NOT EXISTS `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmt_description` varchar(500) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `patient_id` int(11) NOT NULL,
  `number_phone` varchar(50) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `first_name` varchar(250) DEFAULT NULL,
  `last_name` varchar(250) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
