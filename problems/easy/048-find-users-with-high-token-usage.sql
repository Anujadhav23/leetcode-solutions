/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Find Users with High Token Usage                   ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: GROUP BY, HAVING, Aggregation                        ║
║  Date Solved: February 5, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Table: prompts

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| prompt      | varchar |
| tokens      | int     |
+-------------+---------+
(user_id, prompt) is the primary key (unique value) for this table.

Each row represents a prompt submitted by a user to an AI system along 
with the number of tokens consumed.

Write a solution to analyze AI prompt usage patterns based on the 
following requirements:

1. For each user, calculate the total number of prompts they have submitted.
2. For each user, calculate the average tokens used per prompt 
   (Rounded to 2 decimal places).
3. Only include users who have submitted at least 3 prompts.
4. Only include users who have submitted at least one prompt with tokens 
   greater than their own average token usage.
5. Return the result table ordered by average tokens in descending order, 
   and then by user_id in ascending order.

APPROACH:
---------
1. Use GROUP BY to aggregate data by user_id
2. Use COUNT to get the total number of prompts per user
3. Use AVG with CAST and ROUND to calculate average tokens rounded to 2 decimals
4. Use HAVING clause with multiple conditions:
   - COUNT(user_id) >= 3 to filter users with at least 3 prompts
   - AVG(tokens) < MAX(tokens) to ensure at least one prompt exceeds average
5. Order by avg_tokens DESC then user_id ASC

*/

-- SOLUTION:
-- =========

SELECT
    user_id,
    COUNT(user_id) AS prompt_count,
    ROUND(AVG(CAST(tokens AS DECIMAL(10, 2))), 2) AS avg_tokens
FROM prompts
GROUP BY user_id
HAVING COUNT(user_id) >= 3
AND AVG(tokens) < MAX(tokens)
ORDER BY avg_tokens DESC, user_id ASC;


-- NOTES:
-- ------
-- The condition AVG(tokens) < MAX(tokens) ensures that at least one prompt
-- has tokens greater than the average, which satisfies the requirement.
-- CAST to DECIMAL ensures proper rounding for the average calculation.
-- Multiple ORDER BY columns provide stable, predictable result ordering.
