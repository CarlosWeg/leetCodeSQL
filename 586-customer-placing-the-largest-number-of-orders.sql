-- 586. Customer Placing the Largest Number of Orders
-- https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/description/
-- Write your PostgreSQL query statement below
WITH qntd_pedidos AS (

    SELECT customer_number,
           RANK() OVER(ORDER BY COUNT(*) DESC) AS rank
      FROM orders
     GROUP BY customer_number

)

SELECT customer_number
  FROM qntd_pedidos
 WHERE rank = 1
