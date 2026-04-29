create database ecommerce;
use ecommerce;

show databases;
show tables;

create table orders (
order_id int,
order_date date,
region varchar(50),
category varchar(50),
pruduct_name varchar(100),
sales int, 
cost int,
customer_name varchar(100),
profit int
);

 alter table orders 
 rename column pruduct_name to product_name;
 
select count(*) from orders;

-- total sales
select sum(sales) as Total_orders
from orders;   

-- total profit
select sum(profit) as total_profit
from orders;

-- total orders
select count(*) as total_orders 
from orders;

-- sales by region 
select region, sum(sales) as Total_sales
from orders
group by region 
order by Total_sales desc;

-- sales by category 
select category, sum(sales) as Total_sales
from orders
group by category
order by Total_sales desc;

-- monthly sales trend
select
 month(order_date) as month,
 sum(sales) as Total_sales
 from orders
 group by month 
 order by month;
 
 -- top 5 products
 select Product_name, sum(sales) as Total_sales 
 from orders
 group by product_name 
 order by Total_sales desc
 limit 5;

-- profits by category
select category, sum(profit) as Total_profits
from orders
group by category;

-- top performig region
select region, sum(sales) as Total_sales
from orders 
group by region
order by Total_sales desc
limit 1;

 -- highest profit product
 select product_name, sum(profit) as Total_profit
 from orders
 group by product_name 
 order by Total_profit desc
 limit 1;
 
 -- monthly growth 
 select 
   month(order_date) as Month,
   sum(sales) as Total_sales,
   lag(sum(sales)) over (order by (month(order_date))) as Previous_month
   from orders
   group by Month;
 

 