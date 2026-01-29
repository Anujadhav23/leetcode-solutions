/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Find Followers Count                               ║
║  Problem Number: 1729                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: GROUP BY, COUNT, ORDER BY                            ║
║  Date Solved: January 29, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
For each user, return the number of followers.

Example:
User 0: Followed by {1} → 1 follower
User 2: Followed by {0, 1} → 2 followers

APPROACH:
---------
Simple aggregation:
Step 1: GROUP BY user_id
Step 2: COUNT(follower_id) counts followers per user
Step 3: ORDER BY user_id ascending

*/

-- SOLUTION:
-- =========

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;


-- NOTES:
-- ------
-- Simple GROUP BY aggregation
-- COUNT(follower_id): Counts non-NULL followers
-- No DISTINCT needed: Primary key prevents duplicates
-- ORDER BY: Results sorted by user_id