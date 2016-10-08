DELETE FROM Towns;

DBCC CHECKIDENT (Towns, RESEED, 0)
GO

-------------- Problem 4.	Insert Records in Both Tables-----------------------

USE Minions

SET IDENTITY_INSERT [Minions].[dbo].[Towns] ON
INSERT INTO Towns (Id, Name)
VALUES (1, 'Sofia'), (2, 'Plovdiv'), (3, 'Varna')
SET IDENTITY_INSERT Towns OFF

SET IDENTITY_INSERT [Minions].[dbo].[Minions] ON
INSERT INTO Minions (Id, Name, Age, TownID)
VALUES (1, 'Kevin', 22, 1), (2, 'Bob', 15, 3), (3, 'Steward', NULL, 2)
SET IDENTITY_INSERT [Minions].[dbo].[Minions] OFF

GO
-------------- Problem 7.	Create Table  -----------------------

--CREATE TABLE People(
--  ID int IDENTITY NOT NULL,
--  Name NVARCHAR(200) NOT NULL,
--  Picture image NULL,
--  Height float NULL,
--  Weight real NULL,
--  Gender bit NOT NULL,
--  Birthdate Date NOT NULL,
--  Biography nvarchar(max) NOT NULL
--  PRIMARY KEY (ID)
--)
--GO

DELETE FROM People;

DBCC CHECKIDENT (People, RESEED, 0)
GO

SET IDENTITY_INSERT [Minions].[dbo].[People] ON

INSERT INTO People (Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES (1, 'Az', NULL, NULL, NULL, 1, Getdate(), 'Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.')

INSERT INTO People (Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES (2, 'Nick', NULL, 2.11, 1.11, 1, Getdate(), 'Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.')

INSERT INTO People (Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES (3, 'Tedy', NULL, 2.11, 1.11, 1, Getdate(), 'Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.')

INSERT INTO People (Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES (4, 'Bucks', NULL, 2.11, 1.11, 1, Getdate(), 'Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.')

INSERT INTO People (Id, Name, Picture, Height, Weight, Gender, Birthdate, Biography)
VALUES (5, 'Zoro', NULL, 2.11, 1.11, 1, Getdate(), 'Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.Some biograpy.')


-------------- Problem 8.	Create Table Users  -----------------------
CREATE TABLE Users(
ID int IDENTITY NOT NULL,
Username varchar(30) NOT NULL,
Password varbinary(26) NOT NULL,
ProfilePicture varbinary(9) NULL,
LastLoginTime date NULL,
IsDeleted bit NOT NULL)

SET IDENTITY_INSERT Users ON
INSERT INTO Users (ID, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES 
(1, 'Zoro Men', 12345, NULL, NULL, 0),
(2, 'BBBB', 12345, NULL, NULL, 0),
(3, 'CCCC', 12345, NULL, NULL, 1),
(4, 'DDDD', 12345, NULL, NULL, 0),
(5, 'EEEE', 12345, NULL, GetDate(), 1)

