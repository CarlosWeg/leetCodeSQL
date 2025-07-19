-- 1393. Capital Gain/Loss
-- https://leetcode.com/problems/capital-gainloss/description/
-- Write your PostgreSQL query statement below
SELECT stock_name,
       SUM(price) FILTER(WHERE operation = 'Sell') - 
       SUM(price) FILTER(WHERE operation = 'Buy') AS capital_gain_loss
  FROM stocks
 GROUP BY stock_name
