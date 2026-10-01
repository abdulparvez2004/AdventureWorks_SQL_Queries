--this is used to add database.
use AdventureWorks2022;
--production is schema and product is table name
select * from Production.Product

--this query retrive the productid,name and listprice from production.product
select 
ProductID,
Name,
ListPrice
from Production.Product;
--Distinct removes the duplicates values and give the unique one
select distinct
color
from Production.Product
--Top is used when we want to return a limited no. of rows.
select top 10
ProductID,
Name,
ListPrice
from Production.Product
--alias gives a column and table a temporary name
select
ProductID as ProductId,
Name as ProductName,
ListPrice as SellingPrice
from Production.Product
--this query retrive the table production.product
select * from Production.Product
--this query retrive the productid,name and listprice from table production.product
select
ProductID,
Name,
ListPrice
from Production.Product
--this query retrives the unique values from the color column
select distinct
color
from Production.Product
--this query retrives the top 20 records from all columns in production.product
select top 20
*
from Production.Product
--this query uses the alias to rename the column names.
select
ProductID as ProductId,
Name as ProductName,
ListPrice as SellingPrice
from Production.Product
--Exploring data with small sample.
select top 10 -- top gives top 10 records from the table.
ProductID,
Name,
ListPrice
from Production.Product
--section: 4 Filtering data with where
--where clause allow you to filter rows so that the result contain only records that satisfy the condition.
select
ProductID,
Name,
ListPrice
from Production.Product
where ListPrice > 1000; -- result listprice greater than 1000
--2
select 
ProductID,
Name,
Color
from Production.Product
where Color = 'Red'; --result color = 'red' will show
--3.Combining condition with And Operator
select
ProductID,
Name,
Color,
ListPrice
from Production.Product
where ListPrice > 1000 AND Color = 'Black'; -- And operator have to satisfy both the condition.
--4.Combining condition with OR Operator
--OR Operator can atleast one condition also.
select
ProductID,
Name,
Color
from Production.Product
where Color = 'Black' OR Color = 'Red';
--5.Filtering a Range with b/t 
select
ProductID,
Name,
ListPrice
from Production.Product
where ListPrice BETWEEN 500 AND 1000; --this will result listprice between 500 and 1000.
--6.Equivalent logic can also written (>= ,<=).
select
ProductID,
Name,
ListPrice
from Production.Product
where ListPrice >= 500 AND ListPrice <= 1000;
--7.Filtering from a list with in
select
ProductID,
Name,
Color
from Production.Product
where Color in ('Black','Red','Silver');
--8.Filtering missing values with is null
select
ProductID,
Name,
Color
from Production.Product
where Color is null; --this will result all null values
--9.
select
ProductID,
Name,
Color
from Production.Product
where Color is not null;
--10.Combination of AND and OR Operators
select
ProductID,
Name,
Color,
ListPrice
from Production.Product
where (Color = 'Black' OR Color = 'Red') AND ListPrice > 500; --parenthesis has higher precidense rule.

--Sorting and Presenting data with order by.
-- The ORDER BY clause allows you to sort query results.
select
ProductID,
Name,
ListPrice
from Production.Product
order by ListPrice;--it will sort the listprice in ascending order by default(asc means from lower to higher).
--2.descending order
select
ProductID,
Name,
ListPrice
from Production.Product
order by ListPrice desc;--it will sort the listprice in descendint order(desc means from higher to lower).
--3.Combining where and order by.
select
ProductID,
Name,
ListPrice
from Production.Product
where ListPrice > 1000
order by ListPrice desc;--this will show listprice greater than 1000 and from higher to lower order.
--4.Sorting text values.
select
ProductID,
Name,
Color
from Production.Product
where Color is not null
order by Color;--this will show color with not null values and in alphabetic order.
--5.Sort by multiple columns
-- group the result alphabetically by Color, and within each color, show the highest-priced products first.
select
ProductID,
Name,
color,
ListPrice
from Production.Product
order by Color, ListPrice;
--6.Top + order by gives the higher value.
select top 10
ProductID,
Name,
ListPrice
from Production.Product
order by ListPrice desc;--this will show top 10 higher values.
--7.Order by distinct
--DISTINCT and ORDER BY can be used together when you want a unique, ordered list.
select
color
from Production.Product
where Color is not null
order by Color;--this will result color with not null and in alphabetical order.
--Order by column postion.
select
ProductID,
Name,
ListPrice
from Production.Product
order by 3 desc;-- Here 3 refer to third column(listprice)
