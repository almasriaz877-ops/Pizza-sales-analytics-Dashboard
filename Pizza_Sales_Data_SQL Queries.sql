create database pizza_sales;
# A. KPI's 
#1. Total Revenue 
select sum(total_price) as total_revenue from pizza_sales.data;
#2. Average Order Value 
select sum(total_price) / count(distinct order_id) as Average_Order_Value from pizza_sales.data;
#3. Total Pizza Sold 
select sum(quantity) as Total_Pizza_Sold from pizza_sales.data;
#4. Total Orders 
select count(distinct order_id) as Total_Orders from pizza_sales.data;
#5. Average Pizzas Per Order 
select cast(
cast(sum(quantity) as decimal(10, 2)) /
cast(count(distinct order_id) as decimal(10, 2)) as decimal(10, 2)
) as Average_pizza_per_order
from pizza_sales.data;
#B. Daily Trend For Total Orders 
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales.data
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%m/%d/%Y'));
#C. Hourly Trend for Orders
select hour(order_time) as order_hours,
count(distinct order_id) as total_orders
from pizza_sales.data
group by hour(order_time)
order by hour(order_time);
#D. % of sales by Pizza Category
select pizza_category, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales.data)
as decimal(10,2)) as PCT from pizza_sales.data
group by pizza_category; 
#E. % of sales by pizza size 
select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_revenue,
cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales.data)
as decimal(10,2)) as PCT from pizza_sales.data
group by pizza_size
order by pizza_size;
#F. Total Pizza sold By Pizza Category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales.data
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;
#G. Top 5 Best Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales.data 
group by pizza_name
order by Total_Pizza_Sold desc limit 5;
#H.Top 5 Best Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) as Total_Pizza_Sold
from pizza_sales.data
group by pizza_name 
order by Total_Pizza_Sold Asc limit 5;










