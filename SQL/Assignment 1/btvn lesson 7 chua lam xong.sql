-- question 1 
delimiter $$
create trigger ko_cho_nhap_gr
before insert on groupaccount for each row
begin 

if new.GroupID in (select groupID   from `group`
where createdate < (select date_sub(now(),interval 1 year))) then signal sqlstate '10000' set message_text = 'ko nhap vao group nay';
end if ;
end $$
delimiter ;

-- question 2 
delimiter $$
create trigger ko_cho_nhap_sale 
before insert on `account` for each row
begin 
if new.departmentID = (select departmentID from department
where DepartmentName='sale') then signal sqlstate '10000' set message_text='ko cho nhap user sale';
end if ;
end $$
delimiter ; 

-- question 3 
delimiter $$
create trigger group_da_du_5ng 
before insert on groupaccount for each row
begin
if new.groupID in (select groupID from groupaccount
group by GroupID 
having count(*) >=5) then signal sqlstate '10000' set message_text = 'da du 5 ng';
end if;
end $$
delimiter ;

-- question 4
delimiter $$
create trigger ko_nhap_qs_10_cau_hoi 
before insert on examquestion for each row
begin
declare qs_10cau int;
select examID into qs_10cau from examquestion
group by examID
having count(*) >=10 ;
if new.ExamID=qs_10cau then signal sqlstate '10000' set message_text = 'qs da du 10 cau hoi';
end if ;
end $$
delimiter ;

-- question 5 

delimiter $$
create trigger ko_xoa_admin 
before delete on `account` for each row
begin 
if old.email = 'admin@gmail.com' then
signal sqlstate '10000' set message_text = 'chi admin moi dc xoa user nay';
end if;
end $$
delimiter ; 

-- question 6
insert into department(departmentname) values ('waiting department');
delimiter $$
create trigger phong_ban_cho 
 before insert on `account` for each row 
 begin  
 declare ID_phong_cho int;
  select departmentID into ID_phong_cho  from department 
 where departmentname='waiting department'; 
 if (new.departmentID is null) then
 set new.departmentID = ID_phong_cho;
 end if; 
 end $$
 delimiter ;
 
 -- question 7 
 delimiter $$
create trigger answer_4_cai_2_dung 
before insert on answer for each row 
begin 
declare ko_dc_qua_4_cai int ;
declare ko_dc_2_dung int ;
select questionID into ko_dc_qua_4_cai  from answer
group by QuestionID
having count(*)>=4;
select questionID into ko_dc_2_dung from (select * from answer
where isCorrect='đúng') a
group by QuestionID
having count(*)>=2;
if new.QuestionID in (ko_dc_qua_4_cai,ko_dc_2_dung) then signal sqlstate '10000' set message_text = 'answer da du 4 cau va du 2 cau dung';
end if;
end $$
delimiter ;

-- question 8
 
 
 -- question 9
 delimiter $$
create trigger ko_xoa_bai_thi_2ngay
before delete on  exam for each row 
begin
if old.createdate>(select date_sub(now(),interval 2 day))then signal sqlstate  '10000' 
set message_text = 'ko xoa dc vi moi tao 2 ngay' ;
end if;
end $$
delimiter ; 

-- question 10 
delimiter $$
create trigger k_cho_update_qs
before update on question for each row
begin 
declare ad int;
set ad=0 ;
SELECT count(*) into ad FROM examquestion
where QuestionID=new.QuestionID;
if  (ad!=0)  then signal sqlstate '10000' set message_text='ko dc update vi chua co ';
end if;
end $$
delimiter ;



delimiter $$
create trigger k_cho_xoa_qs
before delete on question for each row
begin
 declare iu int;
 SELECT count(*) into iu FROM examquestion
where QuestionID=old.QuestionID;
if (iu!=0) then signal sqlstate '10000' set message_text='ko d xoa qs ';
end if;
end $$
delimiter ;

-- question 12
select examid,code,title,categoryID,duration,creatorID,createdate,
case when duration <= '00:30:00' then 'short time'
when duration <= '01:00:00' and duration >'00:30:00' then 'medium time'
when duration > '01:00:00' then 'long time'
else duration
end as time_loai
from exam

-- question 13


