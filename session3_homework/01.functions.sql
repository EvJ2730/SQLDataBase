--Calculate the count of all grades in the system
--Calculate the count of all grades per Teacher in the system
--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
--Find the Maximal Grade, and the Average Grade per Student on all grades in the system


select count (Grade) as grade_count
from Grade;

select TeacherID, count(Grade) as grade_count
from Grade
group by TeacherID
order by TeacherID asc
go

select TeacherID, count(Grade) as grade_count
from Grade
where StudentID < 100
group by TeacherID
order by TeacherID
go

select studentID, max(Grade) as max_grade, avg(cast(grade as decimal)) as average_grade
from Grade
group by StudentID
order by StudentID
go
