-- 3497. Analyze Subscription Conversion 
-- https://leetcode.com/problems/analyze-subscription-conversion/description/
-- Write your PostgreSQL query statement below

SELECT user_id,
       ROUND(
        AVG(activity_duration) FILTER (WHERE activity_type = 'free_trial')
       , 2) AS trial_avg_duration,
       ROUND(
        AVG(activity_duration) FILTER (WHERE activity_type = 'paid')
       , 2) AS paid_avg_duration
  FROM useractivity u
 WHERE EXISTS (
    SELECT 1
      FROM useractivity u2
     WHERE u.user_id = u2.user_id
       AND u2.activity_type = 'paid'
 )
 GROUP BY user_id
 ORDER BY user_id ASC
