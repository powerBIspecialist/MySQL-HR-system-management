
    -- FUNCTIONS & AGGREGATIONS
    -- This section demonstrates SQL data aggregation, grouping, string manipulation, date handling, 
    -- and null safety functions used for HR analytics and reporting systems.

      -- Aggregations functions: COUNT, SUM, AVG, MIN, MAX
      -- Grouping: GROUP BY, HAVING
      -- String functions: CONCAT, LENGTH, UPPER, LOWER, TRIM, SUBSTRING
      -- Date functions, NOW, CURDATE, DATE_FORMAT, DATEFIFF
      -- NULL functions: IFNULL, NULLIF


  -- 01.01 COUNT – Total Employees
  -- Counts the total number of employees in the company
SELECT COUNT(*) AS total_employees
  FROM employees;


  -- 01.02 COUNT + GROUP BY – Employees per Department
  -- Shows how many employees exist in each department
SELECT 
    dept_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id;

  -- 01.03 SUM – Total Salary Cost
  -- Calculates total payroll cost of all employees
SELECT 
    SUM(salary) AS total_salary_budget
FROM employees;

  -- 01.04. AVG – Average Salary
  -- Returns the average salary in the company
SELECT 
    AVG(salary) AS average_salary
FROM employees;

  -- 01.05 MIN – Lowest Salary
  -- Finds the lowest salary in the company 
SELECT 
    MIN(salary) AS minimum_salary
FROM employees;

  -- 01.06 MAX – Highest Salary
  -- Finds the highest salary in the company
SELECT 
    MAX(salary) AS maximum_salary
FROM employees;

  -- 01.07 AVG + GROUP BY – Department Average Salary
  -- Shows average salary per department
SELECT 
    dept_id,
    AVG(salary) AS avg_department_salary
FROM employees
GROUP BY dept_id;

  -- 01.08 HAVING + COUNT – Departments with 2+ Employees
  -- Filters departments that have at least 2 employees 
SELECT 
    dept_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id
HAVING COUNT(*) >= 2;

  -- 01.09 CONCAT – Full Name Creation
  -- Combines first and last name into a full name
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

  -- 01.10 LENGTH – Name Length
  -- Returns number of characters in first name
SELECT 
    first_name,
    LENGTH(first_name) AS name_length
FROM employees;

  -- 01.11 UPPER – Uppercase Conversion
  -- Converts first names to uppercase
SELECT 
    UPPER(first_name) AS uppercase_name
FROM employees;

  -- 01.12 LOWER – Lowercase Conversion
  -- Converts email addresses to lowercase
SELECT 
    LOWER(email) AS lowercase_email
FROM employees;

  -- 01.13 TRIM – Remove Extra Spaces
  -- Removes spaces from beginning and end of a string
SELECT 
    TRIM('   HR System   ') AS trimmed_text;

  -- 01.14 NOW – Current Date & Time
  -- Returns current system timestamp
SELECT NOW() AS current_datetime;

  -- 01.15 DATE_FORMAT – Format Hire Date
  -- Formats hire date into readable format (DD-MM-YYYY)
SELECT 
    first_name,
    hire_date,
    DATE_FORMAT(hire_date, '%d-%m-%Y') AS formatted_hire_date
FROM employees;

  -- 01.16 DATEDIFF – Days in Company
  -- Calculates how many days an employee has worked in the company
SELECT 
    first_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS days_in_company
FROM employees;

  -- 01.17 IFNULL – Replace NULL Values
  -- Retrieves the first_name column from the employees table
SELECT 
    first_name,
    IFNULL(phone, 'No Phone Number') AS contact_number
FROM employees;

 -- 01.18 NULL HANDLING – IFNULL (DATA CLEANING QUERY)
 -- Displays employee names and ensures that every employee
 -- has a readable contact value, even if the phone number is missing
SELECT 
    first_name,
    IFNULL(phone, 'No Phone Number') AS contact_number
FROM employees;

  -- 01.19 FILTERED GROUP ANALYSIS – HIGH SALARY DEPARTMENTS
  -- This query provides a full HR financial overview per department, showing:
  -- team size
  -- salary distribution
  --total payroll cost
  --salary range
SELECT 
    dept_id,
    COUNT(*) AS total_employees,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id;


  -- 01.20 FILTERED DEPARTMENT ANALYSIS (GROUP BY + HAVING + ORDER BY)
  -- Groups employees by department
  -- Calculates employee count + average salary
  -- Filters only high-paying departments
  -- Sorts them from highest to lowest average salary 
SELECT 
    dept_id,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 9000
ORDER BY average_salary DESC;


            -- THE END--
