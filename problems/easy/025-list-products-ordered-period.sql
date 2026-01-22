/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: List the Products Ordered in a Period              ║                                    
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: JOIN, BETWEEN, GROUP BY, HAVING, SUM                 ║
║  Date Solved: January 22, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Get the names of products that have at least 100 units ordered 
in February 2020 and their total amount.

Example:
Product 1: 60 + 70 = 130 units (Include ✓)
Product 2: 80 units (Exclude - less than 100)
Product 5: 50 + 50 = 100 units (Include ✓)

APPROACH:
---------
Step 1: JOIN Products and Orders tables
        
Step 2: Filter orders to February 2020 using BETWEEN
        Date range: 2020-02-01 to 2020-02-29
        
Step 3: GROUP BY product to aggregate units per product
        
Step 4: SUM(unit) calculates total units ordered
        
Step 5: HAVING filters products with >= 100 total units
        (Cannot use WHERE with aggregate functions)

*/

-- SOLUTION:
-- =========

SELECT 
    p.product_name,
    SUM(o.unit) AS unit
FROM Products p
JOIN Orders o
    ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY p.product_id, p.product_name
HAVING SUM(o.unit) >= 100;


-- NOTES:
-- ------
-- BETWEEN: Inclusive date range (includes both start and end)
-- February 2020: 29 days (2020 is a leap year)
-- WHERE before GROUP BY: Filters rows before aggregation
-- HAVING after GROUP BY: Filters aggregated results
-- GROUP BY both IDs and names: Best practice for consistency
-- SUM(unit): Aggregates multiple orders for same product
-- Alternative: Use YEAR() and MONTH() functions for date filtering