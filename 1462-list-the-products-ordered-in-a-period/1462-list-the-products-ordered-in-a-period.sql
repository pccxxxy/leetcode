# Write your MySQL query statement below
select * from (
    select p.product_name, sum(o.unit) as unit
from Orders o
left join Products p
on o.product_id = p.product_id 

where order_date like '2020-02%'
group by o.product_id

) as t
where unit >=100;

