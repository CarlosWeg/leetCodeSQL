-- 511. Game Play Analysis I
-- https://leetcode.com/problems/game-play-analysis-i/description/

-- V1 com MIN : Mais simples e performática
SELECT player_id,
       MIN(event_date) AS first_login
  FROM activity
 GROUP BY player_id;

-- V2 com ROW_NUMBER  – ideal para quando queremos mais colunas ou flexibilizar a condição no futuro
WITH primeiro_login AS (
    SELECT player_id,
           event_date,
           ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS ordem
      FROM activity
)
SELECT player_id, event_date AS first_login
  FROM primeiro_login
 WHERE ordem = 1;

-- V3 com LATERAL - ótima para acessar linha completa
SELECT a.player_id,
       p.data AS first_login
  FROM (SELECT DISTINCT player_id FROM activity) a
 INNER JOIN LATERAL (
     SELECT event_date AS data
       FROM activity a2
      WHERE a2.player_id = a.player_id
      ORDER BY event_date
      LIMIT 1
 ) p ON true;
