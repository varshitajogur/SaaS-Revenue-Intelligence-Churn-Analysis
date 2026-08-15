"""
SaaS Churn Statistical Analysis
Purpose:
- Compare churned vs retained customers
- Run chi-square tests for categorical variables
- Run t-tests for numeric variables
- Calculate effect sizes / descriptive statistics
- Export reproducible results to analysis/results/

Run from repository root:
    python analysis/statistical_analysis.py
"""

from pathlib import Path
import pandas as pd
import numpy as np
from scipy.stats import chi2_contingency, ttest_ind

DATA = Path("data/subscriptions.csv")
OUT = Path("analysis/results")
OUT.mkdir(parents=True, exist_ok=True)

df = pd.read_csv(DATA)

required = [
    "churned", "plan", "billing_cycle", "industry", "company_size",
    "acquisition_channel", "region", "support_tickets_12mo",
    "nps_score", "feature_usage_pct", "monthly_revenue", "seats", "upgraded"
]
missing = [c for c in required if c not in df.columns]
if missing:
    raise ValueError(f"Missing columns: {missing}")

df["churn_flag"] = df["churned"].map({"Yes": 1, "No": 0})
df["signup_date"] = pd.to_datetime(df["signup_date"], errors="coerce")
df["churn_date"] = pd.to_datetime(df["churn_date"], errors="coerce")

# Descriptive summary
summary = df.groupby("churned")[[
    "monthly_revenue", "seats", "support_tickets_12mo",
    "nps_score", "feature_usage_pct"
]].agg(["count", "mean", "median", "std"]).round(3)
summary.to_csv(OUT / "churn_group_summary.csv")

# Numeric comparisons: Welch's t-test
numeric_cols = [
    "monthly_revenue", "seats", "support_tickets_12mo",
    "nps_score", "feature_usage_pct"
]
rows = []
for col in numeric_cols:
    churned = df.loc[df["churn_flag"] == 1, col].dropna()
    retained = df.loc[df["churn_flag"] == 0, col].dropna()
    stat, p = ttest_ind(churned, retained, equal_var=False)
    pooled_sd = np.sqrt((churned.var(ddof=1) + retained.var(ddof=1)) / 2)
    cohens_d = (churned.mean() - retained.mean()) / pooled_sd if pooled_sd else np.nan
    rows.append({
        "variable": col,
        "churned_mean": churned.mean(),
        "retained_mean": retained.mean(),
        "t_statistic": stat,
        "p_value": p,
        "cohens_d": cohens_d
    })

numeric_results = pd.DataFrame(rows).sort_values("p_value")
numeric_results.to_csv(OUT / "numeric_significance_tests.csv", index=False)

# Categorical relationships: chi-square
categorical_cols = [
    "plan", "billing_cycle", "industry", "company_size",
    "acquisition_channel", "region", "upgraded"
]
cat_rows = []
for col in categorical_cols:
    table = pd.crosstab(df[col], df["churn_flag"])
    chi2, p, dof, expected = chi2_contingency(table)
    n = table.to_numpy().sum()
    r, k = table.shape
    cramers_v = np.sqrt((chi2 / n) / max(1, min(k - 1, r - 1)))
    cat_rows.append({
        "variable": col,
        "chi2": chi2,
        "degrees_of_freedom": dof,
        "p_value": p,
        "cramers_v": cramers_v
    })

categorical_results = pd.DataFrame(cat_rows).sort_values("p_value")
categorical_results.to_csv(OUT / "categorical_significance_tests.csv", index=False)

# Simple data-quality report
quality = pd.DataFrame({
    "column": df.columns,
    "missing_values": df.isna().sum().values,
    "unique_values": df.nunique(dropna=True).values,
    "dtype": df.dtypes.astype(str).values
})
quality.to_csv(OUT / "data_quality_report.csv", index=False)

print("Statistical analysis complete.")
print(f"Results saved to: {OUT.resolve()}")
