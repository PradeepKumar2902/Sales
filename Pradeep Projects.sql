SELECT * FROM pradeep_project.pizza;

use pradeep_project ;

#1. Total Revenue:
SELECT SUM(total_price) AS total_revenue FROM pizza ;

#2. Average Order Value

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza;

#3. Total Pizzas Sold

SELECT SUM(quantity) AS Total_pizza_sold FROM pizza ;

#4. 4. Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza ;

#5.5. Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza;

#6.B. Daily Trend for Total Orders 

SELECT DAYNAME(order_date) AS order_day, 
       COUNT(DISTINCT order_id) AS total_orders
FROM pizza 
GROUP BY DAYNAME(order_date)
ORDER BY FIELD(DAYNAME(order_date), 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday');

#C. Monthly Trend for Orders

Select Monthname(order_date) As Month_Name , count(Distinct order_id) as total_order
From  pizza 
Group by Monthname(order_date)
Order by total_order Desc

#D. % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza) AS DECIMAL(10,2)) AS PCT
FROM pizza
GROUP BY pizza_category ;

SELECT * FROM pradeep_project.pizza;

#E. % of Sales by Pizza Size
SELECT 
    pizza_size,
    cast((total_price) as decimal ( 10 , 2 )) AS total_revenue,
   cast(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza) as Decimal (10 , 2))AS Pct
FROM 
    pizza
GROUP BY 
    pizza_size;
    
#F. Total Pizzas Sold by Pizza Category
    
SELECT * FROM pradeep_project.pizza;

Select pizza_category , sum(quantity) as total_quantity_sold from pizza 
group by pizza_Category 
Order By total_quantity_sold Asc ;

#G. Top 5 Pizzas by Revenue
Select * from Pizza ;
Select pizza_name , Sum(total_price) as total_revenue from pizza
group by pizza_name 
order by total_revenue Desc Limit 5 ;

# H. Bottom 5 Pizzas by Revenue
Select pizza_name , Sum(total_price) as total_revenue from pizza
group by pizza_name 
order by total_revenue asc Limit 5 ;

#I. Top 5 Pizzas by Quantity
Select * from Pizza ;
Select pizza_name , Sum(quantity) as total_quantity from pizza
group by pizza_name 
order by total_quantity desc Limit 5 ;

#J. Bottom 5 Pizzas by Quantity
Select pizza_name , Sum(quantity) as total_quantity from pizza
group by pizza_name 
order by total_quantity asc Limit 5 ;

#K. Top 5 Pizzas by Total Orders

Select * from Pizza ;

	Select pizza_name , count(Distinct order_id)  As total_orders
	from pizza 
	Group by pizza_name 
	order by total_orders Desc  Limit 5 ;
    
    #L. Borrom 5 Pizzas by Total Orders
    
    Select pizza_name , count(Distinct order_id)  As total_orders
	from pizza 
	Group by pizza_name 
	order by total_orders asc  Limit 5 ;
      
