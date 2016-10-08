CREATE DATABASE MySoftUni

USE MySoftUni

CREATE TABLE Town
(
ID int NOT NULL IDENTITY(1,1),
name varchar(50) NOT NULL
PRIMARY KEY (ID)
)

INSERT INTO Town
VALUES('Sofia'),('Plovdiv'), ('Varna'), ('Burgas')

CREATE TABLE Addresses 
(
ID int NOT NULL IDENTITY(1,1),
AdressText varchar(50) NOT NULL,
TownId INT FOREIGN KEY REFERENCES Town(Id) NOT NULL,
PRIMARY KEY (ID)
)

INSERT INTO Addresses
VALUES('Somewhere in Sofia', 1),('Somewhere in  Plovdiv', 2), ('Somewhere in  Varna', 3), ('Somewhere in Burgas', 4)

CREATE TABLE Departments  
(
ID int NOT NULL IDENTITY(1,1),
name varchar(50) NOT NULL
PRIMARY KEY (ID)
)

INSERT INTO Departments
VALUES('Engineering'),('Sales'), ('Marketing'), ('Software Development'), ('Quality Assurance')



CREATE TABLE Employees   
(
ID int NOT NULL IDENTITY(1,1),
FirstName varchar(50) NOT NULL,
MiddleName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
JobTitle varchar(50) NOT NULL,
DepartmentId INT FOREIGN KEY REFERENCES Departments(Id) NOT NULL,
HireDate DateTime DEFAULT GetDate() NULL,
Salary FLOAT NOT NULL,
AddressId INT FOREIGN KEY REFERENCES Addresses(Id) NULL,
PRIMARY KEY (ID)
)	

INSERT INTO Employees
VALUES('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, 01-02-2013, 3500.00, NULL),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, 02-03-2004, 4000.00, NULL),
('Maria', 'Petrova ', 'Ivanova ', 'Intern', 5, 28-08-2016, 525.25, NULL),
('Georgi', 'Teziev', 'Ivanov', 'CEO', 2, 09-12-2007, 3000.00, NULL),
('Peter', 'Pan', 'Pan', 'Intern', 3, 28-08-2016, 599.88, NULL)

TRUNCATE TABLE Town

SELECT Name FROM Towns ORDER BY name
SELECT Name FROM Departments ORDER BY name
SELECT FirstName, LastName, JobTitle, Salary FROM Employees ORDER BY  Salary DESC

UPDATE Employees 
SET Salary*=1.1
SELECT Salary FROM Employees