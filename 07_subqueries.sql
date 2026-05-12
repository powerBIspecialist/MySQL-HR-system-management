
-- This module demonstrates advanced SQL techniques used for:
-- - complex filtering (subqueries)
-- - reusable reporting structures (views)
-- - temporary analytical datasets (CTEs)
--
-- These features are essential for:
-- reporting systems, data analytics, and backend optimization.

    -- 01.01 Subquery in WHERE (Scalar Subquery)
    -- A subquery that returns a single value and is used inside the WHERE clause for filtering
    -- Returns employees whose salary is higher than the company average salary
SELECT 
    first_name,
    last_name,
    salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

    -- 01.02 SUBQUERY IN FROM (DERIVED TABLE)
    -- A derived table is a subquery inside the FROM clause that behaves like a temporary table    
    -- Creates a temporary result set containing average salary per department
SELECT 
    dept_avg.dept_id,
    dept_avg.avg_salary
FROM (
    SELECT 
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
) AS dept_avg;

    -- 01.03 EXISTS SUBQUERY
    -- EXISTS checks whether related records exist in another table
    -- Returns employees who have attendance records 
SELECT 
    first_name,
    last_name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM attendance a
    WHERE a.emp_id = e.emp_id
);

    -- 01.04 NOT EXISTS SUBQUERY
    -- NOT EXISTS returns rows that do not have matching related records
    -- Returns projects without assigned employees
SELECT 
    project_name
FROM projects p
WHERE NOT EXISTS (
    SELECT 1
    FROM emp_projects ep
    WHERE ep.project_id = p.project_id
);

    -- 01.05 IN WITH SUBQUERY
    -- Uses values returned by another query for filtering.
    -- Returns employees working in departments with budget higher than 100000
SELECT 
    first_name,
    last_name,
    dept_id
FROM employees
WHERE dept_id IN (
    SELECT dept_id
    FROM departments
    WHERE budget > 100000
);

-- ----------------------------------------------------------------------------------------
-- 02.00 CREATE VIEW
-- Views are virtual tables created from SQL queries.
-- They simplify reporting and improve query reusability

-- 02.01 DEPARTMENTS VIEWS
-- View: Active Departments
-- Returns only active departments
CREATE VIEW vw_active_departments AS
SELECT 
    dept_id,
    name,
    location,
    budget
FROM departments
WHERE active = 'active';

-- 02.02 View: Department Employee Count
-- Displays total employees per department.
CREATE VIEW vw_departments_employee_count AS
SELECT 
    d.dept_id,
    d.name AS department_name,
    COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.name;

-- 02.03 EMPLOYEES VIEWS 
-- View: Employee Profile
-- Creates simplified employee profile information
CREATE VIEW vw_employee_profile AS
SELECT 
    emp_id,
    CONCAT(first_name, ' ', last_name) AS full_name,
    email,
    job_title,
    salary,
    dept_id,
    manager_id
FROM employees;

-- 02.04 View: Employees With Managers
-- Displays employees together with their managers using a self join
CREATE VIEW vw_employees_with_manager AS
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    m.emp_id AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.emp_id;

-- 02.05 PROJECTS VIEWS
-- View: Active Projects
CREATE VIEW vw_active_projects AS
SELECT 
    project_id,
    project_name,
    budget,
    dept_id,
    status
FROM projects
WHERE status = 'ACTIVE';

-- 02.06 View: Projects With Department
-- Combines projects with department names
CREATE VIEW vw_projects_with_department AS
SELECT 
    p.project_id,
    p.project_name,
    p.budget,
    d.name AS department_name
FROM projects p
JOIN departments d
    ON p.dept_id = d.dept_id;

-- 02.07 EMPLOYEE PROJECT VIEWS
-- View: Employee Projects
-- Displays employee project assignments
CREATE VIEW vw_employee_projects AS
SELECT 
    ep.emp_id,
    e.first_name,
    e.last_name,
    ep.project_id,
    ep.role,
    ep.hours_worked
FROM emp_projects ep
JOIN employees e
    ON ep.emp_id = e.emp_id;

-- 02.08 View: Project Workload
-- Shows workload statistics per project
CREATE VIEW vw_project_workload AS
SELECT 
    project_id,
    COUNT(emp_id) AS total_employees,
    SUM(hours_worked) AS total_hours
FROM emp_projects
GROUP BY project_id;

-- 02.09 ATTENDANCE VIEWS
-- View: Attendance Summary
-- Provides attendance statistics per employee.
CREATE VIEW vw_attendance_summary AS
SELECT 
    emp_id,
    COUNT(*) AS total_days,
    SUM(hours) AS total_hours,
    AVG(hours) AS avg_hours
FROM attendance
GROUP BY emp_id;

-- 02.10 View: Attendance Details
-- Displays detailed attendance information with employee names
CREATE VIEW vw_attendance_details AS
SELECT 
    a.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    a.work_date,
    a.hours,
    a.record_type
FROM attendance a
JOIN employees e
    ON a.emp_id = e.emp_id;

-- 02.11 SALARY AUDIT VIEWS
-- View: Salary Audit History
-- Displays historical salary changes
CREATE VIEW vw_salary_audit_history AS
SELECT 
    emp_id,
    old_salary,
    new_salary,
    changed_at
FROM salary_audit;

-- 02.12 View: Latest Salary Changes
-- Returns only the latest salary change for each employee
CREATE VIEW vw_latest_salary_changes AS
SELECT *
FROM salary_audit sa
WHERE sa.changed_at = (
    SELECT MAX(changed_at)
    FROM salary_audit
    WHERE emp_id = sa.emp_id
);

--  03.01 WITH CTE (COMMON TABLE EXPRESSION)
-- CTEs create temporary named result sets inside a query.
-- Returns departments with average salary higher than 9000.
WITH dept_salary AS (
    SELECT 
        dept_id,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY dept_id
)
SELECT *
FROM dept_salary
WHERE avg_salary > 9000;

-- 03.02 CTE Example: High Salary Employees
-- Creates a temporary list of high-salary employees.
WITH high_salary_employees AS (
    SELECT 
        emp_id,
        first_name,
        last_name,
        salary
    FROM employees
    WHERE salary > 10000
)
SELECT *
FROM high_salary_employees;



   -- THE END--


