SELECT 
    CASE
        WHEN salary_year_avg < 40000 AND salary_year_avg IS NOT NULL THEN 'low salary'
        WHEN salary_year_avg BETWEEN 40000 AND 70000 AND salary_year_avg IS NOT NULL THEN 'standard salary'
        WHEN salary_year_avg > 70000 AND salary_year_avg IS NOT NULL THEN 'high salary'
        ELSE 'not specified'
    END AS salary_category
FROM job_postings_fact
WHERE  job_title_short = 'Data Analyst' AND (salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL)
ORDER BY COALESCE(salary_year_avg, salary_hour_avg) DESC;

