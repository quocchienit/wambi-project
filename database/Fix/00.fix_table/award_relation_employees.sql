CREATE TABLE IF NOT EXISTS `award_relation_employees` ( 
	`id` BIGINT NOT NULL AUTO_INCREMENT ,
	`award_id` INT NOT NULL , 
	`user_id` INT NOT NULL , 
	`pecks` INT NOT NULL , 
	`type` VARCHAR(255) NULL , 
	`created_at` TIMESTAMP NOT NULL , 
	`updated_at` TIMESTAMP NOT NULL , 
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;