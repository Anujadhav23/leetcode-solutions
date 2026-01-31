/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Recyclable and Low Fat Products                    ║
║  Problem Number: 1757                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: WHERE, AND Operator, ENUM Filtering                  ║
║  Date Solved: January 31, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find product IDs that are BOTH low fat AND recyclable.

Conditions:
- low_fats = 'Y' (is low fat)
- recyclable = 'Y' (is recyclable)

Example:
Product 1: low_fats='Y', recyclable='Y' → Include ✓
Product 0: low_fats='Y', recyclable='N' → Exclude

APPROACH:
---------
Simple WHERE clause with AND operator:
Both conditions must be true.

*/

-- SOLUTION:
-- =========

SELECT
    product_id
FROM Products 
WHERE low_fats = 'Y'
    AND recyclable = 'Y';


-- NOTES:
-- ------
-- AND operator: Both conditions must be true
-- ENUM comparison: Direct equality check with 'Y'/'N'
-- Simple filter: No aggregation or joins needed
-- Most basic SQL query pattern
-- Alternative: WHERE (low_fats, recyclable) = ('Y', 'Y') in some databases