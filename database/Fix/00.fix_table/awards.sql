CREATE TABLE  IF NOT EXISTS `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`owner`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
