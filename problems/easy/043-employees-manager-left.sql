/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Employees Whose Manager Left the Company           ║
║  Problem Number: 1978                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: Self-Join, LEFT JOIN, Multiple WHERE Conditions      ║
║  Date Solved: February 2, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find IDs of employees who:
1. Salary < $30,000 AND
2. Manager left the company (manager_id exists but manager not in table)

Note: Employees with manager_id = NULL are excluded.

Example:
Employee 1 (Kalel): Salary $21,241, manager_id = 11
                    Manager 11 exists → Exclude

Employee 11 (Joziah): Salary $28,485, manager_id = 6
                      Manager 6 doesn't exist → Include

APPROACH:
---------
Step 1: Self-JOIN Employees table
        e = employee
        m = manager (LEFT JOIN to check existence)
        
Step 2: Filter with three conditions:
        - salary < 30000
        - manager_id IS NOT NULL (has a manager)
        - m.employee_id IS NULL (manager record missing)
        
Step 3: ORDER BY employee_id

*/

-- SOLUTION:
-- =========

SELECT e.employee_id
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.employee_id
WHERE e.salary < 30000
  AND e.manager_id IS NOT NULL
  AND m.employee_id IS NULL
ORDER BY e.employee_id;


-- NOTES:
-- ------
-- Self-join: Table joined with itself
-- e.manager_id = m.employee_id: Links employee to their manager
-- LEFT JOIN: Keeps employees even if manager doesn't exist
-- m.employee_id IS NULL: Manager record is missing (left the company)
-- manager_id IS NOT NULL: Excludes employees without assigned managers
-- Three-condition filter: Salary AND has manager AND manager missing
-- Alternative: Use NOT IN with subquery