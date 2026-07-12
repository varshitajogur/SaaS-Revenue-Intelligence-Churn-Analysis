# **SaaS Revenue Intelligence & Churn Analysis**

**An end-to-end SaaS analytics project that leverages SQL and Power BI to analyze customer retention, recurring revenue, churn behavior, and subscription performance, enabling data-driven business decisions through interactive dashboards and actionable insights.**

---

## **Overview**

Understanding customer behavior and recurring revenue is critical for the success of any SaaS business. This project simulates a real-world SaaS analytics workflow by integrating **SQL** for data processing and analysis with **Power BI** for interactive business intelligence dashboards.

The solution transforms raw subscription and revenue data into meaningful insights, helping stakeholders monitor key SaaS metrics such as **Monthly Recurring Revenue (MRR)**, customer retention, churn trends, customer health, and acquisition performance. The project demonstrates how data analytics can support strategic decision-making, improve customer retention, and drive sustainable business growth.

---

## **Goals**

- Analyze customer retention and churn behavior.
- Monitor Monthly Recurring Revenue (MRR) and revenue growth.
- Segment customers based on subscription plans and business metrics.
- Evaluate customer health using engagement and support indicators.
- Identify factors contributing to customer churn.
- Build executive dashboards for business performance monitoring.
- Deliver actionable insights to support growth and retention strategies.

---

## **Architecture**

### **Analytics Workflow**

```
CSV Datasets
(Subscriptions & Revenue)
          │
          ▼
SQL Database
(Data Cleaning & Transformation)
          │
          ▼
Exploratory Data Analysis
          │
          ▼
Business KPI Calculations
(MRR • Churn • Retention • Customer Health)
          │
          ▼
Power BI Dashboard
          │
          ▼
Business Insights &
Executive Reporting
```

---

## **Features**

- 💰 Revenue intelligence and recurring revenue analysis.
- 📉 Customer churn analysis and risk identification.
- 👥 Customer segmentation based on subscription behavior.
- ❤️ Customer health monitoring using engagement metrics.
- 📊 Monthly Recurring Revenue (MRR) analysis.
- 🔄 Customer retention and subscription trend analysis.
- 📈 Executive Power BI dashboard with interactive visualizations.
- 🎯 KPI tracking for business growth and customer success.

---

## **Dataset**

The project utilizes two datasets that simulate real-world SaaS business operations.

| **Dataset** | **Description** |
|-------------|-----------------|
| **subscriptions.csv** | Customer subscriptions, subscription plans, churn status, acquisition channels, product adoption, support activity, and customer health metrics. |
| **monthly_revenue.csv** | Monthly recurring revenue, customer growth, churn metrics, acquisition performance, and key SaaS business KPIs. |

---

## **How It Works**

### **1. Data Collection**

Customer subscription and revenue datasets are imported into a SQL database for processing and analysis.

### **2. Data Cleaning & Transformation**

SQL scripts are used to clean, normalize, and transform the raw datasets into structured tables suitable for analytical queries.

### **3. Exploratory Data Analysis**

The processed data is analyzed to identify revenue trends, customer behavior, subscription patterns, and churn indicators.

### **4. KPI & Business Analysis**

Key SaaS metrics are calculated, including:

- Monthly Recurring Revenue (MRR)
- Customer Retention Rate
- Churn Rate
- Customer Health Score
- Revenue Growth
- Acquisition Performance

### **5. Dashboard Development**

The analyzed data is visualized in **Power BI**, providing interactive dashboards that support executive reporting and business decision-making.

---

## **SQL Workflow**

The project includes SQL scripts for:

- Database & Table Setup
- Data Cleaning & Transformation
- Exploratory Data Analysis (EDA)
- Revenue Analysis
- Customer Churn Analysis
- Customer Behavior Analysis
- Customer Health Scoring
- Monthly KPI Analysis

---

## **Dashboard**

The Power BI dashboard provides dedicated pages for:

- 📊 Executive Overview
- 💰 Revenue Intelligence
- 👥 Customer Segmentation
- 📉 Churn Risk Analysis
- 📈 Retention & Growth Strategy

---

## **Key Insights**

- Enterprise customers generated the highest recurring revenue.
- Annual subscription plans demonstrated stronger customer retention.
- Low product adoption significantly increased churn probability.
- High customer support dependency strongly correlated with churn.
- Customer health scoring effectively identified high-risk customers.
- Acquisition channel quality directly influenced long-term customer retention and revenue growth.

---

## **Tech Stack**

### **Database & Analytics**

- **MySQL**
- **SQL**

### **Business Intelligence**

- **Power BI**

### **Data Management**

- **CSV**

### **Version Control**

- **GitHub**

---

## **Getting Started**

### **1. Clone the Repository**

```bash
git clone <repository-url>
```

### **2. Navigate to the Project Directory**

```bash
cd saas-revenue-intelligence-analysis
```

### **3. Import the Dataset**

Load the CSV datasets into your MySQL database.

### **4. Execute SQL Scripts**

Run the SQL scripts sequentially to clean the data, perform exploratory analysis, and calculate business KPIs.

### **5. Open the Power BI Dashboard**

Connect the processed dataset to Power BI and explore the interactive dashboards and business insights.

---

## **Project Structure**

```text
saas-revenue-intelligence-analysis/
│
├── data/
├── sql/
├── dashboard/
├── images/
├── insights/
└── README.md
```

---

## **Key Technologies**

| **Technology** | **Purpose** |
|---------------|-------------|
| **MySQL** | Database management and analytical queries |
| **SQL** | Data cleaning, transformation, and KPI analysis |
| **Power BI** | Interactive dashboards and business intelligence |
| **CSV** | Source datasets |
| **GitHub** | Version control and project management |

---

## **Future Enhancements**

- Machine Learning-based churn prediction.
- Customer Lifetime Value (CLV) forecasting.
- Automated KPI monitoring and reporting.
- Predictive customer health scoring.
- Real-time dashboard refresh with live database integration.
- Cohort analysis and customer journey visualization.
- Revenue forecasting using time-series analytics.

---

## **License**

This project is intended for **educational, business analytics, and data visualization purposes**.
