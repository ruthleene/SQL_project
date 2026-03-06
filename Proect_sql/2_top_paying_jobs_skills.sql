/* 
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst roles from first query.
- Add the specific skills required for these roles.
- Why? Helps provide a detailed look at which high-paying jobs demand certain skills.
*/

WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location= 'Anywhere'AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
    FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    salary_year_avg DESC

/* BREAKDOWN OF MOST DEMANDED SKILLS FOR DATA ANALYSIS IN 2023:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, snowflake, Pandas, and Excel show varying degrees of demand.
*/
