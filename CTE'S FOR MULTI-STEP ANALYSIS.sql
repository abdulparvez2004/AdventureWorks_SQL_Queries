--COMMON TABLE EXPRESSION (CTE).
--Think of a CTE as a temporary named result that you create first, and then use in your main query.
--Subqueries can solve many analytical problems, but nested queries can become difficult to read when several steps are involved.
--A Common Table Expression, or CTE, gives a temporary name to an intermediate result so the main query can work with it. 

--1.Create a product-level sales summary first, then return that summary. 
with ProductSummary as (
select
ProductID,
SUM(OrderQty) as TotalQty
from Sales.SalesOrderDetail
group by ProductID
)
select
ProductID,
TotalQty
from ProductSummary
order by TotalQty desc;
--The CTE establishes the product-level summary. The outer query decides how that summary should be presented. 
--2.Filtering a cte's result.
--Once the CTE has created a summary, the outer query can filter that summary. 
with ProductSummary as(
select 
ProductID,
SUM(OrderQty) as TotalUnits
from Sales.SalesOrderDetail
group by ProductID
)
select
ProductID,
TotalUnits
from ProductSummary
where TotalUnits > 1000
order by TotalUnits desc;

--3.CTE + CASE EXPERSSION.
with ProductSummary as (
select 
ProductID,
SUM(OrderQty) as TotalUnits
from Sales.SalesOrderDetail
group by ProductID
)
select
ProductID,
TotalUnits,
case 
when TotalUnits < 500 then 'Low Volume'
when TotalUnits < 1000 then 'Medium Volume'
else 'High Volume'
end as VolumeCategory
from ProductSummary
order by TotalUnits desc;
--The CTE calculates TotalUnits once. The outer query uses that calculated column in the CASE expression. 

--4.CTE'S + HAVING
--You can still use HAVING inside a CTE when the intermediate result itself should contain only groups meeting an aggregate condition. 
with ProductSummary as (
select
ProductID,
SUM(OrderQty) as TotalQty
from Sales.SalesOrderDetail
group by ProductID
having SUM(OrderQty) > 500
)
select
ProductID,
TotalQty
from ProductSummary
order by TotalQty desc;

--5.MULTIPLE CTE'S
with ProductSummary as (
select
ProductID,
SUM(OrderQty) as TotalUnits
from Sales.SalesOrderDetail
group by ProductID
),
HighVolumeProduct as (
select
ProductID,
TotalUnits
from ProductSummary
where TotalUnits > 1000
)
select
ProductID,
TotalUnits
from HighVolumeProduct
order by TotalUnits desc;
--The first CTE creates the summary. The second CTE filters that summary. The final SELECT presents the result. 
--Do not create multiple CTEs simply to make a query longer. Each step should represent a meaningful analytical stage.

--6. CTE for a Business Benchmark 
--A CTE can calculate a benchmark that is then used by the main query.
with PriceBenchmark as (
select
AVG(ListPrice) as Avg_listprice
from Production.Product
where ListPrice > 0
)
select
p.ProductID,
p.Name as ProductName,
p.ListPrice,
b.Avg_listprice
from Production.Product as p
cross join PriceBenchmark as b
where p.ListPrice > 0
order by p.ListPrice desc;

--BUSINESS PROBLEMS:
--1.Business question:
--The product manager wants to identify products whose ListPrice is higher than the average product price.
with AvgListprice as(
select
AVG(ListPrice) as Avg_price
from Production.Product
where ListPrice > 0
)
select
p.ProductID,
p.Name as ProductName,
p.ListPrice
--a.Avg_price
from Production.Product as p
cross join AvgListprice as a
where p.ListPrice > a.Avg_price;

--2.The product manager wants to know the average price for each product subcategory.
with SubcategoryPrices as (
select
ps.Name as SubcategoryName,
AVG(p.ListPrice) as AveragePrice
from Production.Product as p
inner join Production.ProductSubcategory as ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
where ListPrice > 0
group by ps.Name
)
select
SubcategoryName,
AveragePrice
from SubcategoryPrices
order by AveragePrice desc;

--3.Management wants to identify product subcategories where the average product price is greater than 500.
with SubcategoryPrice as (
select 
ps.Name as SubcategoryName,
AVG(p.ListPrice) as AveragePrice
from Production.Product as p
inner join Production.ProductSubcategory as ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
where p.ListPrice > 0
group by ps.Name
)
select 
SubcategoryName,
AveragePrice
from SubcategoryPrice
where AveragePrice > 500
order by AveragePrice desc;

--4.The inventory team wants to know how many products are available in each subcategory.
with ProductCount as (
select
ps.Name as ProductName,
COUNT(p.ProductID) as ProductCount
from Production.Product as p
inner join Production.ProductSubcategory as ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
group by ps.Name
)
select
ProductName,
ProductCount
from ProductCount
order by ProductCount desc;