create database	Testing_System_Assignment_1 ;
use Testing_System_Assignment_1 ;


create table Department 
( DepartmentID int primary key auto_increment,
DepartmentName varchar (100)
);

create table Position 
( PositionID  int primary key auto_increment ,
PositionName enum ('Dev','Test','Scrum_Master','PM')
);

create table   `Account` 
( accountID int primary key auto_increment,
Email varchar (50),
username varchar(50),
Fullname varchar (50),
DepartmentID int,
PositionID int,
CreateDate date);
 
 create table `group`
 (GruopID int primary key auto_increment,
 GroupName varchar(200),
 CreatorID int ,
 createDate date); 
 
 create table GroupAccount 
 (GroupID int ,
AccountID int,
 Joindate date);
  
  create table TypeQuestion 
  (TyoeID int primary key auto_increment ,
  tyoeName enum('Essay','Mutiple-Choice'));
  
create table CategoryQuestion 
(CategoryID int primary key auto_increment,
CategoryName varchar(25)
);
 
 create table Question 
 (QuestionID int primary key auto_increment,
 Content varchar(255),
 CategoryID int,
 TypeID int,
 CreatorID int,
 CreateDate date
 );

create table Answer 
(AnswerID int primary key auto_increment,
Content varchar(300),
QuestionID int,
isCorrect enum('Đúng','Sai')
);
 
 create table Exam 
 (ExamID int primary key auto_increment,
 `Code` varchar(25),
 Title varchar(100),
 CategoryID int ,
 Duration varchar (50),
 CreatorID int,
 CreateDate date
 );

create table ExamQuestion 
(ExamID int,
QuestionID int);
