CREATE TABLE  IF NOT EXISTS `employee_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `notification_id` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(255) DEFAULT 'NOT_SEEN',
  `jobtitle_id` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `d` (`employee_id`,`jobtitle_id`,`notification_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=751 DEFAULT CHARSET=utf8;
