# AdventureWorks SQL Queries

## Building a Strong SQL Foundation for Data Analytics

This repository contains my **SQL practice and learning journey using the AdventureWorks 2022 database** as part of my Data Analyst course.

The main goal of this repository is to build a strong foundation in **SQL for Data Analytics** by practicing real-world-style queries, understanding relational data, working with multiple tables, and solving business-oriented questions.

I am using this repository to move beyond simply learning SQL syntax and develop the ability to **understand data, write queries, analyze results, and solve business problems using SQL**.

---

## 🎯 Objectives

- Build a strong foundation in SQL
- Practice SQL using a realistic relational database
- Understand tables and relationships
- Improve query-writing skills
- Develop analytical thinking
- Practice solving business questions using SQL
- Prepare for SQL-based Data Analyst interviews
- Document my SQL learning and progress

---

## 🗃️ Database

### AdventureWorks 2022

The queries in this repository are written using the **AdventureWorks 2022** sample database.

AdventureWorks provides a realistic business environment containing data related to:

- Products
- Product Categories
- Customers
- Sales
- Sales Orders
- Employees
- Vendors
- Purchasing
- Production
- Inventory
- Locations

This makes AdventureWorks useful for practicing SQL in scenarios that are closer to real-world business data.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| SQL Server | Database Management System |
| SQL Server Management Studio (SSMS) | Writing and executing SQL queries |
| AdventureWorks 2022 | Practice Database |
| Git & GitHub | Version Control and Documentation |

---

# 📚 SQL Concepts Practiced

## 1. SQL Fundamentals

- `SELECT`
- `FROM`
- `WHERE`
- `DISTINCT`
- Column Aliases
- `TOP`
- `ORDER BY`
- `ASC`
- `DESC`

### Example

```sql
SELECT
    ProductID,
    Name AS ProductName
FROM Production.Product
WHERE ListPrice > 1000;
