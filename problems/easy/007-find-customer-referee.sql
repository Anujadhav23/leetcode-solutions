/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Find Customer Referee                              ║                                     ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: WHERE Clause, NULL Handling                          ║
║  Date Solved: January 13, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Customer
+----+------+------------+
| id | name | referee_id |
+----+------+------------+

Find the names of customers that are:
1. Referred by any customer with id != 2
2. NOT referred by any customer (NULL)

Example:
Input: 
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+

Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+

APPROACH:
---------
Filter customers using WHERE clause with two conditions:
1. referee_id != 2 (not referred by customer 2)
2. referee_id IS NULL (not referred by anyone)

*/

-- SOLUTION:
-- =========

SELECT
    name 
FROM Customer
WHERE referee_id != 2
OR referee_id IS NULL;


-- NOTES:
-- ------
-- NULL cannot be compared with = or !=
-- Must use IS NULL or IS NOT NULL for NULL checks
-- OR operator includes both conditions