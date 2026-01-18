/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Product Sales Analysis I                           ║                                  ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: INNER JOIN, Foreign Key Relationships                ║
║  Date Solved: January 18, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Sales
+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+

Table: Product
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+

Write a solution to report the product_name, year, and price 
for each sale_id in the Sales table.

Example:
Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Output: 
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+

APPROACH:
---------
Used INNER JOIN to combine Sales and Product tables:
- Join condition: product_id (foreign key relationship)
- INNER JOIN ensures only matching records from both tables
- Select product_name from Product table
- Select year and price from Sales table

*/

-- SOLUTION:
-- =========

SELECT
    p.product_name,
    s.year,
    s.price
FROM Sales s
INNER JOIN Product p
ON s.product_id = p.product_id;


-- NOTES:
-- ------
-- INNER JOIN: Returns only matching rows from both tables
-- Foreign Key: product_id links Sales to Product table
-- Table aliases (s, p): Makes query more readable and concise
-- No WHERE needed: All sales have matching products
-- Alternative: Can use implicit join (FROM Sales s, Product p WHERE...)