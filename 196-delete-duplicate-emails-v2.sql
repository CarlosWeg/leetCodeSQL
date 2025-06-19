-- 196. Delete Duplicate Emails
-- https://leetcode.com/problems/delete-duplicate-emails/description/
WITH email_duplicado AS(
    SELECT id,
           ROW_NUMBER() OVER(PARTITION BY email ORDER BY id ASC) AS num
      FROM person 
)

DELETE
  FROM person p
 WHERE id IN (SELECT id
                FROM email_duplicado
               WHERE num > 1)
