/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Product Sales Analysis III                         ║
║  Problem Number: 1070                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Medium                                          ║
║  Topic: CTE, MIN, JOIN, Compound JOIN Conditions             ║
║  Date Solved: February 11, 2026                              ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find ALL sales that occurred in the first year each product was sold.

Steps:
1. For each product, find the earliest (first) year it was sold
2. Return ALL sales entries for that product in that first year

Note: A product may have multiple sales in the first year
      → Return all of them

Example:
Product 100: First year = 2008
             Sales in 2008: (sale_id 1, qty 10, price 5000)
             → Return this sale

Product 200: First year = 2011
             Sales in 2011: (sale_id 7, qty 15, price 9000)
             → Return this sale

APPROACH:
---------
Step 1: CTE to find first year per product
        - GROUP BY product_id
        - MIN(year) finds earliest year
        
Step 2: JOIN original Sales with CTE
        - Match on product_id AND year
        - Compound JOIN ensures we get sales from first year only
        
Step 3: SELECT required columns
        - product_id, first_year, quantity, price

*/

-- SOLUTION:
-- =========

WITH first_year_table AS (
    SELECT 
        product_id, 
        MIN(year) AS first_year
    FROM Sales
    GROUP BY product_id
)

SELECT 
    s.product_id,
    f.first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN first_year_table f
    ON s.product_id = f.product_id
    AND s.year = f.first_year;


-- NOTES:
-- ------
-- CTE (Common Table Expression): Stores intermediate result
-- MIN(year): Finds earliest year per product
-- Compound JOIN: Two conditions (product_id AND year)
-- Multiple sales per product-year: All returned (correct behavior)
-- Alternative approach: Use window function ROW_NUMBER() with PARTITION
-- CTE clarity: Makes query more readable than subquery
-- No ORDER BY: Problem allows any order