-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: revenue_analysis.sql
--
-- Purpose:
-- Analyze revenue contribution across customer segments
-- to identify the highest-value revenue drivers.
--
-- Analysis Areas:
-- - Revenue by plan
-- - Revenue by region
-- - Revenue by industry
-- - Revenue by acquisition channel
--
-- Objective:
-- Understand which customer segments contribute most
-- significantly to SaaS revenue performance.
-- =========================================================

-- REVENUE BY PLAN
SELECT plan, 
round(SUM(monthly_revenue), 2) as revenue
FROM subscriptions 
GROUP BY plan
ORDER BY revenue DESC;

-- REVENUE BY INDUSTRY
SELECT industry, 
round(SUM(monthly_revenue), 2) as revenue
FROM subscriptions 
GROUP BY industry
ORDER BY revenue DESC;

-- REVENUE BY REGION
SELECT region, 
round(SUM(monthly_revenue), 2) as revenue
FROM subscriptions 
GROUP BY region
ORDER BY revenue DESC;

-- REVENUE BY ACQUISITION CHANNEL
SELECT acquisition_channel, 
round(SUM(monthly_revenue), 2) as revenue
FROM subscriptions 
GROUP BY acquisition_channel
ORDER BY revenue DESC;

-- REVENUE BY BILLING CYCLE
SELECT billing_cycle, 
round(SUM(monthly_revenue), 2) as revenue
FROM subscriptions 
GROUP BY billing_cycle
ORDER BY revenue DESC;

