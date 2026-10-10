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
--5.Derived Table + Filtering the Summary
select
ProductID,
TotalUnits
from
(
select
ProductID,
SUM(OrderQty) as TotalUnits
from Sales.SalesOrderDetail
group by ProductID
) as ProductSummary
where TotalUnits > 1000
order by TotalUnits desc;
--6.Subquery in SELECT
select
ProductID,
ListPrice,
(select
AVG(ListPrice) as Avg_price
from Production.Product
where ListPrice > 0
) as AvgListPrice
from Production.Product
where ListPrice > 0;
--7.Comparing Each Product with the Overall Average 
--The benchmark can be turned into a business classification. 
select
ProductID,
Name as ProductName,
ListPrice,
case
when ListPrice > (
select AVG(ListPrice) 
from Production.Product
where ListPrice > 0) then 'Above Average'
else 'At Average Or Below Average'
end as pricePosition
from Production.Product
where ListPrice > 0;
--This combines three ideas already learned: subquery, CASE and filtering.

--8. Derived Table for a Business Summary 
--Suppose the sales team wants products whose total ordered quantity is above 500, along with a simple volume label. 

SELECT 
    ProductID, 
    TotalUnits, 
    CASE 
        WHEN TotalUnits < 1000 THEN 'Medium Volume' 
        WHEN TotalUnits < 5000 THEN 'High Volume' 
        ELSE 'Very High Volume' 
    END AS VolumeCategory 
FROM ( 
    SELECT 
        ProductID, 
        SUM(OrderQty) AS TotalUnits 
    FROM Sales.SalesOrderDetail 
    GROUP BY ProductID 
) AS ProductSummary 
WHERE TotalUnits > 500 
ORDER BY TotalUnits DESC; 

--Business Scenerios:
--Business scenario: A retail manager wants to identify products priced higher than the average positive product price.
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ListPrice > (
select
AVG(ListPrice)
from Production.Product
where ListPrice > 0
)
order by ListPrice desc;

--2.Business scenario: A product manager wants to find which product or products have the highest list price.
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ListPrice = (
select
MAX(listprice)
from Production.Product
where ListPrice > 0
)
order by ListPrice desc;
--3.The sales team wants to find orders whose total due is above the average order total.
select
SalesOrderID,
OrderDate,
TotalDue
from Sales.SalesOrderHeader
where TotalDue > (
select
AVG(TotalDue) as Totaldue
from Sales.SalesOrderHeader
)
order by TotalDue desc;

--4.Business scenario: The inventory team wants to distinguish products that have actually appeared in sales order details.
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ProductID in (
select
ProductID
from Sales.SalesOrderDetail
)
order by Name asc;

--5.Business scenario: The product team wants to identify products that have no matching sales-detail record.
select
ProductID,
Name as ProductName,
ListPrice
from Production.Product
where ProductID not in (
select
ProductID
from Sales.SalesOrderDetail
)
order by Name asc;

--6.Business scenario: Marketing wants a list of customers who have made at least one sales order.
select
CustomerID
from Sales.Customer
where CustomerID in (
select
CustomerID
from Sales.SalesOrderHeader
)
order by CustomerID

--7.Business scenario: Comparing all products against one overall average may be misleading.
--A manager wants to compare each product with other products in its own category
select
p1.ProductID,
p1.Name as ProductName,
p1.ProductSubcategoryID,
p1.ListPrice
from Production.Product as p1
where p1.ProductSubcategoryID is not null
and p1.ListPrice > (
select
AVG(p2.ListPrice)
from Production.Product as p2
where p2.ProductSubcategoryID = p1.ProductSubcategoryID
and p2.ListPrice > 0
)
order by p1.ProductSubcategoryID,
p1.ListPrice