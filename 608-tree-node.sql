-- https://leetcode.com/problems/tree-node/description/
-- 608. Tree Node
-- Write your PostgreSQL query statement below

WITH root_nodes AS (

    SELECT id,
           'Root' AS type
      FROM tree
     WHERE p_id IS NULL

),

leaf_nodes AS (
    SELECT id,
           'Leaf' AS type
      FROM tree t
     WHERE NOT EXISTS (
        SELECT 1
          FROM tree t2
         WHERE t.id = t2.p_id
     )
      AND p_id IS NOT NULL
),

inner_nodes AS (

    SELECT id,
           'Inner' AS type
      FROM tree t
     WHERE EXISTS (
        SELECT 1
          FROM tree t2
         WHERE t.id = t2.p_id
     )
       AND p_id IS NOT NULL

)

SELECT * FROM root_nodes
UNION ALL
SELECT * FROM leaf_nodes
UNION ALL
SELECT * FROM inner_nodes

ORDER BY id
