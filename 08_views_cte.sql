
    -- 08 - VIEWS & CTE (Common Table Expressions)
    -- Purpose: Advanced queries using CTEs and analytical views


    -- 01.01 ACTIVE DEPARTMENTS
    -- Retrieves only departments marked as active
WITH active_departments AS (
    SELECT *
    FROM departments
    WHERE active = 'active'
)
SELECT *
FROM active_departments;

    -- 01.02 DEPARTMENT EMPLOYEE COUNT
    -- Counts the number of employees in each department
WITH dept_emp_count AS (
    SELECT 
        dept_id,
        COUNT(*) AS total_employees
    FROM employees
    GROUP BY dept_id
)
SELECT *
FROM dept_emp_count;

    -- 01.03 HIGH SALARY EMPLOYEES
    -- Retrieves employees with salary greater than 10,000

WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 10000
)
SELECT *
FROM high_salary;

    -- 01.04 EMPLOYEE HIERARCHY
    -- Description: Basic structure showing employee-manager relationships
WITH emp_hierarchy AS (
    SELECT 
        e.emp_id,
        e.first_name,
        e.last_name,
        e.manager_id
    FROM employees e
)
SELECT *
FROM emp_hierarchy;


  -- 01.05 ACTIVE PROJECTS
  -- Retrieves all projects currently marked as ACTIVE
WITH active_projects AS (
    SELECT *
    FROM projects
    WHERE status = 'ACTIVE'
)
SELECT *
FROM active_projects;

    -- 01.06 PROJECT BUDGET OVERVIEW
    -- Displays basic budget information for all projects
WITH project_budget AS (
    SELECT 
        project_id,
        project_name,
        budget
    FROM projects
)
SELECT *
FROM project_budget;


   -- 01.07 EMPLOYEE PROJECT ASSIGNMENTS
   -- Simple overview of employee-project relationships
WITH emp_projects_cte AS (
    SELECT *
    FROM emp_projects
)
SELECT *
FROM emp_projects_cte;


   -- 01.08 TOTAL HOURS PER PROJECT
   -- Calculates total hours worked on each project
WITH project_hours AS (
    SELECT 
        project_id,
        SUM(hours_worked) AS total_hours
    FROM emp_projects
    GROUP BY project_id
)
SELECT *
FROM project_hours;

    -- 01.08 ATTENDANCE RECORDS
    -- Retrieves raw attendance data
WITH attendance_cte AS (
    SELECT *
    FROM attendance
)
SELECT *
FROM attendance_cte;

   -- 01-09 TOTAL WORKING HOURS PER EMPLOYEE
   -- Calculates total hours worked by each employee
WITH total_hours AS (
    SELECT 
        emp_id,
        SUM(hours) AS total_hours
    FROM attendance
    GROUP BY emp_id
)
SELECT *
FROM total_hours;

   -- 01.11 SALARY HISTORY
   -- Retrieves full salary change history
WITH salary_history AS (
    SELECT *
    FROM salary_audit
)
SELECT *
FROM salary_history;



   -- 01.12 LATEST SALARY UPDATE
   -- Retrieves the most recent salary change in the system
WITH latest_salary AS (
    SELECT *
    FROM salary_audit
    WHERE changed_at = (
        SELECT MAX(changed_at)
        FROM salary_audit
    )
)
SELECT *
FROM latest_salary;

