/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Triangle Judgement                                 ║                                 ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: CASE Statement, Conditional Logic                    ║
║  Date Solved: January 15, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Triangle
+-------------+------+
| Column Name | Type |
+-------------+------+
| x           | int  |
| y           | int  |
| z           | int  |
+-------------+------+

Report for every three line segments whether they can form a triangle.

Triangle Inequality Theorem:
A triangle can be formed if and only if the sum of any two sides 
is greater than the third side.

Example:
Input: 
+----+----+----+
| x  | y  | z  |
+----+----+----+
| 13 | 15 | 30 |
| 10 | 20 | 15 |
+----+----+----+

Output: 
+----+----+----+----------+
| x  | y  | z  | triangle |
+----+----+----+----------+
| 13 | 15 | 30 | No       |
| 10 | 20 | 15 | Yes      |
+----+----+----+----------+

APPROACH:
---------
Used CASE statement to check all three conditions of triangle inequality:
1. x + y > z
2. x + z > y
3. y + z > x

If ALL three conditions are true, it forms a triangle ('Yes').
Otherwise, it doesn't ('No').

*/

-- SOLUTION:
-- =========

SELECT
    x,
    y,
    z,
    CASE
        WHEN (x + y) > z AND 
             (x + z) > y AND
             (y + z) > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM Triangle;


-- NOTES:
-- ------
-- CASE statement: SQL's version of if-else logic
-- AND operator: ALL conditions must be true
-- Triangle Inequality: Sum of two sides > third side (all combinations)
-- Alternative: Use IIF() in SQL Server (simpler for single condition)