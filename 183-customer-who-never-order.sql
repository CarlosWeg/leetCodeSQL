-- 183. Customers Who Never Order
-- https://leetcode.com/problems/customers-who-never-order/description/
SELECT c.name AS customers
  FROM customers c
  LEFT JOIN orders o
    ON c.id = o.customerid
 WHERE o.customerid IS NULL
