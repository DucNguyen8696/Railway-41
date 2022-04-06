use Extra_assignment1_2 ;
-- question 1 
insert into trainee(TraineeID,Full_Name,Birth_Date,Gender,ET_IQ,ET_Gmath,ET_English,Training_Class,Evaluation_Notes,VTI_Account)
values 		
		('1','nguyen van tuan','1995-6-5','male','10','15','31','RW31','cham chi ','tuannguyenvan@vti.com'),
		('2','phan van nam','1999-9-5','male','13','16','22','RW42','luoi bieng ','toicodon@vti.com'),
		('3','pham anh tuan','1990-12-5','female','19','11','40','RW3','thong minh','giotlebuon@vti.com'),
		('4','nguyen huu vu','1992-11-5','male','11','16','36','RW11','tot bung ','namthangqua@vti.com'),
		('5','vu van tai','1993-3-5','male','12','8','19','RW22','pha phach','colen@vti.com'),
		('6','tran van hai','1999-6-5','female','4','10','32','RW21','dot nat ','sangancom@vti.com'),
		('7','ngo viet anh','1989-8-5','male','16','8','30','RW61','cham chi ','omoinoi@vti.com'),
		('8','nguyen bao chau','2000-7-5','female','7','16','42','RW11','hien lanh ','hanamninh@vti.com'),	
        ('9','nguyen van toan','1996-2-5','male','2','15','35','RW21','chiu kho','khocthatnhieu@vti.com'),
        ('10','trinh van quyet','1998-1-5','male','13','10','15','RW18','tot','niemvuinho@vti.com'),
        ('11','ngo chi dat','1997-3-5','female','19','12','18','RW31','ngoan ngoan ','hatdauxanh@vti.com'),
        ('12','phan van hai','1990-4-5','male','18','17','20','RW68','vo le','quarocket@vti.com'),
        ('13','nguyen huu duc','1996-8-5','male','16','16','21','IT31','cham chi ','boemgiau@vti.com'),
        ('14','nguyen bao tuan','1995-10-5','female','10','11','32','NO31','nang dong ','nhakocho@vti.com'),
        ('15','ngo tat dat','1993-12-5','male','11','14','16','RW33','vui ve','toitengi@vti.com'),
        ('16','nguyen van thanh','1991-6-5','male','16','13','20','IT31','hoa dong','quaotxanh@vti.com'),
        ('17','nguyen thi hoai','1996-7-5','female','5','15','25','OD31','tot bung','taongot@vti.com'),
        ('18','nguyen thi xuan','1999-2-5','female','7','5','29','RW36','chiu kho','xuanvotu@vti.com');


-- question 2
select Full_Name from trainee 
group by Birth_Date ;

-- question 3 
select * from trainee
where traineeID = (select max(length(full_name)) from trainee );

-- question 4 
select * from trainee
group by TraineeID
having ET_IQ+ET_Gmath >= 20 and ET_IQ >= 8 and ET_Gmath>=8 and ET_English>=18
order by traineeID ;


-- question 5
delete from trainee where traineeid =3 ;


-- question 6 .
update trainee set training_class =2 
where traineeID =5 ;
