USE SQLForDA;

#Part 1: Customer Overview & Demographics

#Total Customers Count
SELECT COUNT(*) AS total_customers
FROM bankchurnersnew;

#Churn Distribution
SELECT Attrition_Flag AS Status, COUNT(*) Count
FROM `bankchurnersnew`
GROUP BY Attrition_Flag;

#Gender Breakdown
SELECT Gender, COUNT(*) AS Count
FROM `bankchurnersnew`
GROUP BY Gender;

#Marital Status Distribution
SELECT Marital_Status, COUNT(*) AS Count
FROM `bankchurnersnew`
GROUP BY Marital_Status; 

#Education Level Breakdown
SELECT Education_Level, COUNT(*) AS count
FROM `bankchurnersnew`
GROUP BY Education_Level;

#Part 2: Financial Behavior 

#Income Category Distribution
SELECT Income_Category, COUNT(*) AS Count
FROM `bankchurnersnew`
GROUP BY Income_Category
ORDER BY Count DESC;

#Average Credit Limit by Income
SELECT Income_Category, ROUND(AVG(Credit_Limit),2) AS avg_credit_limit
FROM `bankchurnersnew`
GROUP BY Income_Category
ORDER BY avg_credit_limit DESC;

#Average Credit Limit by Education Level
SELECT Education_Level, ROUND(AVG(Credit_Limit),2) AS avg_credit_limit
FROM `bankchurnersnew`
GROUP BY Education_Level
ORDER BY avg_credit_limit DESC;

#Average Transaction Amount by Marital Status
SELECT Marital_Status, ROUND(AVG(Total_Trans_Amt),2) AS avg_trans_amt
FROM `bankchurnersnew`
GROUP BY Marital_Status
ORDER BY avg_trans_amt DESC;

#Average Utilization Ratio by Income
SELECT Income_Category, ROUND(AVG(Avg_Utilization_Ratio), 2) AS avg_utilization
FROM bankchurnersnew
GROUP BY Income_Category
ORDER BY avg_utilization DESC;

#Part 3: Churn Analysis by Demographics & Behavior

#Churn Rate %
SELECT ROUND((SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS churn_percentage 
FROM `bankchurnersnew`;

#Churn by Gender
SELECT Gender, 
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned,
       ROUND((SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS churn_rate
FROM bankchurnersnew
GROUP BY Gender;

#Churn by Education Level
SELECT Education_Level, 
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned,
       ROUND((SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS churn_rate
FROM bankchurnersnew
GROUP BY Education_Level;

#Churn by Income
SELECT Income_Category, 
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned,
       ROUND((SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS churn_rate
FROM bankchurnersnew
GROUP BY Income_Category;

#Churn by Card Category
SELECT Card_Category, 
       COUNT(*) AS total,
       SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) AS churned,
       ROUND((SUM(CASE WHEN Attrition_Flag = 'Attrited Customer' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS churn_rate
FROM bankchurnersnew
GROUP BY Card_Category;

# Part 4: High-Value Customer Segmentation

#Top 10 Customers by Credit Limit
SELECT CLIENTNUM, Credit_Limit
FROM bankchurnersnew
ORDER BY Credit_Limit DESC
LIMIT 10;

#Customers with Highest Utilization Ratio
SELECT CLIENTNUM, Avg_Utilization_Ratio
FROM bankchurnersnew
ORDER BY Avg_Utilization_Ratio DESC
LIMIT 10;

#High Spenders (Top 10 by Total Transaction Amount)
SELECT CLIENTNUM, Total_Trans_Amt
FROM bankchurnersnew
ORDER BY Total_Trans_Amt DESC
LIMIT 10;

#Segment Customers by Spending-to-Limit Ratio
SELECT 
  CLIENTNUM,
  ROUND(Total_Trans_Amt / Credit_Limit, 2) AS spending_to_limit_ratio
FROM bankchurnersnew
WHERE Credit_Limit > 0
ORDER BY spending_to_limit_ratio DESC
LIMIT 10;

#Define Your Own High-Value Segment
SELECT CLIENTNUM, Credit_Limit, Total_Trans_Amt
FROM bankchurnersnew
WHERE Credit_Limit > 10000 AND Total_Trans_Amt > 5000;









