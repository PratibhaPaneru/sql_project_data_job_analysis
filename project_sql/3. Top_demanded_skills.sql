/*
Question: What are the most in demand skills for Data Analysts?
- join job posting to inner join table similar to query 2 
- identify the top 5 in demand skills for Data Analysts.
- focus on all job postings 
Why? (Reason for the question) 
- Retrives the top 5 skills with the highest demand in the job market,
providing insights into the most valuable skills for job seekers.
*/


select skills_job_dim.skill_id,
skills,
count(skills_job_dim.skill_id) as demand_count
from job_postings_fact
join skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
join skills_dim
on skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst'
group by skills_job_dim.skill_id, skills
order by demand_count desc
limit 5

