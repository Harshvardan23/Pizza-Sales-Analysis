---QUERIES TO ANSWERS ALL THE QUESTIONS ASKED BY THE CLIENT---

-- To find the REVENUE--
select sum(total_price) as "TOTAL_REVENUE" from pizza_sales;

--To find the Average Order Value--
Select round((sum(total_price)/count(distinct(order_id))),2) as "Average_order_value" from pizza_sales;

-- To find the Total Pizzas Sold--
select sum(quantity) as "Total_pizza_sold" from pizza_sales;

--To find the Total Orders--
select count(distinct(order_id)) as "Total_orders" from pizza_sales;

-- To find the Average Pizzas Per Order-- 
select cast(cast(sum(quantity) as decimal(10,2)) / 
	cast(count(distinct(order_id)) as decimal(10,2))
	as decimal(10,2))
	as "Average_pizza_per_order" 
	from pizza_sales;

--To find the Daily Trend for Total Orders--
select DATENAME(DW, order_date) as "Order_day", count(distinct(order_id)) as "Total_orders"
	from pizza_sales
	group by datename(dw,order_date);

--To find the Hourly Trend for Total Orders--
select DATEPART(hour, order_time) as "order_hour", count(distinct(order_id)) as "Total_orders"
	from pizza_sales
	group by DATEPART(hour, order_time)
	order by DATEPART(hour, order_time); 

-- To find the percentage of sales by pizza category-- 
select pizza_category, 
	sum(total_price) as "Total_Sales", 
	sum(total_price)*100 / (select sum(total_price) from pizza_sales where MONTH(order_date) = 1) as "Total_Sales"
	from pizza_sales
	where MONTH(order_date) = 1
	group by pizza_category;

-- To find the percentage of sales by pizza size-- 
select 
	pizza_size, 
	cast(sum(total_price) as decimal(10,2))as "Total_Sales", 
	cast(sum(total_price)*100 / 
		(select sum(total_price) 
		from pizza_sales where datepart(quarter,order_date) = 1) as decimal(10,2)) as "PCT"
	from pizza_sales
	where datepart(quarter, order_date) = 1
	group by pizza_size
	order by PCT desc;

-- To find the Total Pizzas sold by Pizza Category-- 
select pizza_category, sum(quantity) as "Total_pizzas_sold"
from pizza_sales
group by pizza_category;

-- To find the top 5 Best Sellers By Total Pizzas Sold-- 
select top 5 pizza_name, sum(quantity) as "Total_pizza_sold"
from pizza_sales
group by pizza_name
order by Total_pizza_sold desc; 

-- To find the Bottom 5 Sellers By Total Pizzas Sold-- 
select top 5 pizza_name, sum(quantity) as "Total_pizza_sold"
from pizza_sales
where month(order_date) =1
group by pizza_name
order by Total_pizza_sold asc; 
