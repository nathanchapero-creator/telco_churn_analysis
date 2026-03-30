-- Churn rates by whether customer is a senior citizen (according to database)
SELECT
senior_citizen,
ROUND(SUM(CASE WHEN churn_value = TRUE THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS "Churn % within",
SUM(CASE WHEN churn_value = TRUE THEN 1 ELSE 0 END),
count(*)
FROM customer_status
LEFT JOIN customer_demographics
ON customer_status.customer_id = customer_demographics.customer_id
GROUP BY senior_citizen;

-- Churn rates within each age group
SELECT
CASE
    WHEN age <= 27 THEN 'Gen Z'
    WHEN age >= 28 AND age <= 43 THEN 'Millenial'
    WHEN age >= 44 AND age <= 59 THEN 'Gen X'
    WHEN age >= 60 AND age <= 78 THEN 'Boomer'
    ELSE 'Silent'
END AS age_cohort,
ROUND(SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) * 100.0 / count(*), 1) AS "Churn % Within",
SUM(CASE WHEN churn_value = true THEN 1 ELSE 0 END) AS "Churn Count",
count(*) AS "Total Count"
FROM customer_demographics 
LEFT JOIN customer_status
ON customer_demographics.customer_id = customer_status.customer_id
GROUP BY age_cohort;