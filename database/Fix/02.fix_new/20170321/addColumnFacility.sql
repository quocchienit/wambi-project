ALTER TABLE answers  ADD COLUMN fac_id varchar(50);
ALTER TABLE awards  ADD COLUMN fac_id varchar(50);
ALTER TABLE code_master  ADD COLUMN refkey varchar(50);
ALTER TABLE employee_master  ADD COLUMN fac_id varchar(50);
ALTER TABLE exitsurvey  ADD COLUMN fac_id varchar(50);
ALTER TABLE newsfeed  ADD COLUMN fac_id varchar(50);
ALTER TABLE patient_details  ADD COLUMN fac_id varchar(50);
ALTER TABLE shift_master  ADD COLUMN fac_id varchar(50);
ALTER TABLE surveys  ADD COLUMN fac_id varchar(50);
ALTER TABLE question  ADD COLUMN fac_id varchar(50);
ALTER TABLE exit_question  ADD COLUMN fac_id varchar(50);
ALTER TABLE question  ADD COLUMN orderby int;
ALTER TABLE exit_question  ADD COLUMN orderby int;

/*addColumnTableConfigPeck.sql*/
ALTER TABLE config_peck ADD COLUMN eidalert varchar(1000);
ALTER TABLE config_peck ADD COLUMN eidfollow varchar(1000);

ALTER TABLE rewards ADD COLUMN unit_id varchar(50);


INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`,`refkey`) 
VALUES ( 'facility', '1', 'Facility Name 1', null, null, null);

Update code_master set refkey = 1 where type ='unit';
Update question set orderby = qid ;
Update exit_question set orderby = qid;
Update answers set fac_id = 1;
Update awards set fac_id = 1;
Update employee_master set fac_id = 1;
Update exit_question set fac_id = 1;
Update exitsurvey set fac_id = 1;
Update newsfeed set fac_id = 1;
Update patient_details set fac_id = 1;
Update shift_master set fac_id = 1;
Update surveys set fac_id = 1;
Update question set fac_id = 1;

