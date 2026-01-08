/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Duplicate Emails                                   ║                                    ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: SQL Aggregation, GROUP BY, HAVING                    ║
║  Date Solved: January 8, 2026                                ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+

Write a solution to report all the duplicate emails.
Return the result table in any order.

Example:
Input: 
+----+---------+
| id | email   |
+----+---------+
| 1  | a@b.com |
| 2  | c@d.com |
| 3  | a@b.com |
+----+---------+

Output: 
+---------+
| Email   |
+---------+
| a@b.com |
+---------+

APPROACH:
---------
Used GROUP BY to group emails together, then HAVING clause to filter
only those emails that appear more than once (COUNT(*) > 1).

*/

-- SOLUTION:
-- =========

SELECT
    email AS Email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;


-- NOTES:
-- ------
-- GROUP BY groups identical emails together
-- HAVING filters groups (used after GROUP BY)
-- WHERE cannot be used with aggregate functions