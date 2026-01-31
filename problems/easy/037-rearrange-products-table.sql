/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Rearrange Products Table                           ║
║  Problem Number: 1795                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: UNION ALL, UNPIVOT, Data Transformation              ║
║  Date Solved: January 31, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Transform table from wide format to long format (UNPIVOT operation).

Input (Wide format):
+------------+--------+--------+--------+
| product_id | store1 | store2 | store3 |
+------------+--------+--------+--------+
| 0          | 95     | 100    | 105    |
+------------+--------+--------+--------+

Output (Long format):
+------------+--------+-------+
| product_id | store  | price |
+------------+--------+-------+
| 0          | store1 | 95    |
| 0          | store2 | 100   |
| 0          | store3 | 105   |
+------------+--------+-------+

Skip NULL prices (product not available in that store).

APPROACH:
---------
UNION ALL three queries, one per store:

Query 1: Extract store1 data
Query 2: Extract store2 data
Query 3: Extract store3 data

Each query:
- Selects product_id
- Adds store name as literal string
- Selects price from respective store column
- Filters out NULL prices with WHERE

UNION ALL combines all results (allows duplicates, faster than UNION).

*/

-- SOLUTION:
-- =========

SELECT product_id, 'store1' AS store, store1 AS price
FROM Products
WHERE store1 IS NOT NULL

UNION ALL

SELECT product_id, 'store2', store2
FROM Products
WHERE store2 IS NOT NULL

UNION ALL

SELECT product_id, 'store3', store3
FROM Products
WHERE store3 IS NOT NULL;


-- NOTES:
-- ------
-- UNION ALL: Combines results from multiple queries (faster than UNION)
-- Literal strings: 'store1', 'store2', 'store3' create store column
-- WHERE IS NOT NULL: Excludes unavailable products
-- UNPIVOT technique: Columns → Rows transformation
-- Alternative: Use UNPIVOT operator in SQL Server (less portable)
-- UNION vs UNION ALL: UNION removes duplicates (not needed here)