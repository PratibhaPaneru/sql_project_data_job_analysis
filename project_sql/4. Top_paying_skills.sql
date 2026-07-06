/*
Question:
What are the top paying skills on the basis of salary_year_avg?
- look at the average salary associated with each skill for Data Analyst position
- focus on roles with specified salaries regardless of location.

Why? (Reason for question )
- It reveals how different skills impact salary levels for Data Analysts and 
helps identify the most rewarding skills to acquire or improve
*/

SELECT
round(avg(salary_year_avg),0) as salary_avg,
skills
from job_postings_fact
join skills_job_dim
on job_postings_fact.job_id = skills_job_dim.job_id
join skills_dim
ON skills_job_dim.skill_id = skills_dim.skill_id
where job_title_short = 'Data Analyst'
AND salary_year_avg is not NULL
group by skills
order by salary_avg desc
limit 25 

/*
Insights
- AI/ML skills (TensorFlow, PyTorch, Keras, Hugging Face) appear in top-paying 
roles, showing demand for analysts with machine learning knowledge.

- Data engineering tools (Kafka, Airflow, Cassandra) are highly valued, 
indicating a shift toward analysts who can work with data pipelines and 
large-scale systems.

- Cloud/DevOps tools (Terraform, Ansible, GitLab, Bitbucket) suggest 
high-paying roles require collaboration with engineering and deployment 
workflows.

- Programming languages (Scala, Golang, Perl) show that coding ability beyond 
SQL/Python can increase salary potential.

- Very high averages (e.g., SVN, Solidity) may be outliers due to low job 
counts, so they should be interpreted carefully.

Overall: Higher-paying data analyst roles often combine analytics with 
engineering, cloud, or ML skills rather than just reporting tools.

*/
