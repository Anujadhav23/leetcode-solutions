/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Find Users With Valid Emails                       ║
║  Problem Number: [Email Validation Problem]                  ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: String Functions, Pattern Matching, LIKE, PATINDEX   ║
║  Date Solved: February 3, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find users with valid email addresses.

Valid email rules:
1. Exactly ONE @ symbol
2. Ends with .com
3. Prefix (before @): Only letters, digits, underscore
4. Domain (between @ and .com): Only letters

APPROACH:
---------
Four validation checks:

Check 1: Exactly one @ symbol
- Count @ occurrences using REPLACE and LEN

Check 2: Ends with .com
- Use LIKE '%.com'

Check 3: Prefix valid characters
- PATINDEX checks for invalid chars before @
- LEFT extracts prefix part

Check 4: Domain valid characters  
- SUBSTRING extracts domain part
- PATINDEX checks for non-letters

All checks combined with AND.

*/

-- SOLUTION:
-- =========

SELECT user_id, email
FROM Users
WHERE 
    -- Exactly one @ symbol
    LEN(email) - LEN(REPLACE(email, '@', '')) = 1
    
    -- Ends with .com
    AND email LIKE '%.com'
    
    -- Prefix: only letters, digits, underscore
    AND PATINDEX('%[^A-Za-z0-9_]%', LEFT(email, CHARINDEX('@', email) - 1)) = 0
    
    -- Domain: only letters
    AND PATINDEX('%[^A-Za-z]%', 
        SUBSTRING(
            email,
            CHARINDEX('@', email) + 1,
            LEN(email) - CHARINDEX('@', email) - 4
        )
    ) = 0
ORDER BY user_id;


-- NOTES:
-- ------
-- REPLACE: Removes all @ symbols to count them
-- LEN difference: Counts occurrences of character
-- PATINDEX: Finds position of pattern (0 = not found = valid)
-- [^...]: Negation pattern (matches anything NOT in brackets)
-- CHARINDEX: Finds position of character
-- LEFT/SUBSTRING: Extracts parts of string
-- Complex validation: Multiple conditions ensure strict format
