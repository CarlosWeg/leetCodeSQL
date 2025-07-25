-- 3564. Seasonal Sales Analysis
-- https://leetcode.com/problems/seasonal-sales-analysis/description/
-- Write your PostgreSQL query statement below

WITH season_sales AS (
    SELECT CASE
                WHEN EXTRACT(MONTH FROM s.sale_date) IN(12, 1, 2) THEN 'Winter'
                WHEN EXTRACT(MONTH FROM s.sale_date) IN(3, 4, 5) THEN 'Spring'
                WHEN EXTRACT(MONTH FROM s.sale_date) IN(6, 7, 8) THEN 'Summer'
                WHEN EXTRACT(MONTH FROM s.sale_date) IN(9, 10, 11) THEN 'Fall'
        END AS season,
        p.category,
        SUM(s.quantity) AS total_quantity,
        SUM(s.quantity * s.price) AS total_revenue
    FROM products p
   INNER JOIN sales s
      ON p.product_id = s.product_id
   GROUP BY season, category
)

SELECT DISTINCT ON (season)
       *
  FROM season_sales
 ORDER BY season, total_quantity DESC, total_revenue DESC
