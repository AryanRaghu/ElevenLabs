USE ecomm;

SELECT * 
FROM data
LIMIT 10;


-- Total Revenue
SELECT SUM(Quantity * UnitPrice) AS total_revenue
FROM data;

-- Revenue By country( Top 10)
SELECT Country, SUM(Quantity * UnitPrice) AS revenue
FROM data
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;


-- Top 10 customers
SELECT CustomerID, SUM(Quantity * UnitPrice) AS revenue
FROM data
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY revenue DESC
LIMIT 10;


-- Avg revenue per user
SELECT
  SUM(Quantity * UnitPrice) / COUNT(DISTINCT CustomerID) AS ARPU
FROM data
WHERE CustomerID IS NOT NULL;

SELECT *
FROM data
WHERE CustomerID IN (
    SELECT CustomerID
    FROM data
    GROUP BY CustomerID
    HAVING SUM(Quantity * UnitPrice) > 2000
);

