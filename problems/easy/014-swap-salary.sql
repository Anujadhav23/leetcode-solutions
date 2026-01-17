/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Swap Salary                                        ║                                       ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: UPDATE, CASE Statement, Data Modification            ║
║  Date Solved: January 17, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Salary
+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| id          | int      |
| name        | varchar  |
| sex         | ENUM     |
| salary      | int      |
+-------------+----------+

Write a solution to swap all 'f' and 'm' values with a SINGLE 
UPDATE statement (no intermediate temporary tables).

Example:
Input: 
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
+----+------+-----+--------+

Output: 
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |
+----+------+-----+--------+

APPROACH:
---------
Used UPDATE statement with CASE to swap values in a single operation:
- CASE evaluates current sex value
- WHEN sex = 'm' THEN 'f' (swap male to female)
- WHEN sex = 'f' THEN 'm' (swap female to male)
- All rows updated simultaneously (no temp table needed)

*/

-- SOLUTION:
-- =========

UPDATE Salary
SET sex = CASE
              WHEN sex = 'm' THEN 'f'
              WHEN sex = 'f' THEN 'm'
          END;


-- NOTES:
-- ------
-- UPDATE with CASE: Powerful for conditional updates
-- Single statement: More efficient than multiple UPDATEs
-- No WHERE clause: Updates ALL rows in the table
-- Alternative: Use IF() in MySQL - UPDATE Salary SET sex = IF(sex='m','f','m')
-- CASE can handle complex multi-condition updates