--Cool shop Analysis--

--Retrieve All Customer Data
SELECT *
FROM customers;

-- Retrieve All Order Data
SELECT *
FROM orders;


SELECT *
FROM employees;
/* ==============================================================================
   SELECT FEW COLUMNS
=============================================================================== */

-- Retrieve each customer's name, country, and score.
SELECT 
    lastname,
    country, 
    score
FROM customers;


SELECT 
    firstname,
    score
FROM customers;

/* ==============================================================================
   WHERE
=============================================================================== */

-- Retrieve customers with a score not equal to 0
SELECT *
FROM customers
WHERE score != 0;

-- Retrieve customers from USA
SELECT *
FROM customers
WHERE country = 'USA';

-- Retrieve the name and country of customers from USA
SELECT
    firstname,
    country
FROM customers
WHERE country = 'USA';

/* ==============================================================================
   ORDER BY
=============================================================================== */

/* Retrieve all employees and 
   sort the results by the highest salary first. */
SELECT *
FROM employees
ORDER BY salary DESC;

/* Retrieve all customers and 
   sort the results by the lowest score first. */
SELECT *
FROM customers
ORDER BY score ASC;

/* Retrieve all employees and 
   sort the results by the firstname ascending. */
SELECT *
FROM employees
ORDER BY firstname ASC;

/* Retrieve all customers and 
   sort the results by the country and then by the highest score. */
SELECT *
FROM customers
ORDER BY country, score DESC;

/* Retrieve the name, department, and salary of employees 
   whose salary is not equal to 0
   and sort the results by the highest salary first. */
SELECT
    firstname,
    department,
    salary
FROM employees
WHERE salary != 0
ORDER BY salary DESC;

/* ==============================================================================
   GROUP BY
=============================================================================== */

-- Find the total salary for each department
SELECT 
    department,
    SUM(salary) AS total_salary
FROM employees
GROUP BY department;



/* ==============================================================================
   HAVING
=============================================================================== */

/* Find the average score for each country
   and return only those countries with an average score greater than 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
GROUP BY country
HAVING AVG(score) > 430;

/* Find the average score for each country
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430 */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430;

/* ==============================================================================
   DISTINCT
=============================================================================== */

-- Return Unique list of all countries
SELECT DISTINCT country
FROM customers;

/* ==============================================================================
   TOP
=============================================================================== */

-- Retrieve only 3 Customers
SELECT * 
FROM customers
LIMIT 3;

-- Retrieve the Top 3 Customers with the Highest Scores
SELECT * 
FROM customers
ORDER BY score DESC
LIMIT 3;

-- Retrieve the Lowest 2 Customers based on the score
SELECT * 
FROM customers
ORDER BY score ASC
LIMIT 2;

-- Get the Two Most Recent Orders
SELECT * 
FROM orders
ORDER BY orderdate DESC
LIMIT 2;

/* ==============================================================================
   All Together
=============================================================================== */

/* Calculate the average score for each country 
   considering only customers with a score not equal to 0
   and return only those countries with an average score greater than 430
   and sort the results by the highest average score first. */
SELECT
    country,
    AVG(score) AS avg_score
FROM customers
WHERE score != 0
GROUP BY country
HAVING AVG(score) > 430
ORDER BY AVG(score) DESC;

