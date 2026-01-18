/* Finds the 5 most frequently mentioned skills in job postings*/

SELECT 
    sd.skills,
    sj.skill_count
FROM(
    SELECT
        skill_id,
        COUNT(*) AS skill_count
    FROM skills_job_dim
    GROUP BY skill_id
    ORDER BY skill_count DESC
    LIMIT 5
) sj 
JOIN skills_dim sd ON
    sj.skill_id = sd.skill_id
ORDER BY sj.skill_count DESC;
