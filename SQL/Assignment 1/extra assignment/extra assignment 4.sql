-- question 1
create database assignment4 ;
use assignment4 ;
create table department
 (
department_number int primary key auto_increment,
department_name varchar(70)
);

create table employee_table 
(
employee_number int primary key auto_increment,
employee_name varchar(70),
department_number int ,
foreign key (department_number) references department(department_number) 
);

create table employee_skill_table 
(
stt int primary key auto_increment ,
employee_number int,
skill_code varchar(20),
data_registered varchar(20),
foreign key (employee_number) references employee_table(employee_number)
);


-- question 2 

INSERT INTO `assignment4`.`department` (`department_number`, `department_name`) VALUES ('1', 'thong tin');
INSERT INTO `assignment4`.`department` (`department_number`, `department_name`) VALUES ('2', 'tuyen dung');
INSERT INTO `assignment4`.`department` (`department_number`, `department_name`) VALUES ('3', 'chien luoc');
INSERT INTO `assignment4`.`department` (`department_number`, `department_name`) VALUES ('4', 'ban hang');
INSERT INTO `assignment4`.`department` (`department_number`, `department_name`) VALUES ('5', 'tu van');
INSERT INTO `assignment4`.`department` (`department_number`, `department_name`) VALUES ('6', 'giam doc');


INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('1', 'nguyen van dat', '1');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('2', 'phan van quang', '5');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('3', 'do tien dung ', '4');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('4', 'ngo dinh trong', '1');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('5', 'phan van duc', '3');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('6', 'ngo tan tai', '2');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('7', 'vo van hai', '1');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('8', 'mai xuan huy', '5');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('9', 'tran van tu', '4');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('10', 'ngo ba chau', '6');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('11', 'phan van tai em', '1');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('12', 'tran huy chien', '2');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('13', 'mai tien chung', '3');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('14', 'vo tan tai', '5');
INSERT INTO `assignment4`.`employee_table` (`employee_number`, `employee_name`, `department_number`) VALUES ('15', 'phan quang bach', '2');

INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('1', '6', 'java', 'ios');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('2', '2', 'sql', 'androi');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('3', '1', 'php', 'Window');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('4', '2', 'cc', 'ios');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('5', '4', 'php', 'mac');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('6', '13', 'php', 'Window');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('7', '12', 'sql', 'mac');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('8', '5', 'java', 'mac');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('9', '3', 'cc', 'mac');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('10', '11', 'sql', 'Window');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('11', '7', 'cc', 'ios');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('12', '10', 'cc', 'mac');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('13', '9', 'java', 'mac');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('14', '5', 'php', 'androi');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('15', '9', 'sql', 'Window');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('16', '8', 'java', 'androi');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('17', '10', 'php', 'ios');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('18', '7', 'sql', 'androi');
INSERT INTO `assignment4`.`employee_skill_table` (`stt`, `employee_number`, `skill_code`, `data_registered`) VALUES ('19', '11', 'java', 'ios');


-- question 3
select a.*,employee_table.employee_name from
(select skill_code,employee_number from employee_skill_table
where skill_code='java') a
join employee_table on a.employee_number=employee_table.employee_number;

-- question 4
select department.department_name,a.* from 
(select department_number,count(*) from employee_table
group by department_number
having count(*) >3) a
join department on a.department_number=department.department_number;

-- question 5 
select department.*,employee_table.employee_number,employee_table.employee_name from department
join employee_table
on department.department_number=employee_table.department_number
group by department.department_number,department.department_name,employee_table.employee_number;

-- question 6 
select a.* ,employee_table.employee_name from 
(select count( *),employee_number from employee_skill_table
group by employee_number
having count(*) >1) a
join employee_table on a.employee_number=employee_table.employee_number



