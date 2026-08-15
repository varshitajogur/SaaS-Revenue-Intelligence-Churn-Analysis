/*
SaaS Cohort Retention Analysis — MySQL 8+

Goal:
Track customer retention by signup month.
Because the dataset contains signup_date and churn_date,
retention can be estimated by whether the customer was still
active at each month after signup.

This produces a cohort-month table suitable for Power BI.
*/

WITH RECURSIVE
customer_base AS (
    SELECT
        customer_id,
        DATE_FORMAT(signup_date, '%Y-%m-01') AS cohort_month,
        signup_date,
        churn_date
    FROM subscriptions
),

months AS (
    SELECT DATE_FORMAT(MIN(signup_date), '%Y-%m-01') AS month_start
    FROM subscriptions

    UNION ALL

    SELECT DATE_ADD(month_start, INTERVAL 1 MONTH)
    FROM months
    WHERE month_start < (
        SELECT DATE_FORMAT(MAX(COALESCE(churn_date, signup_date)), '%Y-%m-01')
        FROM subscriptions
    )
),

cohort_activity AS (
    SELECT
        c.cohort_month,
        m.month_start,
        COUNT(DISTINCT c.customer_id) AS cohort_customers,
        COUNT(DISTINCT CASE
            WHEN c.signup_date <= LAST_DAY(m.month_start)
             AND (c.churn_date IS NULL OR c.churn_date > LAST_DAY(m.month_start))
            THEN c.customer_id
        END) AS active_customers
    FROM customer_base c
    CROSS JOIN months m
    WHERE m.month_start >= c.cohort_month
    GROUP BY c.cohort_month, m.month_start
)

SELECT
    cohort_month,
    month_start,
    TIMESTAMPDIFF(
        MONTH,
        STR_TO_DATE(cohort_month, '%Y-%m-%d'),
        month_start
    ) AS months_since_signup,
    cohort_customers,
    active_customers,
    ROUND(100 * active_customers / NULLIF(cohort_customers, 0), 2)
        AS retention_rate_pct
FROM cohort_activity
ORDER BY cohort_month, month_start;
