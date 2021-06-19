--Create Foreign key constraints from diagram or with script

alter table [dbo].[Grade] with check add constraint[fk_Grade_Student] foreign key ([StudentID])
references [dbo].[Student]([ID])
go 

alter table [dbo].[Grade] with check add constraint [fk_Grade_Teacher] foreign key ([TeacherID]) 
references [dbo].[Teacher] ([ID])
go 

alter table [dbo].[Grade] with check add constraint [fk_Grade_Course] foreign key ([CourseID])
references [dbo].[Course] ([ID])
go 

alter table [dbo].[GradeDetails] with check add constraint [fk_GradeDetails_AchievementType] foreign key ([AchievementTypeID])
references [dbo].[AchievementType] ([ID])
go 

alter table [dbo].[GradeDetails] with check add constraint [fk_GradeDetails_Grade] foreign key ([GradeID])
references [dbo].[Grade] ([ID])
go 