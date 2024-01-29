select Register.contest_id,
round(
    (
       count(Register.contest_id)
        / 
        (
            select count(*)
            from Users
        )  
    )
    *100
,2) as percentage
from Register
left join Users on Register.user_id = Users.user_id
group by Register.contest_id
order by percentage DESC, Register.contest_id ASC
