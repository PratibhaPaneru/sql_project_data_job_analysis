/*
Question: What are the most in demand skills for Data Analysts?
- join job posting to inner join table similar to query 2 
- identify the top 5 in demand skills for Data Analysts.
- focus on all job postings 
Why? (Reason for the question) 
- Retrives the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/

SELECT
    sjd.skill_id,
    sd.skills,
    COUNT(sjd.skill_id) AS demand_count
FROM job_postings_fact AS jpf
JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Analyst'
GROUP BY
    sjd.skill_id,
    sd.skills
ORDER BY
    demand_count DESC
LIMIT 5;
