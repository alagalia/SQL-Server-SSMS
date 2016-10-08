USE TableRelationsDemo
GO

CREATE TABLE Students (
StudentID INT Primary KEY,
Name VARCHAR(50)
)

CREATE TABLE Exams (
ExamID INT Primary KEY,
Name VARCHAR(50)
)

CREATE TABLE StudentsExams (
StudentID INT,
ExamID INT,
CONSTRAINT PK_StudentsExams_Students_Exams PRIMARY KEY(StudentID, ExamID),
CONSTRAINT FK_StudentExams_Students FOREIGN KEY(StudentID) REFERENCES  Students(StudentID),
CONSTRAINT FK_StudentExams_Exams FOREIGN KEY(ExamID) REFERENCES  Exams(ExamID)
)

INSERT INTO Students
VALUES (1, 'Mila'),
	   (2,'Toni'),
	   (3,'Ron')

INSERT INTO Exams
VALUES (101, 'Spring MVC'),
	   (102,'Neo4j'),
	   (103,'Oracle 11g')

INSERT INTO StudentsExams
VALUES (1,101),
	   (1,102),
	   (2,101),
	   (3,103),
	   (2,102),
	   (2,103)