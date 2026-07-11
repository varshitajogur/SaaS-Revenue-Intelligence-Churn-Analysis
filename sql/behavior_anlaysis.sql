-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: behavior_analysis.sql
--
-- Purpose:
-- Analyze customer behavior and engagement indicators
-- associated with churn risk and retention outcomes.
--
-- Analysis Areas:
-- - Feature usage vs churn
-- - NPS vs churn
-- - Support burden vs churn
-- - Upgrade behavior vs churn
--
-- Objective:
-- Identify behavioral patterns that predict customer
-- churn and long-term customer health.
-- =========================================================

-- FEATURE USAGE VS CHURN
SELECT 
CASE 
	WHEN feature_usage_pct < 30 THEN 'Low Usage'
    WHEN feature_usage_pct < 70 THEN 'Medium Usage'
    ELSE 'High Usage'
END as usage_segment, 
COUNT(*) as customers,
round(100 * SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY usage_segment
ORDER BY churn_rate DESC;

-- NPS VS CHURN
SELECT
CASE 
	WHEN nps_score <= 6 THEN 'Detractor'
    WHEN nps_score <= 8 THEN 'Passive'
    ELSE 'Promoter'
END as nps_category,
COUNT(*) as customers,
round(100 * SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY nps_category
ORDER BY churn_rate DESC;

-- SUPPORT TICKETS VS CHURN
SELECT 
CASE 
	WHEN support_tickets_12mo <= 3 THEN 'Low'
    WHEN support_tickets_12mo <= 7 THEN 'Medium'
    ELSE 'High'
END as support_segment, 
COUNT(*) as customers,
round(100 * SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY support_segment
ORDER BY churn_rate DESC;

-- UPGRADE IMPACT ON CHURN
SELECT 
upgraded,
COUNT(*) as customers,
round(100 * SUM(CASE WHEN churned = "Yes" THEN 1 ELSE 0 END) / COUNT(*), 2) as churn_rate
FROM subscriptions
GROUP BY upgraded
ORDER BY churn_rate DESC;

-- CHURN REASONS
SELECT churn_reason, 
COUNT(*) as churn_count
FROM subscriptions
WHERE churned = "Yes"
GROUP BY churn_reason
ORDER BY churn_count DESC;

