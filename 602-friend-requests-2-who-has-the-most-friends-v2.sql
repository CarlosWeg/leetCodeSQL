-- 602. Friend Requests II: Who Has the Most Friends
-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/
-- Write your PostgreSQL query statement below
WITH

friends_request AS (
 
    SELECT requester_id AS id,
           COUNT(*) AS nmb
      FROM requestaccepted
     GROUP BY requester_id

),

friend_accept AS (

    SELECT accepter_id AS id,
           COUNT(*) AS nmb
      FROM requestaccepted
     GROUP BY accepter_id

),

friends_union AS (

    SELECT id, nmb FROM friends_request
    UNION ALL
    SELECT id, nmb FROM friend_accept
    
),

friends_rank AS(

    SELECT id,
           SUM(nmb) AS num,
           RANK() OVER(ORDER BY SUM(nmb) DESC) AS rank
      FROM friends_union
     GROUP BY id

)

SELECT id,
       num
  FROM friends_rank
 WHERE rank = 1
