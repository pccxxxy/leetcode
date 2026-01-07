# Write your MySQL query statement below
-- ifnull(__,'null')


SELECT IFNULL((SELECT distinct salary 
from Employee
order by salary desc limit 1,1), NULL)
as SecondHighestSalary

