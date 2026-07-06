/*
Question: What are the top 10 high-paying Data Analyst remote Jobs with the company name?
why(Reason for this question)
- Highlight the top paying opportunities for Data Analysts, offering insights
into employment 
*/

select
j.job_id,
j.job_title,
j.job_location,
j.job_schedule_type,
j.job_posted_date,
j.Salary_year_avg,
c.name as company_name
from job_postings_fact j 
join company_dim c
on j.company_id = c.company_id
where  j.job_title_short = 'Data Analyst'
and j.job_work_from_home = TRUE
and salary_year_avg is not null 
Order by j.salary_year_avg DESC
limit 10 

