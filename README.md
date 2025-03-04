# Superstore Sales Data Analysis

This project involves analyzing sales data from a retail superstore to extract actionable insights, identify trends, and understand customer behavior. The analysis is performed on datasets
containing sales, profits, discounts, customer information, and product details. By leveraging SQL, the project aims to uncover patterns and provide meaningful interpretations to support 
business decision-making.

## 🚀Project Overview

This project is an in-depth analysis of superstore sales data using MySQL. The goal is to:
- Efficiently store and manage sales data using relational database principles.
- Perform data cleaning and transformation to ensure accuracy.
- Conduct exploratory data analysis (EDA) to uncover business insights.
- Segment customers using RFM (Recency, Frequency, Monetary) analysis to help with targeted marketing strategies.
By the end, we will gain actionable insights to optimize sales and improve business decisions!

## 📊Dataset Description

The dataset Superstore Sales Data.csv contains transactional sales data with details such as:
- `Order Information`: Order ID, Order Date, Ship Mode
- `Customer Details`: Customer ID, Customer Name, Segment
- `Geographical Data`: City, State, Region
- `Product Information`: Product ID, Category, Sub-category, Product Name
- `Financial Metrics`: Sales, Quantity, Discount, Profit



## 📁Files
- `File`:The file name is `Superstore Sales Data.csv` The name of the file containing the dataset used for analysis.
- `Create Database`: CREATE DATABASE IF NOT EXISTS superstore_sales;
- `Create Table` : CREATE TABLE IF NOT EXISTS sales_data;
  
## 📝Methodology 

## 🛠️Step-by-Step Implementation :
## 1️⃣Database & Table Creation 🗄️ : 
The MySQL database is named superstore_sales, and a table sales_datas is created with the following schema:

✔  `Primary Key`: Row_ID

✔  `Key Columns`: Customer_ID, Order_ID, Product_Name, Region, Sales, Profit

✔  `Data Types`: The schema ensures proper data types for columns such as FLOAT for numeric values and DATE for dates.

🔹` Enhancements`: We added primary keys, NOT NULL constraints, and data validation checks to ensure data integrity.

## 2️⃣Data Insertion➕ : 

- To handle large datasets, we use bulk insertion with LOAD DATA INFILE, which is faster than multiple INSERT statements.
- Successful data insertion ensured that all relevant transactional records were captured, forming a solid foundation for analysis and reporting.

✔ `Used Method`: Used RebaseData (Convert XLS to MySQL) for data insertion.

## 3️⃣Data Cleaning & Schema Update🧹 : 

✔Ensured date columns (Order_Date, Ship_Date) were converted to the proper DATE format.

## 4️⃣Exploratory Data Analysis (EDA) 🔍 :

✔ EDA helps us uncover insights into sales trends, customer behavior, and profitability

## Key Insights

###  `Sales and Profit`:

- Total Sales: Summed up for the entire dataset.
- Total Profit: Computed for profitability analysis.
- Average Discount: Derived to understand pricing strategies.
###  `Regional Performance`:
- Most profitable regions were identified using a grouped query on Region.
###  `Top Products`:

- Ranked by sales using grouped queries on Product_Name.
  
🔹 Why EDA?

✔ Identifies high-performing products and regions.

✔ Helps optimize inventory and marketing strategies.

✔ Detects anomalies or unexpected patterns in sales data.

### 5️⃣Customer Segmentation (RFM Analysis) 🎯 :  

✔ `Objective`: Categorize customers based on Recency, Frequency, and Monetary Value to improve marketing strategies

### Methodology
- `Recency`: Days since the last order.
- `Frequency`: Number of orders by each customer.
-` Monetar`y: Total sales value for each customer.
### Steps
- Calculated Recency, Frequency, and Monetary metrics for each customer.
- Created segments based on the metrics:
   - `Recency`: Active, Lapsing, Inactive.
   - `Frequency`: Frequent, Infrequent.
   - `Monetary`: High-Value, Low-Value.

🔹 Why RFM?

 - Recency (How recently a customer purchased) helps target active vs. inactive customers.

 - Frequency (How often a customer purchases) identifies loyal customers.

- Monetary (Total spent by a customer) helps prioritize high-value customers.

## 📊Findings (Results) 

✔️  `Total Inserting Data` :

![Total Insert Recored Data](https://github.com/user-attachments/assets/74cee25b-7b2b-49b5-887c-8d5aaa0ddffc)

✔️  `Data Cleaning & Updating` :

![Data Cleaning](https://github.com/user-attachments/assets/0612692d-ff5b-4ddd-806c-d5f2242c62fd)

✔️ `Total Sales For Each Region` :

![image](https://github.com/user-attachments/assets/4ef35e0c-0be7-4964-9880-520ac08c04ed)

✔️ `Show Only The Top 5 Customers` :

![image](https://github.com/user-attachments/assets/f3c6ad9b-7d62-4fc4-9993-c74e6e52b8a9)


✔️ `Identify Repeated customers vs. One-time Customers` :

![image](https://github.com/user-attachments/assets/6a3937d7-3f2a-4c49-82ff-d8a99714e45d)


✔️ `Top 5 Selling Products Based On Sales Revenue` :

![image](https://github.com/user-attachments/assets/5080d134-f040-4e86-99af-2dde983b44b1)


✔️ `Total Sales & Total Profit Based On Discount Category` :

![image](https://github.com/user-attachments/assets/468a3bf5-b4e2-4613-b8b4-76a650202bd1)


✔️ `Segment The Customer Using RFM Segmentation` :

![image](https://github.com/user-attachments/assets/19db985b-73a0-4477-a4cb-ea348f6d6cb9)


## 📈 Project Outcomes

✔️ `Data Quality and Integrity`: Achieved a clean, structured dataset through rigorous data cleaning and schema updates, ensuring accurate reporting and analysis.

✔️ `Optimized Database Performance`: Leveraged efficient database and table creation techniques along with bulk data insertion, resulting in faster query responses and reliable data management.

✔️ `Comprehensive Sales Insights`: Uncovered significant trends in sales, profits, and discount impacts across regions, products, and customer segments to support strategic decision-making.

✔️ `Effective Customer Segmentation`: Implemented RFM analysis to categorize customers, enabling targeted marketing strategies and improved customer retention efforts.

✔️ `Actionable Business Strategies`: Provided actionable insights from exploratory data analysis that inform pricing strategies, inventory management, and overall sales optimization initiatives.



## ✍Author
### Mahbuba AKhtar Jidni
