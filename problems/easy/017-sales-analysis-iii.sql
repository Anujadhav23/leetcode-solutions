/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Sales Analysis III                                 ║                                      ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: JOIN, GROUP BY, HAVING, Date Functions, MIN/MAX      ║
║  Date Solved: January 19, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find products that were ONLY sold in Q1 2019 (Jan 1 - Mar 31, 2019).
A product should NOT have any sales outside this date range.

Example:
Product 1: Sold only on 2019-01-21 ✓ (Include)
Product 2: Sold on 2019-02-17 AND 2019-06-02 ✗ (Exclude - has sale in June)
Product 3: Sold only on 2019-05-13 ✗ (Exclude - outside Q1)

APPROACH:
---------
Step 1: JOIN Product and Sales tables
Step 2: GROUP BY product to aggregate all sales per product
Step 3: Use HAVING with MIN/MAX dates to filter:
        - MIN(sale_date) >= '2019-01-01' (first sale in Q1)
        - MAX(sale_date) <= '2019-03-31' (last sale in Q1)
        
This ensures ALL sales are within Q1 2019.

*/

-- SOLUTION:
-- =========

SELECT
    p.product_id,
    p.product_name
FROM Product p
JOIN Sales s
    ON p.product_id = s.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING
    MIN(s.sale_date) >= '2019-01-01'
    AND MAX(s.sale_date) <= '2019-03-31';


-- NOTES:
-- ------
-- MIN/MAX with dates: Finds earliest and latest sales
-- HAVING filters grouped data (can't use WHERE with aggregates)
-- Logic: If first sale >= Jan 1 AND last sale <= Mar 31, all sales in Q1
-- Alternative: Use NOT EXISTS to check for sales outside date range
-- Date format: 'YYYY-MM-DD' is SQL standard