-- Subquery in WHERE (scalar)
-- Subquerry in FROM (derrived table)
-- EXISTS / NOT EXISTS, IN with subquerries
-- CREATE view
-- WITH CTE (common Table Expression)
CREATE VIEW vw_active_departments AS
SELECT 
    dept_id,
    name,
    location,
    budget
FROM departments
WHERE active = 'active';

CREATE VIEW vw_departments_employee_count AS
SELECT 
    d.dept_id,
    d.name AS department_name,
    COUNT(e.emp_id) AS total_employees
FROM departments d
LEFT JOIN employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.name;


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

CREATE VIEW vw_employees_with_manager AS
SELECT 
    e.emp_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    m.emp_id AS manager_id,
    CONCAT(m.first_name, ' ', m.last_name) AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.emp_id;

CREATE VIEW vw_active_projects AS
SELECT 
    project_id,
    project_name,
    budget,
    dept_id,
    status
FROM projects
WHERE status = 'ACTIVE';

CREATE VIEW vw_projects_with_department AS
SELECT 
    p.project_id,
    p.project_name,
    p.budget,
    d.name AS department_name
FROM projects p
JOIN departments d
    ON p.dept_id = d.dept_id;


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



CREATE VIEW vw_project_workload AS
SELECT 
    project_id,
    COUNT(emp_id) AS total_employees,
    SUM(hours_worked) AS total_hours
FROM emp_projects
GROUP BY project_id;

CREATE VIEW vw_attendance_summary AS
SELECT 
    emp_id,
    COUNT(*) AS total_days,
    SUM(hours) AS total_hours,
    AVG(hours) AS avg_hours
FROM attendance
GROUP BY emp_id;

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



CREATE VIEW vw_salary_audit_history AS
SELECT 
    emp_id,
    old_salary,
    new_salary,
    changed_at
FROM salary_audit;

CREATE VIEW vw_latest_salary_changes AS
SELECT *
FROM salary_audit sa
WHERE sa.changed_at = (
    SELECT MAX(changed_at)
    FROM salary_audit
    WHERE emp_id = sa.emp_id


