-- 602. Friend Requests II: Who Has the Most Friends
-- https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/description/
-- Write your PostgreSQL query statement below

SELECT id,
       num
  FROM(

    SELECT id,
           COUNT(*) AS num,
           RANK() OVER(ORDER BY COUNT(*) DESC) AS rank
      FROM(
        SELECT requester_id AS id FROM RequestAccepted
        UNION ALL 
        SELECT accepter_id AS id FROM RequestAccepted
    )
    GROUP BY id

)
 WHERE rank = 1
