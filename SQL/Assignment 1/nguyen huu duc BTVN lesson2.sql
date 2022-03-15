create database	Testing_System_Assignment_1 ;
use Testing_System_Assignment_1 ;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100)
);

create table Position 
( PositionID  int primary key auto_increment ,
PositionName enum ('Dev','Test','Scrum_Master','PM') not null
);

CREATE TABLE `Account` (
    accountID 		INT PRIMARY KEY AUTO_INCREMENT,
    Email 			VARCHAR(255),
    username 		VARCHAR(70),
    Fullname 		VARCHAR(70),
    DepartmentID 	INT,
    PositionID 		INT,
    CreateDate 		DATE,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID)
        REFERENCES Position (PositionID)
);
 
 CREATE TABLE `group` (
    GroupID INT PRIMARY KEY AUTO_INCREMENT,
    GroupName VARCHAR(200),
    CreatorID INT,
    createDate DATE,
    foreign key (creatorID) references `account`(accountID)
); 
  
CREATE TABLE GroupAccount (
    STT 		INT PRIMARY KEY AUTO_INCREMENT,
    GroupID 	INT,
    AccountID 	INT,
    Joindate 	DATE,
				FOREIGN KEY (AccountID)
				REFERENCES `Account` (AccountID),
				FOREIGN KEY (GroupID)
				REFERENCES `group` (GroupID)
);

  create table TypeQuestion 
  (TypeID int primary key auto_increment ,
  typeName enum('Essay','Mutiple-Choice')not null);
  
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
 CreateDate date,
 foreign key (CategoryID) references CategoryQuestion(CategoryID),
 foreign key (TypeID) references TypeQuestion(TypeID) ,
 foreign key (creatorID) references `account`(accountID)
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
 Duration time,
 CreatorID int,
 CreateDate date,
 foreign key (CategoryID) references  CategoryQuestion(CategoryID),
 foreign key (creatorID) references `account`(accountID)
 );

create table ExamQuestion 
(STT int primary key auto_increment,
ExamID int,
QuestionID int,
foreign key (ExamID) references Exam(ExamID),
foreign key (QuestionID) references Question(QuestionID)
);

INSERT INTO `testing_system_assignment_1`.`department` (`DepartmentID`, `DepartmentName`) VALUES ('1', 'sale');
INSERT INTO `testing_system_assignment_1`.`department` (`DepartmentID`, `DepartmentName`) VALUES ('2', 'marketing');
INSERT INTO `testing_system_assignment_1`.`department` (`DepartmentID`, `DepartmentName`) VALUES ('3', 'thong tin');
INSERT INTO `testing_system_assignment_1`.`department` (`DepartmentID`, `DepartmentName`) VALUES ('4', 'tin dung ');
INSERT INTO `testing_system_assignment_1`.`department` (`DepartmentID`, `DepartmentName`) VALUES ('5', 'bao ve');
INSERT INTO `testing_system_assignment_1`.`department` (`DepartmentID`, `DepartmentName`) VALUES ('6', 'cskh');
INSERT INTO `testing_system_assignment_1`.`department` (`DepartmentID`, `DepartmentName`) VALUES ('7', 'tu van');


INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('1', 'dev');
INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('2', 'test');
INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('3', 'scrum_master');
INSERT INTO `testing_system_assignment_1`.`position` (`PositionID`, `PositionName`) VALUES ('4', 'PM');


INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('1', 'an@gmail.com', 'an', 'tran an', '1', '1', '2022-1-15');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('2', 'dat@gmail.com', 'dat', 'phan dat', '3', '2', '2022-1-3');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('3', 'vu@gmail.com', 'vu', 'nguyen vu', '2', '4', '2021-12-30');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('4', 'tuan@gmail.com', 'tuan', 'mai tuan', '4', '3', '2020-5-3');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('5', 'hai@gmail.com', 'hai', 'vu hai ', '6', '2', '2021-6-9');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('6', 'thanh@gmail.com', 'thanh', 'nguyen thanh', '7', '1', '2022-1-16');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('7', 'minh@gmail.com', 'minh', 'nguyen thinh', '1', '4', '2022-2-15');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('8', 'hoai@gmail.com', 'hoai', 'tran hoai', '2', '3', '2020-10-20');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('9', 'linh@gmail.com', 'linh', 'phan linh', '5', '1', '2019-6-5');
INSERT INTO `testing_system_assignment_1`.`account` (`accountID`, `Email`, `username`, `Fullname`, `DepartmentID`, `PositionID`, `CreateDate`) VALUES ('10', 'ngoc@gmail.com', 'ngoc', 'do ngoc', '4', '2', '2015-6-25');

INSERT INTO `testing_system_assignment_1`.`group` (`GroupID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('1', 'bong da', '1', '2022-1-1');
INSERT INTO `testing_system_assignment_1`.`group` (`GroupID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('2', 'game ', '2', '2018-2-25');
INSERT INTO `testing_system_assignment_1`.`group` (`GroupID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('3', 'doc sach', '8', '2019-6-30');
INSERT INTO `testing_system_assignment_1`.`group` (`GroupID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('4', 'bolling', '4', '2020-5-6');
INSERT INTO `testing_system_assignment_1`.`group` (`GroupID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('5', 'boi loi', '2', '2018-12-12');
INSERT INTO `testing_system_assignment_1`.`group` (`GroupID`, `GroupName`, `CreatorID`, `createDate`) VALUES ('6', 'ban cung', '6', '2020-2-2');

INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`) VALUES ('1', '1', '5');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('2', '2', '3', '2019-1-20');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('3', '6', '2', '2020-3-6');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('4', '3', '6', '2021-11-2');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('5', '2', '9', '2020-6-9');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('6', '5', '2', '2019-3-6');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('7', '4', '5', '2020-6-5');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('8', '2', '4', '2022=1-20');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('9', '3', '6', '2021-6-3');
INSERT INTO `testing_system_assignment_1`.`groupaccount` (`STT`, `GroupID`, `AccountID`, `Joindate`) VALUES ('10', '6', '3', '2020-9-9');

INSERT INTO `testing_system_assignment_1`.`typequestion` (`TypeID`, `typeName`) VALUES ('1', 'Essay');
INSERT INTO `testing_system_assignment_1`.`typequestion` (`TypeID`, `typeName`) VALUES ('2', 'Mutiple-Choice');


INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('1', 'java');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('2', 'net');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('3', 'sql');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('4', 'postman');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('5', 'ruby');
INSERT INTO `testing_system_assignment_1`.`categoryquestion` (`CategoryID`, `CategoryName`) VALUES ('6', 'cc');


INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('1', 'java la gi', '1', '1', '5', '2022-1-15');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('2', 'net la gi', '2', '2', '1', '2019-12-2');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('3', 'sql la gi', '1', '1', '3', '2022-6-3');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('4', 'ruby la gi', '1', '1', '2', '2022-2-3');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('5', 'tac dung cua cc', '2', '2', '1', '2021-5-6');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('6', 'cc co chuc nang gi', '1', '2', '2', '2018-9-9');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('7', 'postman la gi', '4', '2', '1', '2019-5-6');
INSERT INTO `testing_system_assignment_1`.`question` (`QuestionID`, `Content`, `CategoryID`, `TypeID`, `CreatorID`, `CreateDate`) VALUES ('8', 'sql co tac dung gi', '3', '2', '5', '2018-6-6');

INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('1', 'ko', '1', 'sai');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('2', 'co', '2', 'Đúng');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('3', 'ko biet', '3', 'sai');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('4', 'ko sai', '4', 'Đúng');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('5', 'chua biet', '5', 'sai');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('6', 'dang tinh toan', '6', 'Đúng');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('7', 'dang suy nghi', '7', 'Đúng');
INSERT INTO `testing_system_assignment_1`.`answer` (`AnswerID`, `Content`, `QuestionID`, `isCorrect`) VALUES ('8', 'dang hoc ', '8', 'sai');

INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('1', 'a1', 'kho ', '1', '12:00:00', '1', '2022-2-3');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('2', 'a2', 'de', '5', '11:00:00', '8', '2022-2-3');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('3', 'a3', 'vua', '6', '11:00:00', '3', '2020-6-3');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('4', 'a4', 'rat kho', '2', '12:00:00', '6', '2020-6-3');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('5', 'a5', 'rat de ', '3', '11:00:00', '5', '2020-6-3');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('6', 'a6', 'vua phai', '1', '12:00:00', '6', '2022-2-3');
INSERT INTO `testing_system_assignment_1`.`exam` (`ExamID`, `Code`, `Title`, `CategoryID`, `Duration`, `CreatorID`, `CreateDate`) VALUES ('7', 'a7', 'tot', '2', '12:00:00', '7', '2020-6-3');

INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('1', '1', '1');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('2', '2', '1');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('3', '4', '1');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('4', '6', '1');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('5', '7', '7');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('6', '6', '4');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('7', '2', '6');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('8', '1', '4');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('9', '2', '5');
INSERT INTO `testing_system_assignment_1`.`examquestion` (`STT`, `ExamID`, `QuestionID`) VALUES ('10', '1', '2');
