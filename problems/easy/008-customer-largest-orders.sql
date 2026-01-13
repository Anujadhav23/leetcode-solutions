/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Customer Placing the Largest Number of Orders      ║                                      ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: CTE, Aggregation, Subquery, GROUP BY                 ║
║  Date Solved: January 13, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Orders
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+

Find the customer_number for the customer who has placed 
the largest number of orders.

Example:
Input: 
+--------------+-----------------+
| order_number | customer_number |
+--------------+-----------------+
| 1            | 1               |
| 2            | 2               |
| 3            | 3               |
| 4            | 3               |
+--------------+-----------------+

Output: 
+-----------------+
| customer_number |
+-----------------+
| 3               |
+-----------------+

APPROACH:
---------
Step 1: Created CTE to count orders per customer
Step 2: Selected customer with MAX order count
- Used GROUP BY to aggregate orders per customer
- Used subquery to find maximum count
- CTE improves readability and reusability

*/

-- SOLUTION:
-- =========

WITH cte AS 
(
    SELECT 
        customer_number,
        COUNT(order_number) AS Num_Ord
    FROM Orders
    GROUP BY customer_number
)

SELECT customer_number
FROM cte
WHERE Num_Ord = (SELECT MAX(Num_Ord) FROM cte);


-- NOTES:
-- ------
-- CTE (Common Table Expression) makes query more readable
-- Alternative: Use ORDER BY COUNT(*) DESC and LIMIT 1
-- Subquery finds the maximum order count dynamically
-- Follow-up: For multiple customers with same max, remove subquery