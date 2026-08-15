# Data Dictionary

## `subscriptions.csv`

| Field | Description | Type |
|---|---|---|
| `customer_id` | Unique customer identifier | Categorical |
| `plan` | Subscription plan | Categorical |
| `billing_cycle` | Monthly or annual billing cycle | Categorical |
| `industry` | Customer industry | Categorical |
| `company_size` | Customer company-size segment | Categorical |
| `seats` | Number of subscribed seats | Numeric |
| `monthly_revenue` | Monthly recurring revenue attributed to the customer | Numeric |
| `acquisition_channel` | Channel through which the customer was acquired | Categorical |
| `region` | Customer region | Categorical |
| `signup_date` | Customer signup date | Date |
| `churned` | Whether the customer churned | Binary |
| `churn_date` | Date of churn, when applicable | Date |
| `churn_reason` | Recorded churn reason, when applicable | Categorical |
| `support_tickets_12mo` | Support tickets during the previous 12 months | Numeric |
| `nps_score` | Customer NPS score | Numeric |
| `feature_usage_pct` | Product-feature usage percentage | Numeric |
| `upgraded` | Whether the customer upgraded | Binary |

## `monthly_revenue.csv`

Use this dataset for monthly SaaS-level revenue and KPI trend analysis.

> The source data is simulated. Do not present the resulting relationships as industry-wide facts or causal effects.
