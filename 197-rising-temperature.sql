-- 197. Rising Temperature
-- Link:  https://leetcode.com/problems/rising-temperature
SELECT w.id
  FROM weather w
 INNER JOIN weather w2
    ON w.recorddate = (w2.recorddate + INTERVAL '1 day')
   AND w.temperature > w2.temperature
