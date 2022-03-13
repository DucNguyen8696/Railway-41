create database	Testing_System_Assignment_1 ;
use Testing_System_Assignment_1 ;


create table Department 
( DepartmentID int primary key auto_increment,
DepartmentName varchar (100)
);

create table Position 
( PositionID  int primary key auto_increment ,
PositionName enum ('Dev','Test','Scrum_Master','PM') not null
);

create table   `Account` 
( accountID int primary key auto_increment,
Email varchar (255),
username varchar(70),
Fullname varchar (70),
DepartmentID int,
PositionID int,
CreateDate date,
foreign key (DepartmentID) references Department(DepartmentID),
foreign key (PositionID) references Position (PositionID)
);
 
 create table `group`
 (GruopID int primary key auto_increment,
 GroupName varchar(200),
 CreatorID int ,
 createDate date); 
  
 create table GroupAccount 
 (GroupID int  ,
AccountID int,
 Joindate date primary key ,
 foreign key (AccountID) references `Account`(AccountID)
);
  
  create table TypeQuestion 
  (TyoeID int primary key auto_increment ,
  tyoeName enum('Essay','Mutiple-Choice')not null);
  
create table CategoryQuestion 
(CategoryID int primary key auto_increment,
CategoryName varchar(50)
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
isCorrect enum('Đúng','Sai') not null,
foreign key (QuestionID) references Question(QuestionID)
);
 
 create table Exam 
 (ExamID int primary key auto_increment,
 `Code` varchar(50),
 Title varchar(100),
 CategoryID int ,
 Duration varchar (50),
 CreatorID int,
 CreateDate date
 );

create table ExamQuestion 
(STT int primary key auto_increment,
ExamID int,
QuestionID int,
foreign key (ExamID) references Exam(ExamID),
foreign key (QuestionID) references Question(QuestionID)
);

insert into department(departmentID,departmentName)
values
(1,"a"),
(2,"b"),
(3,"c"),
(4,"d"),
(5,"e");

iNSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('1', 'dev');
INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('2', 'test');
INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('3', 'scrum_master');
INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('4', 'PM');
INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('5', 'PM');

INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('1', 'a@gmail.com', 'a', 'aa', '1', '1', '2022-1-1');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('2', 'b@gmail.com', 'b', 'bb', '2', '2', '2022-1-2');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('3', 'c@gmail.com', 'c', 'cc', '3', '3', '2022-1-3');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('4', 'd@gmail.com', 'd', 'dd', '4', '4', '2022-1-4');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('5', 'e@gmail.com', 'e', 'ee', '5', '5', '2022-1-5');

INSERT INTO `testing_system_assignment_1`.`group` (`GruopID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('1', 'a', '1', '2022-1-1');
INSERT INTO `testing_system_assignment_1`.`group` (`GruopID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('2', 'b', '2', '2022-1-2');
INSERT INTO `testing_system_assignment_1`.`group` (`GruopID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('3', 'c', '3', '2022-1-3');
INSERT INTO `testing_system_assignment_1`.`group` (`GruopID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('4', 'd', '4', '2022-1-4');
INSERT INTO `testing_system_assignment_1`.`group` (`GruopID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('5', 'e', '5', '2022-1-5');

INSERT INTO `testing_system_assignment_1`.`groupaccount` (`GroupID`, `AccountID`, `Joindate`) VALUES ('1', '1', '2022-1-1');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`GroupID`, `AccountID`, `Joindate`) VALUES ('2', '2', '2022-1-2');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`GroupID`, `AccountID`, `Joindate`) VALUES ('3', '3', '2022-1-3');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`GroupID`, `AccountID`, `Joindate`) VALUES ('4', '4', '2022-1-4');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`GroupID`, `AccountID`, `Joindate`) VALUES ('5', '5', '2022-1-5');

INSERT INTO `testing_system_assignment_1`.`typequestion` (`TyoeID`, `tyoeName`) VALUES ('1', 'Essay');
INSERT INTO `testing_system_assignment_1`.`typequestion` (`TyoeID`, `tyoeName`) VALUES ('2', 'Essay');
INSERT INTO `testing_system_assignment_1`.`typequestion` (`TyoeID`, `tyoeName`) VALUES ('3', 'Essay');
INSERT INTO `testing_system_assignment_1`.`typequestion` (`TyoeID`, `tyoeName`) VALUES ('4', 'Mutiple-Choice');
INSERT INTO `testing_system_assignment_1`.`typequestion` (`TyoeID`, `tyoeName`) VALUES ('5', 'Mutiple-Choice');
 
 INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('1', 'a');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('2', 'b');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('3', 'c');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('4', 'd');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('5', 'e');

INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('1', 'a', '1', '1', '1', '2022-1-1');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('2', 'b', '2', '2', '2', '2022-1-2');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('3', 'c', '3', '3', '3', '2022-1-3');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('4', 'd', '4', '4', '4', '2022-1-4');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('5', 'e', '5', '5', '5', '2022-1-5');

INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('1', 'a', '1', 'Đúng');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('2', 'b', '2', 'Sai');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('3', 'c', '3', 'Đúng');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('4', 'd', '4', 'Sai');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('5', 'e', '5', 'Đúng');

INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('1', 'a', 'a', '1', '90p', '1', '2022-1-1');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('2', 'b', 'b', '2', '90p', '2', '2022-1-2');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('3', 'c', 'c', '3', '90p', '3', '2022-1-3');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('4', 'd', 'd', '4', '90p', '4', '2022-1-4');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('5', 'e', 'e', '5', '90p', '5', '2022-1-5');


 