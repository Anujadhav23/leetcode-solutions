/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Project Employees I                                ║                                     ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: JOIN, GROUP BY, AVG, ROUND, CAST/DECIMAL             ║
║  Date Solved: January 19, 2026                               ║
╚══════════════════════════════════════════════════════════════╗

PROBLEM DESCRIPTION:
--------------------
Calculate the average experience years of all employees for each 
project, rounded to 2 decimal places.

Example:
Project 1: Employees (Khaled=3, Ali=2, John=1)
           Average = (3+2+1)/3 = 2.00

Project 2: Employees (Khaled=3, Doe=2)
           Average = (3+2)/2 = 2.50

APPROACH:
---------
Step 1: JOIN Project and Employee tables on employee_id
Step 2: GROUP BY project_id to aggregate employees per project
Step 3: Calculate AVG(experience_years) for each project
Step 4: CAST to DECIMAL(10,2) to ensure 2 decimal places

*/

-- SOLUTION:
-- =========

SELECT
    p.project_id,
    CAST(AVG(CAST(e.experience_years AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS average_years
FROM Project p
INNER JOIN Employee e
ON p.employee_id = e.employee_id
GROUP BY p.project_id;


-- NOTES:
-- ------
-- CAST to DECIMAL: Ensures precise decimal arithmetic
-- DECIMAL(10,2): Max 10 digits total, 2 after decimal point
-- Double CAST: Inner for calculation, outer for result format
-- AVG() automatically handles division by count
-- Alternative: ROUND(AVG(experience_years), 2) in some SQL dialects