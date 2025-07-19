-- 1934. Confirmation Rate
-- https://leetcode.com/problems/confirmation-rate/description/
-- Write your PostgreSQL query statement below
SELECT s.user_id,
       COALESCE(
        ROUND(
            COUNT(c.user_id) FILTER (WHERE action = 'confirmed')::NUMERIC /
            NULLIF(COUNT(c.user_id), 0)::NUMERIC
        , 2)
       ,0 ) AS confirmation_rate
  FROM signups s
  LEFT JOIN confirmations c
 USING (user_id)
 GROUP BY s.user_id
