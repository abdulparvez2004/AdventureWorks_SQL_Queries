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