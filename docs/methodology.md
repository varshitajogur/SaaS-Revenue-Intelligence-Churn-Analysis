# Analytical Methodology

## 1. Objective

Identify customer and subscription characteristics associated with SaaS churn and translate those findings into retention-focused business recommendations.

## 2. Research Design

This is a quantitative, observational analysis using simulated customer-level SaaS data.

### Primary outcome

**Churn:** binary outcome where:
- 1 = churned
- 0 = retained

### Main explanatory variables

- Product feature usage
- NPS
- Support-ticket volume
- Subscription plan
- Billing cycle
- Monthly revenue
- Seats
- Acquisition channel
- Region
- Industry
- Company size
- Upgrade status

## 3. Descriptive Analysis

First, calculate:
- Customer count
- Churn rate
- MRR
- Revenue by plan
- Revenue by segment
- Retention by billing cycle
- Churn by acquisition channel

## 4. Statistical Testing

### Categorical variables

Use a **Chi-square test of independence** to evaluate whether churn is associated with:
- Plan
- Billing cycle
- Acquisition channel
- Region
- Industry
- Upgrade status

Report:
- Chi-square statistic
- Degrees of freedom
- p-value
- Cramer's V effect size

### Numeric variables

Use **Welch's independent-samples t-test** to compare churned and retained customers for:
- Feature usage
- NPS
- Support tickets
- Monthly revenue
- Seats

Report:
- Group means
- t-statistic
- p-value
- Cohen's d

A statistically significant result should be interpreted as evidence of an association/difference in this dataset, not proof of causation.

## 5. Predictive Analysis

Use **logistic regression** as the baseline churn prediction model.

### Why logistic regression?

It is interpretable and directly estimates the relationship between predictors and the probability of a binary churn outcome.

### Evaluation

Use a stratified train/test split and report:
- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC
- Confusion matrix

Because churn datasets can be imbalanced, precision and recall should be considered alongside accuracy.

## 6. Cohort Retention

Group customers by signup month and calculate retention across months since acquisition.

This identifies whether retention differs across customer cohorts and avoids relying only on one overall churn percentage.

## 7. Limitations

- Simulated dataset
- Observational design
- Potential omitted variables
- Results may not generalise to real SaaS businesses
- Predictive model is a portfolio baseline, not a production decision system
