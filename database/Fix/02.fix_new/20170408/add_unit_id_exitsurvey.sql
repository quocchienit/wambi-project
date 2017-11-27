ALTER TABLE exitsurvey ADD COLUMN unit_id varchar(50);
ALTER TABLE `patient_details` ADD COLUMN `units` varchar(1000) DEFAULT NULL;

Update exitsurvey left join patient_details 
on exitsurvey.pid= patient_details.pid
set exitsurvey.unit_id = patient_details.lid;