-- This module demonstrates database indexing strategies
-- used to improve query performance, JOIN efficiency,
-- and filtering operations.
--
-- Includes:
-- - Indexes on foreign keys
-- - Indexes on filtering columns (WHERE)
-- - Indexes on sorting columns (ORDER BY)
-- - Composite indexes for many-to-many relationships


  -- 01.01 - Departments Indexes
  -- Speeds up searches by department name
CREATE INDEX idx_departments_name
  ON departments(name);

  -- 01.02 Employees Indexes
  -- Improves filtering and joins by department
CREATE INDEX idx_employees_dept
  ON employees(dept_id);

  --01.03 Manager hierarchy
  -- Optimizes manager hierarchy queries and self joins
CREATE INDEX idx_employees_manager
  ON employees(manager_id);

  -- 01.04 Employees_hire Index
  -- Optimizes filtering and sorting by hire date
CREATE INDEX idx_employees_hiredate
  ON employees(hire_date);

  -- 01.05 Project Indexes
  -- Improves joins between projects and departments
CREATE INDEX idx_projects_department
  ON projects(dept_id);

  -- 01.06 Project Status Index
  -- Speeds up filtering projects by status
CREATE INDEX idx_projects_status
ON projects(status);

  -- 01.07 Employee Project Indexes
  -- Improves searches for projects assigned to a specific employee
CREATE INDEX idx_emp_projects_emp
ON emp_projects(emp_id);

-- 01.08 - Employess Projects Project Index
-- Improves searches for employees assigned to a specific project
CREATE INDEX idx_emp_projects_project
ON emp_projects(project_id);

  -- 01.09 Attendance Index
  -- Improves attendance lookups by employee
CREATE INDEX idx_attendance_emp
ON attendance(emp_id);

  -- 01.10 Attendace date Index
  -- Optimizes filtering attendance by date
CREATE INDEX idx_attendance_date
ON attendance(work_date);

-- 01.11 - Salary Audit Index
-- Improves salary history lookups by employee 
CREATE INDEX idx_salary_audit_emp
ON salary_audit(emp_id);

-- 01.11 - Salary Change Index
-- Optimizes sorting and filtering salary changes by date/time
CREATE INDEX idx_salary_audit_changed
ON salary_audit(changed_at);

      -- THE END--
