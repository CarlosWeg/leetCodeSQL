-- 1321. Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/description/
-- Write your PostgreSQL query statement below
WITH

valid_dates AS (

    SELECT DISTINCT
           c.visited_on
      FROM customer c
     WHERE EXISTS (
        SELECT 1
           FROM customer c2
          WHERE c.visited_on - INTERVAL '6 days' = c2.visited_on 
    )

)

SELECT d.visited_on,
       total.amount,
       ROUND(total.amount / 7.0, 2) AS average_amount
  FROM valid_dates d
 INNER JOIN LATERAL(

    SELECT SUM(amount) AS amount
      FROM customer c
     WHERE c.visited_on >= d.visited_on - INTERVAL '6 days'
       AND c.visited_on <= d.visited_on

) total ON TRUE
 ORDER BY d.visited_on
