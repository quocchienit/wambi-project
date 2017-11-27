CREATE TABLE  IF NOT EXISTS `award_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `value` varchar(250) NOT NULL,
  `unit_id` varchar(50) NOT NULL,
  `notes` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;