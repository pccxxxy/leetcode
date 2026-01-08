# Write your MySQL query statement below
-- select Department.id, Employee.id__ as employee within the department owning the highest_salary, _highest_salary
-- group by Department.id


with cte as (select d.id, d.name as name1, e.salary, e.name as name2, dense_rank() over (PARTITION BY d.id
            ORDER BY e.salary DESC) as rnt
from Employee e
left join Department d
on e.departmentId = d.id
order by d.id asc, e.salary desc) 
select name1 as Department, name2 as Employee, salary
from cte 
where rnt < 4


