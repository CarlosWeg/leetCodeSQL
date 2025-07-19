-- 3421. Find Students Who Improved
-- https://leetcode.com/problems/find-students-who-improved/description/
-- Write your PostgreSQL query statement below
SELECT f.student_id,
       f.subject,
       f.score AS first_score,
       l.score AS latest_score
  FROM scores f
 INNER JOIN scores l
    ON f.student_id = l.student_id
   AND f.subject = l.subject
   AND l.score > f.score
   AND l.exam_date > f.exam_date
 WHERE (f.exam_date, l.exam_date) = (
    
    SELECT MIN(exam_date), MAX(exam_date)
      FROM scores s
     WHERE s.student_id = l.student_id
       AND s.subject = l.subject
    
    )
