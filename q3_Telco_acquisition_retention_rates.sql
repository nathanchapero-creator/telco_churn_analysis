-- Acquisition rates per offer
SELECT
offer,
ROUND(count(*) * 100.0 / sum(count(*)) OVER (), 1),
count(*),
SUM(count(*)) OVER()
FROM customer_services
LEFT JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
WHERE customer_status = 'Joined'
GROUP BY offer;

-- Churn rates within each offer
SELECT
offer,
ROUND(SUM(CASE WHEN churn_value = TRUE THEN 1 ELSE 0 END) * 100.0 / count(*),1),
SUM(CASE WHEN churn_value = TRUE THEN 1 ELSE 0 END) AS "Churned", 
count(*) AS "Total customers within offer"
FROM customer_status
LEFT JOIN customer_services
ON customer_status.customer_id = customer_services.customer_id
GROUP BY offer;

-- General churn rates for offers
SELECT
offer,
ROUND(count(*) * 100.0 / SUM(count(*)) OVER (), 1),
count(*),
SUM(count(*)) OVER ()
FROM customer_status
LEFT JOIN customer_services
ON customer_status.customer_id = customer_services.customer_id
WHERE churn_value = TRUE
GROUP BY offer;