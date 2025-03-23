-- Bank Churn Analysis Project
-- Author : Shubham Naik

-- Part 1 : Key Performance Indicators (KPIs) for the Bank 

-- 1.1 : Display all records from the bank_churn_data table
SELECT * FROM bank_churn_data; 

-- 1.2 : Total Number of Clients in the Bank
SELECT 
        COUNT(clientnum) AS total_number_of_clients 
FROM    bank_churn_data;

-- 1.3 : Average Utilization Ratio 
SELECT 
        ROUND(AVG(utilization_ratio), 2) AS average_utilization_ratio 
FROM    bank_churn_data;

-- 1.4 : Average Credit Limit
SELECT 
        ROUND(AVG(credit_limit), 2) AS average_credit_limit 
FROM    bank_churn_data;

-- 1.5 : Average Age of the Clients
SELECT 
        ROUND(AVG(customer_age)) AS average_age 
FROM    bank_churn_data;

-- Part 2 : Understanding Churned Customer Behavior

-- 2.1 : Financial Behavior Analysis
-- Average Bank Balance and Credit Limit by Income Level
SELECT income, 
       AVG(balance) AS avg_balance, 
       AVG(credit_limit) AS avg_credit_limit 
FROM bank_churn_data 
GROUP BY income
ORDER BY avg_balance DESC;

-- Credit Utilization Distribution Among Churned Customers
SELECT CASE 
         WHEN utilization_ratio < 0.2 THEN 'Low (0-20%)'
         WHEN utilization_ratio BETWEEN 0.2 AND 0.5 THEN 'Moderate (20-50%)'
         ELSE 'High (50%+)'
       END AS utilization_category,
       COUNT(*) AS total_customers
FROM bank_churn_data
GROUP BY utilization_category;

-- Top Customers with Highest Credit Utilization 
SELECT clientnum, customer_age, income, credit_limit, ROUND(utilization_ratio, 3) AS utilization_ratio
FROM bank_churn_data
ORDER BY utilization_ratio DESC 


-- 2.2 : Demographics & Churn Patterns
-- Customers Distribution by Gender and Their Financial Behavior
SELECT gender, COUNT(*) AS total_customers, 
       ROUND(AVG(balance), 2) AS avg_balance, 
       ROUND(AVG(utilization_ratio), 2) AS avg_utilization_ratio
FROM bank_churn_data 
GROUP BY gender 
ORDER BY gender;

-- Card Type Analysis Among Churned Customers
SELECT card_category, 
       COUNT(clientnum) AS number_of_customers, 
       ROUND(AVG(balance), 2) AS avg_balance, 
       ROUND(AVG(utilization_ratio), 2) AS avg_utilization_ratio
FROM bank_churn_data 
GROUP BY card_category 
ORDER BY number_of_customers DESC;

-- Average Bank Balance by Income Level
SELECT income, ROUND(AVG(balance)) AS average_balance FROM bank_churn_data GROUP BY income ORDER BY average_balance DESC;

-- Customers by Marital Status
SELECT marital_status, COUNT(clientnum) AS number_of_customers FROM bank_churn_data GROUP BY marital_status ORDER BY number_of_customers DESC;

-- 2.3 : Tenure & Customer Lifecycle
-- How Long Did Customers Stay Before Churning? (Tenure Analysis)
SELECT months_on_book, COUNT(*) AS total_customers FROM bank_churn_data GROUP BY months_on_book ORDER BY months_on_book DESC;

-- Income Groups with Shortest Average Tenure Before Churn
SELECT income, 
       COUNT(*) AS total_churned, 
       ROUND(AVG(months_on_book), 2) AS avg_tenure_before_churn
FROM bank_churn_data 
GROUP BY income 
ORDER BY avg_tenure_before_churn ASC;

-- Customer Segmentation by Age
SELECT CASE
         WHEN customer_age BETWEEN 18 AND 25 THEN '18-25'
         WHEN customer_age BETWEEN 26 AND 35 THEN '26-35'
         WHEN customer_age BETWEEN 36 AND 45 THEN '36-45'
         WHEN customer_age BETWEEN 46 AND 55 THEN '46-55'
         ELSE '56+' 
       END AS age_group,
       COUNT(clientnum) AS number_of_customers
FROM bank_churn_data
GROUP BY age_group
ORDER BY number_of_customers DESC;
