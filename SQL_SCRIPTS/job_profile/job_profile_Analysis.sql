drop table job_profile_mapping;
create table job_profile_mapping(
department varchar(50),
job_title varchar(100),
job_profile varchar(20),
compensation numeric,
level varchar(50),
bonus_percent numeric
);

select *from job_profile_mapping;

--/ JOIN COMPANY AND JOB_PROFILE_MAPPING TABLE

select 
c.employee_id,
C.department,
c.job_title,
j.job_profile,
j.compensation,
j.level,
j.bonus_percent
from company_data c
inner join job_profile_mapping j
on c.job_title=j.job_title;

--/ DOES A LOWER BONUS PERCENTAGE LEAD TO HIGHER EMPLOYEE ATTRITION
select 
j.bonus_percent,
count(*) total_employees,
sum(
case
when  c.active_status=0 then 1 else 0
end
) as employee_left,
round(
sum(
case
when c.active_status=0 then 1 else 0
end
)*100.00/count(*),
2
) as attrition_rate
from company_data c
inner join job_profile_mapping j
on c.job_title=j.job_title
group by j.bonus_percent
order by attrition_rate desc;

-- compensasion effected employee Attrition
select
case 
when j.compensation<50000 then'low'
when j.compensation<=100000 then'midium'
else 'high'
end as compensation_level,
count(*) total_employees,
sum(
case
when active_status=0 then 1 else 0
end
) employee_left,
round(
sum(
case
when active_status=0 then 1 else 0
end
)*100.00/count(*),
2
) Attrition_rate
from company_data c
inner join job_profile_mapping j
on c.job_title=j.job_title
group by compensation_level;

select * from job_profile_mapping;

--/ which job level has the highest employee Attrition ?
select 
j.level,
count(*) AS total_employees,
sum(
case
when active_status=0 then 1 else 0
end
) as employees_left,
round(
sum(
case
when active_status=0 then 1 else 0
end
)*100.00/count(*),
2
) as Attrition_rate
from company_data c
inner join job_profile_mapping j
on c.job_title= j.job_title
group by j.level
order by Attrition_rate desc;

--/ which department has a highest Attrition rate

select 
c.department,
count(*) as total_employees,
sum (
case
when active_status=0 then 1 else 0
end 
) as employee_left,
round(
sum(
case 
when active_status=0 then 1 else 0
end
)*100.00/ count(*),
2
) as Attrition_rate
from company_data c
inner join Job_profile_mapping j
on c.job_title= j.job_title
group by c.department
order by Attrition_rate desc;


