# Telco Q3 Performance Analysis - California

<img width="946" height="766" alt="Telco_Analysis_Dashboard" src="https://github.com/user-attachments/assets/79dddff0-0455-41f4-b40d-72610860260d" />
https://public.tableau.com/views/Telco_California_Q3_Churn_Analysis_Chapero/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Executive Summary
This project provides a structured churn and acquisition analysis of Telco, a fictional telecommunications company, using the publicly available IBM 2019 dataset. This database covers California markets in Q3, focusing on customer attrition rates and narrowed down to age and offer cohorts.

## The Business Problem
* Q3 proved to be a difficult quarter, as the California customer base shrank by **21.5%**.
* Acquisition rate was acceptable at a rate of **6.9%**, but a churn rate of **28.4%** signals major issues in retention. What could be the main drivers for such a high churn rate?

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
* Data Validation & Integration Testing
* Data Storytelling & Reporting

## Key Insights
* **Offer E** was the largest and only offer to acquire customers, making up **38.5%** of acquisitions
* **Offer E** was also the offer with the worst retention rate at **52.9%**, more than 2x the average churn rate of **24.8%**.
* Customers from the **Boomer** generation (Between 60 and 78 years old) had the highest churn rate at **35.1%**, nearly 10% more than the average churn rate of 28.8%.
 * Note: "Silent" generation was not highlighted due to a low sample size of n = 147, while the other four age groups averaged at n = 1725.

## Strategic Recommendations
* **Offer E's** acquisition rate is great, but retention efforts must be 

## Technical Appendix

*Age groups were a customer created column segmenting customers into the following age groups:
 * Gen Z: 27 years old or less
 * Millennial: Between 28 and 43 years old
 * Gen X: Between 44 and 59 years old
 * Boomer: Between 60 and 78 years old
 * Silent: 79 years old or more





Dataset derived from Kaggle.com: https://www.kaggle.com/datasets/aadityabansalcodes/telecommunications-industry-customer-churn-dataset
