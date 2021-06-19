--System should be able to manage Exams???
--Each Grade record should contain following information: Date, Student, Teacher, Course, Grade value
--Additionally for each Grade, system should keep details about Achievement type 
--(home work, exam, class activity…), achievement points, achievement maximum points and achievement date

select s.FirstName as first_name, g.Grade as grade_value, t.FirstName as teachers_name, c.[Name] as course_name,g.CreatedDate as [date]
from dbo.Grade g
inner join dbo.Student s on s.ID = g.ID
inner join dbo.Teacher t on t.ID = s.ID
inner join dbo.Course c on c.ID = g.ID
order by Grade 
go


select a.[Name] as achievement_name, g.Grade as grade, gd.AchievementPoints as achievement_points, gd.AchievementMaxPoints as max_points, gd.AchievementDate as date 
from dbo.GradeDetails gd
cross join dbo.AchievementType a  
inner join dbo.Grade g on g.ID = gd.ID
order by Grade
go

