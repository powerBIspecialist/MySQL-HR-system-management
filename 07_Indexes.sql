CREATE INDEX idx_departments_name
  ON departments(name);

CREATE INDEX idx_employees_dept
  ON employees(dept_id);

CREATE INDEX idx_employees_manager
  ON employees(manager_id);

CREATE INDEX idx_employees_lastname
  ON employees(last_name);

CREATE INDEX idx_employees_hiredate
  ON employees(hire_date);

CREATE INDEX idx_projects_department
ON projects(dept_id);

CREATE INDEX idx_projects_status
ON projects(status);

CREATE INDEX idx_emp_projects_emp
ON emp_projects(emp_id);

CREATE INDEX idx_emp_projects_project
ON emp_projects(project_id);

CREATE INDEX idx_emp_project_role
ON emp_projects(emp_id, project_id);

CREATE INDEX idx_attendance_emp
ON attendance(emp_id);

CREATE INDEX idx_attendance_date
ON attendance(work_date);

CREATE INDEX idx_attendance_emp_date
ON attendance(emp_id, work_date);

CREATE INDEX idx_salary_audit_emp
ON salary_audit(emp_id);

CREATE INDEX idx_salary_audit_changed
ON salary_audit(changed_at);
