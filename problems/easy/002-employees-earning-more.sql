/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Employees Earning More Than Their Managers         ║                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: SQL Self-Join                                        ║
║  Date Solved: January 8, 2026                                ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+

Write a solution to find the employees who earn more than their managers.
Return the result table in any order.

Example:
Input: 
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+

Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+

APPROACH:
---------
Used SELF JOIN to compare employee salary with their manager's salary.
- e1 represents the employee
- e2 represents the manager
- Joined on e1.managerId = e2.id
- Filtered where employee salary > manager salary

*/

-- SOLUTION:
-- =========

SELECT
    e1.name AS Employee
FROM Employee e1
INNER JOIN Employee e2
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;


-- NOTES:
-- ------
-- Self-join technique: Joining table with itself
-- Alias e1 for employees, e2 for managers
-- INNER JOIN ensures only employees with managers are considered