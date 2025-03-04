# Superstore Sales Data Analysis

This project involves analyzing sales data from a retail superstore to extract actionable insights, identify trends, and understand customer behavior. The analysis is performed on datasets
containing sales, profits, discounts, customer information, and product details. By leveraging SQL, the project aims to uncover patterns and provide meaningful interpretations to support 
business decision-making.

🚀 ##Project Overview

This project is an in-depth analysis of superstore sales data using MySQL. The goal is to:
-Efficiently store and manage sales data using relational database principles.
-Perform data cleaning and transformation to ensure accuracy.
-Conduct exploratory data analysis (EDA) to uncover business insights.
-Segment customers using RFM (Recency, Frequency, Monetary) analysis to help with targeted marketing strategies.
By the end, we will gain actionable insights to optimize sales and improve business decisions!

📊 ##Dataset Description

The dataset Superstore Sales Data.csv contains transactional sales data with details such as:
-`Order Information`: Order ID, Order Date, Ship Mode
-`Customer Details`: Customer ID, Customer Name, Segment
-`Geographical Data`: City, State, Region
-`Product Information`: Product ID, Category, Sub-category, Product Name
-`Financial Metrics`: Sales, Quantity, Discount, Profit



📁 ##Files:
- `File`:The file name is `Superstore Sales Data.csv` The name of the file containing the dataset used for analysis.
- `Create Database`: CREATE DATABASE IF NOT EXISTS superstore_sales;
- `Create Table` : CREATE TABLE IF NOT EXISTS sales_data;
- 
📝 ##Methodology

🛠️ ##Step-by-Step Implementation:
1️⃣ ##Database & Table Creation 🗄️ : 
The MySQL database is named superstore_sales, and a table sales_datas is created with the following schema:
✔ Primary Key: Row_ID
✔ Key Columns: Customer_ID, Order_ID, Product_Name, Region, Sales, Profit
✔ Data Types: The schema ensures proper data types for columns such as FLOAT for numeric values and DATE for dates.
🔹 Enhancements: We added primary keys, NOT NULL constraints, and data validation checks to ensure data integrity.

2️⃣ ##Data Insertion➕ : 
To handle large datasets, we use bulk insertion with LOAD DATA INFILE, which is faster than multiple INSERT statements.
✔ Used Method: Used RebaseData (Convert XLS to MySQL) for data insertion.

3️⃣ ##Data Cleaning & Schema Update🧹 : 
✔Ensured date columns (Order_Date, Ship_Date) were converted to the proper DATE format.

4️⃣ ##Exploratory Data Analysis (EDA) 🔍 : EDA helps us uncover insights into sales trends, customer behavior, and profitability
##Key Insights
-###Sales and Profit:
-Total Sales: Summed up for the entire dataset.
-Total Profit: Computed for profitability analysis.
-Average Discount: Derived to understand pricing strategies.
-###Regional Performance:
-Most profitable regions were identified using a grouped query on Region.
-###Top Products:
-Ranked by sales using grouped queries on Product_Name.
🔹 Why EDA?
✔Identifies high-performing products and regions.
✔Helps optimize inventory and marketing strategies.
✔Detects anomalies or unexpected patterns in sales data.

5️⃣ ##Customer Segmentation (RFM Analysis) 🎯 : Objective: Categorize customers based on Recency, Frequency, and Monetary Value to improve marketing strategies
###Methodology
-Recency: Days since the last order.
-Frequency: Number of orders by each customer.
-Monetary: Total sales value for each customer.
###Steps
-Calculated Recency, Frequency, and Monetary metrics for each customer.
-Created segments based on the metrics:
   -Recency: Active, Lapsing, Inactive.
   -Frequency: Frequent, Infrequent.
   -Monetary: High-Value, Low-Value.


##Findings (Results)📊 : 
