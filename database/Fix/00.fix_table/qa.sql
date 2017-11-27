CREATE TABLE  IF NOT EXISTS `qa` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `qaid` varchar(50) NOT NULL,
  `question` text NOT NULL,
  `q_es` text,
  `anwser` text,
  `a_es` text,
  `utype` varchar(250) NOT NULL,
  `created_user` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_user` varchar(50) DEFAULT '',
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

