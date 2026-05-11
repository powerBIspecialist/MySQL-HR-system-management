SELECT COUNT(*) AS total_employees
  FROM employees;

SELECT 
    dept_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY dept_id;

SELECT 
    SUM(salary) AS total_salary_budget
FROM employees;

SELECT 
    AVG(salary) AS average_salary
FROM employees;

SELECT 
    MIN(salary) AS minimum_salary
FROM employees;

SELECT 
    MAX(salary) AS maximum_salary
FROM employees;

SELECT 
    dept_id,
    AVG(salary) AS avg_department_salary
FROM employees
GROUP BY dept_id;

SELECT 
    dept_id,
    COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id
HAVING COUNT(*) >= 2;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employees;

SELECT 
    first_name,
    LENGTH(first_name) AS name_length
FROM employees;

SELECT 
    UPPER(first_name) AS uppercase_name
FROM employees;

SELECT 
    LOWER(email) AS lowercase_email
FROM employees;

SELECT 
    TRIM('   HR System   ') AS trimmed_text;

SELECT NOW() AS current_datetime;

SELECT 
    first_name,
    hire_date,
    DATE_FORMAT(hire_date, '%d-%m-%Y') AS formatted_hire_date
FROM employees;

SELECT 
    first_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS days_in_company
FROM employees;

SELECT 
    first_name,
    IFNULL(phone, 'No Phone Number') AS contact_number
FROM employees;

SELECT 
    first_name,
    IFNULL(phone, 'No Phone Number') AS contact_number
FROM employees;

SELECT 
    dept_id,
    COUNT(*) AS total_employees,
    AVG(salary) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY dept_id;

SELECT 
    dept_id,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM employees
GROUP BY dept_id
HAVING AVG(salary) > 9000
ORDER BY average_salary DESC;

