-- 1045. Customers Who Bought All Products
-- https://leetcode.com/problems/customers-who-bought-all-products/description/
WITH produtos_comprados_cliente AS (
    SELECT customer_id,
           COUNT(DISTINCT product_key) AS cont
      FROM customer
     GROUP BY customer_id
)

SELECT customer_id
  FROM produtos_comprados_cliente
 WHERE cont = (SELECT COUNT(*)
                 FROM product)
