-- STORED PROCEDURES & TRIGGERS (BUSINESS LOGIC LAYER)
--
-- HR SYSTEM - DATABASE PROGRAMMABILITY LAYER
-- Includes triggers and stored procedures for:
-- - salary audit tracking
-- - employee management
-- - department queries
-- This module contains database-level business logic:
-- - Triggers for automatic auditing
-- - Stored procedures for reusable operations

    -- The project currently uses a BEFORE UPDATE trigger for salary auditing.
    -- Additional stored procedures can be added for reusable business operations
    -- such as employee insertion, salary updates, and department-based reporting.

  -- 01.01 - TRIGGER
  --The trigger executes automatically before an UPDATE operation on the employees table.
  -- It checks whether the employee salary has changed.
  --If the salary is different:
        -- the old salary is stored
        -- the new salary is stored
        -- the change timestamp is recorded inside the salary_audit table.

DELIMITER $$
CREATE TRIGGER trg_salary_audit
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
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

    --  02.01 - STORED PROCEDURE
    -- PROCEDURE 1 - Add Employee
    -- Used to insert new employees into the system.

DELIMITER $$

CREATE PROCEDURE add_employee(
    IN p_first_name VARCHAR(80),
    IN p_last_name VARCHAR(80),
    IN p_email VARCHAR(150),
    IN p_salary DECIMAL(10,2),
    IN p_job_title VARCHAR(100),
    IN p_dept_id INT
)
BEGIN
    INSERT INTO employees(
        first_name,
        last_name,
        email,
        salary,
        job_title,
        dept_id
    )
    VALUES(
        p_first_name,
        p_last_name,
        p_email,
        p_salary,
        p_job_title,
        p_dept_id
    );
END$$

DELIMITER ;

  -- 02.02 PROCEDURE 2 - Update Employee Salary
  -- Updates employee salary.
  --  The salary audit trigger will automatically log the change
DELIMITER $$

CREATE PROCEDURE update_employee_salary(
    IN p_emp_id INT,
    IN p_new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = p_new_salary
    WHERE emp_id = p_emp_id;
END$$

DELIMITER ;

  -- 02.03 PROCEDURE 3 – Employees by Department
  -- Returns all employees from a specific department
DELIMITER $$

CREATE PROCEDURE get_employees_by_department(
    IN p_dept_id INT
)
BEGIN
    SELECT *
    FROM employees
    WHERE dept_id = p_dept_id;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE GetHighSalaryEmployees()
BEGIN
    SELECT *
    FROM employees
    WHERE salary > 10000;
END $$

DELIMITER ;




DELIMITER $$

CREATE FUNCTION GetTotalEmployees()
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM employees;

    RETURN total;
END $$

DELIMITER ;


DELIMITER $$

CREATE TRIGGER trg_after_employee_insert
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    INSERT INTO salary_audit (emp_id, old_salary, new_salary)
    VALUES (NEW.emp_id, 0, NEW.salary);
END $$

DELIMITER ;
