-- 3554. Find Category Recommendation Pairs
-- https://leetcode.com/problems/find-category-recommendation-pairs/description/
-- Write your PostgreSQL query statement below

SELECT c1.category AS category1,
       c2.category AS category2,
       COUNT(DISTINCT pp1.user_id) AS customer_count
  FROM productinfo c1
 CROSS JOIN productinfo c2
 INNER JOIN productpurchases pp1
    ON c1.product_id = pp1.product_id
 INNER JOIN productpurchases pp2
    ON c2.product_id = pp2.product_id
   AND pp1.user_id = pp2.user_id
 WHERE c1.category < c2.category
 GROUP BY c1.category,
          c2.category
HAVING COUNT(DISTINCT pp1.user_id) >= 3
 ORDER BY customer_count DESC,
          category1 ASC,
          category2 ASC
