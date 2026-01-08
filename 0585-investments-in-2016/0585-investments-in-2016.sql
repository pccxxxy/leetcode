# Write your MySQL query statement below
select round(sum(tiv_2016), 2) as tiv_2016 from insurance a
where 
tiv_2015 in (select tiv_2015 from insurance b where a.pid <> b.pid)
and 
(LAT, LON) not in (select lat, lon from insurance c where a.pid <> c.pid)
;


-- select sum(a.TIV_2016) as TIV_2016 from insurance a
-- where
-- a.TIV_2015 in (select b.TIV_2015 from insurance b where a.PID <> b.PID)
-- and
-- (a.LAT, a.LON) not in (select c.LAT, c.LON from insurance c where a.PID <> c.PID)
-- ;