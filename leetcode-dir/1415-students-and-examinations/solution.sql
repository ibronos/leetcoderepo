select Students.student_id, Students.student_name, Subjects.subject_name,
count(Examinations.subject_name) AS attended_exams
from Students
cross join Subjects
left join Examinations on Examinations.student_id = Students.student_id
and Subjects.subject_name = Examinations.subject_name
group by Students.student_id, Students.student_name, Subjects.subject_name
order by Students.student_id
