use data_salaries
-- Displaying all the values
select * from salaries 
-- What is the average BasePay, OvertimePay, and OtherPay?
select 
avg(BasePay) as avg_BasePay,
avg(OvertimePay) as avg_OvertimePay,
avg(OtherPay) as avg_OtherPay
from salaries;
-- What is the maximum and minimum TotalPayBenefits in each year
SELECT 
    Year,
    MAX(TotalPayBenefits) AS Max_TotalPayBenefits,
    MIN(TotalPayBenefits) AS Min_TotalPayBenefits
FROM 
    salaries
GROUP BY 
    Year;
-- Who are the top 10 employees with the highest TotalPayBenefits
SELECT EmployeeName, TotalPayBenefits
FROM salaries
ORDER BY TotalPayBenefits DESC
LIMIT 10;
-- How many unique employees are there in the dataset?
SELECT 
    COUNT(DISTINCT EmployeeName) AS UniqueEmployees
FROM 
    salaries;
-- Most common job titles
SELECT 
    JobTitle, COUNT(*) AS Frequency
FROM salaries
GROUP BY JobTitle
ORDER BY Frequency DESC
LIMIT 5;
-- Job title with the highest average BasePay
SELECT JobTitle, AVG(BasePay) AS Avg_BasePay
FROM salaries
GROUP BY JobTitle
ORDER BY Avg_BasePay DESC
LIMIT 1;
-- Proportion of Employees with 'Full-time' versus 'Part-time' status
SELECT 
    Status,
    COUNT(*) AS EmployeeCount,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () 
FROM salaries
GROUP BY Status;
-- Comparison of Pay Structures for Employees with Different Statuses
SELECT 
    Status,
    AVG(BasePay) AS Avg_BasePay,
    AVG(OvertimePay) AS Avg_OvertimePay,
    AVG(OtherPay) AS Avg_OtherPay,
    AVG(TotalPayBenefits) AS Avg_TotalPayBenefits
FROM 
    salaries
GROUP BY 
    Status;
-- Distribution of Employment Status over the Years
SELECT 
    Year,
    Status,
    COUNT(*) AS EmployeeCount
FROM 
    salaries
GROUP BY 
    Year, Status
ORDER BY 
    Year, Status;
-- Average Benefits Provided to Employees
SELECT 
    AVG(Benefits) AS Average_Benefits
FROM 
    salaries;
-- Patterns or Correlations Between Benefits and Job Titles:
SELECT 
    JobTitle,
    AVG(Benefits) AS Average_Benefits
FROM 
    salaries
GROUP BY 
    JobTitle
ORDER BY 
    Average_Benefits DESC;
-- Relationship Between Benefits and TotalPayBenefits
SELECT 
    TotalPayBenefits,
    AVG(Benefits) AS Average_Benefits
FROM 
    salaries
GROUP BY 
    TotalPayBenefits;
-- Checking for Inconsistencies or Errors
SELECT 
    *
FROM 
    salaries
WHERE 
    BasePay < 0 OR OvertimePay < 0 OR OtherPay < 0 OR TotalPayBenefits < 0;
-- Assessing Reliability of the Notes Column
SELECT 
    DISTINCT Notes
FROM 
    salaries;
-- Counting Unique Agencies
SELECT 
    COUNT(DISTINCT Agency) AS UniqueAgenciesCount
FROM 
    salaries;
-- Finding Agency with Highest Average TotalPayBenefits
SELECT 
    Agency,
    AVG(TotalPayBenefits) AS Average_TotalPayBenefits
FROM 
    salaries
GROUP BY 
    Agency
ORDER BY 
    Average_TotalPayBenefits DESC
LIMIT 1;
-- Identifying Significant Differences in Pay Between Agencies
SELECT 
    Agency,
    AVG(TotalPayBenefits) AS Average_TotalPayBenefits
FROM 
    salaries
GROUP BY 
    Agency
ORDER BY 
    Average_TotalPayBenefits DESC;