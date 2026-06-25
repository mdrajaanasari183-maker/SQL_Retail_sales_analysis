# 🛍️ Retail Sales Analysis Using SQL

## 📌 Project Overview

This project demonstrates SQL-based data analysis on a retail sales dataset using Microsoft SQL Server.

The project covers:

- Database creation
- Table creation
- Data cleaning
- Data exploration
- Business analysis using SQL queries
- Aggregate functions
- Window functions
- Common Table Expressions (CTEs)

---

## 🛠️ Technologies Used

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL

---

## 📂 Database Structure

### Database

```sql
p1_retail_db
```

### Table

```sql
Retail_sales
```

| Column | Data Type |
|---------|-----------|
| Transaction_id | INT (Primary Key) |
| Sale_date | DATE |
| Sale_time | TIME |
| Customer_id | INT |
| Gender | VARCHAR(10) |
| Age | INT |
| Category | VARCHAR(50) |
| Quantity | INT |
| Price_per_unit | DECIMAL(10,2) |
| COGS | DECIMAL(10,2) |
| Total_sales | DECIMAL(10,2) |

---

# 📊 Project Workflow

### 1. Database Creation

- Created a new SQL database
- Created the Retail_sales table with appropriate datatypes and constraints

### 2. Data Cleaning

Performed data quality checks by identifying NULL values in all important columns and removed incomplete records.

### 3. Data Exploration

- Total number of sales
- Total number of customers
- Unique product categories

---

# 📈 Business Analysis Queries

1. Retrieve all sales made on a specific date.
2. Clothing sales with quantity greater than 4 in November 2022.
3. Total sales and total orders by category.
4. Average age of customers purchasing Beauty products.
5. Transactions where total sales exceeded 1000.
6. Number of transactions by gender and category.
7. Best selling month in each year using CTE and RANK().
8. Top 5 customers by total sales.
9. Number of unique customers by category.
10. Number of orders by shopping shift (Morning, Afternoon, Evening).

---

# 📚 SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT()
- SUM()
- AVG()
- CASE WHEN
- YEAR()
- MONTH()
- CTE
- Window Functions (RANK)

---

# 🎯 Learning Outcomes

- SQL Data Cleaning
- Data Exploration
- Aggregate Functions
- Window Functions
- CTEs
- Business Analytics
- Retail Sales Analysis

---

# 🚀 Future Improvements

- SQL Views
- Stored Procedures
- Indexing
- Power BI Dashboard
- Customer Segmentation
- KPI Dashboard

---

## ⭐ If you found this project helpful, consider giving it a star!
