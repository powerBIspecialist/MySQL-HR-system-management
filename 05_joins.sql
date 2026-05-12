         -- Joins and reports
         -- PURPOSE: relational queries, reporting, analytics


        -- INNER JOIN
        -- LEFT JOIN / RIGHT JOIN
        -- JOIN ACROSS 3 tables
        -- SELF JOIN, CROSS JOIN
        -- JOIN + WHERE + GROUP BY + ORDER BY


    -- 01.01 INNER JOIN
    -- Returns only the rows that have matching values in both tables
SELECT 
    e.emp_id,
    e.first_name,
    e.last_name,
    d.name AS department_name
FROM employees e
INNER JOIN departments d
    ON e.dept_id = d.dept_id;

  -- 01.02 LEFT JOIN
  -- Returns all rows from the left table and matching rows from the right table
SELECT 
    d.dept_id,
    d.name AS department_name,
    e.first_name,
    e.last_name
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id;

  -- 01.03 RIGHT JOIN
  -- Returns all rows from the right table and matching rows from the left table
SELECT 
    e.first_name,
    e.last_name,
    d.name AS department_name
FROM employees e
RIGHT JOIN departments d
    ON e.dept_id = d.dept_id;

  -- 01.04 JOIN Across 3 Tables
  -- Combines data from three related tables
SELECT 
    e.first_name,
    e.last_name,
    p.project_name,
    d.name AS department_name
FROM employees e
JOIN emp_projects ep ON e.emp_id = ep.emp_id
JOIN projects p ON ep.project_id = p.project_id
JOIN departments d ON e.dept_id = d.dept_id;

  -- 01.05 SELF JOIN
  -- Joins a table with itself.
  SELECT 
    e.first_name AS employee_name,
    m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.emp_id;

  -- 01.06 CROSS JOIN
  -- Returns all possible combinations between two tables.
SELECT 
    e.first_name,
    d.name AS department_name
FROM employees e
CROSS JOIN departments d;

  -- 01.07 JOIN + WHERE + GROUP BY + ORDER BY
  -- Combines multiple SQL clauses in one query
SELECT 
    d.name AS department_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS average_salary
FROM departments d
INNER JOIN employees e
    ON d.dept_id = e.dept_id
WHERE d.active = 'active'
GROUP BY d.name
ORDER BY average_salary DESC;


            
