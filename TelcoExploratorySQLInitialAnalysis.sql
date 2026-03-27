-- Initial exploratory SQL queries. Includes queries on churn rate and acquistion rate.

-- Reasons for churning by category
SELECT
churn_category,
round((count(*) * 100.0)/sum(count(*)) OVER (),1)
FROM customer_status
WHERE churn_category IS NOT NULL and churn_category != ''
GROUP BY churn_category;

-- Reasons for churning and their counts
SELECT 
churn_reason,
count(*)
FROM
customer_status
GROUP BY churn_reason;

-- Churn rate within their contract type
SELECT
contract,
round(avg(churn_score),2) AS percent_churned
FROM customer_services LEFT JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
GROUP BY contract;

-- Percent of people who churned within their age group (e.g 35.1% of Boomer customers churned this quarter)
SELECT
CASE
    WHEN age <= 27 THEN 'Gen Z'
    WHEN age >= 28 AND age <= 43 THEN 'Millenial'
    WHEN age >= 44 AND age <= 59 THEN 'Gen X'
    WHEN age >= 60 AND age <= 78 THEN 'Boomer'
    ELSE 'Silent'
END AS age_cohort,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS percent_of_cohort,
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS churn_count
FROM customer_demographics 
LEFT JOIN customer_status
ON customer_demographics.customer_id = customer_status.customer_id
GROUP BY age_cohort;

-- Offer churn percentages within each offer (e.g 52.9% of Offer E customers churned)
SELECT
offer,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS percent_churned_within,
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS total_churned_count,
count(*) AS total_count
FROM customer_services
LEFT JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
GROUP BY offer;


-- Offer churn percentages compared to all offers
SELECT
offer,
ROUND(count(*) * 100.0 / sum(count(*)) OVER (), 1) AS percent_churned,
count(*),
sum(count(*)) OVER ()
FROM customer_services
LEFT JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
WHERE churn_value = true AND offer != 'None'
GROUP BY offer;

-- Churn percentages within payment type
SELECT
payment_method,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS percent_churned_within,
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS total_churned_count,
count(*) AS total_count
FROM customer_services
LEFT JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
GROUP BY payment_method;

-- Churn percentages within payment type within Boomers
SELECT
payment_method,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS percent_churned_within,
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS total_churned_count,
count(*) AS total_count
FROM customer_services
INNER JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
INNER JOIN customer_demographics
ON customer_services.customer_id = customer_demographics.customer_id
WHERE age >= 60 AND age <= 78
GROUP BY payment_method;

-- Churn rate by who has tech support
SELECT
premium_tech_support,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS percent_churned_within,
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS total_churned_count,
count(*) AS total_count
FROM customer_services
LEFT JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
GROUP BY premium_tech_support;

-- Churn rate by who has tech support, Boomers only
SELECT
premium_tech_support,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS percent_churned_within,
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS total_churned_count,
count(*) AS total_count
FROM customer_services
INNER JOIN customer_status
ON customer_services.customer_id = customer_status.customer_id
INNER JOIN customer_demographics
ON customer_services.customer_id = customer_demographics.customer_id
WHERE age >= 60 AND age <= 78
GROUP BY premium_tech_support;

-- CLTV metrics (Box Plot)
SELECT
min(cltv) AS Min_CLTV,
max(cltv) AS Max_CLTV,
ROUND(avg(cltv),2) AS Average_CLTV,
PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY cltv) AS p25,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY cltv) AS p50,
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY cltv) AS p75
FROM customer_status;

-- General Churn rate divided by ClTV
SELECT
CASE
	WHEN cltv <= 3469 THEN '25th Percentile'
	WHEN cltv <= 4527 THEN '50th Percentile'
	WHEN cltv <= 5380.5 THEN '75th Percentile'
	ELSE '100th Percentile'
END AS percentile_group,
ROUND(count(*) * 100.0/ SUM(count(*)) OVER (), 2)
FROM customer_status
WHERE churn_value = true
GROUP BY percentile_group;

-- Churn rate within each percentile
SELECT
CASE
	WHEN cltv <= 3469 THEN '25th Percentile'
	WHEN cltv <= 4527 THEN '50th Percentile'
	WHEN cltv <= 5380.5 THEN '75th Percentile'
	ELSE '100th Percentile'
END AS percentile_group,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 2) AS churn_percentage
FROM customer_status
GROUP BY percentile_group;

-- Churn rate by satisfaction score (limitation?)
SELECT
satisfaction_score,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS percent_churned_within,
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS total_churned_count,
count(*) AS total_count
FROM customer_status
GROUP BY satisfaction_score;

-- Total number of customers who joined (454 Joined)
SELECT
customer_status,
count(*)
FROM customer_status
GROUP BY customer_status;

-- Joined customer grouped by Offer (e.g Offer A, Offer B, etc.)
SELECT
offer,
count(*)
FROM customer_status
LEFT JOIN customer_services
ON customer_status.customer_id = customer_services.customer_id
WHERE customer_status = 'Joined'
GROUP BY offer;
