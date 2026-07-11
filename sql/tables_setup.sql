-- =========================================================
-- SaaS Revenue Intelligence & Churn Analysis
-- File: tables_setup.sql
--
-- Purpose:
-- Create and structure the raw database tables used
-- throughout the SaaS revenue and churn analysis project.
--
-- Tables Created:
-- 1. subscriptions
--    -> customer-level subscription and churn data
--
-- 2. monthly_revenue
--    -> monthly SaaS KPI and revenue performance metrics
--
-- Notes:
-- - Date columns were initially imported as VARCHAR
--   to simplify CSV ingestion and handle blank values.
-- - Date cleaning and conversion are handled inside
--   analysis queries where needed.
-- =========================================================

CREATE DATABASE saas_analysis;

CREATE TABLE monthly_revenue (
    month VARCHAR(10),
    total_active_customers INT,
    new_customers INT,
    churned_customers INT,
    monthly_churn_rate_pct NUMERIC,
    total_mrr NUMERIC,
    avg_revenue_per_customer NUMERIC,
    customer_acquisition_cost NUMERIC
);

CREATE TABLE subscriptions (
    customer_id VARCHAR(20),
    plan VARCHAR(50),
    billing_cycle VARCHAR(20),
    industry VARCHAR(100),
    company_size VARCHAR(50),
    seats INT,
    monthly_revenue NUMERIC,
    acquisition_channel VARCHAR(100),
    region VARCHAR(100),
    signup_date VARCHAR(20),
    churned VARCHAR(10),
    churn_date VARCHAR(20),
    churn_reason VARCHAR(200),
    support_tickets_12mo INT,
    nps_score INT,
    feature_usage_pct INT,
    upgraded VARCHAR(10)
);

-- COHORT QUERY (Signup Cohorts)
SELECT
DATE_FORMAT(
STR_TO_DATE(signup_date, '%Y-%m-%d'),
'%Y-%m'
) AS cohort_month, COUNT(*) AS customers
FROM subscriptions
GROUP BY cohort_month
ORDER BY cohort_month;

-- CHURN DATE QUERY
SELECT
customer_id,
CASE
	WHEN churn_date = '' THEN NULL
	ELSE STR_TO_DATE(churn_date, '%Y-%m-%d')
END AS clean_churn_date
FROM subscriptions;


