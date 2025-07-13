--1321. Restaurant Growth
-- https://leetcode.com/problems/restaurant-growth/description/

WITH 

daily_total AS (

    SELECT visited_on,
           SUM(amount) AS amount
      FROM customer
     GROUP BY visited_on
),

seven_days_window AS (

    SELECT visited_on,
           SUM(amount) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS sum_amt,
           COUNT(*) OVER (ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS count_days
      FROM daily_total
)

SELECT visited_on,
       sum_amt AS amount,
       ROUND(sum_amt / count_days::NUMERIC, 2) AS average_amount
  FROM seven_days_window
 WHERE count_days = 7
