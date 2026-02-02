/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Calculate Special Bonus                            ║
║  Problem Number: 1873                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: CASE, Modulo, LIKE, String Pattern Matching          ║
║  Date Solved: February 1, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Calculate bonus for each employee:
- Bonus = 100% of salary IF:
  * employee_id is ODD number AND
  * name does NOT start with 'M'
- Bonus = 0 otherwise

Example:
Employee 2: Even ID → Bonus = 0
Employee 3: Odd ID but name = "Michael" (starts with M) → Bonus = 0
Employee 7: Odd ID and name = "Addilyn" (no M) → Bonus = 7400
Employee 9: Odd ID and name = "Kannon" (no M) → Bonus = 7700

APPROACH:
---------
Use CASE statement with two conditions:

Condition 1: employee_id % 2 != 0 (check if ODD)
Condition 2: name NOT LIKE 'M%' (doesn't start with M)

If BOTH true: bonus = salary
Else: bonus = 0

Order results by employee_id.

*/

-- SOLUTION:
-- =========

SELECT
    employee_id,
    CASE
        WHEN employee_id % 2 != 0 
             AND name NOT LIKE 'M%' 
        THEN salary
        ELSE 0
    END AS bonus
FROM Employees
ORDER BY employee_id;


-- NOTES:
-- ------
-- % (Modulo): Returns remainder of division
-- % 2 != 0: Tests for odd numbers (remainder is 1)
-- NOT LIKE 'M%': Checks if name doesn't start with M
-- % wildcard: Matches any characters after M
-- CASE with AND: Both conditions must be true
-- Alternative: % 2 = 1 also checks for odd numbers
-- Pattern matching is case-sensitive in some databases