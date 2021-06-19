--List all possible combinations of Courses names and AchievementType names that can be passed by student
--List all Teachers that has any exam Grade
--List all Teachers without exam Grade
--List all Students without exam Grade (using Right Join)


select c.[Name], acht.[Name]
from Course c
cross join AchievementType acht
go

select distinct t.FirstName, t.LastName
from [dbo].[Teacher] as t
inner join [dbo].[Grade] as g on t.ID = g.TeacherID
go

select t.FirstName, t.LastName
from [dbo].[Teacher] as t
left join [dbo].[Grade] as g on t.ID = g.TeacherID
where g.ID is null
go


select s.*
from [dbo].[Grade] as g
right join [dbo].[Student] as s on s.ID = g.StudentID
where g.StudentID is null
