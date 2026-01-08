# Write your MySQL query statement below
-- select employee_id
-- from Employees 
-- where salary < 30000 and employee_id in (select manager_id 
-- from Employees 
-- where not exists (select employee_id from Employees));


select employee_id
from Employees 
where  salary < 30000 and manager_id not in (select employee_id from Employees)
order by 1