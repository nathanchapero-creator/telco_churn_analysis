-- Total churn rate (using Q2 Ending customer numbers, 28.4% of last quarter's California customers churned)
SELECT
customer_status,
ROUND(count(*) * 100.0 / sum(count(*)) OVER (), 1) AS "Percent of total",
count(*),
sum(count(*)) OVER ()
FROM customer_status
WHERE customer_status != 'Joined'
GROUP BY customer_status;

-- Acquisition rate for new customers (Q3 experienced a 6.9% customer growth rate relative to Q2 Ending customer numbers)
SELECT
'Joined' AS customer_status,
ROUND(SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN customer_status != 'Joined' THEN 1 ELSE 0 END), 1) AS "Percent of total"
FROM customer_status;

-- Net customer growth for Q3 (Total California customers went down by 21.5% relative to Q2) 
-- Churn rate - acquistion rate (28.4% - 6.9%)
SELECT
ROUND((SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) - SUM(CASE WHEN churn_value = TRUE THEN 1 ELSE 0 END)) * 100.0 / SUM(CASE WHEN customer_status != 'Joined' THEN 1 ELSE 0 END), 1) AS "Percent of total"
FROM customer_status;