-- 180. Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/
-- Write your PostgreSQL query statement below

SELECT DISTINCT
       l.num AS "ConsecutiveNums"
  FROM logs l
 INNER JOIN logs l2
    ON l.id = (l2.id - 1)
   AND l.num = (l2.num)
 INNER JOIN logs l3
    ON l.id = (l3.id + 1)
   AND l.num = (l3.num)
