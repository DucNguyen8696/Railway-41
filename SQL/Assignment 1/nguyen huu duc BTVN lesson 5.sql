-- question 1
create view View_sale as
select  a.*,d.DepartmentName from `account` a
join department d on a.DepartmentID=d.DepartmentID
where DepartmentName='sale';

-- question 2 
create or replace view view_2 as
select a.*,g.GroupID,g.Joindate,count(*) from groupaccount g
join  `account` a on  g.AccountID=a.accountID
group by a.accountID 
having  count(*)=(
select max(sl) from
(select count(*) as sl,accountID from groupaccount 
group by AccountID ) a);

-- question 3 

create or replace view view_3 as 
select length(content),Content,QuestionID from question
where length(content)>=15;
drop view view_3;



-- question 4
create or replace view view_4 as 
select count(*) as slnv,department.DepartmentName from `account`
join department on `account`.departmentID=department.departmentId
group by `account`.departmentID 
having count(*)=(
select max(sl) from (
select count(*)as sl,departmentID from `account`
group by DepartmentID) a);
 
 -- question 5
 create  view view_5 AS
 select q.questionID,a.* from question  q
join `account` a on q.creatorID=a.accountID
where  fullname like 'nguyen%';
