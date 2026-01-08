# Write your MySQL query statement below
select id, count(id) as num
from(SELECT requester_id AS id FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id FROM RequestAccepted) as t
group by id
order by num desc
limit 1;