/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Top Travellers                                     ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: LEFT JOIN, COALESCE, SUM, ORDER BY Multiple          ║
║  Date Solved: January 23, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Report the distance traveled by each user.
- Order by travelled_distance DESC (highest first)
- If same distance, order by name ASC (alphabetical)
- Users with no rides should show 0 distance

Example:
Elvis: 50 + 400 = 450
Lee: 100 + 120 + 230 = 450
Donald: No rides = 0

Output: Elvis first (alphabetically before Lee)

APPROACH:
---------
Step 1: LEFT JOIN Users with Rides
        Includes all users, even those without rides
        
Step 2: COALESCE(distance, 0) handles NULL for users without rides
        
Step 3: SUM aggregates total distance per user
        
Step 4: GROUP BY user to calculate totals
        
Step 5: ORDER BY distance DESC, then name ASC for ties

*/

-- SOLUTION:
-- =========

SELECT
    u.name,
    SUM(COALESCE(r.distance, 0)) AS travelled_distance
FROM Users u
LEFT JOIN Rides r
    ON u.id = r.user_id
GROUP BY u.id, u.name
ORDER BY travelled_distance DESC, u.name ASC;


-- NOTES:
-- ------
-- LEFT JOIN: Preserves all users (including those without rides)
-- COALESCE: Replaces NULL with 0 for users with no rides
-- SUM(COALESCE()): Aggregates distances, treating NULL as 0
-- Multiple ORDER BY: Primary sort DESC, secondary sort ASC
-- GROUP BY both id and name: Best practice for consistency
-- Alternative: ISNULL(r.distance, 0) in SQL Server