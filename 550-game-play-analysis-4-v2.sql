-- 550. Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/description/
-- Write your PostgreSQL query statement below
SELECT ROUND(
            COUNT(DISTINCT a2.player_id)::NUMERIC /
            COUNT(DISTINCT a.player_id)::NUMERIC
       , 2) AS fraction
  FROM (SELECT player_id,
               MIN(event_date) AS first_login
          FROM activity
         GROUP BY player_id) a
 LEFT JOIN activity a2
   ON (a.first_login + INTERVAL '1 day') = a2.event_date
  AND a.player_id = a2.player_id
