use Testing_System_Assignment_1 ;
-- question 2 
SELECT 
    departmentName
FROM
    department;
    
-- question 3 
SELECT 
    departmentID
FROM
    department
WHERE
    departmentName = 'sale';
    
    -- question 4
    select * from `account` 
    where length(fullname)=(select max(length(fullname)) from `account` ); 
    
    -- question 5
    select * from `account` 
    where length(fullname)=(select max(length(fullname)) from `account` where departmentId = 3 ) and departmentID=3;
    
    -- question 6
    SELECT 
    groupname, createdate
FROM
    `group`
WHERE
    createdate <= '2019-12-20';
    
    -- question 7
    select questionID,count(questionID) from answer
    group by questionID 
    having count(questionID) >= 4
    order by questionID ;
    
    -- question 8
    select * from exam 
where duration >= '1:00:00' and CreateDate < '2019-12-20' ;

    -- question 9
    select groupname,createdate from `group` 
order by createdate desc limit 5;
        
    
    -- question 10
     select count(accountID) from `account`
where DepartmentID =  2; 

-- question 11
select * from `account`
where username like 'd%o' ;

-- question 12 
delete from exam 
  where createdate< '2019-12-20' ;
  
  -- question 13 
select questionID from question 
where content like 'cau hoi%' ;

delete from answer 
where	QuestionID=(select questionID from question 
where content like 'cau hoi%' );

delete from examquestion where  questionid = (select questionid from question where content like 'cau hoi%') ;

delete from question where content like 'cau hoi%' ;

-- question 14
update `account` 
set fullname = 'nguyen ba loc', email = 'loc.nguyenba@vti.com.vn' 
where accountID =5 ;
	
    -- question 15 
    update groupaccount
    set accountID =5
    where groupId=4 ;
    

