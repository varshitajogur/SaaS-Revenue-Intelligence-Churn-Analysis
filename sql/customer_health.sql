-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: customer_health.sql
--
-- Purpose:
-- Build a customer health scoring framework using
-- engagement, support, and satisfaction metrics.
--
-- Health Score Factors:
-- - Feature usage
-- - NPS score
-- - Support ticket volume
-- - Upgrade behavior
--
-- Objective:
-- Segment customers by retention risk and identify
-- high-risk accounts requiring proactive intervention.
-- =========================================================

-- HEALTH SCORE
SELECT
customer_id,
(
CASE 
	WHEN feature_usage_pct >= 70 THEN 40
    WHEN feature_usage_pct >= 40 THEN 25
    ELSE 10
END
+
CASE 
	WHEN nps_score >= 9 THEN 30
    WHEN nps_score >= 7 THEN 20
    ELSE 10
END
+
CASE 
	WHEN support_tickets_12mo <= 3 THEN 20
    WHEN support_tickets_12mo <= 7 THEN 10
    ELSE 5
END
+
CASE
	WHEN upgraded = "Yes" THEN 10
    ELSE 5
    END
) AS health_score
FROM subscriptions;

-- HEALTH SEGMENTS
SELECT 
customer_id,
CASE
	WHEN health_score >= 80 THEN "Healthy"
    WHEN health_score >= 60 THEN "Moderate Risk"
    ELSE "High Risk"
END as customer_health

FROM (
	SELECT
	customer_id,
	(
	CASE 
		WHEN feature_usage_pct >= 70 THEN 40
		WHEN feature_usage_pct >= 40 THEN 25
		ELSE 10
	END
	+
	CASE 
		WHEN nps_score >= 9 THEN 30
		WHEN nps_score >= 7 THEN 20
		ELSE 10
	END
	+
	CASE 
		WHEN support_tickets_12mo <= 3 THEN 20
		WHEN support_tickets_12mo <= 7 THEN 10
		ELSE 5
	END
	+
	CASE
		WHEN upgraded = "Yes" THEN 10
		ELSE 5
		END
	) AS health_score
FROM subscriptions
) temp;
	