/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Delete Duplicate Emails                            ║                                      ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: SQL DELETE, Self-Join, Data Modification             ║
║  Date Solved: January 9, 2026                                ║
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

Write a solution to DELETE all duplicate emails, keeping only one 
unique email with the smallest id.

Note: Write a DELETE statement, not a SELECT one.

Example:
Input: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+

Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+

APPROACH:
---------
Used self-join to compare records with same email.
- p1 represents the record to potentially delete
- p2 represents the record to keep (smaller id)
- DELETE rows where p1.id > p2.id for same email
This keeps only the row with smallest id for each email.

*/

-- SOLUTION:
-- =========

DELETE p1
FROM Person p1
JOIN Person p2
ON p1.email = p2.email
WHERE p1.id > p2.id;


-- NOTES:
-- ------
-- Self-join technique for finding duplicates
-- DELETE uses table alias from JOIN
-- Keeps minimum id automatically (WHERE p1.id > p2.id)
-- Alternative: Use CTE with ROW_NUMBER() and DELETE