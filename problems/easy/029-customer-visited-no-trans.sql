/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Customer Who Visited but Did Not Make Any          ║
║           Transactions                                       ║                                     
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: LEFT JOIN, IS NULL, COUNT, GROUP BY                  ║
║  Date Solved: January 27, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find customer IDs who visited without making any transactions
and count how many such visits they made.

Example:
Customer 54: Visited 3 times, made transactions in 1 visit
            → 2 visits without transactions

Customer 30: Visited 1 time, no transaction
            → 1 visit without transaction

APPROACH:
---------
Step 1: LEFT JOIN Visits with Transactions
        Includes all visits, even those without transactions
        
Step 2: WHERE transaction_id IS NULL
        Filters only visits with no matching transaction
        
Step 3: GROUP BY customer_id
        Aggregates visits per customer
        
Step 4: COUNT(*) counts number of such visits

*/

-- SOLUTION:
-- =========

SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
    ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;


-- NOTES:
-- ------
-- LEFT JOIN: Preserves all visits
-- IS NULL: Identifies visits without transactions
-- WHERE filters before GROUP BY (efficient)
-- COUNT(*): Counts all rows (visits without transactions)
-- Alternative: Use NOT EXISTS subquery
-- Key insight: NULL in joined table = no matching record