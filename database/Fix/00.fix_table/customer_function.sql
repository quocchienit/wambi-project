CREATE TABLE  IF NOT EXISTS `customer_function` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `function_id` int(11) NOT NULL,
  `enable` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
