-- SQL preparation for statistical testing
SELECT churned,COUNT(*) customers,AVG(feature_usage_pct) avg_feature_usage,AVG(support_tickets_12mo) avg_support_tickets,AVG(nps_score) avg_nps,AVG(monthly_revenue) avg_mrr
FROM subscriptions GROUP BY churned;

SELECT plan,COUNT(*) customers,SUM(churned='Yes') churned_customers,ROUND(100*AVG(churned='Yes'),2) churn_rate_pct
FROM subscriptions GROUP BY plan ORDER BY churn_rate_pct DESC;

SELECT acquisition_channel,COUNT(*) customers,SUM(churned='Yes') churned_customers,ROUND(100*AVG(churned='Yes'),2) churn_rate_pct
FROM subscriptions GROUP BY acquisition_channel ORDER BY churn_rate_pct DESC;
