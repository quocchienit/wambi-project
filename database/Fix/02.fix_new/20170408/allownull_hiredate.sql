 ALTER TABLE `employee_master` MODIFY   hiredate datetime DEFAULT NULL;
 ALTER TABLE `employee_master` ADD `created_at` TIMESTAMP NULL AFTER `fac_id`;
 ALTER TABLE `newsfeed` ADD `type` VARCHAR(255) NULL AFTER `fac_id`;

