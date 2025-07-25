-- 3626. Find Stores with Inventory Imbalance
-- https://leetcode.com/problems/find-stores-with-inventory-imbalance/description/
-- Write your PostgreSQL query statement below
WITH

store_products AS (

    SELECT store_id,
           product_name,
           quantity,
           price,
           COUNT(*) OVER(PARTITION BY store_id) AS count_pro,
           ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY price DESC) AS expen,
           ROW_NUMBER() OVER(PARTITION BY store_id ORDER BY price ASC) AS cheap
      FROM inventory

)

SELECT s.store_id,
       s.store_name,
       s.location,
       e.product_name AS most_exp_product,
       c.product_name AS cheapest_product,
       ROUND(c.quantity::NUMERIC / e.quantity::NUMERIC, 2) AS imbalance_ratio
  FROM stores s
 INNER JOIN store_products e
    ON s.store_id = e.store_id
   AND e.count_pro >= 3
   AND e.expen = 1
 INNER JOIN store_products c
    ON c.store_id = s.store_id
   AND c.count_pro >= 3
   AND c.cheap = 1
 WHERE c.quantity > e.quantity
 ORDER BY imbalance_ratio DESC,
          store_name ASC
