ALTER TABLE `employee_master` ADD COLUMN(
  `image_new` varchar(250) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `upload_date` datetime DEFAULT NULL  
);