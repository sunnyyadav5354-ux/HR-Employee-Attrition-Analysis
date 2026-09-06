SELECT*FROM company_data;

-- SALARY WISE ATTRITION
SELECT 
case
when salary<50000 then 'below 50k'
when salary between 50000 and 75000 then '50k-75k'
when salary between 75001 and 100000 then '75K-100k'
when salary>100000 then 'above 100K'
end as salary_band,

count(*) as total_employees,
count(*) filter(where active_status =0) as employe_left,
round(count(*) filter(where active_status=0)*100.00/count(*),2)as attrition_rate_pct
from company_data
group by salary_band
having count(*) >10
order by attrition_rate_pct desc;


select count(*)
from company_data;