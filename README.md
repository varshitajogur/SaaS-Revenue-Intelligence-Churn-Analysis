# SaaS Revenue Intelligence & Churn Analysis

## Project Overview

This project investigates how customer behaviour, subscription characteristics, engagement, support activity, and acquisition channels are associated with churn and recurring revenue performance in a simulated SaaS environment.

The project combines **MySQL/SQL for data preparation and analysis** with **Power BI for business intelligence and executive reporting**.

> **Important:** The dataset is simulated for educational and portfolio purposes. Findings should therefore be interpreted as analytical relationships within this dataset, not as causal claims about the SaaS industry.

---

## Business Problem

SaaS businesses depend heavily on recurring revenue and customer retention. A small increase in churn can materially affect Monthly Recurring Revenue (MRR), customer lifetime value, and growth.

The objective of this project is to answer:

> **Which customer behaviours and subscription characteristics are most strongly associated with SaaS churn, and what can a customer-success team do with those insights?**

---

## Research Questions

1. Which customer characteristics are associated with higher churn?
2. How does product adoption relate to customer retention?
3. Are subscription plans associated with different retention outcomes?
4. How do support activity and customer engagement differ between retained and churned customers?
5. Which acquisition channels are associated with stronger long-term customer retention?
6. Which customer segments should be prioritised for retention interventions?

---

## Analytical Approach

```text
Raw CSV Data
     ↓
Data Quality Checks
     ↓
SQL Cleaning & Transformation
     ↓
Exploratory Data Analysis
     ↓
Customer / Revenue KPI Analysis
     ↓
Statistical Relationship Testing
     ↓
Churn-Risk Analysis
     ↓
Power BI Dashboard
     ↓
Business Recommendations
```

### Analysis stages

**1. Data preparation**
- Validate customer and subscription records
- Check missing values and duplicates
- Standardise categorical fields
- Validate revenue and churn fields
- Create analysis-ready tables

**2. Exploratory analysis**
- MRR and revenue trends
- Churn rate
- Retention rate
- Customer segmentation
- Product adoption
- Support activity
- Acquisition channels

**3. Statistical analysis**
Where appropriate, statistical tests should be used to determine whether observed differences are statistically meaningful rather than relying only on visual comparisons.

Potential tests include:
- Chi-square test for categorical variables and churn
- T-test / ANOVA for differences in continuous measures
- Correlation analysis for numeric relationships

**4. Churn-risk analysis**
The project can be extended with an interpretable **logistic regression model** to estimate churn probability and identify the variables most strongly associated with churn.

---

## Key SaaS Metrics

### Monthly Recurring Revenue (MRR)
Recurring subscription revenue generated during a month.

### Churn Rate
The proportion of customers lost during a defined period.

### Retention Rate
The proportion of customers retained during a defined period.

### Customer Health Score
A composite score based on measurable customer behaviour. The score should document:
- Variables included
- Weight assigned to each variable
- Scoring formula
- Reason for selecting each variable
- Validation against actual churn outcomes

---

## Dashboard

The Power BI dashboard is organised around five business questions:

### 1. Executive Overview
- MRR
- Customer count
- Churn rate
- Retention rate
- Revenue trend

### 2. Revenue Intelligence
- Recurring revenue trends
- Revenue by subscription plan
- Revenue by customer segment
- Acquisition performance

### 3. Customer Segmentation
- Customer distribution
- Plan-level behaviour
- Engagement patterns
- Product adoption

### 4. Churn Risk
- Churn by customer characteristics
- Product adoption vs. churn
- Support activity vs. churn
- High-risk customer segments

### 5. Retention & Growth
- Retention patterns
- Cohort behaviour
- Acquisition-channel comparisons
- Recommended retention priorities

---

## Key Findings

The current exploratory analysis indicates several areas worth investigating further:

- Enterprise customers generate a larger share of recurring revenue.
- Annual subscription customers show stronger retention patterns.
- Lower product adoption is associated with higher churn in the dataset.
- Support activity differs between retained and churned customer groups.
- Acquisition channels show differences in customer retention performance.

### Interpreting the findings

These observations describe **relationships in the simulated dataset**. They should not be interpreted as proof that one variable causes another.

For example:

> Instead of saying “low product adoption causes churn,” the appropriate interpretation is “low product adoption is associated with higher churn in this dataset.”

Statistical testing and predictive modelling should be used to assess the strength and reliability of these relationships.

---

## Recommended Next Analytical Layer

To make the project suitable for a stronger graduate-level analytics portfolio, the next stage is:

### Churn Prediction

Build an interpretable logistic regression model:

**Target variable**
- Churn: 0 / 1

**Candidate predictors**
- Tenure
- Product adoption
- Subscription plan
- MRR
- Support activity
- Engagement indicators
- Acquisition channel

### Model evaluation

Report:
- Accuracy
- Precision
- Recall
- F1-score
- ROC-AUC
- Confusion matrix

The model should be evaluated on held-out data rather than only the training dataset.

---

## Cohort Retention Analysis

A cohort view should track customer retention over time:

```text
Acquisition Month
       ↓
Month 0
       ↓
Month 1
       ↓
Month 2
       ↓
Month 3
       ↓
...
```

This allows comparison of retention behaviour across different acquisition cohorts instead of relying only on an overall churn rate.

---

## Business Recommendations

The analysis can support four practical retention priorities:

### 1. Identify low-engagement customers early
Create an early-warning segment based on measurable product-adoption and engagement indicators.

### 2. Prioritise high-value customers
Combine churn risk with MRR/customer value so retention teams focus on customers where intervention has the greatest potential business impact.

### 3. Improve onboarding and product adoption
If statistical analysis confirms the relationship between low adoption and churn, onboarding and feature-adoption interventions should be tested.

### 4. Evaluate acquisition quality
Compare retention outcomes across acquisition channels rather than evaluating channels only on initial customer acquisition volume.

---

## Dataset

The project uses two simulated datasets:

| Dataset | Purpose |
|---|---|
| `subscriptions.csv` | Customer subscriptions, plans, churn, acquisition channels, product adoption and support activity |
| `monthly_revenue.csv` | Monthly recurring revenue, customer growth, churn metrics and SaaS KPIs |

Because the data is simulated, the results are intended for **analytical demonstration and portfolio use**, not external business forecasting.

---

## Technology Stack

| Technology | Purpose |
|---|---|
| MySQL | Data storage and querying |
| SQL | Cleaning, transformation, EDA and KPI analysis |
| Power BI | Interactive dashboards and business reporting |
| CSV | Source datasets |
| GitHub | Version control and project documentation |

---

## Repository Structure

```text
SaaS-Revenue-Intelligence-Churn-Analysis/
│
├── data/
├── sql/
├── dashboard/
├── images/
├── insights/
├── presentation/
└── README.md
```

---

## Limitations

1. The dataset is simulated and may not represent real SaaS customer behaviour.
2. Observational relationships should not be interpreted as causal relationships.
3. Results may depend on the variables available in the dataset.
4. Predictive performance should be validated using a proper train/test methodology.
5. Findings should be re-evaluated on real customer data before operational use.

---

## Future Extensions

- Logistic regression churn prediction
- Customer Lifetime Value (CLV) estimation
- Cohort retention analysis
- Survival analysis
- Predictive customer health scoring
- Revenue forecasting
- Automated KPI monitoring
- Real-time dashboard integration

---

## Why This Project Matters

The purpose of this project is not simply to create a dashboard.

It demonstrates a complete analytical workflow:

**Business problem → data preparation → analysis → statistical validation → visualisation → interpretation → business action**

The emphasis is on translating customer and revenue data into decisions that can support **retention, customer success, and sustainable SaaS growth**.

---

## License

This project is intended for educational, portfolio, business analytics, and data visualisation purposes.
