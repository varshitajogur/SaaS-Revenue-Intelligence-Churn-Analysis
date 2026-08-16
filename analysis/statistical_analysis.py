from pathlib import Path
import pandas as pd, numpy as np
from scipy.stats import chi2_contingency, ttest_ind

df=pd.read_csv("data/subscriptions.csv")
out=Path("analysis/results"); out.mkdir(parents=True,exist_ok=True)
df["churn_flag"]=df["churned"].map({"Yes":1,"No":0})

nums=["monthly_revenue","seats","support_tickets_12mo","nps_score","feature_usage_pct"]
rows=[]
for c in nums:
    a=df.loc[df.churn_flag==1,c].dropna(); b=df.loc[df.churn_flag==0,c].dropna()
    t,p=ttest_ind(a,b,equal_var=False)
    sd=np.sqrt((a.var(ddof=1)+b.var(ddof=1))/2)
    rows.append([c,a.mean(),b.mean(),t,p,(a.mean()-b.mean())/sd if sd else np.nan])
pd.DataFrame(rows,columns=["variable","churned_mean","retained_mean","t_statistic","p_value","cohens_d"]).to_csv(out/"numeric_significance_tests.csv",index=False)

cats=["plan","billing_cycle","industry","company_size","acquisition_channel","region","upgraded"]
rows=[]
for c in cats:
    tab=pd.crosstab(df[c],df.churn_flag); chi,p,dof,_=chi2_contingency(tab); n=tab.to_numpy().sum()
    r,k=tab.shape; v=np.sqrt((chi/n)/max(1,min(k-1,r-1)))
    rows.append([c,chi,dof,p,v])
pd.DataFrame(rows,columns=["variable","chi2","degrees_of_freedom","p_value","cramers_v"]).to_csv(out/"categorical_significance_tests.csv",index=False)
df.groupby("churned")[nums].agg(["count","mean","median","std"]).to_csv(out/"churn_group_summary.csv")
print("Statistical analysis complete.")
