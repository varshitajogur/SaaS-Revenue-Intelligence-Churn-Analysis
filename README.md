# README — Key Findings

> **Dataset note:** The analysis uses a simulated SaaS customer dataset containing **600 customers**. The findings below describe relationships within this dataset and should not be interpreted as causal or industry-wide conclusions.

---

## Key Findings

### 1. Product Adoption & Churn

Customers with **low product adoption (<40% feature usage)** recorded a **73.43% churn rate**, compared with **22.40% among customers with ≥40% feature usage**.

The relationship between product adoption and churn was statistically significant (**χ² = 150.143, p < 0.001, Cramer's V = 0.500**), indicating a strong association in the simulated dataset.

The underlying continuous comparison also showed a large difference: churned customers averaged **27.45% feature usage**, compared with **55.02% among retained customers** (**Welch's t = -18.126, p < 0.001, Cohen's d = -1.501**).

**Business implication:** Product adoption should be monitored as an early retention signal. Customers with low feature usage could be prioritised for onboarding, training, feature-discovery and customer-success interventions.

---

### 2. Customer Satisfaction & Churn

Churned customers had an average **NPS of 3.04**, compared with **5.81 among retained customers**.

The difference was statistically significant (**Welch's t = -14.729, p < 0.001, Cohen's d = -1.215**), representing a large effect in the simulated dataset.

**Business implication:** NPS can be used alongside product-adoption and engagement indicators to identify customers showing signs of dissatisfaction. Low-NPS customers should be investigated before assuming dissatisfaction alone causes churn.

---

### 3. Support Activity & Churn

Churned customers averaged **7.38 support tickets over 12 months**, compared with **5.50 among retained customers**.

The difference was statistically significant (**Welch's t = 5.541, p < 0.001, Cohen's d = 0.451**), indicating a moderate difference between the groups.

**Business implication:** Elevated support activity can be treated as a potential early-warning indicator, particularly when combined with low product adoption or low NPS. High ticket volume should trigger investigation into the underlying customer experience rather than being treated as a standalone churn cause.

---

### 4. Subscription Plan & Churn

The **Starter** plan recorded the highest churn rate at **70.51%**, while the **Enterprise** plan recorded the lowest at **22.00%**.

The relationship between subscription plan and churn was statistically significant (**χ² = 56.345, p < 0.001, Cramer's V = 0.306**).

The other plan-level churn rates were:

| Plan | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Starter | 217 | 153 | **70.51%** |
| Professional | 173 | 83 | **47.98%** |
| Business | 160 | 66 | **41.25%** |
| Enterprise | 50 | 11 | **22.00%** |

**Business implication:** Retention strategy should not treat all subscription plans equally. The Starter segment shows the greatest retention risk and should be investigated for onboarding, pricing, product-value and adoption issues.

---

### 5. Acquisition Channel & Churn

Customers acquired through **Referral** recorded a **61.29% churn rate**, while **Direct Sales** recorded the lowest at **39.29%**.

The relationship between acquisition channel and churn was statistically significant (**χ² = 13.831, p = 0.0167, Cramer's V = 0.152**), although the effect size was relatively small.

| Acquisition Channel | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Referral | 124 | 76 | **61.29%** |
| Partner | 100 | 58 | **58.00%** |
| Social Media | 52 | 29 | **55.77%** |
| Paid Ads | 115 | 61 | **53.04%** |
| Organic Search | 153 | 67 | **43.79%** |
| Direct Sales | 56 | 22 | **39.29%** |

**Business implication:** Acquisition channels should be evaluated not only by customer volume but also by **retention and recurring-revenue quality**. The higher churn observed among referral-acquired customers warrants further investigation rather than an assumption that the channel itself causes churn.

---

## Churn Prediction Model

A **Logistic Regression** model was developed to estimate the probability of customer churn using subscription, financial, engagement, support and acquisition characteristics.

The model used a **75/25 stratified train-test split** with `random_state=42`, and preprocessing included median imputation and standardisation for numeric variables plus one-hot encoding for categorical variables.

### Model Performance

| Metric | Result |
|---|---:|
| Accuracy | **84.67%** |
| Precision | **84.81%** |
| Recall | **85.90%** |
| F1 Score | **85.35%** |
| ROC-AUC | **93.25%** |

The held-out test set contained **150 customers**. The confusion matrix contained **60 true negatives, 12 false positives, 11 false negatives and 67 true positives**.

### Model Interpretation

The largest absolute logistic-regression coefficients were associated with:

1. **Product adoption / feature usage** — coefficient **-1.956**, odds ratio **0.141**
2. **Upgrade status** — `upgraded = No` coefficient **1.538**, odds ratio **4.654**
3. **Enterprise plan** — coefficient **-1.446**, odds ratio **0.235**
4. **NPS score** — coefficient **-1.220**, odds ratio **0.295**
5. **Starter plan** — coefficient **1.111**, odds ratio **3.037**

These coefficients indicate association with the model's predicted churn probability, not causal effects.

The model was also used to generate customer-level predicted churn probabilities and classify customers into:

- **Low Risk**
- **Medium Risk**
- **High Risk**

---

## Cohort Retention

Retention was analysed by **customer signup cohort** and months since signup.

At **12 months after signup**, the **November 2023 cohort** showed the strongest observed retention among cohorts with at least 10 customers, at **81.82%**.

The cohort contained **11 customers**, with **9 remaining active at month 12**.

This cohort analysis provides a more detailed view of retention behaviour than relying only on the overall churn rate.

> Because cohort sizes vary, retention percentages should be interpreted together with cohort size rather than ranked purely by percentage.

---

## Revenue at Risk

The logistic-regression model classified **275 of 600 customers (45.83%)** as high risk.

These high-risk customers represented **$152,968.85 in monthly recurring revenue (MRR)**, equivalent to **31.18% of the dataset's total $490,592.58 MRR**.

This figure should be interpreted as **MRR exposure held by high-risk customers**, rather than guaranteed revenue loss.

**Business implication:** Combining churn probability with MRR provides a practical prioritisation framework. Retention teams can focus first on customers who have both high predicted churn risk and meaningful recurring revenue.

---

## Business Recommendations

Based on the statistical and predictive analysis:

### 1. Prioritise high-risk, high-value customers

Use predicted churn probability alongside MRR to identify customers requiring proactive intervention.

### 2. Improve product adoption

The dataset shows a strong association between low feature usage and churn. Target low-adoption customers with onboarding, training and feature-adoption initiatives.

### 3. Monitor customer satisfaction

NPS was substantially lower among churned customers. Use NPS alongside engagement and support indicators as an early-warning signal.

### 4. Investigate Starter-plan retention

The Starter plan had the highest observed churn rate at **70.51%**. Investigate whether onboarding, perceived product value, pricing or adoption patterns explain the difference.

### 5. Evaluate acquisition quality

Referral customers showed the highest observed churn rate at **61.29%**, while Direct Sales showed **39.29%**. Acquisition channels should therefore be evaluated using downstream retention and recurring revenue, not only acquisition volume.

### 6. Use cohort monitoring

Track retention by signup cohort to identify differences in customer lifecycle performance over time.

---

## Statistical Interpretation Note

The analysis identifies **associations and differences within the simulated dataset**. Statistical significance does **not** establish that one variable causes another.

The dataset is simulated and therefore the findings should not be interpreted as industry-wide or real-company conclusions.

The logistic-regression risk scores are model outputs and should be validated on new or real customer data before being used for operational retention decisions.

---

## Reproducibility

The statistical analysis generates:

```text
analysis/results/
├── churn_group_summary.csv
├── numeric_significance_tests.csv
├── categorical_significance_tests.csv
├── model_metrics.csv
├── confusion_matrix.csv
├── logistic_regression_coefficients.csv
├── customer_churn_risk_scores.csv
├── cohort_retention_results.csv
└── cohort_retention_matrix.csv
```

The statistical tests use Welch's independent-samples t-test for numeric variables and chi-square tests with Cramer's V for categorical variables. The churn model uses logistic regression with a stratified 75/25 train-test split.

---

## Source Files Used

The findings above are based on the current repository's generated analysis outputs and the `subscriptions.csv` dataset.

Repository:
https://github.com/varshitajogur/SaaS-Revenue-Intelligence-Churn-Analysis
