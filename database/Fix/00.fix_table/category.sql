CREATE TABLE  IF NOT EXISTS `category` (
  `catid` int(11) NOT NULL,
  `etid` int(11) NOT NULL,
  `categoryname` text NOT NULL,
  UNIQUE KEY `catid` (`catid`) USING BTREE,
  KEY `etid` (`etid`) USING BTREE,
  KEY `etid_2` (`etid`) USING BTREE,
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`etid`) REFERENCES `employee_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
