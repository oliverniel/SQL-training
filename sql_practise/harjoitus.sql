SELECT
    companies.name AS company_name,
    companies.company_id AS company_id
FROM job_postings_fact AS job_postings
LEFT JOIN company_dim AS companies
    ON job_postings.company_id = companies.company_id
WHERE
    job_health_insurance =  TRUE
    AND EXTRACT(MONTH FROM job_posted_date) > 3
    AND EXTRACT(MONTH FROM job_posted_date) < 7;