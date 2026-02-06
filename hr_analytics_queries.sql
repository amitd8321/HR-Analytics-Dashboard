--Level 1: Basic SQL Questions
--1. Find the total number of employees in the dataset.
  SELECT COUNT(*) AS total_employees
FROM hr_analyst_data;

  
--2. Find how many employees have left the company.
SELECT COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes';


--3. Display the list of unique departments.
SELECT DISTINCT department
FROM hr_analyst_data;

--4. Count employees by gender.
SELECT gender, COUNT(*) AS total_employees
FROM hr_analyst_data
GROUP BY gender;

--5. Calculate the average age of employees.
SELECT AVG(age::INT) AS average_age
FROM hr_analyst_data;

--6. Count employees in each education field.
SELECT educationfield, COUNT(*) AS total_employees
FROM hr_analyst_data
GROUP BY educationfield
ORDER BY total_employees DESC;

--7. Find how many employees are working overtime.
SELECT overtime, COUNT(*) AS total_employees
FROM hr_analyst_data
GROUP BY overtime;


--Level 2: Intermediate SQL Questions
--1. Find how many employees left the company in each department.
SELECT department, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY department;


--2. Calculate average monthly income for each job role.
SELECT jobrole, AVG(monthlyincome::INT) AS avg_monthly_income
FROM hr_analyst_data
GROUP BY jobrole;

--3. Find attrition count for male and female employees.
SELECT gender, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY gender;

--4. List top 5 job roles with highest average salary.
SELECT jobrole, AVG(monthlyincome::INT) AS avg_salary
FROM hr_analyst_data
GROUP BY jobrole
ORDER BY avg_salary DESC
LIMIT 5;

--5. Check if overtime employees are leaving more.
SELECT overtime, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY overtime;

--6. Find attrition count for each job satisfaction level.
SELECT jobsatisfaction, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY jobsatisfaction;

--7. Calculate average years at company by department.
SELECT department, AVG(yearsatcompany::INT) AS avg_years_at_company
FROM hr_analyst_data
GROUP BY department;

--Level 3: Advanced SQL Questions
--1. Analyze attrition across different age groups.
SELECT agegroup, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY agegroup;

--2. Find attrition trend based on years at company.
SELECT yearsatcompany, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY yearsatcompany
ORDER BY yearsatcompany::INT;

--3. Analyze attrition by department and job role.
SELECT department, jobrole, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY department, jobrole
ORDER BY attrition_count DESC;

--4. Identify high-risk employees (low satisfaction + overtime).
SELECT empid, department, jobrole, jobsatisfaction, overtime
FROM hr_analyst_data
WHERE jobsatisfaction::INT <= 2
  AND overtime = 'Yes';

--5. Analyze work-life balance vs attrition.
SELECT worklifebalance, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY worklifebalance;

--6. Find high-paying roles with high attrition.
SELECT jobrole,
AVG(monthlyincome::INT) AS avg_income,
COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY jobrole
HAVING AVG(monthlyincome::INT) > 10000
ORDER BY attrition_count DESC;

--7. Analyze attrition based on years with current manager.
SELECT yearswithcurrmanager, COUNT(*) AS attrition_count
FROM hr_analyst_data
WHERE attrition = 'Yes'
GROUP BY yearswithcurrmanager
ORDER BY yearswithcurrmanager::INT;







