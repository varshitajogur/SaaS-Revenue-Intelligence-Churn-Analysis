from pathlib import Path
import pandas as pd, numpy as np
from sklearn.model_selection import train_test_split
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import OneHotEncoder,StandardScaler
from sklearn.impute import SimpleImputer
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score,precision_score,recall_score,f1_score,roc_auc_score,confusion_matrix

df=pd.read_csv("data/subscriptions.csv"); out=Path("analysis/results"); out.mkdir(parents=True,exist_ok=True)
df["churn_flag"]=df["churned"].map({"Yes":1,"No":0})
features=["plan","billing_cycle","industry","company_size","seats","monthly_revenue","acquisition_channel","region","support_tickets_12mo","nps_score","feature_usage_pct","upgraded"]
num=["seats","monthly_revenue","support_tickets_12mo","nps_score","feature_usage_pct"]; cat=[c for c in features if c not in num]
pre=ColumnTransformer([("num",Pipeline([("imp",SimpleImputer(strategy="median")),("scale",StandardScaler())]),num),("cat",Pipeline([("imp",SimpleImputer(strategy="most_frequent")),("oh",OneHotEncoder(handle_unknown="ignore"))]),cat)])
pipe=Pipeline([("pre",pre),("model",LogisticRegression(max_iter=2000,class_weight="balanced"))])
Xtr,Xte,ytr,yte=train_test_split(df[features],df.churn_flag,test_size=.25,random_state=42,stratify=df.churn_flag)
pipe.fit(Xtr,ytr); pred=pipe.predict(Xte); prob=pipe.predict_proba(Xte)[:,1]
pd.DataFrame([{"accuracy":accuracy_score(yte,pred),"precision":precision_score(yte,pred,zero_division=0),"recall":recall_score(yte,pred,zero_division=0),"f1":f1_score(yte,pred,zero_division=0),"roc_auc":roc_auc_score(yte,prob)}]).to_csv(out/"model_metrics.csv",index=False)
pd.DataFrame(confusion_matrix(yte,pred),index=["Actual_No_Churn","Actual_Churn"],columns=["Predicted_No_Churn","Predicted_Churn"]).to_csv(out/"confusion_matrix.csv")
names=pipe.named_steps["pre"].get_feature_names_out(); coef=pipe.named_steps["model"].coef_[0]
pd.DataFrame({"feature":names,"coefficient":coef,"odds_ratio":np.exp(coef)}).sort_values("coefficient",key=np.abs,ascending=False).to_csv(out/"logistic_regression_coefficients.csv",index=False)
p=pipe.predict_proba(df[features])[:,1]
risk=df[["customer_id","churned","monthly_revenue"]].copy(); risk["predicted_churn_probability"]=p; risk["risk_band"]=pd.cut(p,[-.01,.33,.66,1.01],labels=["Low","Medium","High"])
risk.to_csv(out/"customer_churn_risk_scores.csv",index=False)
print("Churn model complete.")
