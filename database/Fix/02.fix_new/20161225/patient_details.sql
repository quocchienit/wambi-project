ALTER TABLE `patient_details` ADD COLUMN(
  `email` varchar(100) NOT NULL,
  `mobile` varchar(100) NOT NULL,
  `insurance_id` int(11) DEFAULT NULL,
  `code` varchar(4) DEFAULT NULL,
  `code_date` datetime DEFAULT NULL,
  `patient_carrier` varchar(250) DEFAULT NULL
);