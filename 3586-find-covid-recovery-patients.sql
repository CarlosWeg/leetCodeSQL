-- 3586. Find COVID Recovery Patients
-- https://leetcode.com/problems/find-covid-recovery-patients/description/
-- Write your PostgreSQL query statement below
SELECT p.patient_id,
       p.patient_name,
       p.age,
       MIN (c2.test_date) - MIN (c3.test_date) AS recovery_time
  FROM patients p
 INNER JOIN covid_tests c2
    ON p.patient_id = c2.patient_id
   AND c2.result = 'Negative'
 INNER JOIN covid_tests c3
    ON c2.patient_id = c3.patient_id
   AND c3.test_date < c2.test_date
   AND c3.result = 'Positive'
 GROUP BY p.patient_id,
          p.patient_name,
          p.age
 ORDER BY recovery_time ASC, patient_name ASC
