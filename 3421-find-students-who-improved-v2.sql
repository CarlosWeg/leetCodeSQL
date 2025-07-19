-- 3421. Find Students Who Improved
-- https://leetcode.com/problems/find-students-who-improved/description/
-- Write your PostgreSQL query statement below
WITH

sorted_scores AS (

    SELECT student_id,
           subject,
           score,
           ROW_NUMBER() OVER(PARTITION BY student_id, subject ORDER BY exam_date ASC) AS first_exam,
           ROW_NUMBER() OVER(PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_exam
      FROM scores
)

SELECT f.student_id,
       f.subject,
       f.score AS first_score,
       l.score AS latest_score
  FROM sorted_scores f
 INNER JOIN sorted_scores l
    ON f.student_id = l.student_id
   AND f.subject = l.subject
   AND f.score < l.score
   AND f.first_exam = 1
   AND l.latest_exam = 1
