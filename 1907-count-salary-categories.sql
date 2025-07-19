-- 1907. Count Salary Categories
-- https://leetcode.com/problems/count-salary-categories/description/
WITH

categories(cat_id, cat_name) AS (

    VALUES
        (1,'Low Salary'),
        (2,'Average Salary'),
        (3,'High Salary')

),

categorized_accounts AS (

    SELECT income,
           CASE WHEN income < 20000 THEN 1
                WHEN income BETWEEN 20000 AND 50000 THEN 2
                WHEN income > 50000 THEN 3
            END AS cat_id
      FROM accounts
)

SELECT cat_name AS category,
       COUNT(a.cat_id) AS accounts_count
  FROM categories c
  LEFT JOIN categorized_accounts a
    ON a.cat_id = c.cat_id
  GROUP BY category
