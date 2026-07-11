-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: exploratory_analysis.sql
--
-- Purpose:
-- Perform initial exploratory analysis to understand
-- overall customer, revenue, and churn behavior.
--
-- Key Metrics:
-- - Total customers
-- - Overall churn rate
-- - Total MRR
-- - Average revenue per customer
-- - Customer distribution by plan
--
-- Objective:
-- Establish a high-level understanding of the SaaS
-- business before deeper segmentation and churn analysis.
-- =========================================================

-- TOTAL CUSTOMERS
SELECT COUNT(*) as Total_customers
FROM subscriptions;

-- TOTAL MRR
SELECT round(SUM(monthly_revenue),2) as Total_mrr
FROM subscriptions;

-- AVERAGE REVENUE
SELECT round(AVG(monthly_revenue),2) as avg_revenue
FROM subscriptions;

-- OVERALL CHURN RATE
SELECT 
100 * round(SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2)
as churn_rate
FROM subscriptions;

-- CUSTOMERS BY PLAN
SELECT plan, COUNT(*) as customers
FROM subscriptions
GROUP BY plan
ORDER BY customers DESC;

-- CUSTOMERS BY REGION
SELECT region, COUNT(*) as customers
FROM subscriptions
GROUP BY region
ORDER BY customers DESC;