-- 570. Managers with at Least 5 Direct Reports
-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/
-- Write your PostgreSQL query statement below
SELECT m.name
  FROM employee m
 INNER JOIN employee r
    ON m.id = r.managerid
 GROUP BY m.id, m.name
HAVING COUNT(r.*) >= 5
