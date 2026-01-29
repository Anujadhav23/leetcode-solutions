/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: The Number of Employees Which Report to Each       ║
║           Employee                                           ║
║  Problem Number: 1731                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: Self-Join, AVG, ROUND, COUNT, GROUP BY               ║
║  Date Solved: January 29, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Report all managers with:
- Their employee_id and name
- Number of employees reporting to them (reports_count)
- Average age of their reports (rounded to nearest integer)

Manager = Employee with at least 1 direct report

Example:
Hercy (id=9): 2 reports (Alice-41, Bob-36)
              Average age = (41+36)/2 = 38.5 → 39

APPROACH:
---------
Step 1: Self-JOIN Employees table
        e1 = employees (reports)
        e2 = managers (those being reported to)
        
Step 2: Join condition: e1.reports_to = e2.employee_id
        Links employees to their managers
        
Step 3: COUNT(e1.employee_id) counts direct reports
        
Step 4: AVG(e1.age) calculates average age of reports
        Multiply by 1.0 for decimal division
        
Step 5: ROUND to nearest integer (0 decimal places)
        
Step 6: GROUP BY manager details, ORDER BY employee_id

*/

-- SOLUTION:
-- =========

SELECT
    e2.employee_id,
    e2.name,
    COUNT(e1.employee_id) AS reports_count,
    ROUND(AVG(1.0 * e1.age), 0) AS average_age
FROM Employees e1
JOIN Employees e2
    ON e1.reports_to = e2.employee_id
GROUP BY e2.employee_id, e2.name
ORDER BY e2.employee_id;


-- NOTES:
-- ------
-- Self-join: Table joined with itself using aliases
-- e1.reports_to = e2.employee_id: Links employee to manager
-- INNER JOIN: Automatically excludes employees without reports
-- 1.0 * age: Ensures decimal arithmetic for AVG
-- ROUND(value, 0): Rounds to whole number
-- COUNT vs COUNT(DISTINCT): Here no duplicates, so COUNT is fine