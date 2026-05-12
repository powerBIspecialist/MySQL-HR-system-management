-- DATABASE RELATIONSHIPS OVERVIEW
-- This section describes relationships and referential
-- integrity rules between all tables in the HR system.

-- Departments → Employees
-- Relationship: 1 to many
-- Rule: RESTRICT
-- A department cannot be deleted if it has employees
-- to preserve data integrity.

-- Departments → Projects
-- Relationship: 1 to many
-- Rule: RESTRICT
-- A department cannot be deleted if it has projects assigned.

-- Employees → Employees (Self-Join)
-- Relationship: hierarchical (manager structure)
-- Rule: SET NULL
-- If a manager is deleted, employees keep their record
-- but manager_id becomes NULL.

-- Employees → Emp_Projects
-- Relationship: many-to-many (junction table)
-- Rule: CASCADE
-- Deleting an employee removes all project assignments.

-- Projects → Emp_Projects
-- Relationship: many-to-many (junction table)
-- Rule: CASCADE
-- Deleting a project removes all employee assignments.

-- Employees → Attendance
-- Relationship: 1 to many
-- Rule: CASCADE
-- If an employee is deleted, all attendance records are removed.
