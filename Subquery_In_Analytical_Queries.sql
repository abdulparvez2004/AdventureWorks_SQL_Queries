--subquery is one query is written inside another query.
--1.Show me products whose price is higher than the average price of all products that have a price greater than 0
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ListPrice > (--this will check listprice greater than 438
select AVG(ListPrice)--the avg of listprice is 438 
from Production.Product
where ListPrice > 0
)
order by ListPrice desc;
--2. Subquery with IN – Membership Analysis.
--Which products appear in the sales-order-detail data?
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ProductID in(
select ProductID
from Sales.SalesOrderDetail
)
--3. Combining IN with Additional Conditions.
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ProductID in(
select ProductID 
from Sales.SalesOrderDetail
) And ListPrice > 1000
order by ListPrice desc;
--4. Subquery in the FROM Clause.
--The inner query first creates a product-level summary. The outer query then treats that summary as a table. 
--The alias ProductSummary is required because SQL Server needs a name for the derived table.
select
ProductID,
TotalQty
from (
select 
ProductID,
SUM(OrderQty) as TotalQty
from Sales.SalesOrderDetail
group by ProductID
) as ProductSummary;