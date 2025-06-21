-- 585. Investments in 2016
-- https://leetcode.com/problems/investments-in-2016/description/
SELECT ROUND(SUM(i.tiv_2016)::NUMERIC, 2) AS tiv_2016
  FROM insurance i
 WHERE i.tiv_2015 IN (SELECT i2.tiv_2015 
                        FROM insurance i2
                       GROUP BY i2.tiv_2015
                      HAVING COUNT(*) > 1)
   AND (i.lat,i.lon) IN (SELECT i2.lat,i2.lon
                           FROM insurance i2
                          GROUP BY i2.lat,i2.lon
                         HAVING COUNT(*) = 1)
