-- 608. Tree Node
-- https://leetcode.com/problems/tree-node/description/
-- Write your PostgreSQL query statement below
SELECT id,
       CASE WHEN p_id IS NULL THEN 'Root'
            WHEN EXISTS (
            SELECT 1
              FROM Tree t2
             WHERE t.id = t2.p_id
       ) THEN 'Inner'
       ELSE 'Leaf'
       END AS type
  FROM Tree t
 ORDER BY id
