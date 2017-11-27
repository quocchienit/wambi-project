CREATE TABLE  IF NOT EXISTS `employee_type` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(250) NOT NULL,
  `icon` varchar(250) NOT NULL,
  `permission` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `etid` (`id`) USING BTREE,
  KEY `etid_2` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
