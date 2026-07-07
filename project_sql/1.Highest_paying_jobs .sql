/*
Question: What are the top 10 high-paying Data Analyst remote Jobs with the company name?
why(Reason for this question)
- Highlight the top paying opportunities for Data Analysts, offering insights
into employment 
*/

SELECT
    j.job_id,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.job_posted_date,
    j.salary_year_avg,
    c.name AS company_name
FROM job_postings_fact AS j
JOIN company_dim AS c
    ON j.company_id = c.company_id
WHERE
    j.job_title_short = 'Data Analyst'
    AND j.job_work_from_home = TRUE
    AND j.salary_year_avg IS NOT NULL
ORDER BY
    j.salary_year_avg DESC
LIMIT 10;



