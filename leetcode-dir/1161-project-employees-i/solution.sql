select Project.project_id,
round(
    sum(
        case when 
        Employee.experience_years is not null
        then Employee.experience_years
        else 0
        end
    )
    /
    sum(
        case when 
        Employee.experience_years is not null
        then 1
        else 0
        end
    )
,2)
as average_years
from Project
left join Employee on Project.employee_id = Employee.employee_id
group by Project.project_id
