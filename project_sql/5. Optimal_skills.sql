/*
Question: What are the optimal skills to learn (aka its in high demand and high paying skills)?
- Identify skills in high demand and associated with high average salaries
for Data Analyst role.
- Concentrated on remote job with specified salaries 

Why?(Reason for Question)
- Targets skills that offer job security (high demand) and financial benefit
(high salaries) offering strategical insights for career development in Data Analysis 
*/

select skills,
count(skills_job_dim.skill_id) as demand_count,
round(avg(salary_year_avg),0) as salary_avg
from job_postings_fact
join skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
JOIN skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst'
and salary_year_avg is not NULL
and job_work_from_home is TRUE
group by skills
Having count(skills_job_dim.skill_id) >10
order by salary_avg DESC, demand_count DESC
limit 25