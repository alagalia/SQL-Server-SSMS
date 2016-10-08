CREATE DATABASE Movies

USE [Movies]

CREATE TABLE Directors (
  ID int IDENTITY NOT NULL,
  DirectorName NVARCHAR(50) NOT NULL,
  Notes text NULL
  PRIMARY KEY (ID)
)

CREATE TABLE Genres (
  ID int IDENTITY NOT NULL,
  GenreName NVARCHAR(50) NOT NULL,
  Notes text NULL
  PRIMARY KEY (ID)
)

CREATE TABLE Categories (
  ID int IDENTITY NOT NULL,
  CategoryName NVARCHAR(50) NOT NULL,
  Notes text NULL
  PRIMARY KEY (ID)
)

CREATE TABLE Movies (
  ID int IDENTITY NOT NULL,
  Title NVARCHAR(50) NOT NULL,
  DirectorId INT NOT NULL,
  CopyrightYear DATE NULL,
  Lenght FLOAT NOT NULL,
  GenreId INT NOT NULL,
  CategoryId INT NOT NULL,
  Rating float NOT NULL,
  Notes text NOT NULL
  PRIMARY KEY (ID)
)

SET IDENTITY_INSERT Directors ON
INSERT INTO Directors (ID, DirectorName, Notes)
VALUES 
(1, 'Zoro Men', NULL),
(2, 'BBBB', 'Some notes for director BBBB'),
(3, 'CCCC', 'Some notes for director CCCC'),
(4, 'DDDD', 'Some notes for director DDDD'),
(5, 'EEEE', 'Some notes for director EEEE')
SET IDENTITY_INSERT Directors OFF

SET IDENTITY_INSERT Genres ON
INSERT INTO Genres (ID, GenreName, Notes)
VALUES 
(1, 'Drama', NULL),
(2, 'Commendy', 'Some notes for director Commendy'),
(3, 'Action', 'Some notes for director Action'),
(4, 'Si-Fi', 'Some notes for director Si-Fi'),
(5, 'Musical', 'Some notes for director Musical')
SET IDENTITY_INSERT Genres OFF

SET IDENTITY_INSERT Categories ON
INSERT INTO Categories (ID, CategoryName, Notes)
VALUES 
(1, 'Over 18', NULL),
(2, 'Kids', 'Some Kids'),
(3, 'Adult', 'Some Adult'),
(4, 'No restrictions', 'Some ....'),
(5, 'Men Women only', 'Some notes this')
SET IDENTITY_INSERT Categories OFF

SET IDENTITY_INSERT Movies ON
INSERT INTO Movies (ID, Title, DirectorId, CopyrightYear, Lenght, GenreId, CategoryId, Rating, Notes )
VALUES 
(1, 'One',  5, Getdate(), 3.4, 5, 5, 5.6, 'some info for One' ),
(2, 'Two', 4, Getdate(), 4.4, 4, 4, 4.6, 'some info for two'),
(3, 'Three', 3, Getdate(), 3.3, 3, 3, 3.6, 'some info for Three'),
(4, 'Four',  2, Getdate(), 2.2, 2, 2, 2, 'some info for Four'),
(5, 'Five',  1, Getdate(), 6, 1, 1, 6, 'some info for Four')
SET IDENTITY_INSERT Movies OFF
