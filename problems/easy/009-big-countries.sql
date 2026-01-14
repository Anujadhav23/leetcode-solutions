/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Big Countries                                      ║                                      ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: WHERE Clause, OR Operator, Filtering                 ║
║  Date Solved: January 14, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: World
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | bigint  |
+-------------+---------+

A country is "big" if:
- It has an area of at least 3,000,000 km², OR
- It has a population of at least 25,000,000

Find the name, population, and area of the big countries.

Example:
Input: 
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+

Output: 
+-------------+------------+---------+
| name        | population | area    |
+-------------+------------+---------+
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
+-------------+------------+---------+

APPROACH:
---------
Used WHERE clause with OR operator to filter countries that meet
either of the "big country" criteria:
1. Area >= 3,000,000 km²
2. Population >= 25,000,000

*/

-- SOLUTION:
-- =========

SELECT
    name,
    population,
    area
FROM World
WHERE area >= 3000000  
OR population >= 25000000;


-- NOTES:
-- ------
-- OR operator: Returns true if ANY condition is met
-- AND vs OR: AND requires ALL conditions, OR requires AT LEAST ONE
-- Alternative: Use UNION for potentially better performance