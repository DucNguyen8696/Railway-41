create database Exercise3 ;
use Exercise3 ;

create table Exercise3 
( ID int primary key auto_increment,
birthday date  ,
gender int  ,
isdeletedflag int ,
check (gender in (0,1)),
check (isdeletedflag in (0,1))
);