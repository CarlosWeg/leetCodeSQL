-- 3580. Find Consistently Improving Employees
-- https://leetcode.com/problems/find-consistently-improving-employees/
-- Write your PostgreSQL query statement below
WITH

reviews_row AS (

    SELECT employee_id,
           rating,
           LAG(rating) OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS nex,
           LEAD(rating) OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS prev,
           ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY review_date DESC) AS pos
      FROM performance_reviews

)

SELECT e.employee_id,
       e.name,
       r.nex - r.prev AS improvement_score
  FROM employees e
 INNER JOIN reviews_row r
    ON r.employee_id = e.employee_id
 WHERE r.pos = 2
   AND r.nex IS NOT NULL
   AND (r.rating > r.prev AND r.nex > r.rating)
 ORDER BY improvement_score DESC, e.name ASC
