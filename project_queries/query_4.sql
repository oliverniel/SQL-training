/*
For this project, I chose the specific role to be Data Engineer

4. Query:

- What are the top skills based on salary for my role? 

- DOTO:
    * Group the job postings based on skills, and calculate the average salaries of the each skill. Using yearly average units on this.
    * Could consider to change the salaries to be either only yearly avg or monthly avg for easier and better analyses, but not on the to do list now.

*/

SELECT
    skills,
    ROUND(AVG(salary_year_avg), 0) AS salaries_average
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Engineer' 
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    salaries_average DESC
LIMIT 25