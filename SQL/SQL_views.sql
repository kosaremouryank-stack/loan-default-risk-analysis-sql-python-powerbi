-- View 1: Customer Risk Summary View
CREATE VIEW vw_customer_risk_summary AS
SELECT
    LoanID,
    Age,
    Income,
    CreditScore,
    LoanAmount,
    DTIRatio,
    EmploymentType,
    LoanPurpose,
    [Default],

    CASE
        WHEN CreditScore < 600 AND DTIRatio > 0.40 THEN 'High Risk'
        WHEN CreditScore BETWEEN 600 AND 700 THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS Risk_Category

FROM loan_data;

--check view
SELECT * FROM vw_customer_risk_summary;

-- View 2: Loan Portfolio Performance View
CREATE VIEW vw_loan_portfolio_performance AS
SELECT
    LoanPurpose,

    COUNT(*) AS Total_Loans,

    SUM(CAST([Default] AS INT)) AS Total_Defaults,

    ROUND(
        SUM(CAST([Default] AS INT)) * 100.0 / COUNT(*),
        2
    ) AS Default_Rate,

    ROUND(
        AVG(LoanAmount),
        2
    ) AS Avg_Loan_Amount,

    ROUND(
        AVG(InterestRate),
        2
    ) AS Avg_Interest_Rate,

    ROUND(
        AVG(CreditScore),
        2
    ) AS Avg_Credit_Score

FROM loan_data

GROUP BY LoanPurpose;

--check second view
SELECT *
FROM vw_loan_portfolio_performance
ORDER BY Default_Rate DESC;