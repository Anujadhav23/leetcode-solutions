/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Find Total Time Spent by Each Employee             ║
║  Problem Number: 1741                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: SUM, GROUP BY, Arithmetic Operations                 ║
║  Date Solved: January 30, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Calculate total time in minutes spent by each employee on each day.

Employee can enter/leave multiple times per day.
Time for single entry = out_time - in_time

Example:
Employee 1, 2020-11-28:
- Entry 1: 32 - 4 = 28 minutes
- Entry 2: 200 - 55 = 145 minutes
- Total: 28 + 145 = 173 minutes

APPROACH:
---------
Step 1: Calculate time per entry: (out_time - in_time)
        
Step 2: GROUP BY emp_id, event_day
        Groups all entries for same employee on same day
        
Step 3: SUM(out_time - in_time)
        Aggregates total time across multiple entries
        
Step 4: Rename event_day to 'day' as required

*/

-- SOLUTION:
-- =========

SELECT
    event_day AS day,
    emp_id,
    SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY emp_id, event_day;


-- NOTES:
-- ------
-- Arithmetic in aggregate: SUM handles subtraction per row
-- GROUP BY multiple columns: Creates groups per employee per day
-- Column alias: event_day AS day for output format
-- No DISTINCT needed: Primary key prevents duplicates
-- Time units: in_time and out_time are in minutes (1-1440)
-- Simple aggregation: No complex joins or subqueries needed