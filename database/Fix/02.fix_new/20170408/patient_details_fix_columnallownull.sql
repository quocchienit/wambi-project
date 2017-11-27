
 ALTER TABLE `patient_details` MODIFY   `lname` text DEFAULT NULL;
 ALTER TABLE `patient_details` MODIFY    `dob` date DEFAULT NULL;
 ALTER TABLE `patient_details` MODIFY    `admitteddate` date DEFAULT NULL;
 ALTER TABLE `patient_details` MODIFY    `outcome` varchar(250) DEFAULT NULL;
 ALTER TABLE `patient_details` MODIFY    `email` varchar(100) DEFAULT NULL;
 ALTER TABLE `patient_details` MODIFY    `mobile` varchar(100) DEFAULT NULL;

ALTER TABLE `patient_details` Add    `type` varchar(100) DEFAULT NULL;
update patient_details set type ='patient';

alter table exitsurvey add column insurance_id varchar(50);
alter table surveys add column insurance_id varchar(50);

Update surveys  left join patient_details 
on pid= patient_id
set surveys.insurance_id = patient_details.insurance_id;


Update exitsurvey  left join patient_details 
on exitsurvey.pid= patient_details.pid
set exitsurvey.insurance_id = patient_details.insurance_id;