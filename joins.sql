--inner join 
--Let's connect Sales.SalesOrderDetail with Production.Product. Both tables contain ProductID.
select
sod.SalesOrderID,
sod.ProductID,
p.Name as ProductName,
sod.OrderQty,
sod.UnitPrice
from Sales.SalesOrderDetail as sod
inner join Production.Product as p
on sod.ProductID = p.ProductID
where sod.OrderQty >= 10
order by sod.OrderQty desc;
--Multiple table join
select top 1 * from Sales.SalesOrderHeader
select top 1 * from Sales.SalesOrderDetail
select top 1 * from Production.Product

select
soh.SalesOrderID,
soh.OrderDate,
p.Name as ProductName,
sod.OrderQty,
sod.UnitPrice
from Sales.SalesOrderHeader as soh
inner join Sales.SalesOrderDetail as sod
on soh.SalesOrderID = sod.SalesOrderID
inner join Production.Product as p
on sod.ProductID = p.ProductID
order by SalesOrderID, UnitPrice desc;
--Write an INNER JOIN between Sales.SalesOrderDetail and Production.Product that returns: 
select
sod.SalesOrderID,
p.ProductID,
p.Name as ProductName,
sod.OrderQty,
sod.UnitPrice
from Sales.SalesOrderDetail as sod
inner join Production.Product as p
on sod.ProductID = p.ProductID
where sod.UnitPrice > 1000;
--A sales manager wants to identify the products that appear in high-value order lines.
--SalesOrderID ,ProductID ,Product name ,Order quantity ,Unit price.
select
sod.SalesOrderID,
p.ProductID,
p.Name as ProductName,
sod.OrderQty,
sod.UnitPrice
from Sales.SalesOrderDetail as sod
inner join Production.Product as p
on sod.ProductID = p.ProductID
where sod.UnitPrice > 1000
order by sod.UnitPrice desc;

--A LEFT JOIN keeps every row from the left table. If SQL Server cannot,
--find a matching row in the right table, columns from the right table contain NULL. 
select
p.ProductID,
p.Name as ProductName,
sod.SalesOrderID,
sod.OrderQty
from Production.Product as p
left join Sales.SalesOrderDetail as sod
on p.ProductID = sod.ProductID;
--left join with where.
select 
p.ProductID,
p.Name,
sod.UnitPrice
from Production.Product as p
left join Sales.SalesOrderDetail as sod
on p.ProductID = sod.ProductID
where sod.UnitPrice > 1000;
--The product team wants a complete product list, including products that have never appeared in a sales-order detail record. 
select
p.ProductID,
p.Name,sod.ProductID --this show all null values 
from Production.Product as p
left join Sales.SalesOrderDetail as sod
on p.ProductID = sod.ProductID
where sod.ProductID is null;

--Right join keeps every rows from right table and matching rows from the left table if not match make value to null.
select
p.ProductID,
p.Name,
sod.OrderQty,
sod.UnitPrice
from Sales.SalesOrderDetail as sod
right join Production.Product as p
on sod.ProductID = p.ProductID
where sod.OrderQty is  null;
--Join using Top
SELECT TOP 20 
    h.SalesOrderID, 
    h.OrderDate, 
    d.ProductID, 
    p.Name AS ProductName, 
    d.OrderQty 
FROM Sales.SalesOrderHeader AS h 
INNER JOIN Sales.SalesOrderDetail AS d 
    ON h.SalesOrderID = d.SalesOrderID 
INNER JOIN Production.Product AS p 
    ON d.ProductID = p.ProductID 
ORDER BY h.OrderDate DESC; 
--Filtering After a join.
select
h.SalesOrderID,
h.OrderDate,
p.Name as ProductName,
d.OrderQty
from Sales.SalesOrderHeader as h
inner join Sales.SalesOrderDetail as d
on h.SalesOrderID = d.SalesOrderID
inner join Production.Product as p
on d.ProductID = p.ProductID
where h.OrderDate = '2014-01-01'; --filter using order date.
--self join returns the pair of product id's.
select
a.ProductID,
b.ProductID
from Production.Product as a
inner join Production.Product as b
on a.ProductID <> b.ProductID
--start from 115.