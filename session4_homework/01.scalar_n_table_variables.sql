--01.Declare scalar variable for storing FirstName values
--		Assign value ‘Antonio’ to the FirstName variable
--		Find all Students having FirstName same as the variable
				declare @first_name nvarchar(100)
				set @first_name = 'Antonio'
				select @first_name 
				
				select *
				from Student
				where FirstName = @first_name

--02.Declare table variable that will contain StudentId, StudentName and DateOfBirth
--		Fill the table variable with all Female students
				
				declare @table_student table (StudentID int, StudentName nvarchar(50), DateOfBirth date)

				insert into @table_student(StudentID, StudentName, DateOfBirth)
				select ID, FirstName + N'' + LastName, DateOfBirth
				from Student
				where Gender = 'F'
				select *
				from @table_student


--03.Declare temp table that will contain LastName and EnrolledDate columns
--		Fill the temp table with all Male students having First Name starting with ‘A’
--		Retrieve the students from the table which last name is with 7 characters
				
				create table #StudentList
				(LastName nvarchar(50), EnrolledDate date);

				insert into #StudentList
				select LastName, EnrolledDate
				from dbo.Student
				where Gender = 'M'

				select *
				from #StudentList
				where len(LastName) = 7
				order by EnrolledDate
							   				 
--04.Find all teachers whose FirstName length is less than 5 characters and the first 3 characters of their FirstName and LastName are the same
				
				create table #TeacherName
				(FirstName nvarchar(50), LastName nvarchar(50));

				insert into #TeacherName
				select FirstName, LastName
				from dbo.Teacher

				select *
				from #TeacherName
				where SUBSTRING(FirstName, 1, 3) = SUBSTRING(LastName, 1, 3) and len(FirstName) < 5
				

