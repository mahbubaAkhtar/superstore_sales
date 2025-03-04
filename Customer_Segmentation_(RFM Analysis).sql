-- Selecting all data from the sales_data table
SELECT 
    *
FROM
    superstore_sales.sales_data;

-- Calculating Recency, Frequency, and Monetary (RFM) values for each customer
SELECT 
    customer_id,
    DATEDIFF(CURRENT_DATE,
            DATE_ADD('5/28/2012',
                INTERVAL last_purchase_date DAY)) AS Recency,
    Frequency,
    Monetary
FROM
    (SELECT 
        customer_id,
            MAX(order_date) AS last_purchase_date,
            COUNT(order_id) AS frequency,
            SUM(sales) AS monetary
    FROM
        superstore_sales.sales_data
    GROUP BY customer_id) AS rfm_Segmentation_Score;

-- RFM Segmentation Score Calculation
SELECT 
    customer_id,
    -- Assigning RFM scores using NTILE(5) for segmentation
    NTILE(5) OVER (ORDER BY recency ASC) AS r_score,   -- Lower recency value means recent purchase
    NTILE(5) OVER (ORDER BY frequency ASC) AS f_score, -- Higher frequency means more purchases
    NTILE(5) OVER (ORDER BY monetary ASC) AS m_score   -- Higher monetary means more spending
FROM (
    SELECT 
        customer_id,
        -- Recency calculation using DATEDIFF
        DATEDIFF(CURRENT_DATE, MAX(DATE_ADD('5/28/2012', INTERVAL order_date DAY))) AS recency, 
        COUNT(order_id) AS frequency,  
        SUM(sales) AS monetary  
    FROM superstore_sales.sales_data
    GROUP BY customer_id
) AS rfm_Segmentation_Score;

-- Final RFM Segmentation with Customer Categorization
WITH rfm_scores AS (
    SELECT 
        customer_id,
        -- Recency Score: Higher recency values get lower scores
        NTILE(5) OVER (ORDER BY DATEDIFF(CURRENT_DATE, DATE_ADD('5/28/2012', INTERVAL last_purchase_date DAY)) DESC) AS r_score,
        -- Frequency Score: Higher frequency gets a better score
        NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
        -- Monetary Score: Higher spending gets a better score
        NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
    FROM (
        SELECT 
            customer_id,
            MAX(order_date) AS last_purchase_date, -- Latest purchase per customer
            COUNT(order_id) AS frequency,          -- Number of purchases per customer
            SUM(sales) AS monetary                 -- Total amount spent per customer
        FROM superstore_sales.sales_data
        GROUP BY customer_id
    ) AS cs
)

-- Assigning customer segments based on RFM scores
SELECT 
    customer_id,
    -- Combining RFM scores to create an overall customer score
    CONCAT(r_score, f_score, m_score) AS Rfm_Score,
    -- Categorizing customers based on their RFM score
    CASE 
        WHEN r_score = 5 AND f_score = 5 AND m_score = 5 THEN 'Top Tier Customers'  -- Best customers
        WHEN r_score >= 4 AND f_score >= 4 THEN 'Frequent Buyers'                    -- Loyal customers
        WHEN r_score >= 4 AND m_score >= 4 THEN 'High-Value Shoppers'                -- Big spenders
        WHEN r_score <= 2 AND f_score <= 2 AND m_score <= 2 THEN 'Inactive Customers'-- Lost customers
        ELSE 'General Customers'                                                     -- Others
    END AS Customer_Segment
FROM rfm_scores;
