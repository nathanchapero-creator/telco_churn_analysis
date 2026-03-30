-- Churn rates within each offer
WITH churn_rates_within AS (
SELECT
offer,
ROUND(SUM(CASE WHEN churn_value = TRUE THEN 1 ELSE 0 END) * 100.0 / count(*),1) AS churn_rate_within,
SUM(CASE WHEN churn_value = TRUE THEN 1 ELSE 0 END) AS churned_count, 
count(*) AS total_count_within
FROM customer_status
LEFT JOIN customer_services
ON customer_status.customer_id = customer_services.customer_id
GROUP BY offer),

-- General churn rates for offers
general_churn_rates AS (
SELECT
offer,
ROUND(count(*) * 100.0 / SUM(count(*)) OVER (), 1) AS churn_rate,
count(*) AS churn_count,
SUM(count(*)) OVER () AS total_general_count
FROM customer_status
LEFT JOIN customer_services
ON customer_status.customer_id = customer_services.customer_id
WHERE churn_value = TRUE
GROUP BY offer),

-- Acquisition rates per offer
acquisition_rates AS (
SELECT
offer,
ROUND(count(*) * 100.0 / sum(count(*)) OVER (), 1) AS acquisition_rate,
count(*) AS joined_count,
SUM(count(*)) OVER() AS total_joined_count
FROM customer_services
LEFT JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
WHERE customer_status = 'Joined'
GROUP BY offer)

SELECT
c.offer,
c.churn_rate_within,
c.churned_count,
c.total_count_within,
g.churn_rate,
g.churn_count,
g.total_general_count,
a.acquisition_rate,
a.joined_count,
a.total_joined_count
FROM churn_rates_within c
LEFT JOIN general_churn_rates g
ON c.offer = g.offer
LEFT JOIN acquisition_rates a
ON c.offer = a.offer