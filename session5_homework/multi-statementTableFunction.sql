drop function dbo.fn_ExamDetails
go


create function dbo.fn_ExamDetails(@TeacherId smallint, @CourseId smallint)
RETURNS @output table (StudentFirstName nvarchar(50), StudentLastName nvarchar(50), Grade tinyint, CreatedDate datetime)
AS
BEGIN
	insert into @output
	select s.FirstName as first_name, s.LastName as last_name, g.Grade as grade, g.CreatedDate as [date]
	from Grade as g
	inner join Student as s on g.StudentID = s.ID
	where TeacherID = @TeacherId and CourseID = @CourseId
return 
end
go

declare @TeacherId int=1 
declare @CourseId int=1
select*
from dbo.fn_ExamDetails (@TeacherId, @CourseId)
order  by Grade