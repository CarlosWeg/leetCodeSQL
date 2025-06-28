-- 177. Nth Highest Salary
-- https://leetcode.com/problems/nth-highest-salary/
CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below

    SELECT DISTINCT
           e.salary
      FROM employee e
     WHERE N > 0
     ORDER BY e.salary DESC
    OFFSET CASE WHEN N > 0 THEN N-1 ELSE 0 END
     LIMIT 1
   
  );
END;
$$ LANGUAGE plpgsql;
