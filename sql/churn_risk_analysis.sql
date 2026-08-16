-- Business health segmentation and MRR-at-risk preparation
SELECT customer_id,plan,monthly_revenue,feature_usage_pct,nps_score,support_tickets_12mo,
CASE WHEN feature_usage_pct<33 AND nps_score<=6 THEN 'High Attention'
WHEN feature_usage_pct<50 OR nps_score<=6 THEN 'Monitor' ELSE 'Healthy' END health_segment,churned
FROM subscriptions;
