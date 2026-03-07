/* What are the most optimal skills to learn: high demand and high salary
*/


/* What are the most optimal skills to learn:
   High demand and high salary for Data Analysts */

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(*) AS total_demand  -- number of job postings requiring this skill
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim 
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE 
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
    GROUP BY 
        skills_dim.skill_id, skills_dim.skills
),

average_salary AS (
    SELECT  
        skills_job_dim.skill_id,
        ROUND(AVG(salary_year_avg),0) AS avg_salary  -- average salary per skill
    FROM job_postings_fact
    INNER JOIN skills_job_dim 
        ON job_postings_fact.job_id = skills_job_dim.job_id
    WHERE 
        salary_year_avg IS NOT NULL
        AND job_title_short = 'Data Analyst'
    GROUP BY 
        skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    total_demand,
    avg_salary
FROM skills_demand
INNER JOIN average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
WHERE total_demand >10
ORDER BY 
    total_demand DESC,
    avg_salary DESC
    LIMIT 10;

