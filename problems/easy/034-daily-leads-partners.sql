/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Daily Leads and Partners                           ║
║  Problem Number: 1693                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: COUNT DISTINCT, GROUP BY Multiple Columns            ║
║  Date Solved: January 29, 2026                               ║
╚══════════════════════════════════════════════════════════════╗

PROBLEM DESCRIPTION:
--------------------
For each date_id and make_name combination, find:
- Number of distinct lead_id's
- Number of distinct partner_id's

Table may contain duplicates, so DISTINCT is essential.

APPROACH:
---------
Step 1: GROUP BY date_id, make_name
        Creates groups for each date-product combination
        
Step 2: COUNT(DISTINCT lead_id) counts unique leads
        
Step 3: COUNT(DISTINCT partner_id) counts unique partners

*/

-- SOLUTION:
-- =========

SELECT
    date_id,
    make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners
FROM DailySales
GROUP BY date_id, make_name;


-- NOTES:
-- ------
-- DISTINCT: Essential because table may have duplicates
-- GROUP BY multiple columns: Creates compound groups
-- COUNT(DISTINCT): Removes duplicates before counting
-- No ORDER BY specified: Any order acceptable