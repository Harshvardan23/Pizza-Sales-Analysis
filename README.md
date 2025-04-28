# Pizza-Sales-Analysis

📌 Project Overview
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
