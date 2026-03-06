/*
    Question: What are the top paying skills for Data Analyst roles?
    Why? Helps reveal the most financially rewarding skills to acquire or improve
*/

SELECT  
    skills,
   ROUND( AVG(salary_year_avg), 0) AS avg_salary 
    
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    salary_year_avg IS NOT NULL AND 
    job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25

/* Analysis

- SVN leads at $400,000 average salary, though this likely reflects a small sample size of niche, high-paying postings rather than a broad market trend.
- Solidity ($179K), Couchbase ($160K), and Golang ($155K) represent the strongest realistic premium skills, spanning blockchain, NoSQL databases, and systems programming.
- AI/ML frameworks — including MXNet, DataRobot, Keras, PyTorch, TensorFlow, and Hugging Face — consistently appear in the $120K–$155K range, signaling strong and repeatable demand for machine learning tooling in analyst roles.
- DevOps and pipeline tools such as Terraform, Kafka, Airflow, Ansible, and Puppet cluster around $116K–$147K, highlighting the salary premium for analysts who can operate closer to the data engineering stack.
- Even the lowest-ranked skill, Scala, averages $115,480 — confirming that all 25 skills represent well-above-average compensation for Data Analyst positions.
