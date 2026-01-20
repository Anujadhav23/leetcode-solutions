/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Article Views I                                    ║                               ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: DISTINCT, WHERE, Self-Viewing                        ║
║  Date Solved: January 20, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find all authors that viewed at least one of their own articles.
(author_id = viewer_id means author viewed their own article)

Example:
+------------+-----------+-----------+
| article_id | author_id | viewer_id |
+------------+-----------+-----------+
| 2          | 7         | 7         | ← Author 7 viewed own article
| 3          | 4         | 4         | ← Author 4 viewed own article
| 3          | 4         | 4         | ← Duplicate (same author)
+------------+-----------+-----------+

Output: Authors 4 and 7 (sorted, no duplicates)

APPROACH:
---------
Step 1: Filter rows where author_id = viewer_id
Step 2: Use DISTINCT to remove duplicate author IDs
Step 3: Rename column to 'id' as required
(Note: No ORDER BY needed if not required, but can add for sorting)

*/

-- SOLUTION:
-- =========

SELECT
    DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id;


-- NOTES:
-- ------
-- DISTINCT: Removes duplicate values (author may view multiple times)
-- Self-referencing: author_id = viewer_id finds self-views
-- Column alias: AS id renames output column
-- ORDER BY: Sorts results in ascending order
-- Simple filter: No JOIN needed, single table operation