
DROP TABLE IF EXISTS job_listings;

CREATE TABLE job_listings (
    id SERIAL PRIMARY KEY,
    job_title TEXT,
    company_name TEXT,
    location TEXT,
    industry TEXT,
    job_type TEXT,
    experience_level TEXT,
    min_salary INT,
    max_salary INT,
    avg_salary INT,
    skills_required TEXT,
    posted_date DATE
);

SELECT * FROM job_listings;

copy job_listings(job_title, company_name, location, industry, job_type, experience_level, min_salary, max_salary, avg_salary, skills_required, posted_date)
FROM 'C:/pg_data/JOB_LISTING_CUSTOM.csv'
DELIMITER ',' CSV HEADER;




--Job Count by Role
SELECT job_title, COUNT(*) AS total_roles
FROM job_listings
GROUP BY job_title
ORDER BY total_roles DESC;


--Jobs by Location
SELECT location, COUNT(*) AS job_count
FROM job_listings
GROUP BY location
ORDER BY job_count DESC;


--Average Salary by Role
SELECT job_title, ROUND(AVG(avg_salary), 2) AS avg_salary
FROM job_listings
GROUP BY job_title
ORDER BY avg_salary DESC;


-- Roles by Company
SELECT company_name, COUNT(*) AS openings
FROM job_listings
GROUP BY company_name
ORDER BY openings DESC;





