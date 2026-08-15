/*
SaaS Churn Statistical Testing — SQL preparation layer

MySQL 8+
This file prepares grouped tables for statistical testing.
Run the statistical tests themselves in Python/R because MySQL
does not provide a complete native statistical-testing workflow.

Expected table:
subscriptions
*/

-- 1. Churn summary by numeric behaviour
SELECT
    churned,
    COUNT(*) AS customers,
    ROUND(AVG(feature_usage_pct), 2) AS avg_feature_usage_pct,
    ROUND(AVG(support_tickets_12mo), 2) AS avg_support_tickets,
    ROUND(AVG(nps_score), 2) AS avg_nps,
    ROUND(AVG(monthly_revenue), 2) AS avg_monthly_revenue
FROM subscriptions
GROUP BY churned;

-- 2. Churn rate by product adoption band
SELECT
    CASE
        WHEN feature_usage_pct < 33 THEN 'Low'
        WHEN feature_usage_pct < 67 THEN 'Medium'
        ELSE 'High'
    END AS adoption_band,
    COUNT(*) AS customers,
    SUM(churned = 'Yes') AS churned_customers,
    ROUND(100 * AVG(churned = 'Yes'), 2) AS churn_rate_pct
FROM subscriptions
GROUP BY adoption_band
ORDER BY FIELD(adoption_band, 'Low', 'Medium', 'High');

-- 3. Churn by subscription plan
SELECT
    plan,
    COUNT(*) AS customers,
    SUM(churned = 'Yes') AS churned_customers,
    ROUND(100 * AVG(churned = 'Yes'), 2) AS churn_rate_pct
FROM subscriptions
GROUP BY plan
ORDER BY churn_rate_pct DESC;

-- 4. Churn by acquisition channel
SELECT
    acquisition_channel,
    COUNT(*) AS customers,
    SUM(churned = 'Yes') AS churned_customers,
    ROUND(100 * AVG(churned = 'Yes'), 2) AS churn_rate_pct
FROM subscriptions
GROUP BY acquisition_channel
ORDER BY churn_rate_pct DESC;

-- 5. Churn by NPS band
SELECT
    CASE
        WHEN nps_score <= 3 THEN 'Low NPS'
        WHEN nps_score <= 6 THEN 'Neutral NPS'
        ELSE 'High NPS'
    END AS nps_band,
    COUNT(*) AS customers,
    ROUND(100 * AVG(churned = 'Yes'), 2) AS churn_rate_pct
FROM subscriptions
GROUP BY nps_band
ORDER BY churn_rate_pct DESC;
