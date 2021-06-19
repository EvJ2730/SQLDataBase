--03.
--List all Teacher First Names and Student First Names in single result set with duplicates
--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
--List all common First Names for Teachers and Students



select FirstName
from Teacher
union all
select FirstName
from Student
go

select LastName
from Teacher
union 
select LastName
from Student
go

select LastName
from Teacher
except
select LastName
from Student
go

select FirstName
from Teacher
intersect 
select FirstName
from Student
go