-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: monthly_kpi_analysis.sql
--
-- Purpose:
-- Analyze monthly SaaS KPI and revenue performance
-- trends using company-level aggregated metrics.
--
-- Analysis Areas:
-- - Monthly recurring revenue (MRR)
-- - Active customer growth
-- - Customer acquisition trends
-- - Monthly churn trends
-- - Customer acquisition cost (CAC)
--
-- Objective:
-- Evaluate overall business growth efficiency and
-- long-term SaaS revenue health over time.
-- =========================================================

-- MONTHLY MRR TREND

SELECT
    month,
    total_mrr
FROM monthly_revenue
ORDER BY month;


-- ACTIVE CUSTOMER GROWTH

SELECT
    month,
    total_active_customers
FROM monthly_revenue
ORDER BY month;


-- CUSTOMER ACQUISITION VS CHURN

SELECT
    month,
    new_customers,
    churned_customers
FROM monthly_revenue
ORDER BY month;


-- MONTHLY CHURN TREND

SELECT
    month,
    monthly_churn_rate_pct
FROM monthly_revenue
ORDER BY month;


-- CUSTOMER ACQUISITION COST (CAC) TREND

SELECT
    month,
    customer_acquisition_cost
FROM monthly_revenue
ORDER BY month;



-- =========================================================
-- AVERAGE REVENUE PER CUSTOMER (ARPC) TREND
-- Track monetization efficiency over time
-- =========================================================

SELECT
    month,
    avg_revenue_per_customer
FROM monthly_revenue
ORDER BY month;


-- MONTH-OVER-MONTH MRR GROWTH

SELECT
    month,
    total_mrr,
    ROUND( ( total_mrr - LAG(total_mrr) OVER (ORDER BY month) )
			/
			LAG(total_mrr) OVER (ORDER BY month) * 100, 2) AS mom_growth_pct
FROM monthly_revenue;