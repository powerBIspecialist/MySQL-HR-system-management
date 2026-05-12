Employee Management Database
Overview:
A relational Employee Management System built in MySQL that simulates a real HR environment
with departments, employees, projects, attendance, and audit logging.
Tech Stack:
- MySQL 8+
- SQL (DDL, DML, DQL)
- MySQL Workbench
Core Features:
- Employee & department management
- Project assignments
- Attendance tracking
- Salary audit system
- Stored procedures, triggers, functions
- Performance optimization using indexes
SQL Concepts Used:
- Primary/Foreign Keys
- JOINs
- Subqueries
- CTEs
- Views
- Triggers
- Stored Procedures
- Functions
Example Queries:
1. High salary employees: SELECT * FROM employees WHERE salary > 10000;
2. Employees per department using JOIN + GROUP BY
3. Function: GetTotalEmployees()
Performance:
- Indexed foreign keys
- Optimized JOIN queries
- Execution plan analysis (EXPLAIN)
Security:
- Encapsulated business logic
- Audit logs for salary changes
- Controlled relational access
How to Run:
1. CREATE DATABASE hr_system;
2. Run tables.sql
3. Run seed_data.sql
4. Run procedures/functions/triggers
Summary:
This project demonstrates real-world database design, SQL programming, automation, and
optimization techniques.
