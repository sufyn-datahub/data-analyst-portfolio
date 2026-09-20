DROP TAble if exists churn;

CReate table churn (
customer_id varchar(40) Primary key,
gender varchar(20),
SeniorCitizen INT,
Partner varchar(40),
Dependents varchar(40),
tenure INT,
PhoneService varchar(40),
MultipleLines varchar(40),
InternetService varchar(40),
OnlineSecurity varchar(40),
OnlineBackup varchar(40),
DeviceProtection varchar(40),
TechSupport Varchar(40),
StreamingTV varchar(40),
StreamingMovies	varchar(40),
Contract varchar(40),
PaperlessBilling varchar(40),
PaymentMethod varchar(40),	
MonthlyCharges NUMERIC(10,2),
TotalCharges Numeric(10,2),
Churn VARCHAR(10)
);


COPY  churn
FROM 'C:/Users/user/Desktop/python_class/project/cleaned_churn.csv'
DELIMITER ','
CSV HEADER 
QUOTE '"'
ENCODING 'LATIN1';


SELECT * from churn;

SELECT 
	SUM(CASE when churn = 'Yes' THEN 1 ELSE 0 END) * 100 / count(*) AS churn_rate_pct
FROM churn;


--- churn rate by contract type

SELECT contract,
	count(*) AS total_customers,
	SUM(CASE when churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
	SUM(CASE when churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / count(*) AS churn_rate_pct
FROM churn
GROUP BY contract;

-- revenue at risk churned customers 

SELECT 
	SUM(MonthlyCharges) as monthly_revenue_at_risk
FROM churn
WHERE churn = 'Yes'








