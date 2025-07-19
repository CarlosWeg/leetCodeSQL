-- 601. Human Traffic of Stadium
-- https://leetcode.com/problems/human-traffic-of-stadium/description/
-- Write your PostgreSQL query statement below
WITH

sorted_ids AS (
    SELECT id,
           visit_date,
           people,
           LAG(id) OVER(ORDER BY id ASC) AS prev,
           LEAD(id) OVER(ORDER BY id ASC) AS late
      FROM stadium
     WHERE people >= 100
),

inner_ids AS (

    SELECT id
      FROM sorted_ids
     WHERE prev = id - 1
       AND late = id + 1

)

SELECT id,
       visit_date,
       people
  FROM sorted_ids s
 WHERE EXISTS (
    SELECT 1
      FROM inner_ids i
     WHERE s.id IN (i.id, i.id + 1, i.id -1)
)
 ORDER BY visit_date ASC
