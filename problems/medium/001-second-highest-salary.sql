/* 176. Second Highest Salary
 * 
 * Problem: Find the second highest distinct salary from the Employee table.
 * If there is no second highest salary, return null.
 * 
 * Approach:
 * 1. Find the maximum salary (highest salary)
 * 2. Find the maximum salary that is less than the highest salary
 * 3. If no such salary exists, NULL will be returned automatically
 * 4. Use NULL handling for edge cases
 * 
 * Time Complexity: O(n) - two table scans
 * Space Complexity: O(1)
 */

SELECT 
    MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

/* Alternative approach using OFFSET/LIMIT (works in some databases):
SELECT DISTINCT salary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;
*/

/* Alternative approach using dense_rank window function (MySQL 8.0+, PostgreSQL):
SELECT MAX(CASE WHEN rnk = 2 THEN salary END) AS SecondHighestSalary
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) AS ranked
WHERE rnk = 2;
*/
