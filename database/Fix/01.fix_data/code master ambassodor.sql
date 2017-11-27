DELETE FROM `code_master` WHERE `type` LIKE "discipline";
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`, `refkey`) VALUES
('discipline', '1', 'Nursing', NULL, NULL, NULL),
('discipline', '2', 'Nursing Support', NULL, NULL, NULL),
('discipline', '3', 'Respiratory', NULL, NULL, NULL),
('discipline', '4', 'Lab', NULL, NULL, NULL),
('discipline', '5', 'Therapy', NULL, NULL, NULL),
('discipline', '6', 'Case Management', NULL, NULL, NULL),
('discipline', '7', 'Radiology', NULL, NULL, NULL);

DELETE FROM `code_master` WHERE `type` LIKE "job_title";
INSERT INTO `code_master` (`type`, `key`, `value`, `notes`, `display_name`, `refkey`) VALUES
('job_title', '1', 'Charge Nurse', '1', 'Charge Nurse', NULL),
('job_title', '2', 'RN', '1', 'RN', NULL),
('job_title', '3', 'CNA', '2', 'CNA', NULL),
('job_title', '4', 'Sitter', '2', 'Sitter', NULL),
('job_title', '5', 'RCP', '3', 'RCP', NULL),
('job_title', '6', 'Lab Tech', '4', 'Lab Tech', NULL),
('job_title', '7', 'Physical Therapist', '5', 'Physical Therapist', NULL),
('job_title', '8', 'Occupational Therapist', '5', 'Occupational Therapist', NULL),
('job_title', '9', 'Speech Therapist', '5', 'Speech Therapist', NULL),
('job_title', '10', 'Case Manager', '6', 'Case Manager', NULL),
('job_title', '11', 'Social Worker', '6', 'Social Worker', NULL),
('job_title', '12', 'Radiology Tech', '7', 'Radiology Tech', NULL),
('job_title', '13', 'Transporter', '7', 'Transporter', NULL);