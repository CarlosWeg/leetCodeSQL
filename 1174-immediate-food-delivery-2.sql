-- 1174. Immediate Food Delivery II
-- https://leetcode.com/problems/immediate-food-delivery-ii/description/
-- Write your PostgreSQL query statement below
WITH first_orders AS (

    SELECT DISTINCT ON (customer_id)
           customer_id,
           order_date,
           customer_pref_delivery_date
      FROM delivery
     ORDER BY customer_id ASC, order_date ASC

)

SELECT ROUND(
         COUNT(*) FILTER(WHERE order_date = customer_pref_delivery_date)::NUMERIC * 100 / COUNT(*)::NUMERIC
       , 2) AS immediate_percentage
  FROM first_orders
