/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Combine Two Tables                                 ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: SQL Joins                                            ║
║  Date Solved: January 7, 2026                                ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+

Table: Address
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+

Write a solution to report the first name, last name, city, and state 
of each person in the Person table. If the address of a personId is not 
present in the Address table, report null instead.

APPROACH:
---------
Used LEFT JOIN to include all persons from Person table and their 
corresponding addresses from Address table. If no address exists, 
NULL values are returned for city and state.

*/

-- SOLUTION:
-- =========

SELECT
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
ON p.personId = a.personId;


-- NOTES:
-- ------
-- LEFT JOIN ensures all persons are included even without addresses
-- Returns NULL for city and state when no matching address exists