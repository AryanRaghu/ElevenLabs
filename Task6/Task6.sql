-- 1. Monthly Revenue and Order Volume
SELECT 
    YEAR(InvoiceDate) AS year,
    MONTH(InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS monthly_revenue,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM online_sales_dataset
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY year, month;

-- 2. Monthly Revenue and Order Volume for a Specific Year (e.g., 2023)
SELECT 
    YEAR(InvoiceDate) AS year,
    MONTH(InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS monthly_revenue,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM online_sales_dataset
WHERE YEAR(InvoiceDate) = 2023
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY month;

-- 3. Top 3 Months by Revenue
SELECT 
    YEAR(InvoiceDate) AS year,
    MONTH(InvoiceDate) AS month,
    SUM(Quantity * UnitPrice) AS monthly_revenue
FROM online_sales_dataset
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY monthly_revenue DESC
LIMIT 3;

-- 4. Top 3 Months by Order Volume
SELECT 
    YEAR(InvoiceDate) AS year,
    MONTH(InvoiceDate) AS month,
    COUNT(DISTINCT InvoiceNo) AS order_volume
FROM online_sales_dataset
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY order_volume DESC
LIMIT 3;
