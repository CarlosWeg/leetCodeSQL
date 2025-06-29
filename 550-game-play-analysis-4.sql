-- 550. Game Play Analysis IV
-- https://leetcode.com/problems/game-play-analysis-iv/description/
WITH login_jogadores AS (

    SELECT player_id,
           event_date,
           ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS ordem
     FROM activity a

)

SELECT ROUND(
       COUNT(DISTINCT v.player_id):: NUMERIC /
       COUNT(DISTINCT l.player_id):: NUMERIC
       , 2) AS fraction
  FROM login_jogadores l
  LEFT JOIN login_jogadores v
    ON l.player_id = v.player_id
   AND (l.ordem = 1 AND v.ordem = 2)
   AND l.event_date + INTERVAL '1 day' = v.event_date
