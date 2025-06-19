-- 181. Employees Earning More Than Their Managers
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/description/
SELECT e.name AS employee
  FROM employee e
 WHERE EXISTS (SELECT 1
                 FROM employee m
                WHERE e.managerid = m.id
                  AND e.salary > m.salary)
