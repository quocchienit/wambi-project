alter table config_peck add eidredem varchar(1000);
alter table shift_master add shift_starttime varchar(10) DEFAULT NULL;
alter table shift_master add shift_endtime varchar(10) DEFAULT NULL;
alter table config_peck add number_of_consecutive  int(11)DEFAULT '3';
alter table config_peck add users_to_receive varchar(1000);
alter table config_peck add perfectscore  int(11)DEFAULT '0';