/*
╔══════════════════════════════════════════════════════════════╗
║  Problem: Find Products with Valid Serial Numbers            ║
║  Problem Number: 3465                                        ║
║  Source: LeetCode                                            ║
║  Difficulty: Easy                                            ║
║  Topic: LIKE Pattern Matching, COLLATE, Case Sensitivity     ║
║  Date Solved: February 3, 2026                               ║
╚══════════════════════════════════════════════════════════════╝

PROBLEM DESCRIPTION:
--------------------
Find products with valid serial numbers in description.

Valid serial format: SN[4 digits]-[4 digits]
Rules:
1. Starts with SN (case-sensitive)
2. Exactly 4 digits
3. Hyphen (-)
4. Exactly 4 digits
5. Must be standalone (not part of longer number)

Examples:
Valid: SN1234-5678
Invalid: SN1234-56789 (5 digits after hyphen)
Invalid: SN1234-5678 if preceded by letter/digit

APPROACH:
---------
Three LIKE conditions:

Condition 1: Pattern matches SN[4 digits]-[4 digits]
- COLLATE for case-sensitive matching

Condition 2: NOT followed by extra digit
- Prevents SN1234-56789

Condition 3: NOT preceded by alphanumeric
- Ensures SN is start of serial, not part of text

All combined with AND.

*/

-- SOLUTION:
-- =========

SELECT product_id, product_name, description
FROM products
WHERE 
    -- Match pattern SN[4 digits]-[4 digits]
    description COLLATE Latin1_General_CS_AS 
        LIKE '%SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]%'
    
    -- Ensure no 5th digit after hyphen
    AND description NOT LIKE '%SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]%'
    
    -- Ensure SN not preceded by alphanumeric
    AND description NOT LIKE '%[a-zA-Z0-9]SN[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]%'
ORDER BY product_id;


-- NOTES:
-- ------
-- COLLATE Latin1_General_CS_AS: Case-sensitive comparison
-- [0-9]: Matches single digit (0-9)
-- Repeated [0-9]: Exactly 4 times for 4 digits
-- NOT LIKE: Excludes invalid patterns
-- Word boundary check: Third condition ensures standalone serial
-- Pattern matching: LIKE with wildcards and character classes
-- Alternative: Use PATINDEX or regular expressions (if supported)
