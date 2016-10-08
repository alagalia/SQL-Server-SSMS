CREATE DATABASE CarRental 


CREATE TABLE Categories (
  ID int IDENTITY NOT NULL,
  Category NVARCHAR(50) NOT NULL,
  DailyRate float NOT NULL,
  WeeklyRate float NOT NULL,
  MonthlyRate float NOT NULL,
  WeekendRate float NOT NULL,
  PRIMARY KEY (ID)
)
GO