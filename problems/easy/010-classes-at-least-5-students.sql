/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Classes With at Least 5 Students                   ║                                       ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: GROUP BY, HAVING, Aggregation                        ║
║  Date Solved: January 14, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Courses
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+

Write a solution to find all the classes that have at least 
five students.

Example:
Input: 
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+

Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+

Explanation: 
Math has 6 students, so it's included.
Other classes have fewer than 5 students.

APPROACH:
---------
Used GROUP BY to group students by class, then HAVING clause 
to filter classes with at least 5 students.
- GROUP BY aggregates rows per class
- COUNT(student) counts students in each class
- HAVING filters aggregated results (WHERE cannot be used here)

*/

-- SOLUTION:
-- =========

SELECT
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;


-- NOTES:
-- ------
-- HAVING vs WHERE: HAVING filters after aggregation, WHERE before
-- COUNT(student) counts non-NULL student values
-- COUNT(*) would give same result if no NULL values exist
-- GROUP BY is required before using HAVING with aggregate functions