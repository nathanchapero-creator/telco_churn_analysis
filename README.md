# Telco Q3 Performance Analysis - California

<img width="850" height="687" alt="Telco_Project_Dashboard" src="https://github.com/user-attachments/assets/6cd629bb-368e-4e9d-975f-33a485a100e0" />
https://public.tableau.com/views/Telco_California_Q3_Churn_Analysis_Chapero/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Executive Summary
The California customer base in Q3 declined by **21.5%**, with churn (**28.4%**) significantly outweighing acquisition (**6.9%**). **Offer E** customers are our highest-risk segment, churning at double the overall average across all offers (**52.9%** vs. **24.8%**). **Boomers** represent another high-risk segment with elevated churn rates (**35.1%** vs **28.8%** average). Given these patterns, efforts should focus on reducing early-stage churn rates using improved customer support, particularly for Offer E customers.

## The Business Problem
* Q3 proved to be a difficult quarter, as the California customer base shrank by **21.5%**.
* Acquisition rate was acceptable at a rate of **6.9%**, but a churn rate of **28.4%** signaled major issues in retention. What could be the main drivers for such a high churn rate?

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

## Key Insights
* **Offer E** was our largest targeted acquisition method, making up **38.5%** of acquisitions
* **Offer E** held the worst retention rate at **52.9%**, more than 2x the average churn rate of **24.8%**.
* Customers from the **Boomer** generation (Between 60 and 78 years old) had the highest churn rate at **35.1%**, nearly 10% more than the average churn rate of 28.8%.
 * Note: "Silent" generation was not highlighted due to a low sample size of n = 147, while the other four age groups averaged at n = 1725.
* Within customers who churned and gave a reason, **45.0%** churned due to competitors.
* Customers without **Premium Tech Support** churned at **twice** the rate.

## Strategic Recommendations
* More personalized customer outreach support for **Offer E** to increase retention
* Increase customer support
* Focus on bettering retention for boomers

## Technical Appendix

*Age groups were a custom column segmenting customers into the following age groups:
 * Gen Z: 27 years old or less
 * Millennial: Between 28 and 43 years old
 * Gen X: Between 44 and 59 years old
 * Boomer: Between 60 and 78 years old
 * Silent: 79 years old or more

* This project analyzes churn and acquisition rates for Telco, a fictional telecommunications company, using the publicly available IBM 2019 dataset.
* This database covers California markets in Q3, focusing on customer attrition rates and narrowed down to age and offer cohorts





Dataset derived from Kaggle.com: https://www.kaggle.com/datasets/aadityabansalcodes/telecommunications-industry-customer-churn-dataset
