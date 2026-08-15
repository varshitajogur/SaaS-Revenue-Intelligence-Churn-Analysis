"""
SaaS Churn Prediction — Logistic Regression
Purpose:
- Build an interpretable baseline churn model
- Use a stratified train/test split
- Report precision, recall, F1, ROC-AUC and confusion matrix
- Export coefficients and customer-level churn probabilities

Run from repository root:
    python analysis/churn_prediction.py
"""

from pathlib import Path
import pandas as pd
import numpy as np

from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.impute import SimpleImputer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import (
    accuracy_score, precision_score, recall_score, f1_score,
    roc_auc_score, confusion_matrix, classification_report
)

DATA = Path("data/subscriptions.csv")
OUT = Path("analysis/results")
OUT.mkdir(parents=True, exist_ok=True)

df = pd.read_csv(DATA)

df["churn_flag"] = df["churned"].map({"Yes": 1, "No": 0})

features = [
    "plan", "billing_cycle", "industry", "company_size", "seats",
    "monthly_revenue", "acquisition_channel", "region",
    "support_tickets_12mo", "nps_score", "feature_usage_pct", "upgraded"
]

X = df[features].copy()
y = df["churn_flag"]

numeric_features = [
    "seats", "monthly_revenue", "support_tickets_12mo",
    "nps_score", "feature_usage_pct"
]
categorical_features = [c for c in features if c not in numeric_features]

numeric_pipe = Pipeline([
    ("imputer", SimpleImputer(strategy="median")),
    ("scaler", StandardScaler())
])

categorical_pipe = Pipeline([
    ("imputer", SimpleImputer(strategy="most_frequent")),
    ("onehot", OneHotEncoder(handle_unknown="ignore"))
])

preprocessor = ColumnTransformer([
    ("numeric", numeric_pipe, numeric_features),
    ("categorical", categorical_pipe, categorical_features)
])

model = LogisticRegression(max_iter=2000, class_weight="balanced")

pipeline = Pipeline([
    ("preprocessor", preprocessor),
    ("model", model)
])

X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.25, random_state=42, stratify=y
)

pipeline.fit(X_train, y_train)

pred = pipeline.predict(X_test)
prob = pipeline.predict_proba(X_test)[:, 1]

metrics = pd.DataFrame([{
    "accuracy": accuracy_score(y_test, pred),
    "precision": precision_score(y_test, pred, zero_division=0),
    "recall": recall_score(y_test, pred, zero_division=0),
    "f1": f1_score(y_test, pred, zero_division=0),
    "roc_auc": roc_auc_score(y_test, prob)
}])
metrics.to_csv(OUT / "model_metrics.csv", index=False)

cm = confusion_matrix(y_test, pred)
pd.DataFrame(
    cm,
    index=["Actual_No_Churn", "Actual_Churn"],
    columns=["Predicted_No_Churn", "Predicted_Churn"]
).to_csv(OUT / "confusion_matrix.csv")

report = classification_report(
    y_test, pred, output_dict=True, zero_division=0
)
pd.DataFrame(report).transpose().to_csv(OUT / "classification_report.csv")

# Extract interpretable coefficients
feature_names = pipeline.named_steps["preprocessor"].get_feature_names_out()
coefficients = pipeline.named_steps["model"].coef_[0]

coef_df = pd.DataFrame({
    "feature": feature_names,
    "coefficient": coefficients,
    "odds_ratio": np.exp(coefficients)
}).sort_values("coefficient", key=np.abs, ascending=False)

coef_df.to_csv(OUT / "logistic_regression_coefficients.csv", index=False)

# Customer-level risk scores for the full dataset
all_prob = pipeline.predict_proba(X)[:, 1]
risk = df[["customer_id", "churned", "monthly_revenue"]].copy()
risk["predicted_churn_probability"] = all_prob
risk["risk_band"] = pd.cut(
    risk["predicted_churn_probability"],
    bins=[-0.01, 0.33, 0.66, 1.01],
    labels=["Low", "Medium", "High"]
)
risk.sort_values("predicted_churn_probability", ascending=False).to_csv(
    OUT / "customer_churn_risk_scores.csv", index=False
)

print("Logistic regression complete.")
print(f"Results saved to: {OUT.resolve()}")
