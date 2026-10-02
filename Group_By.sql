--Introduction To Group By.
--GROUP BY changes the level of detail of the result. Instead of returning individual rows,
--SQL Server can produce one result row for each group.
select
Color,
COUNT(*) as ProductCount
from Production.Product
where color is not null
group by Color
order by ProductCount desc;
--Now one row represents a color group rather than one product. 

--Having Filtering Groups
--where filters individual rows,while having filters groups after group by
select
Color,
COUNT(*) as ProductCount
from Production.Product
where Color is not null
group by Color
having COUNT(*) >= 5
order by ProductCount desc;
--here where removes rows without a color,group by creates color groups,
--having keeps only groups containg atlest 5 or greater.

--Hands on - practice
--1.Display the 10 products with the highest ListPrice. 
select top 10
ProductID,
Name as ProductName,
ListPrice
from Production.Product
order by ListPrice desc;
--2.Which unique colors are represented in the catalogue? 
select distinct
Color
from Production.Product
where Color is not null;
--3.How many products exist for each color? 
select
Color,
COUNT(*) as ProductCount
from Production.Product
where Color is not null
group by Color
order by ProductCount desc;
--4.Which colors have at least five products? 
select
Color,
COUNT(*) as ProductCount
from Production.Product
where Color is not null
group by Color
having COUNT(*) >= 5
order by ProductCount desc;
--5.Which products cost between 500 and 1,500?
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ListPrice Between 500 AND 1500
order by ListPrice asc;


--Aggregation Functions.
--Most business questions are not answered by looking at one row at a time.
--An analyst is often asked to calculate a total, average, minimum, maximum, or count. 
--1.COUNT() - How many?
select
COUNT(*) as ProductCount
from Production.Product
--The alias ProductCount gives the result a business-friendly column name.

--2.COUNT(COLUMN_NAME)
select
COUNT(*) as TotalCount,
COUNT(color) as ProductWithColor
from Production.Product;

--3.Sum() - Adding Business value
select
SUM(orderqty) as TotalUnits
from Sales.SalesOrderDetail;
--4.
select
SUM(orderqty) as TotalUnits
from  Sales.SalesOrderDetail
where ProductID = 776;
--5.Avg()- Understanding the typical value.
select
AVG(listprice) as Avg_listprice
from Production.Product
where ListPrice > 0;
--6.max(),min()
select
MAX(listprice) as Max_listprice,
MIN(listprice) as Min_listprice
from Production.Product
where ListPrice > 0;
--7.Multiple Aggregations
select
COUNT(*) as ProductCount,
AVG(listprice) as Avg_listprice,
MAX(listprice) as Max_listprice,
MIN(listprice) as Min_listprice
from Production.Product
where ListPrice > 0;