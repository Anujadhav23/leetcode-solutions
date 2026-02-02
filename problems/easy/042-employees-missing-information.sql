/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Employees With Missing Information                 ║
║  Problem Number: 1965                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: UNION, LEFT JOIN, IS NULL, Set Operations            ║
║  Date Solved: February 2, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find IDs of all employees with missing information:
- Name is missing (in Salaries but not in Employees), OR
- Salary is missing (in Employees but not in Salaries)

Example:
Employee 1: Has salary but no name → Include
Employee 2: Has name but no salary → Include
Employee 4: Has both name and salary → Exclude

APPROACH:
---------
Use UNION to combine two queries:

Query 1: Find employees with missing salary
- LEFT JOIN Employees → Salaries
- WHERE salary record IS NULL

Query 2: Find employees with missing name
- LEFT JOIN Salaries → Employees  
- WHERE name record IS NULL

UNION automatically removes duplicates and combines results.
ORDER BY employee_id for final output.

*/

-- SOLUTION:
-- =========

SELECT e.employee_id
FROM Employees e
LEFT JOIN Salaries s
    ON e.employee_id = s.employee_id
WHERE s.employee_id IS NULL

UNION

SELECT s.employee_id
FROM Salaries s
LEFT JOIN Employees e
    ON s.employee_id = e.employee_id
WHERE e.employee_id IS NULL

ORDER BY employee_id;


-- NOTES:
-- ------
-- UNION: Combines results and removes duplicates
-- Double LEFT JOIN: Checks both directions
-- First query: Employees without salaries
-- Second query: Salaries without employee records
-- IS NULL: Identifies missing records from joined table
-- ORDER BY after UNION: Applies to final combined result
-- Alternative: Use FULL OUTER JOIN (not supported in all databases)