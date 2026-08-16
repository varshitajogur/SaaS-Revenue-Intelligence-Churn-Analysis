from pathlib import Path
import pandas as pd
df=pd.read_csv("data/subscriptions.csv"); out=Path("analysis/results"); out.mkdir(parents=True,exist_ok=True)
df["signup_date"]=pd.to_datetime(df["signup_date"],errors="coerce"); df["churn_date"]=pd.to_datetime(df["churn_date"],errors="coerce")
df["cohort_month"]=df.signup_date.dt.to_period("M").dt.to_timestamp()
last=max(df.signup_date.max(),df.churn_date.max() if df.churn_date.notna().any() else df.signup_date.max())
months=pd.date_range(df.cohort_month.min(),last.to_period("M").to_timestamp(),freq="MS")
rows=[]
for cohort,g in df.groupby("cohort_month"):
    size=g.customer_id.nunique()
    for m in months:
        if m<cohort: continue
        end=m+pd.offsets.MonthEnd(1)
        active=g[(g.signup_date<=end)&(g.churn_date.isna()|(g.churn_date>end))].customer_id.nunique()
        age=(m.year-cohort.year)*12+m.month-cohort.month
        rows.append([cohort.strftime("%Y-%m"),m.strftime("%Y-%m"),age,size,active,round(100*active/size,2)])
r=pd.DataFrame(rows,columns=["cohort_month","month","months_since_signup","cohort_customers","active_customers","retention_rate_pct"])
r.to_csv(out/"cohort_retention_results.csv",index=False)
r.pivot_table(index="cohort_month",columns="months_since_signup",values="retention_rate_pct",aggfunc="first").to_csv(out/"cohort_retention_matrix.csv")
print("Cohort analysis complete.")
