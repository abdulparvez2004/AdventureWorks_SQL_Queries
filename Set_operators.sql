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

--Business Scenerio's
--1.The sales manager wants a list of products that are either:price above 1000,price below 100
select
ProductID,
Name
from Production.Product
where ListPrice > 1000

UNION

select
ProductID,
Name
from Production.Product
where ListPrice < 100;
--2.The marketing team wants a list of products that are either:black or red.
select
ProductID,
Name
from Production.Product
where Color = 'Black'

UNION

select
ProductID,
Name
from Production.Product
where Color = 'Red';
--3.The company wants to combine:the customer whose persontype = 'sc' or 'in'.
select
BusinessEntityID,
PersonType
from Person.Person
where PersonType = 'SC'

UNION ALL

select
BusinessEntityID,
PersonType
from Person.Person
where PersonType = 'IN';
--4.
select
ProductID,
Name
from Production.Product
where ListPrice > 500

UNION ALL

select
ProductID,
Name
from Production.Product
where ListPrice > 1000;
--5.The product manager wants to identify products that satisfy both conditions:listprice > 1000 and color = 'Black'
select
ProductID,
Name,
Color,
ListPrice
from Production.Product
where ListPrice > 1000

INTERSECT

select
ProductID,
Name,
Color,
ListPrice
from Production.Product
where Color = 'Black';
--
select
ProductID,
Name,ListPrice
from Production.Product
where ListPrice > 500

INTERSECT

select
ProductID,
Name,ListPrice
from Production.Product
where ListPrice > 1000;
--7.The marketing team wants products that:price > 1000 and are not black.
select
ProductID,
Name as ProductName,Color
from Production.Product
where ListPrice > 1000

EXCEPT

select
ProductID,
Name as ProductName,
Color
from Production.Product
where Color = 'Black';
--8.Products above $500 but not above $1,000
select
ProductID,
Name as ProductName,ListPrice
from Production.Product
where ListPrice > 500

EXCEPT

select
ProductID,
Name as ProductName,ListPrice
from Production.Product
where ListPrice > 1000;
--9.Analytics Question:Find all unique products targeted by either campaign.
select
ProductID,
Name as ProductName,ListPrice,Color
from Production.Product
where ListPrice > 1000

INTERSECT

select
ProductID,
Name as ProductName,ListPrice,Color
from Production.Product
where Color = 'Black';

--10.Products targeted by both campaigns
select
ProductID,
Name as ProductName,ListPrice,Color
from Production.Product
where ListPrice > 1000

UNION ALL

select
ProductID,
Name as ProductName,ListPrice,Color
from Production.Product
where Color = 'Black';

--11.Products targeted only by Campaign A
select
ProductID,
Name as ProductName,ListPrice,Color
from Production.Product
where ListPrice > 1000

EXCEPT

select
ProductID,
Name as ProductName,ListPrice,Color
from Production.Product
where Color = 'Black';