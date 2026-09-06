CREATE TABLE engagement_survey (
    employee_id INT,
    survey VARCHAR(20),
    q_recommend INT,
    q_engaged INT,
    q_leadership_cares INT,
    q_manager_support INT,
    q_diversity INT,
    q_growth_room INT,
    q_interesting_projects INT,
    q_manager_motivates INT,
    q_motivated INT,
    q_recognized INT,
    q_career_opportunities INT,
    q_company_market_position INT,
    q_plan_staying INT,
    q_fair_compensation INT,
    q_little_politics INT,
    q_comfortable_leadership INT,
    q_values_align INT,
    q_know_values INT,
    q_pto_comfort INT,
    what_does_well TEXT,
    what_can_improve TEXT
);
--/JOINED COMPANY DATA AND SURVEY DATA 
select * from engagement_survey;
select
c.employee_id,
c.active_status,
e.q_engaged
from company_data c
join engagement_survey e
on c.employee_id=e.employee_id;


select count(*)
from engagement_survey;

select count(*)
from company_data;

--/ CALCULATE THE OVER ALL AVERAGE EMPLOYEE ENGAGMENT SCORE
select avg(e.q_engaged)
from company_data c
inner join engagement_survey e
on c.employee_id= e.employee_id;

--/ DEPARTMENT WISE ENGAGED SCORE'

SELECT 
c.department,
AVG(e.q_engaged) as average_engagement
from company_data c
inner join engagement_survey e
on c.employee_id= e.employee_id
group by department
order by average_engagement asc;

/*calculate engagment wise attrition
select 
e.q_engaged as engagement_score,
count(*) As total_employees,
sum(
case
when c.active_status=0
then 1
else 0
end ) as attrited_employees,
round(
sum(
case
when c.active_status=0 then 1
else 0
end) *100/count(*),2
) as attrition_rate
from company_data c
inner join engagement_survey e
on c.employee_id = e.employee_id
group by e.q_engaged
order by e.q_engaged;*/

select
c.active_status,
count(*) as employee_count
from company_data c
inner join engagement_survey e
on c.employee_id=e.employee_id
group by c.active_status
order by c.active_status;

select 
e.q_engaged,
count(*) total_employees
from company_data c
inner join engagement_survey e
on c.employee_id = e.employee_id
group by e.q_engaged
order by total_employees desc;

--/engaged score wise anlayis low high medium 
select
case 
when e.q_engaged between 1 and 2 then 'low'
when e.q_engaged = 3  then 'medium'
when e.q_engaged between 4 and 5 then 'high'
end as engagement_level,

count(*) as total_employees,

round(
count(*)*100.0/ sum(count(*))
over(),2
) as percentage

from company_data c
inner join engagement_survey e
on c.employee_id = e.employee_id
group by engagement_level
order by total_employees desc;

--/ engagement vs recommedation
select 
e.q_engaged,
avg(e.q_recommend) as average_recommendation
from company_data c
inner join engagement_survey e
on c.employee_id = e.employee_id
group by e.q_engaged;

select column_name
from information_schema.columns
where table_name='engagement_survey';




