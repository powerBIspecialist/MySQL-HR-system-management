    -- This database setup file for the environment by creating and selecting the database.
    -- Database Operations: DROP/CREATE DATABASE, USE, SHOW, SET


-- 01.01Delete database if exists
DROP DATABASE IF EXISTS hr_system;

-- 01.02 Create a new database named hr_system
CREATE DATABASE hr_system;

-- 01.03 Select hr_system as the active database
CONNECT hr_system; --as alternative we can use :
CONNECT hr_system;

-- 01.04 Show all databases available on the server
SHOW DATABASES;

---------------------------------------------------------------------------------------------
-- 01.05 Delete database
DROP DATABASE HR_system


SET SQL_SAFE_UPDATES = 0;
SET time_zone = '+00:00';
SET default_storage_engine = InnoDB;


-- END OF DATABASE SETUP MODULE
-- Total commands: 8
-- Covers: CREATE\DROP DATABASE, USE, SHOW, SET 
