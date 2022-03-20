-- question 1
select a.*,d.departmentname from `account` a
join department d
on a.DepartmentID=d.DepartmentID 
order by accountID;
 -- question 2 
select * from `account`
where CreateDate > '2010-12-20' ;
 
 
 -- question 3 
  
 select * from `account`
 join position 
 on `account`.positionID=position.positionID
 where positionname='dev';
 
 -- question 4 
select department.*,a.sl from (select departmentID,count(*) as sl from `account`
group by departmentID
having sl >=3) a
join department
on a.departmentID= department.departmentID; 

-- question 5 
select question.Content,a.* from (select max(sl),QuestionID from (select count(*)as sl,questionID from examquestion
group by QuestionID) a order by max(sl) desc) a
join question on
question.QuestionID=a.QuestionID;


 -- question 6 
select categoryquestion.*, a.sl from (select categoryId,count(*) as sl from question
group by categoryId) a
right join categoryquestion 
on categoryquestion.CategoryID=a.categoryID; 

-- question 7 

select question.questionID,question.content,a.sl from
 (select questionID,count(*) as sl from examquestion
group by QuestionID) a
right join question on a.questionID=question.questionId ;

-- question 8
select a.*,question.Content 
from 
(select max(ctt),questionID from (select questionID,count(*) as ctt from answer group by QuestionID ) a) a
join question on a.QuestionID=question.QuestionID ; 

-- question 9 
select a.*,`group`.GroupName from (select groupID,count(*) as slNG from groupaccount
group by groupID) a 
right join `group`
on `group`.GroupID=a.groupID ; 

-- question 10 
select count(*),p.PositionID from position p
join `account` a
on p.PositionID=a.PositionID
group by a.PositionID  
having count(*) = (select min(SL) from (select positionID,count(*) as SL from `account`
group by positionID) a);


-- question 11 
select a.DepartmentID,a.PositionID,d.DepartmentName,p.PositionName,count(*) from `account` a
join department d on a. DepartmentID=d.DepartmentID
join position p on p.PositionID = a.PositionID
group by a.DepartmentID,a.PositionID,d.DepartmentName,p.PositionName
order by d.DepartmentID ;

-- question 12 

select q.*,t.typeName,an.Content,a.Fullname from `question` q
 left join typequestion t on t.TypeID=q.TypeID 
 left join answer an on an.QuestionID=q.QuestionID
 left join `account` a on a.accountID=q.CreatorID; 
 
 -- question 13 
 select a.*,typequestion.typeName from (select count(typeID)as soluong,typeID from question
group by typeID) a
join typequestion on a.typeID=typequestion.TypeID;

-- question 14 
select `group`.* from `group` 
left join groupaccount on
`group`.GroupID=groupaccount.GroupID
where groupaccount.GroupID is null ;

-- question 15 

select `group`.* from `group` 
left join groupaccount on
`group`.GroupID=groupaccount.GroupID
where groupaccount.GroupID is null ;

-- question 16
select q.QuestionID,q.Content from question q
left join answer a
on q.QuestionID=a.QuestionID
where a.Content is null;

-- question 17 
-- cau a 
select `group`.GroupName,`account`.* from `group`
join `account`
on `account`.accountID=`group`.CreatorID
where `group`.GroupID=1;
-- cau b 
select `group`.GroupName,`account`.* from `group`
join `account`
on `account`.accountID=`group`.CreatorID
where `group`.GroupID=2; 
-- cau c 
select a.* from (select `group`.GroupName,`account`.* from `group`
join `account`
on `account`.accountID=`group`.CreatorID
where `group`.GroupID=1) a
union 
select b.* from 
(select `group`.GroupName,`account`.* from `group`
join `account`
on `account`.accountID=`group`.CreatorID
where `group`.GroupID=2) b; 

-- question 18
-- cau a 
select `group`.GroupName,a.* from 
(select count(distinct accountID)as sl,GroupID from groupaccount
group by GroupID
having sl > 5) a
join `group` on `group`.GroupID=a.groupID;
-- cau b
select `group`.GroupName,a.* from 
(select count(distinct accountID) as sl,GroupID from groupaccount
group by GroupID
having sl < 7) a
join `group` on `group`.GroupID=a.groupID;
-- cau c 

select aa.* from (select `group`.GroupName,a.* from 
(select count(distinct accountID)as sl,GroupID from groupaccount
group by GroupID
having sl > 5) a
join `group` on `group`.GroupID=a.groupID) aa
union 
select bb.* from (select `group`.GroupName,a.* from 
(select count(distinct accountID) as sl,GroupID from groupaccount
group by GroupID
having sl < 7) a
join `group` on `group`.GroupID=a.groupID) bb;







 
 
 
 
 
 
 
