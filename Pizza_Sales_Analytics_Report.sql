select sum(total_price) as Total_Revenue
from pizza_sales;

select sum(total_price)/count(distinct order_id) as Avg_Order_Value
from pizza_sales;

select sum(quantity) as Total_Pizzas_Sold
from pizza_sales;

select count(distinct order_id) as Total_Orders
from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2))/ cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_Order
from pizza_sales;

SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY Order_Day
order by Total_Orders desc;

select hour(order_time) as hour_time, count(distinct order_id) as Total_Orders
from pizza_sales
group by hour_time
order by Total_Orders desc;

SELECT monthname(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY Month_Name
order by Total_Orders desc;

select pizza_category, ((sum(total_price))/ (select sum(total_price) from pizza_sales where month(STR_TO_DATE(order_date, '%d-%m-%Y'))=1))*100 as Percentage_Share_Total_Sales
from pizza_sales
where month(STR_TO_DATE(order_date, '%d-%m-%Y'))=1
group by pizza_category
order by Percentage_Share_Total_Sales desc;

select pizza_size, cast(((sum(total_price))/ (select sum(total_price) from pizza_sales where quarter(STR_TO_DATE(order_date, '%d-%m-%Y'))=1))*100 as decimal(10,2)) as Percentage_Share_Total_Sales
from pizza_sales
where quarter(STR_TO_DATE(order_date, '%d-%m-%Y'))=1
group by pizza_size
order by Percentage_Share_Total_Sales desc;

select pizza_category, sum(quantity) as No_of_pizzas_sold
from pizza_sales
group by pizza_category
order by No_of_pizzas_sold desc;

select pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue desc
limit 5;

select pizza_name, sum(total_price) as Total_Revenue
from pizza_sales
group by pizza_name
order by Total_Revenue asc
limit 5;

select pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc
limit 5;

select pizza_name, sum(quantity) as Total_Quantity
from pizza_sales
where month(str_to_date(order_date, '%d-%m-%Y'))=8
group by pizza_name
order by Total_Quantity asc
limit 5;

select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders desc
limit 5;

select pizza_name, count(distinct order_id) as Total_Orders
from pizza_sales
group by pizza_name
order by Total_Orders asc
limit 5;
