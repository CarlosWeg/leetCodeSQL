-- 3421. Find Students Who Improved
-- https://leetcode.com/problems/find-students-who-improved/description/
-- Write your PostgreSQL query statement below
WITH

first_scores AS (

    SELECT DISTINCT ON(student_id, subject)
           student_id,
           subject,
           score,
           exam_date
      FROM scores
     ORDER BY student_id, subject, exam_date ASC

),

latest_scores AS (

    SELECT DISTINCT ON(student_id, subject)
           student_id,
           subject,
           score,
           exam_date
      FROM scores
     ORDER BY student_id, subject, exam_date DESC

)

SELECT f.student_id,
       f.subject,
       f.score AS first_score,
       l.score AS latest_score
  FROM first_scores f
 INNER JOIN latest_scores l
    ON f.student_id = l.student_id
   AND f.subject = l.subject
   AND l.exam_date > f.exam_date
   AND l.score > f.score
