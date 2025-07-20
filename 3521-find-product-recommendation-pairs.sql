-- 3521. Find Product Recommendation Pairs
-- https://leetcode.com/problems/find-product-recommendation-pairs/description/
-- Write your PostgreSQL query statement below
SELECT pi.product_id AS product1_id,
       pi2.product_id AS product2_id,
       pi.category AS product1_category,
       pi2.category AS product2_category,
       COUNT(DISTINCT p2.user_id) AS customer_count
  FROM productpurchases p
 INNER JOIN productinfo pi
    ON p.product_id = pi.product_id
 INNER JOIN productpurchases p2
    ON p.product_id < p2.product_id
   AND p.user_id = p2.user_id
 INNER JOIN productinfo pi2
    ON p2.product_id = pi2.product_id
 GROUP BY product1_id,
          product2_id,
          product1_category,
          product2_category
HAVING COUNT(DISTINCT p2.user_id) >= 3
 ORDER BY customer_count DESC,
          product1_id ASC,
          product2_id ASC
