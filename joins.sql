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