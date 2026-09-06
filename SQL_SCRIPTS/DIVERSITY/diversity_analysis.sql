create table diversity(
employee_id int,
gender varchar(50),
gender_identity varchar(100),
race_ethnicity varchar(100),
veteran int,
disabillity int,
education varchar(100),
sexual_orientation varchar(100)
);

select *  from diversity;


--/ GENDER WISE EMPLOYEE DISTRIBUTION

select gender_identity,
count(*) as total_employees
from diversity
group by gender_identity;

--/ RACE WISE EMPLOYEES DISTRIBUTION

select race_ethnicity,
count(*) as total_ethnicity
from diversity
group by race_ethnicity;

--/ count vetern and non veteran

select veteran,
count(*) as total_veteran
from diversity
group by veteran;


--/ JOIN COMPANY TABLE AND DIVERSITY TABLE

select * from company_data c
inner join diversity d
on c.employee_id =d.employee_id;

--/HOW MANY ATTIRATION RATE IN MALE AND FEMALE

select
d.gender,
count(*) total_employees,
sum(
case
when c.active_status=0 then 1 else 0
end) as attrited_employees,
round(
count(*)*100.00/ sum(count(*)) 
over(),2
) as attrition_rate
from company_data c
inner join diversity d
on c.employee_id= d.employee_id

group by d.gender;

--/ HOW MANY ATTRITION  RACE-ETHNCITY
SELECT * FROM DIVERSITY;

select
race_ethnicity,
count(*) total_employees,
sum(
case
when c.active_status=0 then 1 else 0
end ) as attrited_employees,
round(
count(*)*100.00/ sum(count(*)) 
over(),2
) as attrition_rate
from company_data c
inner join diversity d
on c.employee_id=d.employee_id
group by race_ethnicity;

select * from diversity;

-- veteran wise Attritatioin
select
veteran,
count(*) total_employees,
sum(
case
when c.active_status=0 then 1 else 0
end ) as attrited_employees,
round(
count(*)*100.0/ sum(count(*)) 
over(),2
) as attrition_rate
from company_data c
inner join diversity d
on c.employee_id= d.employee_id
group by veteran;
order by 


