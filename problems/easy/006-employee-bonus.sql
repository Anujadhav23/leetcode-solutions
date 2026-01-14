/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Employee Bonus                                     ║                                     ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: LEFT JOIN, NULL Handling, WHERE Clause               ║
║  Date Solved: January 13, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Employee
+-------+--------+------------+-----------+
| empId | name   | supervisor | salary    |
+-------+--------+------------+-----------+

Table: Bonus
+-------+-------+
| empId | bonus |
+-------+-------+

Select all employee names and their bonus amounts. 
If an employee has a bonus < 1000, show them.
Also show employees with no bonus (NULL).

APPROACH:
---------
Used LEFT JOIN to include all employees and their bonuses.
Filtered with WHERE clause to include:
1. Employees with bonus < 1000
2. Employees with NULL bonus (no bonus record)

*/

-- SOLUTION:
-- =========

SELECT
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000
OR b.bonus IS NULL;


-- NOTES:
-- ------
-- LEFT JOIN preserves all employees even without bonus
-- WHERE with OR handles both conditions
-- NULL handling is crucial for optional relationships