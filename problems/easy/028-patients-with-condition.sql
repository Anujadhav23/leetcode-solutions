/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Patients With a Condition                          ║                                     
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: LIKE, String Pattern Matching, OR Operator           ║
║  Date Solved: January 25, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find patients who have Type I Diabetes.
Type I Diabetes code always starts with DIAB1 prefix.

Conditions field contains space-separated codes.

Examples:
"DIAB100 MYOP"   → Starts with DIAB1 ✓
"ACNE DIAB100"   → Contains DIAB1 after space ✓
"DIAB201"        → Does NOT start with DIAB1 ✗
"MYDIAB100"      → DIAB1 not at word boundary ✗

APPROACH:
---------
Use LIKE with wildcards to match two patterns:

Pattern 1: 'DIAB1%'
- Matches codes starting with DIAB1 at beginning of string
- Example: "DIAB100 MYOP"

Pattern 2: '% DIAB1%'
- Matches codes with DIAB1 after a space
- Space before DIAB1 ensures word boundary
- Example: "ACNE DIAB100"

OR operator: Includes rows matching either pattern

*/

-- SOLUTION:
-- =========

SELECT
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'        -- Starts with DIAB1
   OR conditions LIKE '% DIAB1%';     -- DIAB1 after space


-- NOTES:
-- ------
-- LIKE operator: Pattern matching with wildcards
-- %: Wildcard matching any sequence of characters
-- Space before DIAB1: Ensures word boundary (not part of another code)
-- OR logic: Matches start of string OR after space
-- Edge case: Empty conditions will not match (correct behavior)
-- Alternative: Use REGEXP/REGEX for more complex patterns
-- Warning: Doesn't handle edge cases like trailing spaces perfectly