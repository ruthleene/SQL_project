/* 
Question: What are the most in-demand skills for data analysts?
Why? Retrieves the top 5 skills with the highest market demand
*/

WITH jobs_and_skills AS
(
    SELECT 
        job_postings_fact.job_id,
        skills     
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
        WHERE job_title_short = 'Data Analyst'

)

SELECT 
    skills, COUNT (*) AS total_demand
FROM jobs_and_skills

GROUP BY skills
ORDER BY total_demand DESC
LIMIT 5


