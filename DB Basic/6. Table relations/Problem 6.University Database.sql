CREATE DATABASE TableRelationsDemo
USE TableRelationsDemo
GO

CREATE TABLE Majors (
MajorID INT Primary KEY,
Name NVARCHAR(50)
)

CREATE TABLE Students (
StudentID INT Primary KEY,
StudentNumber NVARCHAR(50),
StudentName NVARCHAR(50),
MajorID INT,
CONSTRAINT FK_Students_Majors FOREIGN KEY(MajorID)
	REFERENCES Majors(MajorID)
)

CREATE TABLE Payments (
PaymentID INT Primary KEY,
PaymentDate DATE,
PaymantAmount DECIMAL(10,2),
StudentID INT,
CONSTRAINT FK_Payments_Students FOREIGN KEY(StudentID)
	REFERENCES Students(StudentID)
)

CREATE TABLE Subjects (
SubjectID INT Primary KEY,
Name NVARCHAR(50)
)

CREATE TABLE Agenda (
StudentID INT,
SubjectID INT,
CONSTRAINT PK_Agenda_Students_Subjects PRIMARY KEY(StudentID,SubjectID), 
CONSTRAINT FK_Agenda_Students FOREIGN KEY(StudentID)
		REFERENCES Students(StudentID),
CONSTRAINT FK_Agenda_Subjects FOREIGN KEY(SubjectID)
		REFERENCES Subjects(SubjectID)
)