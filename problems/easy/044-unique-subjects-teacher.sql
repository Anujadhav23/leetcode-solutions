/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Number of Unique Subjects Taught by Each Teacher  ║
║  Problem Number: 2356                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: COUNT DISTINCT, GROUP BY                             ║
║  Date Solved: February 3, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Calculate the number of unique subjects each teacher teaches.

Same teacher can teach same subject in different departments
→ Count subject only once per teacher.

Example:
Teacher 1:
- Subject 2 in dept 3 and dept 4 → Count as 1 subject
- Subject 3 in dept 3 → Count as 1 subject
- Total: 2 unique subjects

Teacher 2:
- Subjects 1, 2, 3, 4 → Total: 4 unique subjects

APPROACH:
---------
Simple aggregation with DISTINCT:

Step 1: GROUP BY teacher_id
Step 2: COUNT(DISTINCT subject_id) counts unique subjects
        DISTINCT removes duplicate subjects across departments

*/

-- SOLUTION:
-- =========

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;


-- NOTES:
-- ------
-- COUNT(DISTINCT): Counts unique values only
-- Different from COUNT(*): Would count all rows including duplicates
-- GROUP BY: Aggregates per teacher
-- Simple query: No joins or complex conditions needed
-- Primary key (subject_id, dept_id): Ensures no exact duplicates
