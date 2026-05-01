# Telco Q3 Performance Analysis - California

<img width="850" height="693" alt="Telco_Project_Dashboard" src="https://github.com/user-attachments/assets/8bf6407a-d7f0-46aa-9092-da3a3ed91078" />
https://public.tableau.com/views/Telco_California_Q3_Churn_Analysis_Chapero/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Executive Summary

The California Telco customer base declined by 21.5% in Q3, driven by churn (28.4%), significantly outpacing acquisition (6.9%), indicating a retention issue rather than a demand issue.

Two primary drivers explain most of the decline:

Offer E performance is the largest contributor to churn. Customers on Offer E churn at 52.9%, nearly double the overall rate, and represent the main targeted acquisition stream. This makes the offer both a growth and retention bottleneck.

Early-tenure churn is a second key issue. About 31.9% of customers churn within the first 90 days, suggesting onboarding or problems realizing early value.

Secondary patterns include higher churn among Boomer customers (35.1%) and users without Premium Tech Support (31.2% vs 15.2%), though these likely reflect underlying product or cohort differences rather than primary reasons for churn.

Overall, churn is concentrated in early lifecycle behavior and a single high-volume offer, making these the key areas for retention improvement.

## The Business Problem
Telco's California customer base declined significantly in Q3. Retention difficulties are outweighing acquisition, leading to substantial net losses this quarter. This trend highlights the growing challenges of customer retention. Identifying and analyzing the main churn drivers will reveal which customer segments are most at risk. Understanding these drivers is critical for stabilizing the customer base and future revenue growth.

## Key Insights
* **High Acquisition, Low Retention:** Offer E churns at **52.9%**, nearly double the overall churn rate (28.4%). As the only active acquisition offer this quarter, it's the most actionable retention opportunity.
* **Older Generations:** Boomers churned at **35.1%**, more than 11 percentage points above the **23.5%** average across comparable age groups.
 - Note: "Silent" generation was not highlighted due to a low sample size of n = 147, while the remaining age groups averaged ~1,725 each.

### Additional Insights
* **External Retention Challenges:** Among customers who churned and provided a reason, **45%** cited **competition** as a driving factor for leaving.
* **Lack of Customer Service:** Customers without **Premium Tech Support** churned at **twice** the rate, indicating that customer support quality is a key retention driver (31.2% vs 15.2%).
* **Customers Churn Early:** Around **1/3** customers (31.9%) churned within the first three months of their tenure, suggesting possible onboarding issues.

## Strategic Recommendations
* **Prioritize Offer E retention (highest priority):** Focus on converting promo users before plan expiry via early upsell flows and value reinforcement campaigns. Validate whether churn is dependent on promotions via non-offer cohorts.
* **Improve early-life retention:** Address 0–90 day churn by tightening onboarding, reducing time-to-first-value, and introducing structured activation milestones to retain customers.
* **Validate Boomer segment friction:** Investigate whether elevated churn is driven by UX, support accessibility, or acquisition differences before designing further interventions.

## Tools & Methodologies

### Tools Used
* TablePlus
* Tableau

### Concepts used
* Advanced SQL
  * Joins and Relational Logic
  * Window Functions
  * CASE Statements
  * Common Table Expressions (CTEs)
* Cohort Analysis (Segmentation by Offer & Age Type)
* Visualization
* Rate Calculation
* KPI Aggregation
* Data Validation & Integrity Testing
* Data Storytelling & Reporting

## Technical Appendix

*Age groups were a custom column segmenting customers into the following age groups:
 * Gen Z: 27 years old or less
 * Millennial: Between 28 and 43 years old
 * Gen X: Between 44 and 59 years old
 * Boomer: Between 60 and 78 years old
 * Silent: 79 years old or more

* This project analyzes churn and acquisition rates for Telco, a fictional telecommunications company, using the publicly available IBM 2019 dataset.
* This database covers California markets in Q3, focusing on customer attrition rates and narrowed down to age and offer cohorts

## SQL Query Directory

All data manipulation and metric calculations were performed using Advanced SQL. The queries are broken down by their function in the analysis:

**Exploratory Data Analysis**
* [q3_telco_exploratory_SQL_initial_analysis.sql](https://github.com/nathanchapero-creator/telco_churn_analysis/blob/main/q3_telco_exploratory_SQL_initial_analysis.sql) - *Initial data exploration and identification of high-level churn trends.*

**Dashboard Visualization Queries**
The following queries were used to isolate specific cohorts and generate the aggregated CSV outputs used in the Tableau dashboard:
* [q3_telco_churn_overview.sql](https://github.com/nathanchapero-creator/telco_churn_analysis/blob/main/q3_telco_churn_overview.sql) - *Calculates the baseline churn rate and overall market decline.*
* [q3_telco_acquisition_retention_rates.sql](https://github.com/nathanchapero-creator/telco_churn_analysis/blob/main/q3_telco_acquisition_retention_rates.sql) - *Data prep for analyzing the performance of Offer E versus overall retention.*
* [q3_telco_age_cohort_churn.sql](https://github.com/nathanchapero-creator/telco_churn_analysis/blob/main/q3_telco_age_cohort_churn.sql) - *Segments the customer base into generational cohorts (Gen Z, Millennials, Boomers, etc.) to calculate demographic churn rates.*





Dataset derived from Kaggle.com: https://www.kaggle.com/datasets/aadityabansalcodes/telecommunications-industry-customer-churn-dataset
