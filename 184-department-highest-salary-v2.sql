-- 184. Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/description/
WITH salario_por_departamento AS (
    SELECT e.id,
           e.departmentid,
           RANK() OVER(PARTITION BY e.departmentid ORDER BY e.salary DESC) AS rank
      FROM employee e
)

SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
  FROM employee e
 INNER JOIN department d
    ON e.departmentid = d.id
 INNER JOIN salario_por_departamento sd
    ON e.id = sd.id 
   AND e.departmentid = sd.departmentid
 WHERE sd.rank = 1
