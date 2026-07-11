-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: churn_analysis.sql
--
-- Purpose:
-- Analyze customer churn patterns across multiple
-- customer and subscription segments.
--
-- Analysis Areas:
-- - Churn by plan
-- - Churn by billing cycle
-- - Churn by industry
-- - Churn by region
-- - Churn reasons
--
-- Objective:
-- Identify the highest-risk customer segments and
-- understand key drivers behind customer attrition.
-- =========================================================

-- CHURN RATE BY PLAN
SELECT plan,
COUNT(*) as total_customers,
SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) as churned_customers,
100 * round(SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY plan
ORDER BY churn_rate DESC;

-- CHURN RATE BY INDUSTRY
SELECT industry,
COUNT(*) as total_customers,
SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) as churned_customers,
100 * round(SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY industry
ORDER BY churn_rate DESC;

-- CHURN RATE BY REGION
SELECT region,
COUNT(*) as total_customers,
SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) as churned_customers,
100 * round(SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY region
ORDER BY churn_rate DESC;

-- CHURN RATE BY BILLING CYCLE
SELECT billing_cycle,
COUNT(*) as total_customers,
SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) as churned_customers,
100 * round(SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY billing_cycle
ORDER BY churn_rate DESC;

-- CHURN RATE BY ACQUISITION CHANNEL
SELECT acquisition_channel,
COUNT(*) as total_customers,
SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) as churned_customers,
100 * round(SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY acquisition_channel
ORDER BY churn_rate DESC;





