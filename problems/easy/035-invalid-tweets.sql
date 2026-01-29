/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Invalid Tweets                                     ║
║  Problem Number: 1683                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: LEN/LENGTH, String Functions, WHERE                  ║
║  Date Solved: January 29, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find IDs of invalid tweets.
Tweet is invalid if content length > 15 characters.

Example:
"Let us Code" → 11 chars → Valid
"More than fifteen chars are here!" → 33 chars → Invalid

APPROACH:
---------
Simple filter with string length function:
WHERE LEN(content) > 15

*/

-- SOLUTION:
-- =========

SELECT
    tweet_id
FROM Tweets
WHERE LEN(content) > 15;


-- NOTES:
-- ------
-- LEN(): SQL Server function for string length
-- Alternative: LENGTH() in MySQL/PostgreSQL
-- CHAR_LENGTH() in some databases
-- Simple WHERE filter: No aggregation needed
-- Character count includes spaces and special characters