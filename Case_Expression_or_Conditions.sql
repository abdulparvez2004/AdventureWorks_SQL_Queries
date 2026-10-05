--Case Expression and Conditional Logic.
--The CASE expression allows SQL Server to apply conditional logic directly inside a query.
--Syntax:
    --CASE 
       -- WHEN condition THEN result 
        --WHEN condition THEN result 
        --ELSE result 
    --END 

--1.Classify products based on price.expensive,medium and affordable.
select
ProductID,
Name as ProductName,
ListPrice,
case
when ListPrice > 1000 then 'Expensive'
when ListPrice > 500 then 'Medium'
else 'Affordable'
end as PriceCategory
from Production.Product;
--2.Case with NUll Values.
select
ProductID,
Name as ProductName,
Color,
case
when Color is null then 'Color Not Available'
else Color
end as ColorStatus
from Production.Product;
--Case With Numeric Business Rule.
select *
from(
select
ProductID,
Name,
ListPrice,
case
when ListPrice = 0 then 'Free'
when ListPrice < 100 then 'Budget'
when ListPrice < 1000 then 'Expensive'
else 'very Expensive'
end as PriceSegment
from Production.Product
) as Product
where PriceSegment = 'Very Expensive'; --this will filter and give only very expensive products

--4. CASE with Sales Order Quantities
select
SalesOrderID,
ProductID,
OrderQty,
case
when OrderQty <= 5 then 'Small'
when OrderQty <= 20 then 'Medium'
else 'Large'
end as QuantityBand
from Sales.SalesOrderDetail;
--5.CASE with Aggregation 
select
ProductID,
SUM(OrderQty) as TotalUnits,
case
when SUM(OrderQty) < 100 then 'Low Volume'
when SUM(OrderQty) < 500 then 'Medium Volume'
else 'High Volume'
end as VolumeCategory
from Sales.SalesOrderDetail
group by ProductID
order by TotalUnits desc;
--6.Case with group by
select
case
when ListPrice < 100 then 'Small'
when ListPrice < 500 then 'Medium'
else 'High'
end as PriceCategory,
COUNT(*) as ProductCount
from Production.Product
group by
case
when ListPrice < 100 then 'Small'
when ListPrice < 500 then 'Medium'
else 'High'
end;
--7. CASE for Business Flags
select
ProductID,
Name as ProductName,
ListPrice,
case 
when ListPrice > 1000 then 'Review'
else 'Normal'
end as PriceFlag
from Production.Product;

--8. Business Challenge – Product Segmentation 

--The product team wants a catalogue view containing ProductID, Name, ListPrice and a PriceSegment using these rules: 
select
ProductID,
Name as ProductName,
ListPrice,
case
when ListPrice < 100 then 'Budget'
when ListPrice < 500 then 'Standard'
when ListPrice < 1000 then 'Premium'
else 'Executive'
end as PriceCategory
from Production.Product;

--9.The sales team wants a product-level volume classification based on total OrderQty: 
SELECT 
    ProductID, 
    SUM(OrderQty) AS TotalUnits, 
    CASE 
        WHEN SUM(OrderQty) < 100 THEN 'Low Volume' 
        WHEN SUM(OrderQty) < 500 THEN 'Medium Volume' 
        ELSE 'High Volume' 
    END AS VolumeCategory 
FROM Sales.SalesOrderDetail 
GROUP BY ProductID 
ORDER BY TotalUnits DESC; 