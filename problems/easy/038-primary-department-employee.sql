/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Primary Department for Each Employee               ║
║  Problem Number: 1789                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: UNION, Subquery, HAVING, COUNT                       ║
║  Date Solved: January 31, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Report all employees with their primary department.

Rules:
1. If employee in multiple departments → primary_flag = 'Y'
2. If employee in only 1 department → that's their primary (even if flag = 'N')

Example:
Employee 1: Only 1 dept (dept 1) → Return dept 1
Employee 2: 2 depts, primary = dept 1 → Return dept 1
Employee 4: 3 depts, primary = dept 3 → Return dept 3

APPROACH:
---------
UNION two queries:

Query 1: Employees with explicit primary flag = 'Y'
SELECT WHERE primary_flag = 'Y'

Query 2: Employees in only 1 department
- Subquery finds employee_id with COUNT(*) = 1
- Main query returns those employees

UNION combines both (removes duplicates automatically).

*/

-- SOLUTION:
-- =========

SELECT
    employee_id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT
    employee_id,
    department_id
FROM Employee
WHERE employee_id IN (
    SELECT employee_id
    FROM Employee 
    GROUP BY employee_id
    HAVING COUNT(*) = 1
);


-- NOTES:
-- ------
-- UNION: Combines and removes duplicates (vs UNION ALL)
-- Subquery with HAVING: Finds employees in exactly 1 department
-- IN operator: Filters employees from subquery results
-- Two conditions: Explicit primary OR single department
-- HAVING COUNT(*) = 1: Identifies single-department employees
-- Alternative: Use CASE statement or LEFT JOIN approach