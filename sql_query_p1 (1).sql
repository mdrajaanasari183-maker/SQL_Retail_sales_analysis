CREATE DATABASE p1_retail_db;

create table Retail_sales
          ( 
          Transaction_id INT Primary key,
          Sale_date DATE,
          Sale_time TIME,
          Customer_id int ,
          Gender varchar (10) ,
          Age INT ,
          Category varchar (50) ,
          Quality int ,
          Price_per_unit decimal (10,2) ,
          Cogs decimal (10,2) ,
          Total_sales decimal (10,2)
          );

          select * from Retail_sales
     
          select top 10 * from Retail_sales

          select count (*) as total_customer from Retail_sales
          
           -- DATA CLEANING 
    
    SELECT *
FROM Retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

   -- DELETING NULL VALUES

   DELETE 
FROM Retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;

   select count (*) as total_customer from Retail_sales


-- ===========================================
-- Retail Sales Analysis Project - SQL Queries
-- File: sql_query_p1.sql
-- ===========================================

-- Q1. Retrieve all sales made on '2022-11-05'
SELECT *
FROM Retail_sales
WHERE sale_date = '2022-11-05';


-- Q2. Retrieve Clothing transactions where quantity > 4 in Nov-2022
SELECT *
FROM Retail_sales
WHERE category = 'Clothing'
  AND quantiy > 4
  AND sale_date >= '2022-11-01'
  AND sale_date < '2022-12-01';


-- Q3. Calculate total sales for each category
SELECT
    category,
    SUM(total_sale) AS net_sale,
    COUNT(*) AS total_orders
FROM Retail_sales
GROUP BY category;


-- Q4. Find the average age of customers who purchased Beauty products
SELECT
    AVG(age) AS avg_age
FROM Retail_sales
WHERE category = 'Beauty';


-- Q5. Find all transactions where total_sale > 1000
SELECT *
FROM Retail_sales
WHERE total_sale > 1000;


-- Q6. Find total transactions by gender and category
SELECT
    gender,
    category,
    COUNT(*) AS total_transactions
FROM Retail_sales
GROUP BY gender, category
ORDER BY gender, category;


-- Q7. Calculate the average sale for each month and find the best-selling month in each year
WITH MonthlySales AS
(
    SELECT
        YEAR(sale_date) AS sales_year,
        MONTH(sale_date) AS sales_month,
        AVG(total_sale) AS avg_sale,
        SUM(total_sale) AS total_sales
    FROM Retail_sales
    GROUP BY YEAR(sale_date), MONTH(sale_date)
),
RankedSales AS
(
    SELECT *,
           RANK() OVER
           (
               PARTITION BY sales_year
               ORDER BY total_sales DESC
           ) AS sales_rank
    FROM MonthlySales
)
SELECT
    sales_year,
    sales_month,
    avg_sale,
    total_sales,
    sales_rank
FROM RankedSales
WHERE sales_rank = 1;


-- Q8. Find the Top 5 customers based on highest total sales
SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_sales
FROM Retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC;


-- Q9. Find the number of unique customers who purchased from each category
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM Retail_sales
GROUP BY category
ORDER BY unique_customers DESC;


-- Q10. Create shopping shifts and count the number of orders
SELECT
    CASE
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(transactions_id) AS number_of_orders
FROM Retail_sales
GROUP BY
    CASE
        WHEN DATEPART(HOUR, sale_time) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END
ORDER BY number_of_orders DESC;
