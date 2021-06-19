--01.Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
--		StudentCardNumber without “sc-”
--		“ – “
--		First character of student FirstName
--		“.”
--		Student LastName

		create function dbo.fn_FormatName (@StudentId int)
		returns nvarchar (100)
		as
		begin
				declare @StudentDescriptionId nvarchar(100)
				select @StudentDescriptionId = SUBSTRING(StudentCardNumber,4,5) + left(FirstName,1) + '.' + LastName
				from dbo.Student
				where id = @StudentId
				return @StudentDescriptionId
		end
		go

		select *, dbo.fn_FormatName (id ) as student_description_name
		from dbo.Student