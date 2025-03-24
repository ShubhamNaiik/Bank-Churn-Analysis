# 💳 Bank Churn Analysis – SQL Project

**Author:** Shubham Naik  
**Tools Used:** SQL (MySQL), Visual Studio  

---

## 📘 Introduction

This SQL-based project analyzes churned bank customers using demographic and financial data. The purpose is to identify key trends, behavioral patterns, and risk segments associated with customer churn. Insights derived from this project help inform customer retention strategies and product improvements.

---

## 🎯 Objective

The goal is to build a comprehensive SQL-driven backend to explore **why customers leave** the bank. Through a series of structured queries, the analysis uncovers churn trends across age, income, card usage, tenure, and demographic factors.

---

## 📄 Dataset Overview

The dataset `bank_churn_data.csv` includes **1,627 records** representing **only churned customers**.  

| Column Name         | Description                                      |
|---------------------|--------------------------------------------------|
| clientnum           | Unique client identifier                         |
| customer_age        | Age of the customer                              |
| gender              | Gender of the customer                           |
| dependent_count     | Number of dependents                             |
| education_level     | Educational background                           |
| marital_status      | Marital status                                   |
| income              | Income category                                  |
| card_category       | Type of credit card held                         |
| months_on_book      | Duration as a client (in months)                 |
| credit_limit        | Credit limit assigned to the customer            |
| utilization_ratio   | Ratio of utilized credit to credit limit         |
| balance             | Current account balance                          |
| churn               | Indicates if the client churned (all = Yes)      |

---

## 🧮 SQL Queries and Analysis

### 1. Total Customers, Age, Credit & Utilization
```sql
SELECT 
        COUNT(clientnum), 
        ROUND(AVG(customer_age)), 
        ROUND(AVG(credit_limit), 2), 
        ROUND(AVG(utilization_ratio), 2) 
FROM bank_churn_data;
```

Key Results:
![image](https://github.com/user-attachments/assets/2c3b891a-bfb0-47bc-8868-08ff4da0afa8)

Total Customers: 1,627

Average Age: 47 years

Average Credit Limit: $8,136.04

Average Utilization Ratio: 16.0%

### 2. Average Balance and Credit by Income Group
```sql

SELECT 
    income, 
    AVG(balance) AS avg_balance, 
    AVG(credit_limit) AS avg_credit_limit 
FROM bank_churn_data 
GROUP BY income
ORDER BY avg_balance DESC;
```
**Explanation:**
This query compares average balances and credit access across income levels.
![image](https://github.com/user-attachments/assets/29841096-06c3-48c2-8a2e-b571b5702780)


**Insight:**
Customers earning $80K–$120K have higher balances and access to more credit. However, even lower-income groups hold significant credit limits, suggesting broad access.

### 3. Utilization Distribution Categories
``` SQL 
SELECT 
    CASE 
        WHEN utilization_ratio < 0.2 THEN 'Low (0-20%)'
        WHEN utilization_ratio BETWEEN 0.2 AND 0.5 THEN 'Moderate (20-50%)'
        ELSE 'High (50%+)' 
    END AS utilization_category,
    COUNT(*) AS total_customers
FROM bank_churn_data
GROUP BY 
    CASE 
        WHEN utilization_ratio < 0.2 THEN 'Low (0-20%)'
        WHEN utilization_ratio BETWEEN 0.2 AND 0.5 THEN 'Moderate (20-50%)'
        ELSE 'High (50%+)' 
    END;
```
Explanation:
This bins customers into credit utilization brackets.

![image](https://github.com/user-attachments/assets/5e055cf8-712a-4cc7-9cf2-fc0de4be716a)

Key Insight:

58.5% of churned customers had low credit utilization (0–20%), indicating churn may be driven by lack of engagement, not debt pressure.

### 4. Top 10 Customers by Utilization
```SQL 
SELECT 
    clientnum, 
    customer_age, 
    income, 
    credit_limit, 
    ROUND(utilization_ratio, 3) AS utilization_ratio
FROM bank_churn_data
ORDER BY utilization_ratio DESC
LIMIT 10;
```
Explanation:
Identifies the highest users of credit—these customers may have left due to credit dependency stress.
![image](https://github.com/user-attachments/assets/ec88f387-b0a8-44aa-a136-590293f51d4b)









### ✅ Key Metrics

- **Total Churned Clients:** 1,627  
- **Average Age:** 47 years  
- **Average Credit Limit:** $8,136.04  
- **Average Utilization Ratio:** 16.0%

### 📊 Financial Behavior

- **58.5%** of customers used **less than 20%** of their credit (Low Utilization)
- Churn isn't always due to financial stress—**inactivity may be the cause**
- Higher-income clients tend to have larger balances and credit limits

### 💳 Card Category Insights

- **Blue Card** holders account for **93% of churned customers**
- Premium cardholders (Silver, Gold, Platinum) also churned—indicating benefit gaps

### 👥 Demographics

- **57.2%** of churned users were **female**
- **43.6%** were **married**
- Most churned clients fall into the **46–55 age group**

### ⌛ Tenure Analysis

- Churn peaks between **35–50 months** of customer relationship
- Clients with **$40K–$60K** income had the **shortest tenure** (~35.77 months)

---

## 📌 Key Insights Summary

| Insight Area           | Findings |
|------------------------|----------|
| **Utilization Ratio**  | 58.5% had low utilization (<20%) |
| **Tenure Risk**        | Churn peaks after 3–4 years |
| **Card Type**          | Blue card linked with highest churn |
| **Income Sensitivity** | Mid-income ($40K–$60K) customers churn fastest |
| **Age Segment**        | 46–55 age group = most at-risk |

---

## ✅ Recommendations

- **Improve Blue card benefits** to increase engagement  
- **Introduce re-engagement campaigns** before the 36-month mark  
- **Create personalized offers** for mid-income earners  
- **Target 46–55 age group** with tailored retention strategies  
- **Monitor low utilization** as an early signal for churn risk  
- **Strengthen onboarding** and first-year experiences

---
##  Conclusion  
This SQL-based analysis provides actionable insights into customer churn behavior.  
It helps banks understand churn drivers and take preventive measures by leveraging credit usage, demographics, and account data.  
**Future enhancements** may include predictive models for churn forecasting and integration with CRM systems for automated retention strategies.
