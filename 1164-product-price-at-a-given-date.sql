-- 1164. Product Price at a Given Date
-- https://leetcode.com/problems/product-price-at-a-given-date/description/
-- Write your PostgreSQL query statement below
SELECT DISTINCT
       p.product_id,
       COALESCE(d.price, 10) AS price
  FROM products p
  LEFT JOIN LATERAL (SELECT p2.new_price AS price
                       FROM products p2
                      WHERE p2.change_date <= DATE '2019-08-16'
                        AND p.product_id = p2.product_id
                      ORDER BY p2.change_date DESC
                      LIMIT 1)d ON TRUE
