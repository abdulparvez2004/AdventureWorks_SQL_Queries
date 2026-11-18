-- Windows Function Fundamentals
--It performs calculations across multiple rows without removing individual rows from the result.

--Windows Function VS Group by
--suppose you want total quantity sold by product.
select
sod.ProductID,
SUM(OrderQty) as TotalQty
from Sales.SalesOrderDetail as sod
group by ProductID
order by ProductID desc;
--the group by return one row per product.the detail rows are collapsed into the grouped result.

--windows fucntion can calculate a value while retaining the rows being analysed.
select
sod.ProductID,
sod.OrderQty,
SUM(OrderQty) over() as OverallQty
from Sales.SalesOrderDetail as sod

--2.OVER(): "Look at these rows and perform the calculation without removing the original rows."
select
p.Name,
p.ListPrice,
AVG(ListPrice) over() as AveragePrice
from Production.Product as p
where p.ListPrice > 0
order by p.ListPrice desc;
