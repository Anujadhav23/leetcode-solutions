/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Biggest Single Number                              ║                                       ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: Subquery, GROUP BY, HAVING, Aggregation              ║
║  Date Solved: January 16, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: MyNumbers
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+

A "single number" is a number that appeared only once in the table.
Find the largest single number. If there is no single number, 
report NULL.

Example 1:
Input: 
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+

Output: 
+-----+
| num |
+-----+
| 6   |
+-----+

Example 2:
Input: 
+-----+
| num |
+-----+
| 8   |
| 8   |
| 7   |
| 7   |
| 3   |
| 3   |
| 3   |
+-----+

Output: 
+------+
| num  |
+------+
| null |
+------+

APPROACH:
---------
Step 1: Subquery finds all "single numbers" (numbers appearing once)
        - GROUP BY num groups same numbers together
        - HAVING COUNT(*) = 1 filters numbers appearing exactly once

Step 2: Main query finds MAX of those single numbers
        - MAX() returns the largest value
        - Returns NULL automatically if subquery is empty

*/

-- SOLUTION:
-- =========

SELECT
    MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
);


-- NOTES:
-- ------
-- Subquery vs JOIN: Subquery is cleaner for filtering
-- MAX() with empty set returns NULL (perfect for this problem)
-- IN operator checks if value exists in subquery results
-- Alternative: Use CTE for better readability