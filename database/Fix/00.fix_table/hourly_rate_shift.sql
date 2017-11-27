CREATE TABLE  IF NOT EXISTS `hourly_rate_shift` (
  `shift_id` int(11) NOT NULL,
  `hourly_rate_id` int(11) NOT NULL,
  UNIQUE KEY `unique` (`shift_id`,`hourly_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;