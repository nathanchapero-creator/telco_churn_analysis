# Telco Q3 Performance Analysis - California

<img width="850" height="687" alt="Telco_Project_Dashboard" src="https://github.com/user-attachments/assets/6cd629bb-368e-4e9d-975f-33a485a100e0" />
https://public.tableau.com/views/Telco_California_Q3_Churn_Analysis_Chapero/Dashboard1?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link

## Executive Summary
The California customer base in Q3 declined by **21.5%**, with churn (**28.4%**) significantly outweighing acquisition (**6.9%**). **Offer E** customers are our highest-risk segment, churning at double the average across all offers (**52.9%** vs. **24.8%**). **Boomers** represent another high-risk segment with elevated churn rates across all age groups (**35.1%** vs **28.8%** average). Given these patterns, efforts should focus on reducing early-stage churn rates using improved customer support, particularly for Offer E customers.

## The Business Problem
Telco's California customer base declined significantly in Q3. Retention difficulties are outweighing acquisition, leading to substantial net losses this quarter. This trend highlights the growing challenges of customer retention. Identifying and analyzing the main churn drivers will reveal which customer segments are most at risk. Understanding these drivers is critical for stabilizing the customer base and future revenue growth.

## Key Insights
* **High Acquisition, High Risk**: Offer E churns at **52.9%**, nearly double the **27.1%** rate of customers on no offer. As the only active acquisition offer this quarter, it's the most actionable retention opportunity.
* **Older Generations:** Boomers churned at **35.1%**, more than 11 percentage points above the **23.5%** average across comparable age groups.
 * Note: "Silent" generation was not highlighted due to a low sample size of n = 147, while the remaining age groups averaged ~1,725 each.

### Additional Insights
* **External Retention Challenges:** Among customers who churned and provided a reason, **45%** cited **competition** as a driving factor for leaving.
* **Lack of Customer Service:** Customers without **Premium Tech Support** churned at **twice** the rate, indicating that customer support quality is a key retention driver (31.2% vs 15.2%).
* **Customers Churn Early:** Around **1/3** customers (31.9%) who churned this quarter were customers for 3 months or fewer.

## Strategic Recommendations
* **Monitor Offer E Onboarding**: More personalized customer outreach support for **Offer E** to increase retention
* Increase customer support
* Focus on bettering retention for boomers

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





Dataset derived from Kaggle.com: https://www.kaggle.com/datasets/aadityabansalcodes/telecommunications-industry-customer-churn-dataset
