/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Queries Quality and Percentage                     ║                                      
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: AVG, CASE, Percentage Calculation, GROUP BY          ║
║  Date Solved: January 21, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Calculate two metrics per query:
1. Quality: AVG(rating / position)
2. Poor query %: (queries with rating < 3) / total queries × 100

Example - Dog queries:
Quality = ((5/1) + (5/2) + (1/200)) / 3 = 2.50
Poor % = (1/3) × 100 = 33.33

APPROACH:
---------
Metric 1 - Quality:
AVG(rating / position) with decimal division

Metric 2 - Poor Query Percentage:
Step 1: CASE counts poor queries (rating < 3)
Step 2: SUM(CASE) / COUNT(*) gives ratio
Step 3: Multiply by 100 for percentage

Both rounded to 2 decimal places.

*/

-- SOLUTION:
-- =========

SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(
        SUM(CASE
            WHEN rating < 3 THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS poor_query_percentage
FROM Queries
GROUP BY query_name;


-- NOTES:
-- ------
-- AVG with division: Calculates average ratio
-- CASE for conditional counting: Returns 1 for poor, 0 otherwise
-- SUM(CASE): Counts rows meeting condition
-- Percentage formula: (count / total) × 100
-- * 1.0 and * 100.0: Ensures decimal arithmetic
-- Alternative: Use AVG(CASE WHEN rating < 3 THEN 100.0 ELSE 0 END)