-- 182. Duplicate Emails
-- https://leetcode.com/problems/duplicate-emails/description/
WITH emails_duplicados AS (

    SELECT email,
           COUNT(email) OVER(PARTITION BY email) AS qntd
      FROM person

)

SELECT email
  FROM emails_duplicados
 WHERE qntd > 1
 GROUP BY email
