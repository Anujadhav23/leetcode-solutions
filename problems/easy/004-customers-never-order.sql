/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Customers Who Never Order                          ║                                       ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: SQL LEFT JOIN, NULL Handling                         ║
║  Date Solved: January 8, 2026                                ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Customers
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+

Table: Orders
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| customerId  | int  |
+-------------+------+

Write a solution to find all customers who never order anything.
Return the result table in any order.

Example:
Input: 
Customers table:
+----+-------+
| id | name  |
+----+-------+
| 1  | Joe   |
| 2  | Henry |
| 3  | Sam   |
| 4  | Max   |
+----+-------+

Orders table:
+----+------------+
| id | customerId |
+----+------------+
| 1  | 3          |
| 2  | 1          |
+----+------------+

Output: 
+-----------+
| Customers |
+-----------+
| Henry     |
| Max       |
+-----------+

APPROACH:
---------
Used LEFT JOIN to include all customers and their orders.
Filtered for customers where customerId IS NULL in Orders table,
indicating they have never placed an order.

*/

-- SOLUTION:
-- =========

SELECT
    c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id = o.customerId
WHERE o.customerId IS NULL;


-- NOTES:
-- ------
-- LEFT JOIN keeps all customers even without orders
-- NULL in joined table means no matching record exists
-- Alternative: Use NOT IN or NOT EXISTS subquery