-- # Write your MySQL query statement below
(select u.name as results
from MovieRating mr
left join Users u
on mr.user_id = u.user_id
group by mr.user_id
order by count(distinct mr.movie_id) desc, u.name asc
limit 1)

union all

(select m.title as results
from MovieRating mr
left join Movies m
on mr.movie_id = m.movie_id
where mr.created_at like '2020-02%'
group by mr.movie_id
order by sum(mr.rating) / count(mr.rating) desc, m.title asc
limit 1);