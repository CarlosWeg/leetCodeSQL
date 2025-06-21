-- 176. Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/description/
SELECT (

    WITH rank_salarios AS (

        SELECT salary,
               DENSE_RANK() OVER(ORDER BY salary DESC) AS rank
          FROM employee

    )

    SELECT salary
      FROM rank_salarios
     WHERE rank = 2
     LIMIT 1

) AS SecondHighestSalary
