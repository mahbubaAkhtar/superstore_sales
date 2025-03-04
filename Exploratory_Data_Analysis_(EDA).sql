-- Retrieve all records from the sales_data table
SELECT 
    *
FROM
    superstore_sales.sales_data;

-- Calculate the total sales revenue across all orders
SELECT 
    SUM(sales) AS Total_Sales
FROM
    superstore_sales.sales_data;

-- Determine the total profit generated from all sales
SELECT 
    SUM(profit) AS Total_Profit
FROM
    superstore_sales.sales_data;
    
-- Analyze total sales for each region
SELECT 
    Region, SUM(Sales) AS Total_Sales
FROM
    superstore_sales.sales_data
GROUP BY Region
ORDER BY Total_Sales DESC;-- Sort regions in descending order based on sales

SELECT 
    Customer_ID, Customer_Name, COUNT(Order_ID) AS Total_Orders
FROM
    superstore_sales.sales_data
GROUP BY Customer_ID , Customer_Name
ORDER BY Total_Orders DESC
LIMIT 5;-- Show only the top 5 customers

SELECT 
    Product_Category,
    SUM(sales) AS Total_Sales,
    SUM(profit) AS Total_Profit
FROM
    superstore_sales.sales_data
GROUP BY Product_Category
ORDER BY Total_Sales DESC;-- Sort product categories by sales

SELECT 
    product_name, SUM(sales) AS Total_Sales
FROM
    superstore_sales.sales_data
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 10;-- Show only the top 10 products

SELECT 
    Customer_Name,
    SUM(sales) AS Total_Sales,
    SUM(profit) AS Total_Profit
FROM
    superstore_sales.sales_data
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- Analyze the number of orders placed by each customer
SELECT 
    customer_ID, COUNT(order_ID) AS Total_Orders
FROM
    superstore_sales.sales_data
GROUP BY customer_ID
ORDER BY total_orders DESC
LIMIT 10;-- Show only the top 10 customers with the most orders

SELECT 
    customer_segment,
    SUM(sales) AS Total_Sales,
    SUM(profit) AS Total_Profit
FROM
    superstore_sales.sales_data
GROUP BY customer_segment;
    
-- Identify repeat customers vs. one-time customers
SELECT 
    COUNT(DISTINCT Customer_Name) AS Total_Customers,
    SUM(CASE
        WHEN order_count > 1 THEN 1
        ELSE 0
    END) AS Repeat_Customers,
    SUM(CASE
        WHEN order_count = 1 THEN 1
        ELSE 0
    END) AS One_Time_Customers
FROM
    (SELECT 
        Customer_Name, COUNT(Order_ID) AS order_count
    FROM
        superstore_sales.sales_data
    GROUP BY Customer_Name) AS customer_orders;

-- Aggregate sales for each order date and format the date
SELECT 
    DATE_FORMAT(DATE_ADD('5/28/2012',
                INTERVAL Order_Date DAY),
            '%m/%d/%Y') AS Formatted_Date,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(profit) AS Total_Profit
FROM
    superstore_sales.sales_data
GROUP BY formatted_date
ORDER BY STR_TO_DATE(formatted_date, '%m/%d/%Y');

-- Track yearly sales growth over time
SELECT 
    Order_Date,
    SUM(sales) AS Total_Sales,
    SUM(profit) AS Total_Profit
FROM
    superstore_sales.sales_data
GROUP BY Order_Date
ORDER BY Order_Date DESC;-- Order by date in descending order

SELECT 
    AVG(Sales) AS avg_order_value
FROM
    superstore_sales.sales_data;

-- Aggregate yearly sales and calculate the average order value per year
SELECT 
    YEAR(STR_TO_DATE(order_date, '%Y-%m-%d')) AS Year,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(sales) AS Total_Profit,
    ROUND(SUM(sales) / COUNT(DISTINCT Order_ID), 2) AS AvgOrderValue
FROM
    superstore_sales.sales_data
WHERE
    order_date IS NOT NULL
        AND order_date != ''
GROUP BY Year
ORDER BY Year;

-- Identify the top 5 selling products based on sales revenue
SELECT 
    product_name, SUM(sales) AS Total_Sales
FROM
    superstore_sales.sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;-- Show only the top 5 products

SELECT 
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount BETWEEN 0.01 AND 0.05 THEN 'Very Low Discount (1-5%)'
        WHEN discount BETWEEN 0.06 AND 0.10 THEN 'Low Discount (6-10%)'
        WHEN discount BETWEEN 0.11 AND 0.20 THEN 'Medium Discount (11-20%)'
        WHEN discount BETWEEN 0.21 AND 0.30 THEN 'High Discount (21-30%)'
        WHEN discount BETWEEN 0.31 AND 0.50 THEN 'Very High Discount (31-50%)'
        ELSE 'Extreme Discount (Above 50%)'
    END AS discount_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM
    superstore_sales.sales_data
GROUP BY discount_category
ORDER BY discount_category DESC;

-- Analyze sales performance by shipping mode
SELECT 
    Shipping_Mode,
    SUM(sales) AS Total_Sales,
    COUNT(`order ID`) AS total_orders
FROM
    superstore_sales.sales_data
GROUP BY Shipping_Mode;
