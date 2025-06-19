-- 184. Department Highest Salary
-- https://leetcode.com/problems/department-highest-salary/description/
-- Solução 1
WITH maior_salario_departamento AS(
    SELECT departmentid,
           MAX(salary) AS max_salary
      FROM employee
     GROUP BY departmentid
)

SELECT d.name AS department,
       e.name AS employee,
       e.salary AS salary
  FROM employee e
 INNER JOIN department d 
    ON e.departmentid = d.id
 INNER JOIN maior_salario_departamento md
    ON md.departmentid = e.departmentid
 WHERE e.salary = md.max_salary
