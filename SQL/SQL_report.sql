SELECT
SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS missing_income,
SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS missing_credit_score,
SUM(CASE WHEN LoanAmount IS NULL THEN 1 ELSE 0 END) AS missing_loan_amount
FROM loan_data;

--Overall Default Rate
SELECT
    [Default],
    COUNT(*) AS Customers,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM loan_data),
        2
    ) AS Percentage
FROM loan_data
GROUP BY [Default];

--Default Rate by Age Group
SELECT
CASE
    WHEN Age < 25 THEN '18-25'
    WHEN Age BETWEEN 25 AND 35 THEN '25-35'
    WHEN Age BETWEEN 36 AND 50 THEN '36-50'
    ELSE '50+'
END AS Age_Group,

COUNT(*) AS Customers,

SUM(CAST([Default] AS INT)) as default_customers,

ROUND(
    SUM(CAST([Default] AS INT))*100.0/COUNT(*),
    2
) AS Default_Rate

FROM loan_data

GROUP BY
    CASE
        WHEN Age < 25 THEN '18-25'
        WHEN Age BETWEEN 25 AND 35 THEN '25-35'
        WHEN Age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END

ORDER BY Default_Rate DESC;

SELECT DISTINCT [Default]
FROM loan_data;

--Income Group Analysis
SELECT

CASE
    WHEN Income < 30000 THEN 'Low Income'
    WHEN Income BETWEEN 30000 AND 70000 THEN 'Middle Income'
    ELSE 'High Income'
END AS Income_Group,

COUNT(*) AS Customers,

SUM(CAST([Default] AS INT)) AS Defaults,

ROUND(
SUM(CAST([Default] AS INT))*100.0/COUNT(*),
2
) AS Default_Rate

FROM loan_data

GROUP BY
CASE
    WHEN Income < 30000 THEN 'Low Income'
    WHEN Income BETWEEN 30000 AND 70000 THEN 'Middle Income'
    ELSE 'High Income'
END

ORDER BY Default_Rate DESC;

--Credit Score Analysis
SELECT
    Credit_Category,
    COUNT(*) AS Customers,
    SUM(CAST([Default] AS INT)) AS default_customers,
    ROUND(SUM(CAST([Default] AS INT)) * 100.0 / COUNT(*), 2) AS Default_Rate
FROM (
    SELECT
        CreditScore,
        [Default],
        CASE
         WHEN CreditScore < 550 THEN 'Poor'
         WHEN CreditScore BETWEEN 550 AND 650 THEN 'Average'
         WHEN CreditScore BETWEEN 651 AND 750 THEN 'Good'
         ELSE 'Excellent'
        END AS Credit_Category

    FROM loan_data
) AS t
GROUP BY Credit_Category

ORDER BY Default_Rate DESC;

--Loan Amount Analysis
SELECT
    Loan_Size,
    COUNT(*) AS Customers,
    SUM(CAST([Default] AS INT)) AS default_customers,
    ROUND(SUM(CAST([Default] AS INT)) * 100.0 / COUNT(*), 2) AS Default_Rate
FROM (
    SELECT
        LoanAmount,
        [Default],
CASE
    WHEN LoanAmount < 10000 THEN 'Small Loan'
    WHEN LoanAmount BETWEEN 10000 AND 30000 THEN 'Medium Loan'
    ELSE 'Large Loan'
END AS Loan_Size
    FROM loan_data
) AS t
GROUP BY Loan_Size
order by Default_Rate DESC;

--Interest Rate Analysis
SELECT

CASE
    WHEN InterestRate < 8 THEN 'Low Rate'
    WHEN InterestRate BETWEEN 8 AND 15 THEN 'Medium Rate'
    ELSE 'High Rate'
END AS Interest_Group,

COUNT(*) AS Customers,

SUM(CAST([Default] AS INT)) AS Defaults,

ROUND(
SUM(CAST([Default] AS INT))*100.0/COUNT(*),
2
) AS Default_Rate

FROM loan_data

GROUP BY 
  CASE
    WHEN InterestRate < 8 THEN 'Low Rate'
    WHEN InterestRate BETWEEN 8 AND 15 THEN 'Medium Rate'
    ELSE 'High Rate'
  END

ORDER BY Default_Rate DESC;

--Debt-to-Income Ratio Analysis
SELECT

CASE
    WHEN DTIRatio < 0.20 THEN 'Low DTI'
    WHEN DTIRatio BETWEEN 0.20 AND 0.40 THEN 'Medium DTI'
    ELSE 'High DTI'
END AS DTI_Group,

COUNT(*) AS Customers,

SUM(CAST([Default] AS INT)) AS Defaults,

ROUND(
SUM(CAST([Default] AS INT))*100.0/COUNT(*),
2
) AS Default_Rate

FROM loan_data

GROUP BY 
CASE
    WHEN DTIRatio < 0.20 THEN 'Low DTI'
    WHEN DTIRatio BETWEEN 0.20 AND 0.40 THEN 'Medium DTI'
    ELSE 'High DTI'
END
ORDER BY Default_Rate DESC;

--Employment Type Analysis
SELECT

EmploymentType,

COUNT(*) AS Customers,

SUM(CAST([Default] AS INT)) AS Defaults,

ROUND(
SUM(CAST([Default] AS INT))*100.0/COUNT(*),
2
) AS Default_Rate

FROM loan_data

GROUP BY EmploymentType

ORDER BY Default_Rate DESC;

--Loan Purpose Analysis
SELECT

LoanPurpose,

COUNT(*) AS Loans,

SUM(CAST([Default] AS INT)) AS Defaults,

ROUND(
SUM(CAST([Default] AS INT))*100.0/COUNT(*),
2
) AS Default_Rate

FROM loan_data

GROUP BY LoanPurpose

ORDER BY Default_Rate DESC;

--Top High-Risk Customers
SELECT *

FROM loan_data

WHERE CreditScore < 600
AND DTIRatio > 0.40
AND LoanAmount > 30000
AND InterestRate > 15;

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(Age) AS Non_Null_Age,
    COUNT(*) - COUNT(Age) AS Null_Age
FROM loan_data;
--Through output, there is not present any of the null values.