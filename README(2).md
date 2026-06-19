# Loan Default Risk Analysis & Prediction Dashboard

## Project Overview

This project is an end-to-end **Loan Default Risk Analysis** solution built for Data Analyst / Business Analyst portfolio use. It analyzes borrower profiles, identifies default risk factors, builds machine learning models to predict loan defaults, and presents the final insights through a Power BI dashboard.

The project combines:

- **Sql** for Performed portfolio-level and customer-level risk analysis
- **Python** for data cleaning, feature engineering, EDA, and machine learning
- **Pandas / NumPy** for data manipulation
- **Matplotlib / Seaborn** for visualization
- **Scikit-learn** for model building and evaluation
- **Power BI** for interactive dashboard reporting

---

## Business Problem

Financial institutions face losses when borrowers fail to repay loans. The goal of this project is to:

- Analyze borrower behavior and loan characteristics.
- Identify borrower characteristics associated with loan default
- Analyze default behavior across income, credit score, loan amount, employment type, and DTI ratio
- Build predictive models to classify loan applicants as risky or safe
- Generate borrower risk scores and segment customers into risk categories
- Create an interactive dashboard for loan portfolio monitoring and credit risk decision-making

---

## Attached Project Files

| File Name | Description |
|---|---|
| `loan_data.csv` | Raw loan dataset containing borrower, loan, and default information |
| `loan_analysis.ipynb` | Python notebook for data cleaning, preprocessing, feature engineering, and EDA |
| `loan_default_ml_models.ipynb` | Machine learning notebook for model training, evaluation, risk scoring, and export |
| `loan_default_analysis_dashborad.pbix` | Power BI dashboard for loan default and risk analysis |

---

## Dataset Information

The dataset contains **255,347 loan records** and **18 original columns**.

### Columns Used

| Column | Description |
|---|---|
| `LoanID` | Unique loan identifier |
| `Age` | Borrower age |
| `Income` | Borrower income |
| `LoanAmount` | Loan amount requested |
| `CreditScore` | Borrower credit score |
| `MonthsEmployed` | Number of months employed |
| `NumCreditLines` | Number of active credit lines |
| `InterestRate` | Loan interest rate |
| `LoanTerm` | Loan tenure |
| `DTIRatio` | Debt-to-income ratio |
| `Education` | Borrower education level |
| `EmploymentType` | Employment category |
| `MaritalStatus` | Marital status |
| `HasMortgage` | Whether borrower has a mortgage |
| `HasDependents` | Whether borrower has dependents |
| `LoanPurpose` | Purpose of loan |
| `HasCoSigner` | Whether borrower has a co-signer |
| `Default` | Target variable: 0 = No Default, 1 = Default |

---

## Target Variable

```text
Default = 0 → Non-default borrower
Default = 1 → Default borrower
```

Default distribution in the dataset:

| Class | Count |
|---|---:|
| Non-default | 225,694 |
| Default | 29,653 |

Overall default rate:

```text
11.61%
```

---
# Project Workflow

## Step 1: SQL Analysis

Performed portfolio-level and customer-level risk analysis using SQL.

### SQL Files Included

### SQL_1.sql

Contains:

- Overall Default Analysis
- Age Group Analysis
- Income Group Analysis
- Credit Score Analysis
- Loan Amount Analysis

### SQL_2.sql

Contains:

- Employment Type Analysis
- Loan Purpose Analysis
- Mortgage Analysis
- Co-Signer Analysis
- High-Risk Borrower Identification

### SQL_report.sql

Contains:

- Business KPI Reports
- Portfolio Summary Reports
- Default Trend Reports

### SQL_views.sql

Contains reusable SQL views:

#### Customer Risk Summary View

- Risk Classification
- Customer Segmentation
- High-Risk Customer Identification

#### Loan Portfolio Performance View

- Loan Purpose Performance
- Default Rate Monitoring
- Portfolio Risk Assessment

### Business Insight

- Identified key borrower segments contributing to default risk.
- Created risk-based customer views for business reporting.
- Enabled faster portfolio monitoring through reusable SQL views.

---

## Step 2: Data Cleaning & Feature Engineering

Performed preprocessing and feature engineering using Python.

### Notebook

**loan_analysis.ipynb**

### Activities

- Data Validation
- Duplicate Check
- Data Type Verification
- Feature Engineering

### Features Created

#### Loan_to_Income

Measures loan burden relative to borrower income.

#### Credit_Category

- Poor
- Average
- Good
- Excellent

#### Income_Group

- Low Income
- Medium Income
- High Income

### Business Insight

Engineered 3 borrower risk features to improve customer segmentation and credit risk assessment.

---

## Step 3: Exploratory Data Analysis (EDA)

### Visualizations Created

1. Default Distribution
2. Age Distribution
3. Age vs Default
4. Income Distribution
5. Income vs Default
6. Credit Score vs Default
7. Loan Amount vs Default
8. Interest Rate vs Default
9. DTI Ratio vs Default
10. Correlation Heatmap

### Key Findings

- Lower credit scores showed higher default probability.
- Higher DTI ratios increased repayment risk.
- Higher interest rates correlated with elevated default rates.
- Income and employment stability influenced repayment behavior.
- Certain loan purposes carried greater risk.

### Business Insight

Engineered 3 borrower risk features and developed 10+ analytical visualizations to identify key default drivers and support data-driven lending decisions.

---

## Step 4: Machine Learning Modeling

### Notebook

**loan_default_ml_models.ipynb**

### Models Implemented

#### Logistic Regression

Used as baseline classification model.

#### Random Forest Classifier

Used for advanced risk prediction.

### Model Outputs

- Default Prediction
- Risk Score Generation
- Feature Importance Analysis
- Customer Risk Segmentation

### Risk Categories

- Low Risk
- Medium Risk
- High Risk

### Top Risk Drivers

- Credit Score
- DTI Ratio
- Interest Rate
- Income
- Loan Amount

### Business Insight

- The overall loan default rate is **11.61%**, showing that defaults are a minority but important business risk.
- Borrowers in the **Poor Credit Score** category show a higher default rate of **12.57%**, while the **Excellent Credit Score** category shows a lower default rate of **10.07%**.
- The model identified **Interest Rate, Loan-to-Income Ratio, Income, Age, Loan Amount, Months Employed, Credit Score, and DTI Ratio** as major factors influencing default risk.
- Logistic Regression achieved **88.67% accuracy**, while Random Forest achieved **88.56% accuracy**.
- Random Forest produced a **0.7418 ROC-AUC score**, showing moderate ability to rank borrowers by default risk.
- Borrowers were segmented into **3 risk categories**: Low Risk, Medium Risk, and High Risk.
- The Power BI dashboard helps convert model outputs into business-friendly credit risk insights.

---

## Step 5: Power BI Dashboard

### Dashboard File

**loan_default_analysis_dashborad.pbix**

### Dashboard Pages

#### Executive Summary

- Total Customers
- Total Defaults
- Default Rate
- Average Loan Amount
- Average Credit Score
- Revenue at Risk

#### Customer Risk and Financial Analysis

- Risk Category Distribution
- High-Risk Customers
- Risk Score Analysis
- Loan Purpose Performance
- Employment Analysis
- Credit Score Segmentation

#### Model Insights

- Feature Importance
- Risk Distribution
- Business Recommendations

### Dashboard Features

- 3 Dashboard Pages
- 6 KPI Cards
- 10+ Interactive Visualizations
- Dynamic Filters
- Risk Segmentation

### Business Insight

Developed a 3-page Power BI dashboard with 6 KPIs, 10+ interactive visualizations, and dynamic slicers to monitor borrower risk, default trends, and portfolio performance.

---

# Technologies Used

### SQL

- MySQL
- Views
- Aggregations
- Risk Analysis

### Python

- Pandas
- NumPy
- Matplotlib
- Seaborn

### Machine Learning

- Scikit-Learn
- Logistic Regression
- Random Forest Classifier

### Business Intelligence

- Power BI

---

# Project Structure

```text
Loan-Default-Risk-Analysis/
│
├── Data/
│   └── loan_data.csv
│
├── SQL/
│   ├── SQL_1.sql
│   ├── SQL_2.sql
│   ├── SQL_report.sql
│   └── SQL_views.sql
│
├── Data Cleaning, Preprocessing and EDA/
│   ├── loan_analysis.ipynb
│   └── loan_cleaned.csv
|
│── Machine Learning model for prediction/
│   ├── loan_default_ml_models.ipynb
│   └── loan_dashboard_data_updated.csv
|
├── Resources/
│   ├── loan_default_anlaysis_dashborad.pbix
│   └── Loan Default Risk Analysis\Dashboard\loan_default_anlysis_dashborad.pdf
|
├── Images/
│   ├── Executive Summary.png
│   ├── Risk and Financial Analysis.png
│   └── Business Recommendations.png
|
|
├── README(2).md
│
└── requirements.txt
```
---

## Author

**Mouryan Kosare**

Data Analytics | Business Analytics
---