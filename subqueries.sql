SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

SELECT 
    first_name,
    last_name
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

SELECT 
    first_name,
    last_name
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE location = 'Bucharest'
);

SELECT 
    first_name,
    last_name
FROM employees
WHERE dept_id NOT IN (
    SELECT dept_id
    FROM departments
    WHERE active = 'inactive'
);

SELECT 
    first_name,
    last_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM emp_projects ep
    WHERE ep.emp_id = e.emp_id
);

SELECT 
    first_name,
    last_name
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM attendance a
    WHERE a.emp_id = e.emp_id
);

SELECT *
FROM (
    SELECT 
        first_name,
        last_name,
        salary
    FROM employees
    WHERE salary > 10000
) AS high_salary_employees;

SELECT *
FROM (
    SELECT 
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS dept_avg_salary;

SELECT 
    e.first_name,
    e.last_name,
    e.salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id = e.dept_id
);

SELECT 
    project_name
FROM projects
WHERE project_id IN (
    SELECT project_id
    FROM emp_projects
    WHERE hours_worked > 150
);

SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

SELECT 
    first_name,
    last_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM attendance a
    WHERE a.emp_id = e.emp_id
    AND a.hours > 8
);

SELECT *
FROM (
    SELECT 
        project_name,
        budget
    FROM projects
    ORDER BY budget DESC
) AS ordered_projects;

SELECT 
    first_name,
    last_name
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE name = 'IT'
);

SELECT 
    name
FROM departments
WHERE dept_id IN (
    SELECT dept_id
    FROM employees
    GROUP BY dept_id
    HAVING COUNT(*) > 2
);

SELECT 
    first_name,
    last_name,
    salary,
    (
        SELECT AVG(salary)
        FROM employees
    ) AS avg_company_salary
FROM employees;

SELECT *
FROM (
    SELECT 
        dept_id,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY dept_id
    HAVING COUNT(*) >= 2
) AS dept_summary;

SELECT 
    project_name
FROM projects p
WHERE NOT EXISTS (
    SELECT 1
    FROM emp_projects ep
    WHERE ep.project_id = p.project_id
);

SELECT 
    name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);

SELECT 
    dept_name,
    avg_salary
FROM (
    SELECT 
        d.name AS dept_name,
        AVG(e.salary) AS avg_salary
    FROM employees e
    JOIN departments d
        ON e.dept_id = d.dept_id
    GROUP BY d.name
) AS department_salary_report;

SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE dept_id IN (
        SELECT dept_id
        FROM departments
        WHERE active = 'active'
    )
);
