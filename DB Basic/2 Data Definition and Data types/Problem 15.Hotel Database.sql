create database Hotel
CREATE TABLE Employees (
  ID int IDENTITY NOT NULL PRIMARY KEY,
  FirstName nvarchar(50) NOT NULL,
  LastName nvarchar(50) NOT NULL,
  Title nvarchar(50) NOT NULL,
  Notes nvarchar(max) NULL,
)

SET IDENTITY_INSERT Employees ON
INSERT INTO Employees (Id, FirstName, LastName, Title, Notes)
VALUES (1, 'Pesho', 'Peshev', 'Mechanic', NULL), (2, 'Ivo', 'Ivanov', 'Manager', NULL), (3, 'Gani', 'Ganev', 'Cleaner', 'Some cleaner info')
SET IDENTITY_INSERT Employees  OFF

CREATE TABLE Customers (
  ID int IDENTITY NOT NULL,
  AccountNumber int NOT NULL,
  FirstName nvarchar(50) NOT NULL,
  LastName nvarchar(50) NOT NULL,
  PhoneNumber nvarchar(50),
  EmergencyName nvarchar(50) NOT NULL,
  EmergencyNumber INT NOT NULL,
  Notes nvarchar(max) NULL,
  PRIMARY KEY (ID)
)
SET IDENTITY_INSERT Customers ON
INSERT INTO Customers (Id, AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
VALUES (1, 123, 'Mara',' Mareva', 123456432, 'fl.5', 5000, 'asdedc'), 
(2, 123, 'Mara',' Mareva', 123456432, 'fl.5', 5000, 'asdedc'), 
(3, 123, 'Mara',' Mareva', 123456432, 'fl.5', 5000, 'asdedc')
SET IDENTITY_INSERT Customers  OFF

CREATE TABLE RoomStatus (
  ID INT IDENTITY NOT NULL,
  RoomStatus BIT NOT NULL,
  Notes NVARCHAR(max) NULL,
  PRIMARY KEY (ID)
)

SET IDENTITY_INSERT RoomStatus ON
INSERT INTO RoomStatus (Id, RoomStatus, Notes)
VALUES (1, 0, 'Mara Marevaasdedc'), 
(2, 1, 'Iskra Iskrova asdedc'), 
(3, 1, 'Mara Mareva dffzed sdfs')
SET IDENTITY_INSERT RoomStatus  OFF

CREATE TABLE RoomTypes (
  ID INT IDENTITY NOT NULL,
  RoomType NVARCHAR(50) NOT NULL,
  Notes NVARCHAR (max) NULL,
  PRIMARY KEY (ID)
)

SET IDENTITY_INSERT RoomTypes ON
INSERT INTO RoomTypes (Id, RoomType, Notes)
VALUES (1, 'losha rabota', 'Mara Marevaasdedc'), 
(2, 'biva', 'Iskra Iskrova asdedc'), 
(3, 'excelent', 'Mara Mareva dffzed sdfs')
SET IDENTITY_INSERT RoomTypes  OFF

CREATE TABLE BedTypes (
  ID INT IDENTITY NOT NULL,
  BedType NVARCHAR(50) NOT NULL,
  Notes NVARCHAR (max) NULL,
  PRIMARY KEY (ID)
)
SET IDENTITY_INSERT BedTypes ON
INSERT INTO BedTypes (Id, BedType, Notes)
VALUES (1, 'type1', 'some notes1'),
(2, 'type2', 'some notes2'),
(3, 'type3', 'some notes3')
SET IDENTITY_INSERT BedTypes  OFF

CREATE TABLE Rooms (
  ID INT IDENTITY NOT NULL,
  RoomNumber INT NOT NULL,
  RoomType INT NOT NULL,
  BedType INT NOT NULL,
  Rate INT NOT NULL,
  RoomStatus INT NOT NULL,
  Notes NVARCHAR (max) NULL,
  PRIMARY KEY (ID)
)
SET IDENTITY_INSERT Rooms ON
INSERT INTO Rooms (Id, RoomNumber, RoomType, BedType, Rate, RoomStatus, Notes)
VALUES (1, 1, 1, 1, 6, 1, 'Room note'),
(2, 2, 2, 2, 5, 2, 'Room note'),
(3, 3, 3, 3, 5, 3, 'Room note')
SET IDENTITY_INSERT Rooms  OFF

CREATE TABLE Payments  (
  ID INT IDENTITY NOT NULL,
  EmployeeId INT NOT NULL,
  PaymentDate DATETIME NOT NULL,
  AccountNumber INT NOT NULL,
  FirstDateOccupied DATETIME NOT NULL,
  LastDateOccupied DATETIME NOT NULL,
  TotalDays as (datediff(day,[FirstDateOccupied],[LastDateOccupied])),
  AmountCharged MONEY NOT NULL,
  TaxRate FLOAT null, 
  TaxAmount as AmountCharged*TaxRate,
  PaymentTotal as AmountCharged+AmountCharged*TaxRate/100,
  Notes NVARCHAR (max) NULL,
  PRIMARY KEY (ID),
)
SET IDENTITY_INSERT Payments ON
INSERT INTO Payments (Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, 
 AmountCharged, TaxRate, Notes)
VALUES (1, 1, 2016-09-28, 432556, GetDate(),GetDate(),  100, 0.2, 'Room note'),
(2, 2, 2016-09-28, 12221, GetDate(),GetDate(),  200, 0.3, 'Room note'),
(3, 3, 2016-09-28, 22442, GetDate(),GetDate(),  300, 0.4, 'Room note')
SET IDENTITY_INSERT Payments  OFF

CREATE TABLE Occupancies (
Id INT NOT NULL PRIMARY KEY,
EmployeeId INT NOT NULL, 
DateOccupied DATE NOT NULL, 
AccountNumber INT NOT NULL, 
RoomNumber INT NOT NULL, 
RateApplied FLOAT,
PhoneCharge BIT  NOT NULL, 
Notes VARCHAR(MAX)
)

INSERT INTO Occupancies 
VALUES (1, 1, GETDATE(), 9983, 101, 4, 0, 'Offff'),
(2, 2, 2016-09-29, 9983, 432, 4, 0, 'Adre vlak do tire'),
(3, 3, 2015-09-29, 7654, 222, 1, 1, 'Xom rodentori chetronika startuni forum')