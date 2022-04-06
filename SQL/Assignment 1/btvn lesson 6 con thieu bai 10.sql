-- question 1 

delimiter $$
create procedure phong_ban(in ten_phong_ban varchar(100) )
begin
	select a.* from `account` a
	join department d on a.departmentID=d.departmentID
	where d.departmentname=ten_phong_ban;
end $$
delimiter ;

-- question 2 
delimiter $$
create procedure song_moi_gr( )
begin
	select a.soluong,gr.GroupName from 
		(select count(*) as soluong ,GroupID 
		from groupaccount
		group by GroupID) a 
	join `group` gr 
		on a.groupID=gr.GroupID;
end $$
delimiter ;

-- question 3 
delimiter $$
create procedure so_CH_trong_thang()
begin
	select ha.*,ty.typeName from 
		(select count(*) as soluong,typeID 
        from 
			(select typeID,CreateDate 
			from question
			where  
            year(createdate)=year(now()) and month(createdate)=month(now())) a
		group by TypeID) ha
	join typequestion ty on ty.typeID=ha.typeID;
end $$
delimiter ;

-- question 4 
delimiter $$
create procedure ID_nhieu_CH_nhat (out idLoaiCH int)
begin
	select typequestion.typeID into idLoaiCH 
    from 
		(select count(*) as sl,typeID from question
		group by typeID 
		order by sl desc limit 1) a
	join typequestion on a.typeID=typequestion.TypeID;
end $$
delimiter ;
-- cach khac 
delimiter $$
create function abc () returns int
begin
	declare id int;
	select typeID into ID 
    from 
    (select count(*) as sl,TypeID from question 
	group by TypeID 
    order by sl desc limit 1) a;

	return ID;
 end $$
 delimiter ;




-- question 5 
set @idLoaiCH = 0;
call testing_system_assignment_1.ID_nhieu_CH_nhat(@idLoaiCH);
select @idLoaiCH;

select typename from typequestion 
where typeID=@idLoaiCH;
--  cach khac 
delimiter $$
create procedure Name_ID_nhieu_CH_nhat (out Loai_CH enum('essay','Mutiple-Choice'))
begin
	select typequestion.typeName into Loai_CH 
    from 
		(select count(*) as sl,typeID 
		from question
		group by typeID 
		order by sl desc limit 1) a
	join typequestion on a.typeID=typequestion.TypeID;
end $$
delimiter ;
-- cach khac
delimiter $$
create function def () returns enum('essay','Mutiple-Choice')
begin
	declare Ten enum('essay','Mutiple-Choice');
	select typequestion.typeName into Ten  
		from (select count(*) as sl,typeID 
			from question
			group by typeID 
			order by sl desc limit 1) a
	join typequestion on a.typeID=typequestion.TypeID;
	return Ten;
end $$
delimiter ;

-- question 6
delimiter $$
create procedure tim_ten (in ten_in varchar(200))
begin
	select username  from `account`
	where username like concat('%',ten_in,'%')
		union all
	select groupname  from `group`
	where groupname like  concat('%',ten_in,'%');
end $$
delimiter ;

-- question 7
delimiter $$
create procedure nhap_account (in fullname_vao varchar(70),in email_vao varchar(255))
begin
	declare email_bien varchar(255);
	declare position_vao int;
	select positionID into  position_vao from position
		where PositionName='dev';

	select substring_index(email_vao,'@',1) into email_bien;
	insert into `account`(email,username,fullname,departmentID,PositionID,createdate) 	
    values 				(email_vao,email_bien,fullname_vao,null,position_vao,now());

end  $$

-- question 8
delimiter $$
create procedure thong_ke_CH(in kieu_CH enum('Essay','Mutiple-Choice'))
begin 
	select question.content,typequestion.typeName 	
    from question 
    join typequestion on question.TypeID=typequestion.typeID
	where length(content)=(select max(length(content)) from question
	where TypeID=1) and typequestion.typeName=kieu_CH
		union all
	select question.content,typequestion.typeName   from question join typequestion on question.TypeID=typequestion.typeID
	where length(content)=(select max(length(content)) from question
	where TypeID=2) and typequestion.typeName=kieu_CH
;
end $$ 
delimiter ;

-- question 9 
delimiter $$
create procedure Xoa_exam (in ID int)
begin 
	delete from examquestion where examID=ID ;
	delete from exam where examID=ID;
end $$
delimiter ;

-- question 10
select ExamID  from exam
where createdate <(select date_sub(now(),interval 3 year));




-- question 11
delimiter $$
create procedure xoa_phong_ban(in ten_phong_ban varchar(100))
begin
	update `account`
	set departmentID = null 
	where departmentID= 
    (select departmentID from department where DepartmentName = ten_phong_ban);
	delete from department
	where DepartmentName = ten_phong_ban;
end$$
delimiter ;

-- question12
delimiter $$
create procedure CH_tao_moi_thang ()
begin 
	with cte as(
			select 1 as month 
union all  	select 2 as month
union all 	select 3 as month
union all 	select 4 as month
union all 	select 5 as month
union all 	select 6 as month
union all 	select 7  as month
union all 	select 8 as month
union all 	select 9 as month
union all 	select 10 as month
union all 	select 11 as month
union all 	select 12 as month)

	select * from 
    (select count(*) as so_CH_tao,month(CreateDate) as thang_tao  
    from question
	where year(createdate)=year(now())
	group by month(createdate)) da
	right join cte on da.thang_tao=cte.month;
end $$
delimiter ;

-- question 13 
delimiter $$
create procedure CH_6_thang_gan_nhat ()
begin
with cte as (
		  select month(date_sub(now(),interval 5 month)) as thang
union all select month(date_sub(now(),interval 4 month))
union all select month(date_sub(now(),interval 3 month))
union all select month(date_sub(now(),interval 2 month))
union all select month(date_sub(now(),interval 1 month))
union all select month(date_sub(now(),interval 0 month)))

	select cte.*,dl.createdate,
	case when dl.so_CH_tao is null then 'ko co cau hoi nao trong thang'
		else dl.so_CH_tao
		end as so_CH_tao
	from 
    (select count(*) as so_CH_tao,month(CreateDate) as thang_tao ,CreateDate  
    from question
	where createdate > (select date_sub(now(),interval 6 month))
	group by month(CreateDate)) dl
right join cte
	on dl.thang_tao=cte.thang ;
end $$
delimiter ;














