/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Not Boring Movies                                  ║                                      ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: WHERE, Modulo Operator, ORDER BY                     ║
║  Date Solved: January 17, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Cinema
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+

Write a solution to report movies with:
- Odd-numbered ID
- Description is NOT "boring"

Return result ordered by rating in descending order.

Example:
Input: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+

Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+

APPROACH:
---------
Step 1: Filter odd IDs using modulo operator (id % 2 = 1)
Step 2: Exclude boring movies using <> operator
Step 3: Sort by rating in descending order (highest first)

*/

-- SOLUTION:
-- =========

SELECT
    id,
    movie,
    description,
    rating
FROM Cinema
WHERE id % 2 = 1
AND description <> 'boring'
ORDER BY rating DESC;


-- NOTES:
-- ------
-- % (Modulo): Returns remainder of division (odd numbers have remainder 1)
-- <> vs !=: Both mean "not equal" (SQL standard uses <>)
-- ORDER BY DESC: Sorts in descending order (largest to smallest)
-- Multiple WHERE conditions: Use AND for both to be true