drop database lesson7 ;
create database lesson7 ;

use 	lesson7;
create table student 
( id int primary key auto_increment,
`name` varchar(100) ,
age tinyint ,
gender enum('nam','nu','chua dien') default 'chua dien'
);

create table `subject` 
( subjectID int primary key auto_increment,
subjectName varchar(100) unique key
); 

create table studensubject 
(STT int primary key auto_increment,
ID int   ,
subjectID int ,
mark float(2,1),
`date` date ,
foreign key (ID) references student(id)  ,
foreign key (subjectID) references `subject`(subjectID) 
);


INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('1', 'nam ', '18', 'nam');
INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('2', 'tuan', '17', 'nam');
INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('3', 'hoa', '16', 'nu');
INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('4', 'dat', '15', 'nam');
INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('5', 'hien', '17', 'nu');
INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('6', 'ngoc', '18', 'nam');
INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('7', 'duc', '16', 'nam');
INSERT INTO `lesson7`.`student` (`id`, `name`, `age`, `gender`) VALUES ('8', 'vu', '15', 'nam');


INSERT INTO `lesson7`.`subject` (`subjectID`, `subjectName`) VALUES ('1', 'toan');
INSERT INTO `lesson7`.`subject` (`subjectID`, `subjectName`) VALUES ('2', 'van');
INSERT INTO `lesson7`.`subject` (`subjectID`, `subjectName`) VALUES ('3', 'anh');
INSERT INTO `lesson7`.`subject` (`subjectID`, `subjectName`) VALUES ('4', 'ly');
INSERT INTO `lesson7`.`subject` (`subjectID`, `subjectName`) VALUES ('5', 'sinh');
INSERT INTO `lesson7`.`subject` (`subjectID`, `subjectName`) VALUES ('6', 'su');


INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('1', '1', '1', '6.28', '2020-12-2');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('2', '1', '3', '5.25', '2021-2-21');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('3', '1', '5', '3.21', '2022-3-5');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('4', '2', '1', '6.74', '2019-12-5');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('5', '2', '2', '8.59', '2018-2-15');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('6', '3', '4', '5.69', '2020-3-6');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('7', '6', '3', '7.63', '2019-3-12');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('8', '4', '4', '5.6', '2021-10-10');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('9', '7', '5', '9.3', '2019-2-20');
INSERT INTO `lesson7`.`studensubject` (`STT`, `ID`, `subjectID`, `mark`, `date`) VALUES ('10', '5', '3', '8.25', '2022-1-21');



select s.* from subject s  left join studensubject st on s.subjectID=st.subjectID
where st.subjectID is null;

select a.*,s.subjectName from (select count(*),subjectID from studensubject 
group by subjectID
having count(*) >=2) a 
join   `subject` s on a.subjectID=s.subjectID ;

select sb.* from studensubject st 
join `subject` sb on sb.subjectID=st.subjectID
group by st.subjectID
having count(*)>=2 ;

-- cau 3 
create view StudentInfo as
select st.subjectID,st.mark,st.`date`,hs.`name`,hs.age,mh.subjectName,hs.id,
case when gender = 'nam' then 'male'
when gender = 'nu' then 'female'
when gender = 'chua dien' then 'unknow'
else gender
end as gioi_tinh
 from  student hs
left join studensubject st on st.id=hs.id
left join subject mh on mh.subjectID=st.subjectID; 



-- cau 4 
-- a
delimiter $$
create trigger phu
before update on `subject` for each row 
begin 
update studensubject set subjectID=null where subjectID=old.subjectid;
end $$
delimiter ;
delimiter $$
create trigger SubjectUpdateID
after update on `subject` for each row 
begin 
update studensubject set subjectID=new.subjectid where subjectID is null;
end$$
delimiter ;

/* b Tạo trigger cho table StudentSubject có tên là StudentDeleteID:
Khi xóa data của cột ID của table Student, thì giá trị tương ứng với
cột StudentID của table StudentSubject cũng bị xóa theo  */

delimiter $$
create trigger StudentDeleteID
before delete on student for each row 
begin 
delete from  studensubject
where id= old.id ;
end$$
delimiter ;



-- cau 5 
delimiter $$
create procedure xoa_hs (in student_name varchar(100)) 
begin
delete from student 
where `name`=student_name;
if student_name = '*' then 
delete from student;
end if;
end $$
delimiter ;

https://drive.google.com/file/d/1jKEer_Z9gJDRukShauidhdCSjvErTvXT/view
