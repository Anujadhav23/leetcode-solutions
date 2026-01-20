/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: User Activity for the Past 30 Days I               ║                                   
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: DATE, BETWEEN, COUNT DISTINCT, GROUP BY              ║
║  Date Solved: January 20, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find daily active user count for 30 days ending 2019-07-27.
A user is "active" on a day if they had at least one activity.

Period: 2019-06-28 to 2019-07-27 (30 days inclusive)
Calculation: 2019-07-27 minus 29 days = 2019-06-28

Example:
On 2019-07-20: Users 1 and 2 were active
On 2019-07-21: Users 2 and 3 were active

APPROACH:
---------
Step 1: Filter dates using BETWEEN for 30-day window
Step 2: GROUP BY activity_date to get data per day
Step 3: COUNT(DISTINCT user_id) counts unique users per day
        (Same user can have multiple activities on same day)

*/

-- SOLUTION:
-- =========

SELECT
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity 
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;


-- NOTES:
-- ------
-- BETWEEN: Inclusive range (includes both start and end dates)
-- 30 days calculation: End date - 29 days = Start date
-- COUNT(DISTINCT): Prevents counting same user multiple times per day
-- GROUP BY date: Aggregates all activities per day
-- Only days with activity appear in results (no zero-activity days)
-- Date format: 'YYYY-MM-DD' is SQL standard