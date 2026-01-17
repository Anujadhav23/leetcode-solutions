/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Actors and Directors Who Cooperated At Least       ║
║           Three Times                                        ║                                      ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: GROUP BY (Multiple Columns), HAVING, Aggregation     ║
║  Date Solved: January 17, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: ActorDirector
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+

Find all pairs (actor_id, director_id) where the actor has 
cooperated with the director at least three times.

Example:
Input: 
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+

Output: 
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+

Explanation: 
Pair (1, 1) cooperated 3 times.
Pair (1, 2) cooperated 2 times (excluded).
Pair (2, 1) cooperated 2 times (excluded).

APPROACH:
---------
Step 1: GROUP BY both actor_id AND director_id to create unique pairs
Step 2: COUNT(*) counts number of cooperations for each pair
Step 3: HAVING filters pairs with at least 3 cooperations

*/

-- SOLUTION:
-- =========

SELECT
    actor_id,
    director_id
FROM ActorDirector
GROUP BY actor_id, director_id
HAVING COUNT(*) >= 3;


-- NOTES:
-- ------
-- GROUP BY multiple columns: Creates groups based on combination
-- Each unique (actor_id, director_id) pair forms one group
-- HAVING with COUNT: Filters aggregated results
-- COUNT(*) counts all rows in each group (including duplicates)
-- Composite grouping: Common for finding relationships/patterns