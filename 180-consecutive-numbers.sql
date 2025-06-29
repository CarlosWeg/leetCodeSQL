-- 180. Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/
-- Write your PostgreSQL query statement below

WITH numeros_consecutivos AS (

    SELECT num,
           LAG(num) OVER(ORDER BY id) AS anterior,
           LEAD(num) OVER(ORDER BY id) AS posterior
     FROM logs
     
)

SELECT DISTINCT
       num AS ConsecutiveNums
  FROM numeros_consecutivos
 WHERE num = anterior
   AND num = posterior
