-- 1045. Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/description/
SELECT c.customer_id
  FROM customer c
 GROUP BY c.customer_id
HAVING COUNT(DISTINCT c.product_key) = (SELECT COUNT(product_key) FROM product)
