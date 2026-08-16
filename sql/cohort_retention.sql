-- Cohort retention table for Power BI
WITH RECURSIVE months AS (
 SELECT DATE_FORMAT(MIN(signup_date),'%Y-%m-01') month_start FROM subscriptions
 UNION ALL SELECT DATE_ADD(month_start,INTERVAL 1 MONTH) FROM months
 WHERE month_start < (SELECT DATE_FORMAT(MAX(COALESCE(churn_date,signup_date)),'%Y-%m-01') FROM subscriptions)
)
SELECT DATE_FORMAT(s.signup_date,'%Y-%m') cohort_month,m.month_start,
TIMESTAMPDIFF(MONTH,DATE_FORMAT(s.signup_date,'%Y-%m-01'),m.month_start) months_since_signup,
COUNT(DISTINCT s.customer_id) cohort_customers,
COUNT(DISTINCT CASE WHEN s.signup_date<=LAST_DAY(m.month_start) AND (s.churn_date IS NULL OR s.churn_date>LAST_DAY(m.month_start)) THEN s.customer_id END) active_customers
FROM subscriptions s CROSS JOIN months m
WHERE m.month_start>=DATE_FORMAT(s.signup_date,'%Y-%m-01')
GROUP BY cohort_month,m.month_start;
