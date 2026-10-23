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
