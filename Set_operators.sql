--Set Operators — Combining and Comparing Query Results.
--Set operators allow SQL Server to combine or compare the results of two SELECT statements.
--Instead of joining columns from related tables, set operators work with the rows returned by separate queries.
--types:
--1.UNION - It combine the rows and remove the duplicates.
--2.UNION ALL- It combine the rows and keeps all rows including duplicates.
--3.INTERSECT- It combines the rows and keeps the duplicates only.
--4.EXCEPT - Return rows from the first query that do not exist in the second query.
select
ProductID,
Name as ProductName
from Production.Product
where ListPrice > 1000

UNION

select
ProductID,
Name as ProductName
from Production.Product
where Color = 'Black';

--2.Union All.- this will show all values and keep all duplicated values also.
select
ProductID,
Name as ProductName
from production.Product
where ListPrice > 1000

UNION ALL

select
ProductID,
Name as ProductName

from Production.Product 
where Color = 'Black';

--Intersect - this will show the duplicate rows (unique).
select
ProductID,
Name as ProductName
from Production.Product
where ListPrice > 1000

INTERSECT

select
ProductID,
Name as ProductName
from Production.Product
where Color = 'Black'

--Except - this will result the first query rows but not in second query rows.
select
ProductID,
Name as ProductName
from Production.Product
where ListPrice > 1000

EXCEPT

select
ProductID,
Name as ProductName
from Production.Product
where Color = 'Black'

--Analyst Pattern to write a code:
--SELECT ... 
--FROM ... 
--WHERE ... 
--GROUP BY ... 
--HAVING ... 
--UNION / UNION ALL / INTERSECT / EXCEPT ... 
--ORDER BY ...;

select top 4 * from Production.Product

--Business Challenge
select top 15
ProductID,
Name as ProductName,
ListPrice as ProductPrice
from Production.Product
where ListPrice > 1000
order by ProductPrice desc;
