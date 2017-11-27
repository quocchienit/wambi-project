CREATE TABLE  IF NOT EXISTS `shift_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shift_unit` varchar(255) DEFAULT NULL,
  `shift_discipline` varchar(255) DEFAULT NULL,
  `shift_job_title` varchar(255) DEFAULT NULL,
  `shift_date` varchar(255) DEFAULT NULL,
  `shift_time` varchar(255) DEFAULT NULL,
  `shift_pecks` varchar(255) DEFAULT NULL,
  `shift_notes` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
