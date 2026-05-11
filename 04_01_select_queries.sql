
SELECT *
  FROM employees;

SELECT
    emp_id AS employee_id,
    first_name AS firstName,
    last_name AS lastName,
    salary AS monthly_salary
FROM employees;

SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE dept_id = 2
AND salary > 9000;

SELECT
    first_name,
    last_name,
    job_title
FROM employees
WHERE dept_id = 1
OR dept_id = 8;

SELECT
    name,
    active
FROM departments
WHERE NOT active = 'inactive';

SELECT
    name,
    active
FROM departments
WHERE NOT active = 'inactive';

SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary BETWEEN 7000 AND 12000;

SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE salary NOT BETWEEN 6000 AND 10000;

SELECT
    first_name,
    last_name,
    dept_id
FROM employees
WHERE dept_id IN (2, 8, 10);

SELECT
    first_name,
    last_name,
    dept_id
FROM employees
WHERE dept_id NOT IN (1, 3, 5);

SELECT
    first_name,
    email
FROM employees
WHERE first_name LIKE 'A%';

SELECT
    project_name,
    status
FROM projects
WHERE project_name LIKE '%System%';

SELECT
    first_name,
    last_name,
    manager_id
FROM employees
WHERE manager_id IS NULL;

SELECT
    first_name,
    last_name,
    phone
FROM employees
WHERE phone IS NOT NULL;

SELECT DISTINCT
    status
FROM projects;

SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary ASC;

SELECT
    project_name,
    budget
FROM projects
ORDER BY budget DESC;

SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5;

SELECT
    first_name,
    last_name,
    salary
FROM employees
ORDER BY salary DESC
LIMIT 5 OFFSET 5;

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

SELECT
    first_name,
    last_name,
    salary,
    dept_id
FROM employees
WHERE dept_id = 2
AND salary > 8000
AND hire_date >= '2025-01-01';

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





