create database Extra_assignment1_2 ;
use Extra_assignment1_2 ;

create table Trainee 
(TraineeID int primary key auto_increment,
Full_Name varchar ( 100),
Birth_Date date ,
Gender enum('male','female','unknow'),
ET_IQ tinyint unsigned,
ET_Gmath tinyint unsigned,
ET_English tinyint unsigned,
Training_Class char(10),
Evaluation_Notes text
);

alter table trainee
add column VTI_Account  varchar(255) not null unique key;
