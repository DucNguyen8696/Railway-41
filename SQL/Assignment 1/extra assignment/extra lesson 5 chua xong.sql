USE `adventureworks`;
-- exercise 1 
-- question 1
select product.`name` from  product
where ProductSubcategoryID=(select ca.ProductsubCategoryID from productsubcategory ca
where `name` = 'saddles');

-- question 2 
select p.`name` from  (select ca.ProductsubCategoryID from productsubcategory ca
where `name` like  'bo%') abc
join
product p on abc.ProductsubCategoryID=p.ProductsubCategoryID;

-- question 3 
select `name` from product
where ListPrice=( 
select min(ListPrice) from product
where ProductSubcategoryID=3) ;

-- exercise 2 
-- question 1 
 select c.`name`,s.`name` from countryregion c
join stateprovince s on c.CountryRegionCode=s.CountryRegionCode;

-- question 2

select c.`name`,s.`name` from countryregion c
join stateprovince s on c.CountryRegionCode=s.CountryRegionCode
where c.`name` in ('germany','canada');

-- question 3 
select salesperson.salespersonID,salesperson.bonus,salesperson.salesytd,a.* from salesperson
 join (select SalesOrderID ,OrderDate,SalesPersonID as BusinessEntity from salesorderheader
where OnlineOrderFlag=0) a
on a.BusinessEntity=SalesPerson.SalesPersonID

-- question 4 




 
 
 