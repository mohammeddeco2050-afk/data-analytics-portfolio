-- Import customer_churn_sample.csv as customers (SQLite)
SELECT contract_type, COUNT(*) AS customers,
 SUM(CASE WHEN churned='Yes' THEN 1 ELSE 0 END) AS churned_customers,
 ROUND(100.0*SUM(CASE WHEN churned='Yes' THEN 1 ELSE 0 END)/COUNT(*),1) AS churn_rate_pct
FROM customers GROUP BY contract_type ORDER BY churn_rate_pct DESC;
SELECT CASE WHEN tenure_months<=6 THEN '1-6 months' WHEN tenure_months<=12 THEN '7-12 months'
 WHEN tenure_months<=24 THEN '13-24 months' ELSE '25-60 months' END AS tenure_band,
 COUNT(*) AS customers, ROUND(100.0*SUM(CASE WHEN churned='Yes' THEN 1 ELSE 0 END)/COUNT(*),1) AS churn_rate_pct
FROM customers GROUP BY tenure_band ORDER BY tenure_band;
