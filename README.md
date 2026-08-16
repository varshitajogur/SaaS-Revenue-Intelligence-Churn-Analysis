# SaaS Revenue Intelligence & Churn Analysis

A business analytics project that investigates **customer retention, churn behaviour, subscription performance and recurring revenue** in a simulated SaaS environment.

The project combines **SQL/MySQL data analysis with Power BI business intelligence** to move from raw customer and revenue data to statistically informed retention insights and actionable business recommendations.

> **Dataset note:** The dataset is simulated for educational and portfolio purposes. Findings describe relationships within this dataset and should not be interpreted as causal claims about the wider SaaS industry.

---

## Project Objective

SaaS businesses depend on recurring revenue and customer retention. Understanding **who is likely to churn, which behaviours are associated with churn, and where recurring revenue is exposed** can help customer-success teams prioritise retention actions.

This project answers six core questions:

1. Which customer characteristics are associated with higher churn?
2. How does product adoption relate to retention?
3. Do subscription plans show different churn outcomes?
4. How do support activity and engagement differ between retained and churned customers?
5. Which acquisition channels show stronger retention performance?
6. Which customers or segments should be prioritised for retention intervention?

---

## Analytical Workflow

```text
Raw CSV Data
     ↓
Data Quality Checks
     ↓
SQL Cleaning & Transformation
     ↓
Exploratory Data Analysis
     ↓
Revenue & Customer KPI Analysis
     ↓
Statistical Relationship Testing
     ↓
Churn-Risk Analysis
     ↓
Power BI Dashboard
     ↓
Business Recommendations
```

---

## Dataset

The project uses two simulated datasets:

| Dataset | Purpose |
|---|---|
| `subscriptions.csv` | Customer subscriptions, plans, churn, acquisition channels, product adoption and support activity |
| `monthly_revenue.csv` | Monthly recurring revenue, customer growth, churn metrics and SaaS KPIs |

The analysis covers customer-level behavioural and subscription variables together with recurring-revenue measures.

---

# Key Findings

## 1. Product Adoption & Churn

Customers with **low product adoption (<40% feature usage)** recorded a **73.43% churn rate**, compared with **22.40%** among customers with **≥40% adoption**.

This represents a substantial difference in observed retention behaviour and supports treating product adoption as an important customer-health indicator in this simulated dataset.

![Product adoption versus churn](images/03_product_adoption_vs_churn.png)

### Business implication

Customer-success teams could use low product adoption as an **early-warning segment**, then test onboarding, feature-education and adoption campaigns before customers become disengaged.

> Association does not establish causation.

---

## 2. Subscription Plan & Churn

Observed churn varies considerably by subscription plan.

| Subscription Plan | Churn Rate |
|---|---:|
| Starter | **70.51%** |
| Professional | **47.98%** |
| Business | **41.25%** |
| Enterprise | **22.00%** |

The Starter plan has the highest observed churn, while Enterprise has the lowest.

![Churn by subscription plan](images/02_churn_by_plan.png)

### Business implication

Plan-level retention should be evaluated alongside **customer value, tenure and product adoption**. High churn in a lower-tier plan may indicate onboarding or engagement issues, while lower enterprise churn can reflect stronger account engagement or switching costs.

---

## 3. Acquisition Channel & Churn

Observed churn differs across acquisition channels.

| Acquisition Channel | Churn Rate |
|---|---:|
| Referral | **61.29%** |
| Partner | **58.00%** |
| Social Media | **55.77%** |
| Paid Ads | **53.04%** |
| Organic Search | **43.79%** |
| Direct Sales | **39.29%** |

![Acquisition channel churn](images/04_acquisition_channel_churn.png)

### Business implication

Acquisition quality should be evaluated using **retention and recurring-revenue outcomes**, not only customer acquisition volume.

---

# Churn Prediction

The project includes an interpretable churn-risk analysis layer using customer and behavioural characteristics.

Candidate predictors include:

- Tenure
- Product adoption
- Subscription plan
- MRR
- Support activity
- Engagement indicators
- Acquisition channel

The churn target is binary:

```text
Churn = 0 → Retained
Churn = 1 → Churned
```

## Model Comparison

The evaluated classification models show the following F1 performance:

| Model | F1 Score |
|---|---:|
| Logistic Regression | **87.1%** |
| Random Forest | **94.6%** |
| SVM (RBF) | **91.4%** |
| XGBoost | **93.7%** |
| KNN | **85.4%** |
| Naive Bayes | **78.1%** |

![Churn prediction model comparison](images/01_model_comparison.png)

### Interpretation

**Random Forest records the strongest F1 score among the models shown**, making it the leading model in this comparison.

For a production use case, model selection should also consider precision/recall trade-offs, probability calibration, interpretability and validation on genuinely unseen customer data.

---

# Revenue at Risk

The churn-risk analysis identifies **275 of 600 customers (45.83%)** as high risk.

These customers represent approximately:

**$152,968.85 in MRR**

or **31.18% of total MRR**.

![MRR exposure by churn risk](images/05_mrr_risk_exposure.png)

### Important interpretation

This is **MRR exposure associated with high-risk customers**, not guaranteed revenue loss.

The business value of the model is therefore in helping customer-success teams prioritise intervention based on both:

```text
Churn Risk
     +
Customer / MRR Value
     ↓
Retention Priority
```

---

# Business Intelligence Dashboard

The Power BI dashboard is structured around five business questions.

### 1. Executive Overview

- MRR
- Customer count
- Churn rate
- Retention rate
- Revenue trends

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
- Product adoption vs churn
- Support activity vs churn
- High-risk customer segments

### 5. Retention & Growth

- Retention patterns
- Cohort behaviour
- Acquisition-channel comparisons
- Retention priorities

---

# Statistical Analysis

The analytical framework includes statistical testing rather than relying only on dashboard visualisations.

Potential tests include:

| Question | Method |
|---|---|
| Categorical variable vs churn | Chi-square test |
| Continuous variable vs churn | T-test / ANOVA |
| Numeric relationships | Correlation analysis |
| Churn probability | Logistic regression |

For statistical results, the project should report:

- Test statistic
- p-value
- Effect size
- Confidence interval where appropriate

A statistically significant association should **not** be interpreted as evidence of causality.

---

# Cohort Retention

Retention can also be analysed by customer acquisition cohort:

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

Cohort analysis allows retention performance to be compared across customer signup periods instead of relying only on one overall churn figure.

---

# Customer Health & Retention Strategy

A useful customer-health framework combines behavioural signals with commercial value.

```text
Product Adoption
       +
Engagement
       +
Support Activity
       +
Tenure
       +
Churn Probability
       +
MRR
       ↓
Customer Risk Segment
       ↓
Retention Priority
```

### Recommended segmentation

**High Risk + High MRR**  
→ Immediate customer-success intervention

**High Risk + Low MRR**  
→ Scaled onboarding / automated engagement

**Low Risk + High MRR**  
→ Expansion and relationship management

**Low Risk + Low MRR**  
→ Standard lifecycle communication

---

# Key Business Recommendations

### 1. Monitor product adoption early

Customers with lower observed product adoption show substantially higher churn in the simulated dataset. Product usage should therefore be monitored as part of customer health.

### 2. Prioritise high-value churn risk

Churn probability becomes more useful when combined with MRR. This allows retention teams to focus on customers where intervention could protect the greatest recurring-revenue exposure.

### 3. Improve onboarding

Low-adoption segments can be targeted with onboarding, feature education and usage nudges.

### 4. Evaluate acquisition quality

Channels should be compared using **retention quality and recurring revenue**, not just acquisition volume.

### 5. Use cohort analysis

Cohort retention can identify whether newer customer groups are retaining better or worse than earlier cohorts.

---

# Technology Stack

| Technology | Purpose |
|---|---|
| **MySQL** | Data storage and querying |
| **SQL** | Cleaning, transformation, EDA and KPI analysis |
| **Power BI** | Interactive dashboards and business reporting |
| **CSV** | Source datasets |
| **GitHub** | Version control and project documentation |

![Technology and analytical visuals](images/01_model_comparison.png)

---

# Repository Structure

```text
SaaS-Revenue-Intelligence-Churn-Analysis/
│
├── analysis/
├── dashboard/
├── data/
├── docs/
├── images/
├── insights/
├── presentation/
├── sql/
├── README.md
└── requirements.txt
```

The repository currently contains dedicated areas for analysis, dashboard assets, data, documentation, visuals, insights, presentation material and SQL. 

---

# Limitations

1. The dataset is simulated.
2. Observed relationships should not be interpreted as causal.
3. Predictive performance depends on the available variables and validation methodology.
4. Results may not generalise to real SaaS customer populations.
5. High-risk MRR represents exposure, not guaranteed future revenue loss.
6. Real operational deployment would require validation on historical and future customer data.

---

# Future Extensions

- Customer Lifetime Value estimation
- Survival analysis
- Advanced cohort retention analysis
- Predictive customer-health scoring
- Revenue forecasting
- Automated KPI monitoring
- Model calibration
- Explainable AI
- Real-time dashboard integration
- Validation using real customer data

---

# Why This Project Matters

This project goes beyond creating a Power BI dashboard.

It demonstrates a complete business-analytics workflow:

**Business Problem → Data Preparation → SQL Analysis → KPI Measurement → Statistical Validation → Churn Prediction → Visualisation → Business Recommendation**

The final objective is to translate customer and revenue data into decisions that can support:

**Retention + Customer Success + Revenue Protection + Sustainable SaaS Growth**

---

# Academic Positioning

This project demonstrates practical skills relevant to Master's programmes in:

- Business Analytics
- Data Science
- Information Systems
- Artificial Intelligence
- Digital Transformation
- Management Analytics

The strongest aspect is the connection between **technical analysis and business decision-making**: the project uses SQL and predictive analytics to identify churn patterns, then translates those patterns into customer-success and revenue-retention actions.

---

## Author

**Varshita Jogur**

GitHub: https://github.com/varshitajogur
