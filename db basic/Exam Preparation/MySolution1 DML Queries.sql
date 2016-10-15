-----------------------
-----Section 2. DML----
-----------------------

--1.	Insert data into the following tables 
INSERT INTO DepositTypes (DepositTypeID, Name)
VALUES 
(1,'Time Deposit'),
(2,'Call Deposit'),
(3,'Free Deposit')


INSERT INTO  [dbo].[Deposits] 
(Amount, StartDate, EndDate, DepositTypeID, CustomerID)
SELECT 
		CASE WHEN c.DateOfBirth > '1980-01-01' THEN 1000
		ELSE 1500
		END
		+ 
		CASE WHEN c.Gender = 'M' THEN 100
		ELSE 200
		END AS Amount,
		GETDATE() AS StartDate,
		NULL AS EndDate,
		CASE 
			WHEN c.CustomerID > 15  THEN 3
			WHEN c.CustomerID % 2 <> 0  THEN 1
			WHEN c.CustomerID % 2 = 0  THEN 2
		END AS DepositTypeID,
		c.CustomerID
   FROM [dbo].[Customers] AS c
  WHERE c.CustomerID < 20
		

INSERT INTO EmployeesDeposits (EmployeeID, DepositID)
VALUES 
(15,4 ),
(20,15),
(8,7  ),
(4,8  ),
(3,13 ),
(3,8  ),
(4,10 ),
(10,1 ),
(13,4 ),
(14,9 )

------  2.	Update Employees

UPDATE [dbo].[Employees]
SET ManagerID = CASE 
					WHEN EmployeeID = 11 OR EmployeeID = 21 THEN 1
					WHEN EmployeeID BETWEEN 2 AND 10 THEN 1
					WHEN EmployeeID BETWEEN 12 AND 20 THEN 11
					WHEN EmployeeID BETWEEN 22 AND 30 THEN 21
				END

----DML exercise 3.	Delete Records

DELETE FROM [dbo].[EmployeesDeposits]
 WHERE DepositID = 9 OR EmployeeID = 3

 -----------------------------------------
 ----- Section 3. Querying ---------------------
 -----------------------------------------

 --1.	Employees’ Salary

 SELECT 
		 [EmployeeID],
		 [HireDate],
		 [Salary],
		 [BranchID]
  FROM [dbo].[Employees] AS e
 WHERE e.Salary > 2000  AND e.HireDate > '2009-06-15'

 --2.	Customer Age
 SELECT 
		[FirstName],
		[DateOfBirth],
		DATEDIFF(YEAR, [DateOfBirth], '2016') AS Age
 FROM [dbo].[Customers] AS c
 WHERE DATEDIFF(YEAR, [DateOfBirth], '2016') BETWEEN 40 and 50

 -- 3.	Customer City
 SELECT 
	[CustomerID],
	[FirstName],
	[LastName],
	[Gender],
	[CityName] 
  FROM [dbo].[Customers] AS cu
 INNER JOIN [dbo].[Cities] AS ci
	ON cu.CityID = ci.CityID
 WHERE (cu.LastName LIKE 'Bu%' OR cu.FirstName LIKE '%a')
   AND LEN(ci.CityName) >= 8
 ORDER BY cu.CustomerID ASC

 --- 4.	Employee Accounts
 SELECT TOP 5
	e.[EmployeeID],
	e.[FirstName],
	a.[AccountNumber]
 FROM [dbo].[Employees] AS e
 INNER JOIN [dbo].[EmployeesAccounts] AS ea
 ON e.EmployeeID = ea.EmployeeID
 INNER JOIN [dbo].[Accounts] AS a
 ON a.[AccountID] = ea.[AccountID]
 WHERE a.[StartDate] > '2012-01-01'
 ORDER BY e.FirstName DESC

 -- 5.	Employee Cities
 SELECT 
ci.CityName,
b.[Name], 
COUNT(*) AS [EmployeesCount]
FROM [dbo].[Employees] AS e
INNER JOIN [dbo].[Branches] AS b
ON e.BranchID = b.BranchID
INNER JOIN [dbo].[Cities] as ci
ON ci.CityID = b.CityID
WHERE ci.CityID NOT IN (4,5)
GROUP BY ci.CityName, b.[Name]
HAVING COUNT(*) >= 3

--6.	Loan Statistics
SELECT SUM(l.Amount), MAX(l.[Interest]), MIN(e.Salary) 
FROM [dbo].[Employees] AS e
INNER JOIN [dbo].[EmployeesLoans] AS el
ON e.EmployeeID = el.EmployeeID
INNER JOIN [dbo].[Loans] l
ON el.LoanID = l.LoanID

--7.	Unite People
SELECT TOP 3 
	   e.FirstName, 
	   ci.CityName
 FROM [dbo].[Employees] AS e
INNER JOIN [dbo].[Branches] AS b
   ON e.BranchID = b.BranchID
INNER JOIN [dbo].[Cities] as ci
   ON ci.CityID = b.CityID
UNION ALL
SELECT TOP 3 
	   c.FirstName,
	   ci.CityName
  FROM [dbo].[Customers] AS c
 INNER JOIN [dbo].[Cities] as ci
    ON c.CityID = ci.CityID

-- 8.	Customers without Accounts
SELECT 
	c.[CustomerID],
	c.Height
   FROM [dbo].[Customers] AS c
   LEFT JOIN [dbo].[Accounts] AS a
     ON c.CustomerID = a.CustomerID
  WHERE a.AccountNumber IS NULL
AND c.Height BETWEEN 1.74 AND 2.04

--9.	Average loans
SELECT TOP 5
	   c.CustomerID,
	   l.Amount
 FROM [dbo].[Customers] AS c
INNER JOIN [dbo].[Loans] AS l
   ON c.CustomerID = l.CustomerID
WHERE l.Amount > (    
				  SELECT 
				    AVG (l.Amount)
				   FROM [dbo].[Customers] AS c
				  INNER JOIN [dbo].[Loans] AS l
				     ON c.CustomerID = l.CustomerID
				  WHERE c.Gender = 'M'
					  ) 
ORDER BY c.LastName ASC

--10.	Oldest Account
SELECT TOP 1 
       c.CustomerID,c.FirstName, a.StartDate 
  FROM [dbo].[Customers] AS c
 INNER JOIN [dbo].[Accounts] as a
    ON c.CustomerID = a.CustomerID
 ORDER BY a.StartDate 

 -------------------------------------------
 --Section 4. Programmability --------------
 -------------------------------------------

 --1.	String Joiner Function
 CREATE FUNCTION udf_ConcatString (@first VARCHAR(MAX), @second VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN CONCAT(REVERSE(@first), REVERSE(@second))
END

--2.	Unexpired Loans Procedure
CREATE Procedure usp_CustomersWithUnexpiredLoans (@CustomerID INT)
AS
BEGIN
SELECT 
		c.CustomerID,
		FirstName,
		LoanID
FROM [dbo].[Customers] AS c
INNER JOIN [dbo].[Loans] AS l
ON c.CustomerID = l.CustomerID
WHERE l.ExpirationDate IS NULL
AND c.CustomerID = @CustomerID
END  --    EXEC usp_CustomersWithUnexpiredLoans @CustomerID = 9

--- 3.	Take Loan Procedure
CREATE Procedure usp_TakeLoan (@CustomerID INT, @LoanAmount DECIMAL(18,2), @Interest DECIMAL(4,2), @StartDate DATE)
AS
BEGIN
		BEGIN TRAN
	       INSERT INTO [dbo].[Loans] (StartDate, Amount, Interest, ExpirationDate, CustomerID)
		   VALUES (@StartDate, @LoanAmount, @Interest, NULL, @CustomerID)
	       IF (@LoanAmount NOT BETWEEN 0.01 AND 100000)
		BEGIN
			RAISERROR ('Invalid Loan Amount.', 16,1)
			ROLLBACK
		END
		ELSE
		BEGIN
			COMMIT
		END
END

---4.	Trigger Hire Employee
CREATE TRIGGER  dbo.tr_NewEmployee 
ON [dbo].[Employees]
AFTER INSERT    
AS
BEGIN	
	UPDATE [dbo].[EmployeesLoans] 
	   SET EmployeeID = (SELECT i.EmployeeID FROM inserted AS i) 
	   WHERE EmployeeID = (SELECT i.EmployeeID FROM inserted AS i) - 1
END 

-----------------------------
------- BONUS---------------
----------------------------

--1.	Delete Trigger INSTEAD OF DELETE

CREATE TRIGGER  dbo.tr_LogsAfterDelete
ON [dbo].[Accounts]
INSTEAD OF DELETE
AS
BEGIN	
IF OBJECT_ID('[AccountLogs]') IS NULL
	BEGIN
		Select * Into AccountLogs From Accounts Where 1 = 2
	END
	INSERT INTO AccountLogs
    SELECT * FROM deleted

	DELETE FROM [EmployeesAccounts]
	WHERE  AccountID = (SELECT AccountID FROM deleted)

	DELETE FROM [dbo].[Accounts] WHERE CustomerID = (SELECT CustomerID FROM deleted)
END 
--DELETE FROM [dbo].[Accounts] WHERE CustomerID = 4