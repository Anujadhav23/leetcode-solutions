/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Replace Employee ID With The Unique Identifier     ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: LEFT JOIN, NULL Handling                             ║
║  Date Solved: January 23, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Show the unique ID of each user.
If a user does not have a unique ID, show NULL.

Example:
Alice (id=1): No unique_id → NULL
Meir (id=11): unique_id = 2
Winston (id=90): unique_id = 3

APPROACH:
---------
Simple LEFT JOIN:
- Join Employees with EmployeeUNI on id
- LEFT JOIN ensures all employees appear in result
- Employees without unique_id get NULL automatically
- Select unique_id and name

*/

-- SOLUTION:
-- =========

SELECT
    u.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI u
    ON e.id = u.id;


-- NOTES:
-- ------
-- LEFT JOIN: Keeps all employees, even without unique_id
-- NULL handling: Automatic when no match exists in right table
-- Simple query: No aggregation or filtering needed
-- Column order: unique_id first, then name (as required)
-- Alternative: Could use RIGHT JOIN from EmployeeUNI perspective