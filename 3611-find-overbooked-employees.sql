-- 3611. Find Overbooked Employees
-- https://leetcode.com/problems/find-overbooked-employees/description/
-- Write your PostgreSQL query statement below

WITH meets_per_week AS(

    SELECT employee_id,
           DATE_TRUNC('week', meeting_date) AS week,
           SUM(duration_hours) AS duration_week
      FROM meetings
     GROUP BY employee_id,
              week
    HAVING SUM(duration_hours) > 20
)

SELECT e.employee_id,
       e.employee_name,
       e.department,
       COUNT(m.employee_id) AS meeting_heavy_weeks
  FROM employees e
 INNER JOIN meets_per_week m
    ON e.employee_id = m.employee_id
 GROUP BY e.employee_id, e.employee_name, e.department
HAVING COUNT(m.employee_id) > 1
 ORDER BY meeting_heavy_weeks DESC, e.employee_name ASC
