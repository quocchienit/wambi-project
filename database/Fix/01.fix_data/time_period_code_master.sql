DELETE FROM `code_master`  where `type` = 'time_period';
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`)  VALUES ('time_period', '4', 'Week', 2, null);
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`)  VALUES ('time_period', '1', 'Month', 3, null);
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`)  VALUES ('time_period', '2', 'Quarter', 5, null);
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`)  VALUES ('time_period', '3', 'Year', 6, null);
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`)  VALUES ('time_period', '5', 'Pay Period', 4, null);
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`)  VALUES ('time_period', '6', 'Day', 1, null);

