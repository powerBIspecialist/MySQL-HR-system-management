    -- The database setup file initializes the environment by creating and selecting the database.
    -- Database Operations: CREATE\DROP DATABASE, USE, SHOW

-- Create a database named mydb
CREATE DATABASE mydb;

-- Delete the database named mydb
DROP DATABASE mydb;

-- Delete database if exists
DROP DATABASE IF EXISTS hr_system;

-- Create a new database named hr_system
CREATE DATABASE hr_system;

-- Select hr_system as the active database
USE hr_system;

-- Show all databases available on the server
SHOW DATABASES;
