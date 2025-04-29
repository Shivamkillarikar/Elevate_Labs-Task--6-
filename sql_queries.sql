show databases;
create database online_sales;
use online_sales;
select * from sales_table;

#Q1 Extract Month from order_date for month
SELECT 
  EXTRACT(MONTH FROM STR_TO_DATE(Date, '%d-%m-%Y')) AS month
FROM 
  sales_table
WHERE 
  STR_TO_DATE(Date, '%d-%m-%Y') IS NOT NULL;

#Q2 GROUP BY YEAR/MONTH
ALTER TABLE sales_table
ADD COLUMN month INT,
ADD COLUMN year INT;

UPDATE sales_table
SET 
  month = EXTRACT(MONTH FROM STR_TO_DATE(Date, '%d-%m-%Y')),
  year = EXTRACT(YEAR FROM STR_TO_DATE(Date, '%d-%m-%Y'));


select * from sales_table;

select year,month,sum(`Total Revenue`) as total_revenue
from sales_table
group by year,month;

#Q3 SUM FOR REVENUE
select sum(`Total Revenue`) as revenue
from sales_table;

#Q4  COUNT(DISTINCT_ID) for volume
select count(DISTINCT `TRANSACTION ID`) as count
from sales_table;

#Q5 Use order by sorting
select `Product Name`,sum(`Total Revenue`) as revenue
from sales_table
group by  `Product Name`
order by `Product Name`;

#Q6 Limit results by specific time period
select sum(`Total Revenue`) as revenue 
from sales_table
where 
Date between '01-01-2024' and '27-08-2024';


