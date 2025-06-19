-- 196. Delete Duplicate Emails
-- https://leetcode.com/problems/delete-duplicate-emails/description/
DELETE
  FROM person
 WHERE id NOT IN (
    SELECT MIN(id)
      FROM person p
     GROUP BY email
 );
