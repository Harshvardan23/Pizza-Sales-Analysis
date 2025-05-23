# Pizza-Sales-Analysis

![pablo-pacheco-D3Mag4BKqns-unsplash](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/pablo-pacheco-D3Mag4BKqns-unsplash.jpg)

# 📌 Project Overview
Pizza is undeniably one of the most beloved meals across the globe, with its rich variety of flavors and styles. As I embarked on this data analysis project, the first thing that came to mind was to explore the patterns and trends in pizza sales. Pizza, Italy's famous tasty and affordable meal, has a way of drawing people in, and it was no surprise that I chose this topic when searching for a dataset to analyze.

In this project, the goal was to dive deep into pizza sales data to uncover meaningful insights, identify key trends, and make actionable recommendations. Data analysis is more than just creating beautiful dashboards; it’s about understanding the data, finding meaningful patterns, and drawing conclusions that can drive decisions.

Through the use of SQL and Excel, I was able to clean, analyze, and visualize the data in a way that helps answer important business questions like which pizza category is most popular, what time of day sales peak, and what factors drive sales. The project goes beyond just visualization – it digs into the why behind the data to create a narrative that can help businesses optimize their strategies.

# 🧑‍💻 Technologies Used
SQL: Data extraction and analysis from an SQL database.

Microsoft Excel: Data cleaning, pivot tables, charts, and dashboard creation.

Excel Functions: SUMIFS, COUNTIFS, DATEPART, CAST, and more.

# 📋 Table of Contents

* Project Overview
* Technologies Used
* Steps Overview
* Data Cleaning
* Questions Answered
* Key Metrics
* Visual Insights
* Recommendations
* SQL Integration
* Dashboard Preview
* Conclusion

# 📝 Steps Overview

* Data Import: Imported raw pizza sales data from an SQL database into Excel using the Get Data feature.

* Data Cleaning: Cleaned and standardized the data to ensure it was ready for analysis, Created a table and extracted additional date columns (order_day, order_month) for better analysis.

* SQL Queries: Performed complex data aggregation and filtering using SQL queries to extract relevant information.

* Analysis & Visualization: Used pivot tables and Excel charts to uncover insights and trends in the data, Created a dashboard to visually represent key findings.

# 🧹 Data Cleaning

* Created a structured table to facilitate easy analysis.
* Extracted order_day and order_month from the order_date column to analyze trends over time.
* Ensured all dates and times were standardized for consistency.

# ❓ Questions Answered

### What category of pizza was demanded the most?

**SQL Query:**
```sql
SELECT 
    pizza_category,
    SUM(total_price) AS Total_Sales,
    (SUM(total_price) * 100.0) / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1) AS Total_Sales_Percentage
FROM 
    pizza_sales
WHERE 
    MONTH(order_date) = 1
GROUP BY 
    pizza_category;
```
**Excel Preview:**



![percentage of sales by pizza category (Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/percentage%20of%20sales%20by%20pizza%20category%20(Excel).png)







**SQL Preview:**




![percentage of sales by pizza category (SQL)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/percentage%20of%20sales%20by%20pizza%20category%20(SQL).png)
---

### Which pizza brand brought in more sales in total price?

**SQL Query:**
```sql
SELECT TOP 5 
    pizza_name, 
    SUM(quantity) AS Total_pizza_sold
FROM 
    pizza_sales
WHERE 
    MONTH(order_date) = 1
GROUP BY 
    pizza_name
ORDER BY 
    Total_pizza_sold ASC;
```
**SQL Preview:**




![Which pizza brand brought in more sales in total price(SQL)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Which%20pizza%20brand%20brought%20in%20more%20sales%20in%20total%20price(SQL).png)
---

### What pizza size was ordered the most?

**SQL Query:**
```sql
SELECT 
    pizza_size, 
    CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sales, 
    CAST(SUM(total_price) * 100 / 
        (SELECT SUM(total_price) 
         FROM pizza_sales 
         WHERE DATEPART(quarter, order_date) = 1) AS DECIMAL(10,2)
    ) AS PCT
FROM 
    pizza_sales
WHERE 
    DATEPART(quarter, order_date) = 1
GROUP BY 
    pizza_size
ORDER BY 
    PCT DESC;
```
---
**Excel Preview:**



![What pizza size that was ordered the most (Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/What%20pizza%20size%20that%20was%20ordered%20the%20most%20(Excel).png)







**SQL Preview:**




![What pizza size that was ordered the most (SQL)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/What%20pizza%20size%20that%20was%20ordered%20the%20most%20(SQL).png)
---

### At what time of the day do pizza sales peak?

**SQL Query:**
```sql
SELECT 
    DATEPART(hour, order_time) AS order_hour, 
    COUNT(DISTINCT(order_id)) AS Total_orders
FROM 
    pizza_sales
GROUP BY 
    DATEPART(hour, order_time)
ORDER BY 
    DATEPART(hour, order_time);
```
**Excel Preview:**



![At what time of the day do pizza sales peak(Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/At%20what%20time%20of%20the%20day%20do%20pizza%20sales%20peak(Excel).png)







**SQL Preview:**




![At what time of the day do pizza sales peak(SQL)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/At%20what%20time%20of%20the%20day%20do%20pizza%20sales%20peak(SQL).png)
---

### what is the Total Revenue?

**SQL Query:**
```sql
SELECT 
    SUM(total_price) AS Total_Revenue 
FROM 
    pizza_sales;
```
![Total revenue (SQL)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Total%20revenue%20(SQL).jpg)
---

### What is the Average Order Value? 

**SQL Query:**
```sql
SELECT 
    (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value 
FROM 
    pizza_sales;
```
![Average Order Value](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Average%20Order%20Value.png)
---

### what is the number fof Total Pizzas Sold?

**SQL Query:**
```sql
SELECT 
    SUM(quantity) AS Total_pizza_sold 
FROM 
    pizza_sales;
```
![Total Pizzas Sold](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Total%20Pizzas%20Sold.png)
---

### what is the number of Total Orders placed?

**SQL Query:**
```sql
SELECT 
    COUNT(DISTINCT order_id) AS Total_Orders 
FROM 
    pizza_sales;
```
![Total Orders Placed](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Total%20Orders.png)
---

### what is the value of Average Pizzas Per Order?

**SQL Query:**
```sql
SELECT 
    CAST(
        CAST(SUM(quantity) AS DECIMAL(10,2)) / 
        CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) 
    AS DECIMAL(10,2)) AS Avg_Pizzas_per_order
FROM 
    pizza_sales;
```
![Average Pizzas Per Order](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Average%20Pizzas%20Per%20Order.png)
---

# 📊 Visual Insights
Some key insights are better captured visually. Below are some screenshots that highlight the trends and findings from the data:

* Daily Trend for Total Orders

  
  ![Daily trends for total orders (Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Daily%20trends%20for%20total%20orders%20(Excel).png)


  
---
* Hourly Trend for Orders

  
  ![Hourly Trend for orders(Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Hourly%20Trend%20for%20orders(Excel).png)

  
---
* Percentage of Sales by Pizza Category

  
  ![Percentage of Sales by Pizza Category](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Percentage%20of%20Sales%20by%20Pizza%20Category.png)

  
---
* Percentage of Sales by Pizza Size

  
  ![percentage of sales by pizza size (Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/percentage%20of%20sales%20by%20pizza%20size%20(Excel).png)

  
---
* Total Pizzas Sold by Pizza Category

  
  ![Total Pizzas Sold by Pizza Category](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Percentage%20of%20Sales%20by%20Pizza%20Category.png)

  
---
* Top 5 Best Sellers by Total Pizzas Sold

  
  ![top 5 best sellers by total pizzas sold (Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/top%205%20best%20sellers%20by%20total%20pizzas%20sold%20(Excel).png)

  
---
* Bottom 5 Best Sellers by Total Pizzas Sold

  
  ![Bottom 5 sellers for total pizzas sold (Excel)](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Bottom%205%20sellers%20for%20total%20pizzas%20sold%20(Excel).png)

  

---

# 💡 Recommendations
Based on the insights gathered from the data, here are some recommendations to maximize profits and optimize sales strategies:

### CHICKEN PIZZA STRATERGY:
The Chicken category brings in the highest total sales despite being one of the least demanded categories. This indicates that while customers may prefer other pizza types, chicken pizzas are more expensive. To attract more customers, I recommend offering affordable chicken pizza options that can appeal to a wider audience without sacrificing profitability.

### FOUCS ON POPULAR SIZES:
The Large, Medium, and Small sizes continue to dominate the market. I recommend continuing to produce these sizes in larger quantities. Special attention should be given to optimizing production and distribution strategies for these pizza sizes to meet customer demand effectively.

### PEAK SALES PERIOD:
Sales data shows that pizza orders peak at midday and around the 5 PM to 6 PM period. To avoid running out of stock during peak hours, I recommend implementing inventory management systems that can anticipate demand and ensure enough pizzas are produced and available during these critical times.

### DYNAMIC PRICING STRATERGY:
Based on demand and price sensitivity, I recommend implementing a dynamic pricing strategy where popular pizza categories or sizes are sold at slightly higher prices during off-peak hours and discounted during peak demand periods. This could help balance supply and demand more effectively.

### MENU OPTIMIZATION:
Given that some pizza categories or types do not sell as well, I suggest menu optimization — perhaps focusing more on popular items and offering seasonal promotions or limited-edition pizzas to stimulate demand.

### PROMOTIONS AND DISCOUNTS:
Considering the insights into the top-selling pizzas, targeted promotions and discounts can be introduced for the most popular pizzas, while other pizzas could be promoted with creative deals to increase their sales.

### CUSTOMER SEGMENTATION:
Understanding customer behavior based on pizza sizes and categories can help in segmenting customers. Offering personalized discounts or loyalty programs based on these segments can improve customer retention and boost sales.

---

# 🖥️ SQL Integration
SQL played a crucial role in this project by facilitating data extraction and analysis:

### Data Import:
The raw data was imported into Excel using the Get Data feature from an SQL database.

### SQL Queries:
I used complex SQL queries to aggregate and manipulate data. Key SQL functions included:

* DISTINCT, CAST, and DECIMAL to clean and format data.

* DATENAME and DATEPART for extracting specific date information for analysis.

* Subqueries, ORDER BY, and HAVING for advanced data filtering and sorting.

### Answering Project Questions:
SQL was used to extract insights like which pizza category was the most popular, what time of day pizza sales peak, and more. The SQL queries provided the foundation for answering all key questions in this project.

### SQL and Excel Integration:
By combining SQL for data extraction and Excel for visualization, I was able to analyze the data efficiently and create pivot tables and charts that clearly presented the insights.

--- 

# 🖥️ Dashboard Preview
![Dashboard](https://github.com/Harshvardan23/Pizza-Sales-Analysis/blob/main/images_used/Dashboard.png)

# 📥 How to Run the Project
To run this project and use the analysis:

### Clone the repository:
  https://github.com/Harshvardan23/Pizza-Sales-Analysis

### Data Setup:
Import the SQL database or use the dataset provided in the project files.

### Open in Excel:
Open the Excel workbook to explore the pivot tables, charts, and dashboard.

### Customization:
Modify SQL queries or Excel charts to analyze other aspects of the data.

--- 

# 👨‍💻 Author
@https://github.com/Harshvardan23

