-- create schema
CREATE DATABASE docviewer;

-- drop and create table
DROP TABLE IF EXISTS docviewer.jobexecution;

create table docviewer.jobexecution(
   case_id varchar(20) NOT NULL,
   total_control_files int NOT NULL,
   processed_control_files int NOT NULL,
   unmerged_control_files int NOT NULL,
   unprocessed_files_from_main int NOT NULL,
   insert_datetime datetime DEFAULT CURRENT_TIMESTAMP,
   last_update_datetime datetime DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY ( case_id )
);

create table docviewer.jobexecution_history(
   case_id varchar(20) NOT NULL,
   total_control_files int NOT NULL,
   processed_control_files int NOT NULL,
   unmerged_control_files int NOT NULL,
   unprocessed_files_from_main int NOT NULL,
   insert_datetime datetime,
   last_update_datetime datetime
);

-- Examples
insert into docviewer.jobexecution (jobexecution.case_id, jobexecution.total_control_files, jobexecution.processed_control_files, jobexecution.unmerged_control_files, jobexecution.unprocessed_files_from_main) values ("case_1",10,8,1,1);
update docviewer.jobexecution set jobexecution.processed_triggers=jobexecution.processed_triggers+1 where jobexecution.case_id='case_1';

-- check if the table is empty
SELECT EXISTS (SELECT 1 FROM docviewer.jobexecution);

-- To increase max connection
show variables like "max_connections";
GRANT SYSTEM_VARIABLES_ADMIN ON *.* TO admin;
SET GLOBAL max_connections = 100000;
