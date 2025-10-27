# 🧾 Employee Trend Analysis (SQL Project)

This project explores employee data to uncover key insights about workforce demographics, job satisfaction, and departmental trends.  
It uses structured SQL queries to answer practical HR questions and support data-driven decision-making.

---

## 📊 Project Overview

The goal of this analysis is to:
- Understand workforce distribution by department and demographics.
- Measure job satisfaction across different categories.
- Identify departments or education levels with higher or lower satisfaction rates.
- Evaluate how business travel impacts employee satisfaction.

All analyses were performed using SQL on a dataset named **`employees_hr`**.

---

## 🧱 Database Structure

The table `employees_hr` contains the following columns:

| Column | Description |
|---------|-------------|
| `emp_no` | Unique employee ID |
| `gender` | Gender of the employee |
| `marital_status` | Marital status (e.g., Married, Single, Divorced) |
| `age_band` | Age group category |
| `age` | Employee's actual age |
| `department` | Department name (e.g., Sales, HR, IT) |
| `education` | Employee’s education level |
| `education_field` | Field of study |
| `job_role` | Employee’s job title |
| `business_travel` | Frequency of travel (e.g., Travel_Rarely, Travel_Frequently) |
| `employee_count` | Count of employees (constant = 1 per record) |
| `attrition` | Whether the employee left the company |
| `attrition_label` | Attrition label (Yes/No) |
| `job_satisfaction` | Job satisfaction score (1–5) |
| `active_employee` | 1 for active, 0 for inactive |

---

## 🧠 SQL Analyses and Insights

### 1. View All Employee Records
```sql
SELECT * FROM employees_hr;

### 2. Employee Count by Department### 1. View All Employee Records
SELECT department, COUNT(*) AS employee_count
FROM employees_hr
GROUP BY department;

### 3. Average Age by Department
SELECT department, AVG(age) AS average_age
FROM employees_hr
GROUP BY department;

### 4.  Marital Status Distribution
SELECT marital_status, COUNT(*) AS marital_count
FROM employees_hr
GROUP BY marital_status;

### 5. Average Job Satisfaction by Education Level
SELECT education, AVG(job_satisfaction) AS average_job_satisfaction
FROM employees_hr
GROUP BY education;

### 6. Departmental Job Satisfaction Ranking
SELECT department, AVG(job_satisfaction) AS avg_job_satisfaction
FROM employees_hr
GROUP BY department
ORDER BY avg_job_satisfaction;

### 7. Job Satisfaction Among Frequent Travelers (by Education)
SELECT education, AVG(job_satisfaction) AS avg_job_satisfaction
FROM employees_hr
WHERE business_travel = 'Travel_Frequently'
GROUP BY education
ORDER BY avg_job_satisfaction;

### 8. The most common job roles in each department 
SELECT department, job_role, count (*) as role_count
from employees_hr
GROUP BY department, job_role
ORDER BY department, job_role
desc;
