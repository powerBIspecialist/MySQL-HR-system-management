Relationships Overview:

departments -> employees : RESTRICT - the department cannot be deleted if it has employees.

departments -> projects : RESTRICT - the department cannot be deleted if it has projects.

employees -> employees : SET NULL - SELF JOIN - manager_id points to the same table.

employees -> emp_projects : CASCADE - Pivot table dissolves many-to-many relationship.

projects -> emp_ projects : CASCADE - Removing a profect removes all its assignmens.

employees -> attendance : CASCADE - Time logs deleted when employee record is removed.
