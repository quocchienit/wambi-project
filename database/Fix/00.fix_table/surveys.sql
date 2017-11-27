CREATE TABLE  IF NOT EXISTS `surveys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `discipline` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `type` varchar(255) NOT NULL,
  `avg` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;
