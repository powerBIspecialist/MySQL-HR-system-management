CREATE TABLE departments (
    dept_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    budget DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
    created_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    active ENUM('active', 'inactive') NOT NULL DEFAULT 'active',

    CONSTRAINT pk_departments
		PRIMARY KEY (dept_id),
        
    CONSTRAINT uq_dept_name
		UNIQUE (name),

    CONSTRAINT chk_dept_budget 
		CHECK (budget >= 0)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
;




CREATE TABLE employees (
    emp_id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(80) NOT NULL,
    last_name VARCHAR(80) NOT NULL,
   	email VARCHAR(150) NOT NULL,
    phone VARCHAR(20) NULL,
    birth_date DATE NULL,
    hire_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    salary DECIMAL(10, 2) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    dept_id INT NOT NULL,
    manager_id INT NULL,
    active ENUM('active', 'inactive') NOT NULL DEFAULT 'active',

    CONSTRAINT pk_employees 
		PRIMARY KEY (emp_id),
        
	CONSTRAINT uq_emp_email 
		UNIQUE (email),
        
	CONSTRAINT fk_emp_dept
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
        
	CONSTRAINT fk_manager
        FOREIGN KEY (manager_id)
        REFERENCES employees(emp_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
        
	CONSTRAINT chk_salary
        CHECK (salary > 0),
        
	CONSTRAINT chk_emp_dates
        CHECK (birth_date IS NULL
            OR birth_date < hire_date
        ))
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
;



CREATE TABLE projects (
	project_id INT AUTO_INCREMENT,
	project_name VARCHAR(150) NOT NULL,
	description TEXT NULL,
	start_date DATE NOT NULL,
	end_date DATE NULL,
	status VARCHAR(50) NOT NULL DEFAULT 'Active',
	budget DECIMAL(12, 2) NOT NULL DEFAULT 0.00,
	dept_id INT NOT NULL,

    CONSTRAINT pk_projects 
		PRIMARY KEY (project_id),
    
	CONSTRAINT uq_project_name 
		UNIQUE (project_name),
    
	CONSTRAINT chk_project_budget 
		CHECK (budget >= 0),
    
	CONSTRAINT chk_project_dates 
		CHECK ( end_date IS NULL
            OR end_date >= start_date
        ),

CONSTRAINT fk_project_department
        FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE emp_projects (
    id INT NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    project_id INT NOT NULL,
    role VARCHAR(100) NOT NULL,
    hours_worked INT NOT NULL,
    assigned_date DATE NOT NULL,

    CONSTRAINT pk_emp_projects 
        PRIMARY KEY (id),

    CONSTRAINT uq_emp_project 
        UNIQUE (emp_id, project_id),

    CONSTRAINT fk_emp 
        FOREIGN KEY (emp_id) 
        REFERENCES employees(emp_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_ep_project
        FOREIGN KEY (project_id)
        REFERENCES projects(project_id)
        ON DELETE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE attendance (
    id INT NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    work_date DATE NOT NULL,
    hours DECIMAL(4,2) NOT NULL DEFAULT 8.00,
    record_type VARCHAR(50) NOT NULL,
    notes VARCHAR(255),

    CONSTRAINT pk_attendance
        PRIMARY KEY (id),

    CONSTRAINT fk_attendance_employee
        FOREIGN KEY (emp_id)
        REFERENCES employees(emp_id)
        ON DELETE CASCADE,

    CONSTRAINT uq_attendance_work_date
        UNIQUE (emp_id, work_date),

    CONSTRAINT chk_attendance_hours
        CHECK (hours >= 0.00 AND hours <= 24.00)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE salary_audit (
    id INT NOT NULL AUTO_INCREMENT,
    emp_id INT NOT NULL,
    old_salary DECIMAL(10,2) NOT NULL,
    new_salary DECIMAL(10,2) NOT NULL,
    changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    changed_by VARCHAR(100) DEFAULT (USER()),

    CONSTRAINT pk_salary_audit
        PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
	
    
    DELIMITER $$
CREATE TRIGGER trg_salary_audit
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF NOT (OLD.salary <=> NEW.salary) THEN
        INSERT INTO salary_audit (
            emp_id,
            old_salary,
            new_salary
        )
        VALUES (
            OLD.emp_id,
            OLD.salary,
            NEW.salary
        );
    END IF;
END$$

DELIMITER ;
