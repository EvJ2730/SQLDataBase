--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
				
				create view vv_StudentGrades
				as 
				select StudentID, count(Grade) as grade_count 
				from Grade
				group by StudentID
				go
			
--Change the view to show Student First and Last Names instead of StudentID

				alter view vv_StudentGrades
				as 
				select s.FirstName, s.LastName, count(Grade) as grade_count
				from Grade as g
				inner join Student as s on g.StudentID = s.ID
				group by s.FirstName, s.LastName
				go

--List all rows from view ordered by biggest Grade Count

				select *
				from vv_StudentGrades
				order by grade_count desc
				go

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit)

				drop view if exists vv_StudentGrades;
				go

				create view vv_StudentGradeDetails
				as 
				select s.FirstName+ N'' + s.LastName as student_name, count(g.CourseID) as course_count 
				from Grade as g
				inner join Student as s on g.StudentID = s.ID
				inner join GradeDetails as gd on g.ID = gd.AchievementTypeID
				inner join AchievementType as a on gd.AchievementTypeID = a.ID
				where a.Name = 'Ispit'
				group by s.FirstName, s.LastName

				select * from vv_StudentGradeDetails go


				
