# Bank-Churn-Analysis - SQL Project Summary

##  Introduction  
This SQL project focuses on analyzing customer churn behavior using transactional and demographic data from a bank's customer database. The goal is to derive actionable insights and calculate key performance indicators (KPIs) that can help the bank reduce churn and retain valuable clients.

## Objective  
The main objective of this project is to understand the financial and behavioural patterns of customers who churned versus those who remained loyal. The project aims to identify trends, risk factors, and business opportunities through SQL queries.

##  Dataset Overview  
The dataset `bank_churn_data` includes the following key columns:
## 🗂 Dataset Overview

| Column Name              | Description                                      |
|--------------------------|--------------------------------------------------|
| `clientnum`              | Unique client identifier                         |
| `customer_age`           | Age of the customer                              |
| `gender`                 | Gender of the client                             |
| `dependent_count`        | Number of dependents                             |
| `education_level`        | Education background                             |
| `marital_status`         | Marital status of the client                     |
| `income`                 | Client's income level                            |
| `card_category`          | Type of credit card held                         |
| `months_on_book`         | Duration as a client (in months)                 |
| `total_relationship_count` | Total number of products/services used        |
| `churn`                  | Indicates if the client churned (Yes/No)         |


## Core Analysis Areas  
- Key performance indicators (e.g., average credit limit, utilization ratio, age)  
- Financial behavior comparison of churned vs. non-churned customers  
- Churn rate analysis across income levels, card categories, and education levels  
- Customer segmentation using credit usage and account activity  

## Detailed Insights

### 1. Customer Profile & Financial Behavior  
- The average age of churned customers is **46.66 years**  
- The average credit limit is **$8,136.04**, and the average utilization ratio is **16.25%**  
- Most churned customers fall into the **"Low (0–20%)"** utilization category, suggesting inactivity or dissatisfaction rather than financial hardship  

### 2.  Card Type & Churn Trends  
- The most commonly churned card type is **Blue**, with **1,519 customers**  
- Premium cardholders (Silver, Gold, Platinum) also churn, indicating **high-tier cards don't guarantee loyalty**  
- The benefits of these cards may **not be attractive enough to retain customers**  

### 3. Tenure & Income Patterns  
- Customers with **$40K–$60K** income have the **shortest tenure (~35.77 months)** before churning  
- Most churned customers leave within the **first few years** of account opening  
- Lower-income customers churn the fastest, potentially due to **fee sensitivity or unmet expectations**  

### 4. Gender & Marital Status Insights  
- **Female customers** represent **57.16%** of all churned clients  
- **Married individuals** account for **43.58%** of churned customers  
- Engagement strategies should consider differences in **gender and marital status preferences**  

##  Key Takeaways for the Bank  
✅ Low credit utilization does not prevent churn – engagement and loyalty matter more  
✅ Mid-income customers ($40K–$60K) have the shortest tenure – may require tailored retention offers  
✅ Blue cardholders churn the most – basic card benefits need reassessment  
✅ Early churn suggests onboarding & engagement issues – improve first-year experience with better support and incentives  

##  Recommendations  
- Offer financial literacy resources and personalized incentives to low-income clients  
- Identify and engage high-risk churn segments early using account activity alerts  
- Tailor credit card product offerings based on customer needs and risk profiles  
- Redesign onboarding programs to engage customers in their first year  

##  Conclusion  
This SQL-based analysis provides actionable insights into customer churn behavior.  
It helps banks understand churn drivers and take preventive measures by leveraging credit usage, demographics, and account data.  
**Future enhancements** may include predictive models for churn forecasting and integration with CRM systems for automated retention strategies.
