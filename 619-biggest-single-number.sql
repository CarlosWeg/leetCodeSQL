-- 619. Biggest Single Number
-- https://leetcode.com/problems/biggest-single-number/description/
-- Write your PostgreSQL query statement below

WITH single_number AS (

    SELECT num
      FROM MyNumbers
     GROUP BY num
    HAVING COUNT(*) = 1

)

SELECT max(num) AS num
  FROM single_number
