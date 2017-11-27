CREATE TABLE  IF NOT EXISTS `function_list` (
  `id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
