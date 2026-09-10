select * from company_data;

select 
case
when tenure_years <1 then '0_1'
when tenure_years between 1 and 3 then '1_3 years'
when tenure_years between 4 and 6 then '4-6 years'
when tenure_years between 7 and 9 then '7-9 years'
when tenure_years>=10 then '10+'
end as tenure_bucket,
count(*) as total_employees,
count(*) filter(where active_status=0) as employee_left
from(
select*,
case 
when active_status=0 then extract(year from age(termination_date, start_date))
else extract(year from age('2022-06-01', start_date))
end as tenure_years
from company_data
) as sub
group by tenure_bucket
order by total_employees desc
;

select count(*) from company_data
where active_status=1
and start_date>='2023-08-20';

select max(start_date) as most_recent_hire_date
from company_data;
