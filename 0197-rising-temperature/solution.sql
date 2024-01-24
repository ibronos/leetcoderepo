# Write your MySQL query statement below
select id as Id
from Weather current
where exists (
    select * from Weather prev
    where 
    datediff(current.recordDate, prev.recordDate) = 1 
    and current.temperature > prev.temperature
)
