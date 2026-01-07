# Write your MySQL query statement below
WITH DuplicateEmails AS (
    SELECT 
        id,
        email,
        ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM 
        Person
)
delete p
from Person p
left join DuplicateEmails d on p.id = d.id
where d.rn>1
;