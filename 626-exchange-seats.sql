-- 626. Exchange Seats
-- https://leetcode.com/problems/exchange-seats/description/
-- Write your PostgreSQL query statement below
SELECT CASE
           WHEN s.id % 2 = 0 THEN s.id - 1
           WHEN (s.id % 2 = 1) AND (s.id != m.id) THEN s.id + 1
           ELSE s.id
       END AS id,
       s.student
  FROM seat s
 CROSS JOIN (SELECT max(id) AS id FROM seat) m
 ORDER BY id ASC
