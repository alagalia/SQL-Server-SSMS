CREATE DATABASE TableRelationsDemo

USE TableRelationsDemo
GO

CREATE TABLE Passports (
PassportID INT Primary KEY,
PassportNumber VARCHAR(50)
)

CREATE TABLE Persons (
PersonID INT PRIMARY KEY,
FirstName	VARCHAR(50),
Salary DECIMAL(10,2),
PassportID INT UNIQUE,
CONSTRAINT FK_Person_Passport FOREIGN KEY(PassportId)
	REFERENCES Passports(PassportId)
)

INSERT INTO Passports
VALUES (101,'N34FG21B'),(102,'K65LO4R7'),(103,'ZE657QP2')

INSERT INTO Persons
VALUES (1, 	'Roberto', 43300.00,102),
		(2,'Tom',56100.00, 103),
		(3,'Yana',60200.00,	101)
