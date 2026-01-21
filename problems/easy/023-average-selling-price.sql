/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Average Selling Price                              ║                                      ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: JOIN, BETWEEN, ROUND, COALESCE, Weighted Average     ║
║  Date Solved: January 21, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Calculate weighted average selling price for each product.
Price varies by date range, so must match purchase_date to 
correct price period.

Formula: SUM(price × units) / SUM(units)

If no sales, return 0.

Example:
Product 1:
- 100 units at $5 (Feb 25) = $500
- 15 units at $20 (Mar 1) = $300
- Average = $800 / 115 = $6.96

APPROACH:
---------
Step 1: LEFT JOIN on product_id AND date range
        BETWEEN matches purchase_date to price period
        
Step 2: Calculate weighted average:
        SUM(price × units) / SUM(units)
        
Step 3: COALESCE handles NULL (no sales) → returns 0
        
Step 4: Multiply by 1.0 for decimal division
        
Step 5: ROUND to 2 decimal places

*/

-- SOLUTION:
-- =========

SELECT
    p.product_id,
    ROUND(
        COALESCE(SUM(p.price * u.units) * 1.0 / SUM(u.units), 0),
        2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;


-- NOTES:
-- ------
-- BETWEEN: Inclusive range check for dates
-- Weighted average: Different from simple AVG(price)
-- COALESCE: Returns first non-NULL value (handles division by NULL)
-- * 1.0: Forces decimal division (avoids integer truncation)
-- Complex JOIN: Multiple conditions with date range matching
-- Alternative: Use ISNULL() or IFNULL() in some SQL dialects