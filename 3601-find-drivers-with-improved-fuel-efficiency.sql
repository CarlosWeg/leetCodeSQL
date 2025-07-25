-- 3601. Find Drivers with Improved Fuel Efficiency
-- https://leetcode.com/problems/find-drivers-with-improved-fuel-efficiency/description/
-- Write your PostgreSQL query statement below
SELECT driver_id,
       driver_name,
       ROUND(first_half_avg, 2) AS first_half_avg,
       ROUND(second_half_avg, 2) AS second_half_avg,
       ROUND(second_half_avg - first_half_avg, 2) AS efficiency_improvement
  FROM(
SELECT d.driver_id,
       d.driver_name,
       AVG(t.distance_km / t.fuel_consumed)
          FILTER(WHERE EXTRACT(MONTH FROM t.trip_date) BETWEEN 1 AND 6)
       AS first_half_avg,
       AVG(t.distance_km / t.fuel_consumed)
          FILTER(WHERE EXTRACT(MONTH FROM t.trip_date) BETWEEN 7 AND 12)
       AS second_half_avg
  FROM drivers d
 INNER JOIN trips t
    ON t.driver_id = d.driver_id
 GROUP BY d.driver_id,
          d.driver_name
  )o
 WHERE (first_half_avg IS NOT NULL AND second_half_avg IS NOT NULL)
   AND second_half_avg > first_half_avg
 ORDER BY efficiency_improvement DESC,
          driver_name ASC
