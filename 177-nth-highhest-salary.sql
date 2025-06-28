-- 177. Nth Highest Salary
-- https://leetcode.com/problems/nth-highest-salary/
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.

    SELECT(

        WITH rank_salarios AS(

            SELECT e.salary,
                   DENSE_RANK() OVER(ORDER BY e.salary DESC) AS rank
            FROM employee e

        )

        SELECT r.salary
          FROM rank_salarios r
         WHERE r.rank = N
         LIMIT 1

    ) AS resultado
      
  );
END;
$$ LANGUAGE plpgsql;
