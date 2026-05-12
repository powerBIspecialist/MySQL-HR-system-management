EXPLAIN
SELECT *
FROM employees
WHERE dept_id = 10;

CREATE INDEX idx_employees_dept_id
ON employees(dept_id);

EXPLAIN
SELECT *
FROM employees
WHERE dept_id = 10;


/*
BEFORE INDEX:
- Full table scan
- Slow performance on large datasets

AFTER INDEX:
- Index scan used
- Faster data retrieval
*/



EXPLAIN
SELECT dept_id, COUNT(*)
FROM employees
GROUP BY dept_id;


EXPLAIN
SELECT e.emp_id, d.dept_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id;
