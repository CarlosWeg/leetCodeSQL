-- 262. Trips and Users
-- https://leetcode.com/problems/trips-and-users/
-- Write your PostgreSQL query statement below
SELECT t.request_at AS "Day",
       COALESCE(ROUND(
            (COUNT(t.id) FILTER (WHERE STATUS LIKE 'cancelled%'))::NUMERIC /
            NULLIF((COUNT(t.id))::NUMERIC, 0)
       , 2), 0) AS "Cancellation Rate"
  FROM trips t
 INNER JOIN users d
    ON t.driver_id  = d.users_id
 INNER JOIN users c
    ON t.client_id = c.users_id
 WHERE c.banned = 'No'
   AND d.banned = 'No'
   AND t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
 GROUP BY t.request_at
