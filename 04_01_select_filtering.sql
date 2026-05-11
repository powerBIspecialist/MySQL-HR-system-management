-- SELECT *, specific column, AS(aliases)
-- WHERE: AND, OR, NOT, IN, BETWEEN, LIKE
-- ORDER BY, LIMIT, OFFSET, DISTINCT
-- IS NULL / IS NOT NULL
-- CASE WHEN

  -- SELECT * (ALL)
  -- Returns all columns and all rows from the employees table
SELECT *
  FROM employees;

  -- ALIASES (AS)
  -- Renames columns in the output for better readability (does NOT change table structure).
SELECT
    emp_id AS employee_id,
    first_name AS firstName,
    last_name AS lastName,
    salary AS monthly_salary
FROM employees;

  -- WHERE with AND
  -- Returns employees from department 2 AND with salary greater than 9000
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE dept_id = 2
AND salary > 9000;

  -- WHERE with OR
  -- Returns employees from department 1 OR department 8.

SELECT
    first_name,
    last_name,
    job_title
FROM employees
WHERE dept_id = 1
OR dept_id = 8;


  -- NOT condition (with WHERE)
  -- Returns all departments that are not inactive (only active ones)
SELECT
    name,
    active
FROM departments
WHERE NOT active = 'inactive';

  -- BETWEEN
  -- Returns employees whose salary is between 7000 and 12000 (inclusive)
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary BETWEEN 7000 AND 12000;

  -- NOT BETWEEN
  -- Returns employees whose salary is outside that range
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary NOT BETWEEN 6000 AND 10000;

  -- IN
  -- Returns employees from departments 2, 8, or 10
SELECT
    first_name,
    last_name,
    dept_id
FROM employees
WHERE dept_id IN (2, 8, 10);

  -- NOT IN
  -- Excludes employees from departments 1, 3, and 5
SELECT
    first_name,
    last_name,
    dept_id
FROM employees
WHERE dept_id NOT IN (1, 3, 5);

  -- LIKE (starts with)
  -- Finds employees whose first name starts with "A".
SELECT
    first_name,
    email
FROM employees
WHERE first_name LIKE 'A%';

  -- LIKE (contains)
  -- Finds projects that contain the word "System"
SELECT
    project_name,
    status
FROM projects
WHERE project_name LIKE '%System%';

  -- IS NULL
  -- Finds employees who do NOT have a manager (top-level employee like CEO)
SELECT
    first_name,
    last_name,
    manager_id
FROM employees
WHERE manager_id IS NULL;

  -- IS NOT NULL
  -- Returns employees who have a phone number
SELECT first_name, last_name, phone
FROM employees
WHERE phone IS NOT NULL;

  -- DISTINCT
  -- Returns only unique project statuses (no duplicates).
SELECT DISTINCT
    status
FROM projects;

  -- ORDER BY ASC
  -- Sorts employees by salary from lowest to highest
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary ASC;

  -- ORDER BY DESC
  -- Sorts projects from highest budget to lowest
SELECT
    project_name,
    budget
FROM projects
ORDER BY budget DESC;

  -- LIMIT
  -- Returns top 5 highest paid employees
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

  -- LIMIT + OFFSET
  -- Skips first 5 results and returns next 5 (pagination)
SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5 OFFSET 5;

  -- CASE WHEN – Employee Level Classification
  -- This query creates a new derived column called employee_level based on salary.
SELECT
    first_name,
    last_name,
    salary,
    CASE
        WHEN salary >= 15000 THEN 'Executive'
        WHEN salary >= 10000 THEN 'Senior'
        WHEN salary >= 7000 THEN 'Mid-Level'
        ELSE 'Junior'
    END AS employee_level
FROM employees;

  -- WHERE FILTER QUERY
  -- This query filters employees based on multiple conditions
SELECT
    first_name,
    last_name,
    salary,
    dept_id
FROM employees
WHERE dept_id = 2
AND salary > 8000
AND hire_date >= '2025-01-01';

-- COMPLEX FILTER + CASE + ORDER
--Returns: 
  -- employees from specific departments
  -- with salary in range
  -- with company email
  -- adds full name + salary category
  -- sorts by highest salary
  -- shows only top 10

SELECT
    emp_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    job_title,
    salary,
    CASE
        WHEN salary >= 12000 THEN 'High Salary'
        ELSE 'Standard Salary'
    END AS salary_category
FROM employees
WHERE dept_id IN (2, 8, 10)
AND salary BETWEEN 7000 AND 22000
AND email LIKE '%company.com'
ORDER BY salary DESC
LIMIT 10;





