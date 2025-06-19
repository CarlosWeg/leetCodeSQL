-- 185. Department Top Three Salaries
-- https://leetcode.com/problems/department-top-three-salaries/description/
-- Write your PostgreSQL query statement below

WITH rank_salario_departamento AS (

    SELECT id AS employeeid,
           DENSE_RANK() OVER(PARTITION BY departmentid ORDER BY salary DESC)AS rank
      FROM employee

)

SELECT d.name AS department,
       e.name AS employee,
       e.salary AS salary
  FROM employee e
 INNER JOIN department d
    ON e.departmentid = d.id
 INNER JOIN rank_salario_departamento rs
    ON rs.employeeid = e.id
 WHERE rs.rank <= 3
