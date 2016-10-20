--Section 1: Data Definition---
----------------------------------------


CREATE TABLE Flights (
FlightID INT PRIMARY KEY,
DepartureTime DATETIME NOT NULL,
ArrivalTime DATETIME NOT NULL,
[Status] VARCHAR(9) 
CHECK ([Status] IN ('Departing', 'Delayed', 'Arrived', 'Cancelled')),
OriginAirportID INT, 
DestinationAirportID INT, 
AirlineID INT,
CONSTRAINT FK_Flights_OriginAirports FOREIGN KEY (OriginAirportID)
	REFERENCES [dbo].[Airports](AirportID),
CONSTRAINT FK_Flights_DestinationAirports FOREIGN KEY (DestinationAirportID)
	REFERENCES [dbo].[Airports](AirportID),
CONSTRAINT FK_Flights_Airlines FOREIGN KEY (AirlineID)
	REFERENCES [dbo].[Airlines](AirlineID)
)

CREATE TABLE Tickets (
TicketID INT PRIMARY KEY,
Price DECIMAL(8,2) NOT NULL,
Class VARCHAR(6) 
CHECK (Class IN ('First', 'Second', 'Third')),
Seat VARCHAR(5) NOT NULL,
CustomerID INT,
FlightID INT,
CONSTRAINT FK_Tickets_Customers FOREIGN KEY(CustomerID)
	REFERENCES [dbo].[Customers](CustomerID),
CONSTRAINT FK_Tickets_Flights FOREIGN KEY(FlightID)
	REFERENCES [dbo].[Flights](FlightID)
)

---Section 2: Database Manipulations----
---------------------------------------


---Task 1: Data Insertion---
INSERT INTO [dbo].[Flights] (
	   [FlightID]
      ,[DepartureTime]
      ,[ArrivalTime]
      ,[Status]
      ,[OriginAirportID]
      ,[DestinationAirportID]
      ,[AirlineID]
	  )
VALUES 
(1,	'2016-10-13 06:00 AM', '2016-10-13 10:00 AM',	'Delayed', 1, 4, 1),
(2,	'2016-10-12 12:00 PM', '2016-10-12 12:01 PM',	'Departing', 1,	3, 2),
(3, '2016-10-14 03:00 PM', '2016-10-20 04:00 AM',	'Delayed', 4, 2, 4),
(4, '2016-10-12 01:24 PM', '2016-10-12 4:31 PM',	'Departing', 3,	1, 3),
(5, '2016-10-12 08:11 AM', '2016-10-12 11:22 PM',	'Departing', 4,	1, 1),
(6, '1995-06-21 12:30 PM', '1995-06-22 08:30 PM',	'Arrived',	2,	3, 5),
(7, '2016-10-12 11:34 PM', '2016-10-13 03:00 AM',	'Departing', 2,	4, 2),
(8, '2016-11-11 01:00 PM', '2016-11-12 10:00 PM',	'Delayed', 4, 3, 1),
(9, '2015-10-01 12:00 PM', '2015-12-01 01:00 AM',	'Arrived', 1,2,	1),
(10, '2016-10-12 07:30 PM', '2016-10-13 12:30 PM',	'Departing', 2,1,7)


INSERT INTO [dbo].[Tickets] (
	   [TicketID]
      ,[Price]
      ,[Class]
      ,[Seat]
      ,[CustomerID]
      ,[FlightID]
	  )
VALUES 
(1,	3000.00, 'First', '233-A', 3, 8),
(2,	1799.90	,'Second', '123-D',	1,	1),
(3,	1200.50	,'Second', '12-Z', 2,	5),
(4,	410.68	,'Third', '45-Q', 2,	8),
(5,	560.00	,'Third', '201-R', 4,	6),
(6,	2100.00	,'Second', '13-T', 1,	9),
(7,	5500.00	,'First', '98-O', 2,	7)

---Task 2: Update Arrived Flights
UPDATE [dbo].[Flights]
   SET AirlineID = 1
   WHERE Status = 'Arrived'

 ----Task 3: Update Tickets

UPDATE [dbo].[Tickets] 
   SET 
		Price += Price/2
   FROM	
		[dbo].[Tickets] AS t
		JOIN [dbo].[Flights] AS f
		ON t.FlightID = f.FlightID
		JOIN [dbo].[Airlines] AS a
		ON f.AirlineID = a.AirlineID
  WHERE a.Rating =  (SELECT MAX(Rating) FROM [dbo].[Airlines])

  ---- Task 4: Table Creation

CREATE TABLE CustomerReviews (
ReviewID INT PRIMARY KEY,
ReviewContent VARCHAR(255) NOT NULL,
ReviewGrade INT CHECK (ReviewGrade BETWEEN 0 AND 10),
AirlineID INT,
CustomerID INT,
CONSTRAINT FK_CustomerReviews_Airlines FOREIGN KEY(AirlineID)
	REFERENCES [dbo].[Airlines](AirlineID),
CONSTRAINT FK_CustomerReviews_Customers FOREIGN KEY(CustomerID)
	REFERENCES [dbo].[Customers](CustomerID)
)

CREATE TABLE CustomerBankAccounts(
AccountID INT PRIMARY KEY,
AccountNumber VARCHAR(10) NOT NULL UNIQUE,
Balance DECIMAL (10,2) NOT NULL,
CustomerID INT,
CONSTRAINT FK_CustomerBankAccounts_Customers FOREIGN KEY (CustomerID)
	REFERENCES [dbo].[Customers](CustomerID)
)

------Task 5: Fill the new Tables with Data

INSERT INTO [dbo].[CustomerReviews]
VALUES 
(1,'Me is very happy. Me likey this airline. Me good.',10,1,1),
(2,'Ja, Ja, Ja… Ja, Gut, Gut, Ja Gut! Sehr Gut!',10,1,4),
(3,'Meh...',5,4,3),
(4,'Well I`ve seen better, but I`ve certainly seen a lot worse...',7,3,5)

INSERT INTO [dbo].[CustomerBankAccounts]
VALUES
(1,	'123456790', 2569.23, 1),
(2,	'18ABC23672', 14004568.23, 2),
(3,	'F0RG0100N3', 19345.20, 5)


------------------------------------------- 
----------Section 3: Querying-----------------------

---Task 1: Extract All Tickets
SELECT t.TicketID, t.Price, t.Class, t.Seat
  FROM [dbo].[Tickets] AS t
 ORDER BY t.TicketID ASC

 ----Task 2: Extract All Customers 
SELECT c.CustomerID, c.FirstName + ' ' + c.LastName AS [FullName], c.Gender
  FROM [dbo].[Customers] AS c
ORDER BY [FullName], c.CustomerID ASC

--!!!---- Task 3: Extract Delayed Flights 
SELECT f.FlightID, f.DepartureTime, f.ArrivalTime 
 FROM [dbo].[Flights] as f 
 WHERE f.Status = 'Delayed'
 ORDER BY f.FlightID ASC

--!!! ----Task 4: Extract Top 5 Most Highly Rated Airlines which have any Flights
 SELECT DISTINCT TOP 5 e.* FROM [dbo].[Airlines] AS e
	JOIN [dbo].[Flights] as f
	ON e.AirlineID = f.AirlineID
 ORDER BY e.Rating DESC, e.AirlineID ASC

--!!!--Task 5: Extract all Tickets with price below 5000, for First Class
 SELECT t.TicketID, a.AirportName AS [Destination], c.FirstName + ' ' + c.LastName AS [CustomerName]
   FROM
		 [dbo].[Tickets] AS t
		 INNER JOIN [dbo].[Flights] AS f
		 ON t.FlightID = f.FlightID
		 INNER JOIN [dbo].[Airports] AS a
		 ON f.DestinationAirportID = a.AirportID
		 INNER JOIN [dbo].[Customers] AS c
		 ON t.CustomerID = c.CustomerID		 
	WHERE t.Price < 5000 AND t.Class = 'First'
ORDER BY t.TicketID ASC

--!!!-- Task 6: Extract all Customers which are departing from their Home Town
SELECT DISTINCT c.CustomerID, 
			   c.FirstName + ' ' + c.LastName AS [FullName],
			   t.TownName as [HomeTown]
  FROM [dbo].[Customers] AS c
 INNER JOIN [dbo].[Towns] AS t
    ON c.HomeTownID = t.TownID
 INNER JOIN [dbo].[Tickets] as tic
    ON tic.CustomerID = c.CustomerID
 INNER JOIN [dbo].[Flights] AS f
    ON tic.FlightID = f.FlightID
 INNER JOIN [dbo].[Airports] as a
    ON a.AirportID = f.OriginAirportID
 INNER JOIN [dbo].[Towns] as airportTown
    ON a.TownID = airportTown.TownID
WHERE a.TownID = c.HomeTownID
ORDER BY c.CustomerID ASC

--!!!---Task 7: Extract all Customers which will fly

SELECT DISTINCT c.CustomerID, 
				c.FirstName + ' ' + c.LastName AS [FullName], 
				DATEDIFF (year, c.DateOfBirth, '2016-01-01') AS [Age]
	FROM [dbo].[Customers] AS c
   INNER JOIN [dbo].[Tickets] AS tic
	  ON c.CustomerID = tic.CustomerID
   INNER JOIN [dbo].[Flights] as f
	  ON tic.FlightID = f.FlightID
WHERE f.Status = 'Departing'
ORDER BY [Age] ASC , c.CustomerID ASC

----- Task 8: Extract Top 3 Customers which have Delayed Flights
SELECT DISTINCT TOP 3 
       c.CustomerID,
	   c.FirstName + ' ' + c.LastName AS [FullName],
	   tic.Price AS [TicketPrice],
	   air.AirportName AS [Destination]
	FROM [dbo].[Customers] AS c
   INNER JOIN [dbo].[Tickets] as tic
	  ON tic.CustomerID = c.CustomerID
   INNER JOIN [dbo].[Flights] as f
	  ON f.FlightID = tic.FlightID
   INNER JOIN [dbo].[Airports] as air
	  ON air.AirportID = f.DestinationAirportID
WHERE f.Status = 'Delayed'
ORDER BY tic.Price DESC, c.CustomerID ASC

--!!!--- Task 9: Extract the Last 5 Flights, which are departing.

SELECT TOP 5 
		f.FlightID, 
		f.DepartureTime, 
		f.ArrivalTime, 
		orignAirport.AirportName AS [Origin],  
		destinAirport.AirportName AS [Destination]
	FROM [dbo].[Flights] AS f
   INNER JOIN [dbo].[Airports] AS orignAirport
      ON orignAirport.AirportID = f.OriginAirportID
   INNER JOIN [dbo].[Airports] AS destinAirport 
      ON destinAirport.AirportID = f.DestinationAirportID
WHERE f.Status = 'Departing'
ORDER BY f.DepartureTime ASC, f.FlightID ASC 

---!!!--Task 10: Extract all Customers below 21 years, which have already flew at least once

SELECT cus.CustomerID,
	   cus.FirstName + ' ' + cus.LastName AS [FullName],
	   DATEDIFF(year, cus.DateOfBirth, '2016-01-01') AS [Age]
  FROM [dbo].[Customers] AS cus
  JOIN [dbo].[Tickets] AS tic
  ON tic.CustomerID = cus.CustomerID
  JOIN [dbo].[Flights] AS f
  ON tic.FlightID = f.FlightID
WHERE f.Status = 'Arrived' AND DATEDIFF(year, cus.DateOfBirth, '2016-01-01') < 21
ORDER BY [Age] DESC, cus.CustomerID ASC

--!!!-Task 11: Extract all Airports and the Count of People departing from them
 SELECT f.OriginAirportID AS AirportID,
		air.AirportName,
		COUNT(f.OriginAirportID) AS Passengers
   FROM [dbo].[Flights] AS f
  INNER JOIN [dbo].[Airports] AS air
     ON f.OriginAirportID = air.AirportID
  WHERE f.Status='Departing'
  GROUP BY f.OriginAirportID,air.AirportName
  ORDER BY f.OriginAirportID ASC


-------------------------- -------------
---Section 4: Programmability--------

--Task 1: Review Registering Procedure
CREATE PROCEDURE usp_SubmitReview(@CustomerID INT,
								  @ReviewContent VARCHAR(255),
								  @ReviewGrade INT,
								  @AirlineName VARCHAR(30))
AS
BEGIN
DECLARE @AirlineID INT =(SELECT a.AirlineID 
				  FROM [dbo].[Airlines] AS a
				 WHERE a.AirlineName=@AirlineName)
	BEGIN TRAN
	INSERT [dbo].[CustomerReviews] (CustomerID, ReviewContent, ReviewGrade, AirlineID)
	VALUES (@CustomerID, @ReviewContent, @ReviewGrade, @AirlineID) 
	IF (@AirlineID NOT BETWEEN 1 AND 7)
	BEGIN
			RAISERROR('Airline does not exist.',16,1)
			ROLLBACK
			RETURN
	END
			COMMIT;
END

--!!!-Task 2: Ticket Purchase Procedure

CREATE PROCEDURE usp_PurchaseTicket 
(@CustomerID INT, @FlightID INT, @TicketPrice DECIMAL(8,2), @Class VARCHAR(6), @Seat VARCHAR(5))   
AS
BEGIN 
	DECLARE @CustomerBalance DECIMAL (8,2) = (
							SELECT acc.Balance FROM  [dbo].[CustomerBankAccounts] as acc
							WHERE acc.CustomerID = @CustomerID) 
	DECLARE @TicketID INT = (SELECT COUNT(*) FROM [dbo].[Tickets]) + 1

	BEGIN TRAN
    INSERT INTO [dbo].[Tickets](
							TicketID, 
							Price,
							Class,
							Seat, 
							CustomerID, 
							FlightID)
    VALUES (@TicketID, @TicketPrice, @Class, @Seat, @CustomerID, @FlightID)
    IF (@TicketPrice > @CustomerBalance)
    BEGIN
            RAISERROR('Insufficient bank account balance for ticket purchase.',16,1)
            ROLLBACK
            RETURN
    END
        UPDATE CustomerBankAccounts
        SET Balance=Balance-@TicketPrice
        WHERE CustomerID=@CustomerID
    COMMIT;
END


