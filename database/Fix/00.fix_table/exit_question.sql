CREATE TABLE  IF NOT EXISTS `exit_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `question` varchar(250) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
