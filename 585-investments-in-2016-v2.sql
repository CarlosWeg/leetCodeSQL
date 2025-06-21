-- 585. Investments in 2016
-- https://leetcode.com/problems/investments-in-2016/description/
SELECT ROUND(SUM(i.tiv_2016)::NUMERIC, 2) AS tiv_2016
  FROM insurance i
 WHERE EXISTS (
         SELECT 1
           FROM insurance i2
          WHERE i.tiv_2015 = i2.tiv_2015
          GROUP BY i2.tiv_2015
         HAVING COUNT(*) > 1
       )
   AND NOT EXISTS (
         SELECT 1
           FROM insurance i2
          WHERE i.lat = i2.lat
            AND i.lon = i2.lon
          GROUP BY i2.lat, i2.lon
         HAVING COUNT(*) > 1
       );
