--01.Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200

				select TeacherID, count(Grade) as grade_count
				from Grade 
				group by TeacherID
				having count(Grade) > 200
				go

--02.Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count
								
				select TeacherID, count(Grade) as grade_count
				from Grade
				where StudentID < 100
				group by TeacherID
				having count(Grade) > 50
				order by grade_count
				go

--03.Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
--Filter only records where Maximal Grade is equal to Average Grade

				select studentID, count(Grade) as grade_count ,max(Grade) as max_grade, avg(cast(grade as decimal)) as average_grade
				from Grade
				group by StudentID
				having max(Grade) = avg(cast(Grade as decimal))
				order by max_grade
				go

--04.List Student First Name and Last Name next to the other details from previous query

				select g.studentID, s.FirstName, s.LastName, count(g.Grade) as grade_count ,max(g.Grade) as max_grade, avg(cast(g.Grade as decimal)) as average_grade
				from Grade as g
				inner join Student as s on g.StudentID = s.ID
				group by StudentID, s.FirstName, s.LastName
				having max(Grade) = avg(cast(Grade as decimal))
				order by max_grade
				go