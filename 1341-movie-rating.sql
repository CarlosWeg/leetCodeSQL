-- 1341. Movie Rating
-- https://leetcode.com/problems/movie-rating/description/
-- Write your PostgreSQL query statement below
WITH

users_movies AS (
    SELECT u.name,
           COUNT(r.user_id) AS num
      FROM users u
     INNER JOIN movierating r
        ON r.user_id = u.user_id
     GROUP BY u.name
     ORDER BY num DESC,
              name ASC
     LIMIT 1
),

highest_average AS (

    SELECT m.title,
           AVG(r.rating) AS aver
      FROM movies m
     INNER JOIN movierating r
        ON m.movie_id = r.movie_id
     WHERE DATE_TRUNC('month', r.created_at) = DATE '02/01/2020' 
     GROUP BY m.title
     ORDER BY aver DESC,
              title ASC
     LIMIT 1
)

SELECT name AS results
  FROM users_movies

UNION ALL

SELECT title AS results
  FROM highest_average
