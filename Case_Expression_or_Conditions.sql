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