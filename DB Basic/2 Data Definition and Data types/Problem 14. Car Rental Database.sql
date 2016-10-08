use CarRental 
CREATE TABLE Categories (
  ID int IDENTITY NOT NULL,
  Category NVARCHAR(50) NOT NULL,
  DailyRate float NOT NULL,
  WeeklyRate float NOT NULL,
  MonthlyRate float NOT NULL,
  WeekendRate float NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE Cars (
  ID int IDENTITY NOT NULL,
  PlateNumber INT NOT NULL,
  Make DateTime NOT NULL,
  Model varchar(50) NOT NULL,
  CarYear char(4) NOT NULL,
  CategoryId int NOT NULL,
  Doors int NOT NULL,
  Picture varbinary(max) NULL,
  Condition bit NOT NULL,
  Available bit NOT NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE Employees  (
  ID int IDENTITY NOT NULL,
  FirstName nvarchar(50) NOT NULL,
  LastName nvarchar(50) NOT NULL,
  Title nvarchar(50) NOT NULL,
  Notes nvarchar(max) NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE Customers   (
  ID int IDENTITY NOT NULL,
  DriverLicenceNumber int NOT NULL,
  FullName nvarchar(50) NOT NULL,
  Address nvarchar(50) NOT NULL,
  City nvarchar(50)NOT NULL,
  ZIPCode int NOT NULL,
  Notes nvarchar(max) NULL,
  PRIMARY KEY (ID)
)

CREATE TABLE RentalOrders  (
  ID int IDENTITY NOT NULL,
  EmployeeId int NOT NULL,
  CustomerId int NOT NULL,
  CarId int NOT NULL,
  CarCondition bit NOT NULL,
  TankLevel int NOT NULL,
  KilometrageStart int NOT NULL,
  KilometrageEnd int NOT NULL,
  TotalKilometrage int NOT NULL,
  StartDate DateTime NOT NULL,
  EndDate DateTime NOT NULL,
  TotalDays int NOT NULL,
  RateApplied int NOT NULL,
  TaxRate int NOT NULL,
  OrderStatus int NOT NULL,
  Notes nvarchar(max) NULL,
  PRIMARY KEY (ID)
)

SET IDENTITY_INSERT Employees ON
INSERT INTO Employees (Id, FirstName, LastName, Title, Notes)
VALUES (1, 'Pesho', 'Peshev', 'Mechanic', NULL), (2, 'Ivo', 'Ivanov', 'Manager', NULL), (3, 'Gani', 'Ganev', 'Cleaner', 'Some cleaner info')
SET IDENTITY_INSERT Employees  OFF

SET IDENTITY_INSERT Categories  ON
INSERT INTO Categories (Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES (1, 'A+', 1.1, 2.2, 2.2, 1), (2, 'B+', 5.1, 5.2, 5.2, 5), (3, 'C+', 7.1, 7.2, 7.2, 7)
SET IDENTITY_INSERT Categories  OFF

SET IDENTITY_INSERT Cars  ON
INSERT INTO Cars (Id, PlateNumber, Make, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES 
(1, 44444, GetDate(), 'BMW', '2015', 3, 4, NULL, 1, 1), 
(2, 66666, GetDate(), 'Lada', '1978', 1, 5, NULL, 0, 0), 
(3, 58394, GetDate(), 'ZAZ', '1974', 2, 2, NULL, 1, 0)
SET IDENTITY_INSERT Cars  OFF

SET IDENTITY_INSERT Customers ON
INSERT INTO Customers (Id, DriverLicenceNumber, FullName, Address, City, ZIPCode, Notes)
VALUES (1, 123, 'Mara Mareva', '123 str, fl.5', 'Sofia', 5000, 'asdedc'), 
(2, 456, 'Iskra Iskrova', '123 str, fl.5', 'Varna', 9000, 'asdedc'), 
(3, 789, 'Mara Mareva', 'Sokol str, fl.5', 'Plovdiv', 7650, 'dffzed sdfs')
SET IDENTITY_INSERT Customers  OFF

SET IDENTITY_INSERT RentalOrders  ON
INSERT INTO RentalOrders (Id, EmployeeId, CustomerId, CarId, CarCondition, TankLevel, 
KilometrageStart, KilometrageEnd, TotalKilometrage, StartDate, EndDate, TotalDays, RateApplied, TaxRate, OrderStatus, Notes)
VALUES 
(1, 1, 1, 2, 0, 10, 103002, 104002, 100000, GetDate(),GetDate(),10, 6, 6, 0,'Adfcvdz zsdkd deiiidk dkridk'), 
(2, 1, 1, 2, 0, 10, 33333333, 44444, 100000, GetDate(),GetDate(),10, 6, 6, 0,'Yjdmmd dd 2342 iiidk dkridk'), 
(3, 1, 1, 2, 0, 10, 33333333, 44444, 100000, GetDate(),GetDate(),10, 6, 6, 0,'Dfdidk dkridk')
SET IDENTITY_INSERT RentalOrders  OFF
