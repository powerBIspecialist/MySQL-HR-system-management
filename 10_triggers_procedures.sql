-- TRIGGERS & STORED PROCEDURES
-- This file contains database business logic:
-- - Triggers: automatic actions on data changes
-- - Stored Procedures: reusable SQL logic

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


-- =========================================
-- TRIGGERS
-- =========================================

-- salary audit trigger
...

-- =========================================
-- STORED PROCEDURES
-- =========================================

-- (dacă ai proceduri, le pui aici)
