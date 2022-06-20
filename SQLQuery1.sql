CREATE DATABASE Academy

USE Academy

CREATE TABLE [Group]
(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(255) UNIQUE
)

CREATE TABLE Students
(
Id int PRIMARY KEY IDENTITY,
Name nvarchar(255),
Surname nvarchar(255),
GroupId int FOREIGN KEY REFERENCES [Group](Id)
)

ALTER TABLE Students ADD Grade int

INSERT INTO [Group] VALUES
('P129'),
('P124'),
('P221')

INSERT INTO Students VALUES
(
	'Onur','Ismailov',1,70
),
(
	'Ismail','Jabbarli',1,80
),
(
	'Yamil','Layicov',1,60
),
(
	'Vusal','Imanov',3,90
)

SELECT g.Name, COUNT(*) FROM [Group]g  JOIN Students s On s.GroupId=g.Id Group By g.Name

CREATE VIEW usv_GetData
AS
SELECT s.name,s.Surname,g.Name 'GroupName',s.Grade FROM STUDENTS s JOIN [Group] g On g.Id=s.GroupId

CREATE PROCEDURE usp_GetGrade
As
@grade
Begin
SELECT * FROM Students s WHERE @grade>s.Grade
End

CREATE FUNCTION ReturnCount
@name 
AS
BEGIN
SELECT * FROM [Group] g WHERE g.Name Like '@name' Group By Students s Having g.id=s.GroupId
END



