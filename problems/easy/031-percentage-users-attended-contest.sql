/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Percentage of Users Attended a Contest             ║                               
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: Subquery, Percentage, COUNT DISTINCT, ORDER BY       ║
║  Date Solved: January 28, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find the percentage of users registered in each contest.

Formula: (Users in contest / Total users) × 100

Example (3 total users):
Contest 208: 3 users → (3/3) × 100 = 100.00%
Contest 215: 2 users → (2/3) × 100 = 66.67%
Contest 207: 1 user  → (1/3) × 100 = 33.33%

Order by:
1. percentage DESC (highest first)
2. contest_id ASC (tie-breaker)

APPROACH:
---------
Step 1: GROUP BY contest_id to analyze each contest
        
Step 2: COUNT(DISTINCT user_id) counts unique users per contest
        DISTINCT handles duplicate registrations
        
Step 3: Subquery (SELECT COUNT(*) FROM Users) gets total users
        This is constant for all contests
        
Step 4: Calculate percentage: (count / total) × 100.0
        * 100.0 ensures decimal division
        
Step 5: ROUND to 2 decimal places
        
Step 6: ORDER BY percentage DESC, contest_id ASC

*/

-- SOLUTION:
-- =========

SELECT
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users),
        2
    ) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY
    percentage DESC,
    r.contest_id ASC;


-- NOTES:
-- ------
-- DISTINCT: Prevents counting same user multiple times per contest
-- Subquery: Gets total user count (same for all contests)
-- * 100.0: Forces decimal arithmetic (not integer division)
-- ROUND(value, 2): Rounds to 2 decimal places
-- Multiple ORDER BY: Primary DESC, secondary ASC for ties
-- Subquery efficiency: Evaluated once, reused for all rows
-- Alternative: Use CROSS JOIN with user count, or CTE