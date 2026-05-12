-- Stored procedures (IN/OUT parameters)
-- Trigger BEFORE / AFTER
-- Differences: FUNCTION VS PROCEDURE
-- CREATE USER, GRANT, REVOKE
-- Export/ import mysqldump, sql files

-- --THE END--

CREATE USER analyst_user IDENTIFIED BY 'password123';

GRANT SELECT ON employees TO analyst_user;
GRANT SELECT ON departments TO analyst_user;

CREATE ROLE hr_role;

GRANT SELECT, INSERT, UPDATE ON employees TO hr_role;

GRANT hr_role TO analyst_user;
