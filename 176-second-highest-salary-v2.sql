-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/description/
SELECT (

    SELECT DISTINCT
           salary
      FROM employee
     ORDER BY salary DESC
    OFFSET 1
     LIMIT 1

) AS SecondHighestSalary
