-- 1204. Last Person to Fit in the Bus
-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/submissions/1695281907/
-- Write your PostgreSQL query statement below

WITH name_total_weight AS (
 
    SELECT person_name,
           turn,
           SUM(weight) OVER(ORDER BY turn ASC) AS total_weight
      FROM queue

)

SELECT person_name
  FROM name_total_weight
 WHERE total_weight <= 1000
 ORDER BY turn DESC
 LIMIT 1
