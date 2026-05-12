    -- The database setup file initializes the environment by creating and selecting the database.
    -- Database Operations: CREATE\DROP DATABASE, USE, SHOW, SET

-- 01.01 Create a database named mydb
CREATE DATABASE mydb;

-- 01.02 Delete the database named mydb
DROP DATABASE mydb;

-- 01.03Delete database if exists
DROP DATABASE IF EXISTS hr_system;

-- 01.04 Create a new database named hr_system
CREATE DATABASE hr_system;

-- 01.05 Select hr_system as the active database
USE hr_system;

-- 01.06 Show all databases available on the server
SHOW DATABASES;

SET SQL_SAFE_UPDATES = 0;

SET default_storage_engine = InnoDB;


-- END OF DATABASE SETUP MODULE
-- Total commands: 8
-- Covers: CREATE\DROP DATABASE, USE, SHOW, SET 
