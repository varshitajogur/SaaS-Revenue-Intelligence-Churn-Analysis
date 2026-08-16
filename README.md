# README — Key Findings Section

> **Important:** Replace every `[X]` with the actual result generated from your analysis. Do not use estimated or invented statistics.

---

## Key Findings

### 1. Product Adoption & Churn

Customers with **low product adoption** recorded a **[X]% churn rate**, compared with **[Y]% among high-adoption customers**.

The relationship between product adoption and churn was tested using a **[Chi-square / appropriate test]** and was **[statistically significant / not statistically significant]** (**p = [X]**, effect size = **[X]**).

**Business implication:** [Write the retention action supported by the result.]

---

### 2. Customer Satisfaction & Churn

Churned customers had an average **NPS of [X]**, compared with **[Y] among retained customers**.

The difference was **[statistically significant / not statistically significant]** (**p = [X]**, Cohen's d = **[X]**).

**Business implication:** [Explain what the company should do.]

---

### 3. Support Activity & Churn

Churned customers averaged **[X] support tickets**, compared with **[Y] among retained customers**.

The difference was **[statistically significant / not statistically significant]** (**p = [X]**, Cohen's d = **[X]**).

**Business implication:** [Explain whether support activity should be treated as an early-warning indicator.]

---

### 4. Subscription Plan & Churn

The **[Plan Name]** plan recorded the highest churn rate at **[X]%**, while **[Plan Name]** recorded the lowest at **[Y]%**.

The relationship between subscription plan and churn was **[statistically significant / not statistically significant]** (**χ² = [X]**, **p = [X]**, Cramer's V = **[X]**).

**Business implication:** [Explain what this means for plan strategy or retention.]

---

### 5. Acquisition Channel & Churn

Customers acquired through **[Channel]** recorded a **[X]% churn rate**, while **[Channel]** recorded **[Y]%**.

The relationship between acquisition channel and churn was **[statistically significant / not statistically significant]** (**χ² = [X]**, **p = [X]**, Cramer's V = **[X]**).

**Business implication:** Acquisition channels should be evaluated not only by customer volume but also by **retention and recurring revenue quality**.

---

## Churn Prediction Model

A **Logistic Regression** model was developed to estimate the probability of customer churn using subscription and behavioural characteristics.

### Model Performance

| Metric | Result |
|---|---:|
| Accuracy | [X] |
| Precision | [X] |
| Recall | [X] |
| F1 Score | [X] |
| ROC-AUC | [X] |

### Model Interpretation

The strongest model coefficients were associated with:

1. **[Variable]**
2. **[Variable]**
3. **[Variable]**
4. **[Variable]**
5. **[Variable]**

The model was used to generate customer-level **predicted churn probabilities** and classify customers into:

- **Low Risk**
- **Medium Risk**
- **High Risk**

---

## Cohort Retention

Retention was analysed by **customer signup cohort** and months since signup.

The **[Month/Year] cohort** showed the strongest retention after [X] months at **[X]%**, while the **[Month/Year] cohort** recorded **[Y]%**.

This cohort analysis provides a more detailed view of retention behaviour than relying only on the overall churn rate.

---

## Revenue at Risk

High-risk customers represented **[X]% of the customer base** but accounted for **[Y]% of total MRR**.

The estimated **MRR at risk was [X]** based on [state your calculation method].

This helps prioritise retention efforts toward customers where churn could have the greatest recurring-revenue impact.

---

## Business Recommendations

Based on the statistical and predictive analysis:

### 1. Prioritise high-risk, high-value customers
Use predicted churn probability alongside MRR to identify customers requiring proactive intervention.

### 2. Improve product adoption
If the analysis confirms a significant adoption–churn relationship, target low-adoption customers with onboarding and feature-adoption initiatives.

### 3. Monitor customer satisfaction
Use NPS and engagement indicators as potential early-warning signals where the analysis supports the relationship.

### 4. Evaluate acquisition quality
Assess acquisition channels using retention and recurring revenue, rather than acquisition volume alone.

### 5. Use cohort monitoring
Track retention by signup cohort to identify deterioration or improvement in customer lifecycle performance.

---

## Statistical Interpretation Note

The analysis identifies **associations and differences within the simulated dataset**. Statistical significance does **not** establish that one variable causes another.

The dataset is simulated and therefore the findings should not be interpreted as industry-wide or real-company conclusions.

---

## How to Replace the Placeholders

After running:

```bash
python analysis/statistical_analysis.py
python analysis/churn_prediction.py
python analysis/cohort_analysis.py
```

use the generated files in:

```text
analysis/results/
```

to replace each `[X]`, `[Y]`, and `[Variable]` above.

**Do not manually estimate the values.**
