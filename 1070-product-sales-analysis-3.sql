-- 1070. Product Sales Analysis III
-- https://leetcode.com/problems/product-sales-analysis-iii/description/
-- Write your PostgreSQL query statement below
WITH primeiro_ano_venda_produto AS (

    SELECT product_id,
           MIN(year) AS first_year
      FROM sales
     GROUP BY product_id

)

SELECT p.product_id,
       p.first_year,
       s.quantity,
       s.price
  FROM primeiro_ano_venda_produto p
 INNER JOIN sales s
    ON s.product_id = p.product_id
   AND s.year = p.first_year
