-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: data_cleaning.sql
--
-- Purpose:
-- Perform initial data validation and cleaning checks
-- on the imported SaaS subscription datasets.
--
-- Key Tasks:
-- - Null value checks
-- - Duplicate detection
-- - Churn status validation
-- - Date consistency checks
-- - Standardization of categorical fields
--
-- Objective:
-- Ensure imported datasets are reliable and analysis-ready
-- before performing business and churn analysis.
-- =========================================================

-- CHECK TOTAL ROWS
SELECT COUNT(*) FROM subscriptions;

-- CHECK NULL CUSTOMER IDS
SELECT *
FROM subscriptions
WHERE customer_id IS NULL;

-- CHECK DUPLICATES
SELECT customer_id, 
COUNT(*) as duplicate_count
FROM subscriptions
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- CHECK INVALID NPS
SELECT *
FROM subscriptions
WHERE nps_score < 0 OR nps_score > 10;

-- CHECK INVALID FEATURE USAGE
SELECT *
FROM subscriptions
WHERE feature_usage_pct > 100;

-- CHECK CHURN CONSISTENCY
SELECT *
FROM subscriptions
WHERE churned = "Yes" AND churn_date = '';

-- STANDARDIZE YES/NO VALUES
UPDATE subscriptions
SET churned = trim(churned);