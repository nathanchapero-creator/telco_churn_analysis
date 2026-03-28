SELECT
customer_status,
ROUND(count(*) * 100.0 / sum(count(*)) OVER (), 1) AS "Percent of total",
count(*),
sum(count(*)) OVER ()
FROM customer_status
WHERE customer_status != 'Joined'
GROUP BY customer_status;

SELECT
'Joined' AS customer_status,
ROUND(SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) * 100.0 / SUM(CASE WHEN customer_status != 'Joined' THEN 1 ELSE 0 END), 1) AS "Percent of total"
FROM customer_status;

SELECT
ROUND((SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) - SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)) * 100.0 / SUM(CASE WHEN customer_status != 'Joined' THEN 1 ELSE 0 END), 1) AS "Percent of total"
FROM customer_status;