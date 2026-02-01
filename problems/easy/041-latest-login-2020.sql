/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: The Latest Login in 2020                           ║
║  Problem Number: 1890                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: MAX, DATETIME, YEAR Filtering, GROUP BY              ║
║  Date Solved: February 1, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Report the latest login for all users in year 2020.
Exclude users who did not login in 2020.

Example:
User 6: Logged in 2020-06-30 (2020) → Include
User 8: Logged in 2020-02-01 and 2020-12-30 → Use latest (Dec 30)
User 14: No 2020 logins → Exclude

APPROACH:
---------
Step 1: Filter logins to year 2020 using BETWEEN
        Date range: 2020-01-01 to 2020-12-31
        
Step 2: GROUP BY user_id to aggregate per user
        
Step 3: MAX(time_stamp) gets latest login timestamp
        
Step 4: Automatically excludes users without 2020 logins

*/

-- SOLUTION:
-- =========

SELECT
    user_id,
    MAX(time_stamp) AS last_stamp
FROM Logins
WHERE time_stamp BETWEEN '2020-01-01 00:00:00'
                      AND '2020-12-31 23:59:59'
GROUP BY user_id;


-- NOTES:
-- ------
-- DATETIME filtering: Includes full timestamp with time
-- BETWEEN: Inclusive range (both boundaries included)
-- MAX(time_stamp): Finds latest datetime value
-- WHERE before GROUP BY: Filters before aggregation (efficient)
-- Time precision: 23:59:59 captures all logins on Dec 31
-- Alternative: YEAR(time_stamp) = 2020 (simpler but may be slower)
-- GROUP BY: One row per user with their latest 2020 login