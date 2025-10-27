CREATE TABLE employees_hr (
	emp_no				INT PRIMARY KEY,
	gender				TEXT,
	marital_status		TEXT,
	age_band			TEXT,
	age					SMALLINT, 
	department			TEXT, 
	education			TEXT,
	education_field		TEXT,
	job_role			TEXT,
	business_travel		TEXT,
	empLoyee_count		SMALLINT, 
	attrition			TEXT,
	attrition_label		TEXT,
	job_satisfaction	SMALLINT,
	active_employee		SMALLINT
) ;

select * from employees_hr;

-- count number of employees in ech department--
select department, count (*) as employee_count
from employees_hr
group by department;

--calculate the average age for each department--
select department, avg(age) as average_age
from employees_hr
group by department;

--count number of married and unmarried employees in the company--
select marital_status, count(*) as marital_count
from employees_hr
group by marital_status;

-- calculate the average job satisfaction for each educational level 
select education, avg(job_satisfaction) as average_job_satisfaction
from employees_hr
group by education;

-- identify the department with the highest and lowest satisfaction
select department, avg(job_satisfaction) as avg_job_satisfaction
from employees_hr
group by department
order by avg_job_satisfaction;

-- find the education level with the highest average job satisfaction among employees who travel frequently --
select education, avg(job_satisfaction) as avg_job_satisfaction
from employees_hr
where business_travel = 'Travel_Frequently'
group by education 
order by avg_job_satisfaction;

--The most common job roles in each department --
SELECT department, job_role, count (*) as role_count
from employees_hr
GROUP BY department, job_role
ORDER BY department, job_role
desc;