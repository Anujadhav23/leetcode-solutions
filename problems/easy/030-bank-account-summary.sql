/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Bank Account Summary II                            ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: JOIN, SUM, GROUP BY, HAVING                          ║
║  Date Solved: January 27, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Report name and balance of users with balance > 10000.

Balance = Sum of all transaction amounts (positive and negative)
- Positive amount: Money received
- Negative amount: Money transferred

Example:
Alice: 7000 + 7000 - 3000 = 11000 (Include ✓)
Bob: 1000 (Exclude)
Charlie: 6000 + 6000 - 4000 = 8000 (Exclude)

APPROACH:
---------
Step 1: JOIN Users with Transactions on account
        
Step 2: GROUP BY user to calculate total balance
        
Step 3: SUM(amount) calculates balance
        Handles both positive and negative amounts
        
Step 4: HAVING filters users with balance > 10000

*/

-- SOLUTION:
-- =========

SELECT
    u.name,
    SUM(t.amount) AS balance
FROM Users u
JOIN Transactions t
    ON u.account = t.account
GROUP BY u.name
HAVING SUM(t.amount) > 10000;


-- NOTES:
-- ------
-- INNER JOIN: Only users with transactions (correct for this problem)
-- SUM handles positive/negative: Automatic addition/subtraction
-- HAVING filters after aggregation (can't use WHERE with SUM)
-- GROUP BY name: Safe because name is unique per problem statement
-- Alternative: Could GROUP BY u.account, u.name for best practice
-- Balance calculation: Natural handling of debits and credits