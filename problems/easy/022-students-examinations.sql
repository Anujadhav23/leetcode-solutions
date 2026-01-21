/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Students and Examinations                          ║                                     ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: CROSS JOIN, LEFT JOIN, COUNT, GROUP BY               ║
║  Date Solved: January 21, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find the number of times each student attended each exam.
Result must show ALL students and ALL subjects combinations,
even if attendance is 0.

Key Challenge: Must show students who never attended any exam
and all subject combinations for every student.

APPROACH:
---------
Step 1: CROSS JOIN Students × Subjects 
        Creates all possible (student, subject) combinations
        
Step 2: LEFT JOIN with Examinations
        Matches actual exam attendance records
        
Step 3: COUNT(e.subject_name) counts exam attendance
        NULL values from LEFT JOIN are not counted (gives 0)
        
Step 4: GROUP BY student_id, student_name, subject_name
        Aggregates attendance per combination

*/

-- SOLUTION:
-- =========

SELECT
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
    AND sub.subject_name = e.subject_name
GROUP BY
    s.student_id,
    s.student_name,
    sub.subject_name
ORDER BY
    s.student_id,
    sub.subject_name;


-- NOTES:
-- ------
-- CROSS JOIN: Cartesian product (every student × every subject)
-- Multiple JOIN conditions: AND in ON clause for compound matching
-- COUNT(column): Counts non-NULL values only (perfect for LEFT JOIN)
-- COUNT(*) would count all rows (wrong for this problem)
-- Alternative: Use COALESCE with COUNT(*) but current solution is cleaner