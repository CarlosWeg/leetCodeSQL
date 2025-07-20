-- 3475. DNA Pattern Recognition 
-- https://leetcode.com/problems/dna-pattern-recognition/description/
-- Write your PostgreSQL query statement below
SELECT sample_id,
       dna_sequence,
       species,
       CASE 
            WHEN dna_sequence ILIKE 'ATG%' THEN 1
            ELSE 0
       END AS has_start,
       CASE 
            WHEN dna_sequence ILIKE '%TAA' THEN 1
            WHEN dna_sequence ILIKE '%TAG' THEN 1
            WHEN dna_sequence ILIKE '%TGA' THEN 1
            ELSE 0
       END AS has_stop,
       CASE
            WHEN dna_sequence ILIKE '%ATAT%' THEN 1
            ELSE 0
        END AS has_atat,
       CASE WHEN dna_sequence ILIKE '%GGG%' THEN 1
            ELSE 0
       END AS has_ggg
  FROM samples
