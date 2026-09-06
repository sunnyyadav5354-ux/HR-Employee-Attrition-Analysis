drop table company_data;
CREATE TABLE company_data (
    employee_id VARCHAR(20),
    first_name VARCHAR(50),
    surname VARCHAR(50),
    street_address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    state_full VARCHAR(50),
    zip_code VARCHAR(50),
    country VARCHAR(50),
    country_full VARCHAR(50),
    age INT,
    office VARCHAR(50),
    start_date varchar(20),
    termination_date  varchar(20),
    office_type VARCHAR(50),
    department VARCHAR(50),
    currency VARCHAR(10),
    bonus_pct NUMERIC(5,2),
    job_title VARCHAR(100),
    dob varchar(20),
    level VARCHAR(50),
    salary NUMERIC(12,2),
    active_status INT,
    job_profile VARCHAR(50),
    notes VARCHAR(400)
);

set datestyle ='DMY';

SELECT * from company_data;


-- CONVERT VARCHAR TO INT
alter table company_data 
alter column employee_id 
type int using employee_id::int;

-- ADD PRIMARY KEY

alter table company_data add primary key(employee_id);

      -- DEPARTMENT WISE ATTRITION ANALYSIS
	  
-- HOW MANY EMPLOYEE LEFT THE JOB DEPARTMENT WISE
 SELECT  department, 
 count(*) as total_employee,
 count(*) filter(where active_status=0) as employees_left
 from company_data
 
 group by department;

 -- WHICHE DEPARTMENT LOSES MOST EMPLOYEES PERCENATGE WISE
 select department,
 count(*) total_employee,
 count(*) filter(where active_status=0) as  employees_left,
 round (count(*) filter(where active_status=0)*100.0/count(*),2)as attrition_rate_pct
 from company_data
 group by department
 order by attrition_rate_pct desc;

 -- WHICE LEVEL AND AGE GROUP EMPLOYEES HAS MOST ATTRITION 
 SELECT 
 LEVEL,
 CASE
 WHEN AGE between  20 and 30 then '20-30'
 when age between 31 and 40 then '31-40'
 when age between 41 and 50 then '41-50'
 when age>=51 then '51+'
 end as age_group,
 count(*) as total_employee,
 count(*) filter(where active_status=0) as employees_left,
 round(count(*)filter(where active_status=0)*100.00/count(*),2) as attrition_rate_pct
 from company_data
 group by level, age_group
 Having count(*)>=10
 order by attrition_rate_pct desc;

 -- DISPLAY MAX MIN AVG SALARY 
 select min(salary), max(salary), avg(salary) from company_data;

 select employee_id,
 first_name, surname, job_title,level, salary
from company_data
where salary=6071580;

/*select employee_id, first_name, surname, job_title, salary
from company_data
where salary>500000 or salary<25000
order by salary desc;

select employee_id, first_name, surname, job_title, level, salary
from company_data
where level='CSuite'
order by salary desc;

SELECT level, count(*) as count_above_ceo
from company_data
where salary >500000
group by level
order by count_above_ceo desc;*/

-- JOB ROLE WISE ATTRITION
SELECT job_title,
count(*)  as total_employee,
COUNT(*) FILTER(WHERE active_status=0) AS  employee_left,
round (count(*) filter(where active_status=0)*100.00/count(*),2) as attrition_rate_pct
from company_data
group by job_title
having count(*)>10
order by attrition_rate_pct desc;


/*select count(*)
from company_data;

select employee_id
from company_data
order by employee_id desc
limit 10;

select employee_id
from company_data
order by employee_id
limit 10;

select min(employee_id) as maximum_id,
max (employee_id) as maximum_id,
count(distinct employee_id) as
unique_ids
from company_data;

truncate table company_data;

select employee_id
from company_data
order by employee_id;


select count(*)
from company_data
where employee_id between 100001 and 104968;*/

--DATA TYPE CLEANING & DATE FROMAT CONVERSION

-- CONVERT START_DATE FROM VARCHAR TO DATE
alter table company_data
add column start_date_new date;

update company_data
set start_date_new=TO_DATE(start_date,'mm/dd/yyyy');

select start_date,start_date_new
from company_data
limit 10;

alter table company_data
drop column start_date;

alter table company_data
rename column start_date_new to start_date

select start_date
from company_data
limit 10;


-- CONVERT DATE_OF_BIRTH (DOB) FROM VARCHAR TO DATE
ALTER TABLE company_data
add column dob_new date;

update company_data
set dob_new=TO_date(dob,'mm/dd/yyyy');

select dob, dob_new
from company_data
limit 10;

alter table company_data 
drop column dob;

alter table company_data
rename column dob_new to dob;

select dob
from company_data
limit 10;


--CONVERT TERMINATION_DATE_FROM VARCHAR TO DATE
-- HANDLE BLANK TERMINATION DATES AS NULL
ALTER table company_data
add column termination_date_new date;

update company_data
set termination_date_new=
to_date (nullif(termination_date,''),'mm/dd/yyyy');


select termination_date, termination_date_new
from company_data
limit 10;

alter table company_data
drop column termination_date

alter table company_data
rename column termination_date_new to termination_date;


select termination_date
from company_data
limit 10;

select count(*) from company_data;

select count(distinct employee_id)
from company_data;



































































 `
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 	`