/* Defining the size categories for the companies according to their amount of job postings */
SELECT
    company_id,
    job_count,
    CASE
        WHEN job_count < 10 THEN 'Small'
        WHEN job_count BETWEEN 10 AND 50 THEN 'Medium'
        WHEN job_count > 50 THEN 'Large'
        ELSE 'unknown'
    END AS company_size
FROM(
    SELECT
        company_id,
        COUNT(*) AS job_count
    FROM job_postings_fact
    GROUP BY company_id
) company_jobs;
