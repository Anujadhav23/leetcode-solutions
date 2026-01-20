/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Reformat Department Table                          ║                                    ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: CASE, GROUP BY, SUM, PIVOT (Manual)                  ║
║  Date Solved: January 20, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Transform rows to columns - convert monthly revenues into separate 
columns for each month (PIVOT operation).

Input (Row format):
+------+---------+-------+
| id   | revenue | month |
+------+---------+-------+
| 1    | 8000    | Jan   |
| 1    | 7000    | Feb   |
+------+---------+-------+

Output (Column format):
+------+-------------+-------------+
| id   | Jan_Revenue | Feb_Revenue |
+------+-------------+-------------+
| 1    | 8000        | 7000        |
+------+-------------+-------------+

APPROACH:
---------
Manual PIVOT using CASE statements:
- Use CASE WHEN for each month to extract revenue
- SUM() aggregates revenue (handles NULLs automatically)
- GROUP BY id to combine all months per department
- Creates 13 columns: 1 for id + 12 for months

*/

-- SOLUTION:
-- =========

SELECT
    id,
    SUM(CASE WHEN month = 'Jan' THEN revenue END) AS Jan_Revenue,
    SUM(CASE WHEN month = 'Feb' THEN revenue END) AS Feb_Revenue,
    SUM(CASE WHEN month = 'Mar' THEN revenue END) AS Mar_Revenue,
    SUM(CASE WHEN month = 'Apr' THEN revenue END) AS Apr_Revenue,
    SUM(CASE WHEN month = 'May' THEN revenue END) AS May_Revenue,
    SUM(CASE WHEN month = 'Jun' THEN revenue END) AS Jun_Revenue,
    SUM(CASE WHEN month = 'Jul' THEN revenue END) AS Jul_Revenue,
    SUM(CASE WHEN month = 'Aug' THEN revenue END) AS Aug_Revenue,
    SUM(CASE WHEN month = 'Sep' THEN revenue END) AS Sep_Revenue,
    SUM(CASE WHEN month = 'Oct' THEN revenue END) AS Oct_Revenue,
    SUM(CASE WHEN month = 'Nov' THEN revenue END) AS Nov_Revenue,
    SUM(CASE WHEN month = 'Dec' THEN revenue END) AS Dec_Revenue
FROM Department
GROUP BY id;


-- NOTES:
-- ------
-- PIVOT technique: Rows → Columns transformation
-- CASE without ELSE returns NULL (perfect for missing months)
-- SUM(NULL) = NULL (no data for that month)
-- Alternative: Use PIVOT operator in SQL Server/Oracle
-- Manual PIVOT: More portable across different SQL databases