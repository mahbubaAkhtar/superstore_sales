-- Checking for missing values in key columns (Order_ID, Order_Date, and Customer_ID)
SELECT 
    COUNT(*) - COUNT(Order_ID) AS Missing_OrderID,
    COUNT(*) - COUNT(Order_Date) AS Missing_OrderDate,
    COUNT(*) - COUNT(Customer_ID) AS Missing_CustomerID
FROM
    sales_data;

-- Deleting records that have missing values in essential columns (Order_ID, Order_Date, or Customer_ID)
DELETE FROM sales_data 
WHERE
    Order_ID IS NULL OR Order_Date IS NULL
    OR Customer_ID IS NULL;

-- Ensuring the correct data type for order_date by modifying it to DATE format
ALTER TABLE superstore_sales.sales_data 
MODIFY COLUMN order_date DATE;

-- Updating order_date column to ensure it follows the correct DATE format
UPDATE superstore_sales.sales_data 
SET 
    order_date = STR_TO_DATE(order_date, '%Y-%m-%d');
