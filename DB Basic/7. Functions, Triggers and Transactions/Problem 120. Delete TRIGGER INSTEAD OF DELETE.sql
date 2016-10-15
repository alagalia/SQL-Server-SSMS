CREATE TRIGGER  dbo.tr_LogsAfterDelete
ON [dbo].[Accounts]
INSTEAD OF DELETE
AS
BEGIN	
IF OBJECT_ID('[AccountLogs]') IS NULL
	BEGIN
		Select * Into AccountLogs From Accounts Where 1 = 2
	END
	--DECLARE @AccountId INT = (SELECT d.AccountID FROM  deleted d);
	--DECLARE @AccountNumber CHAR(12) = (SELECT d.AccountNumber FROM deleted d);
	--DECLARE @StartDate DATE = (SELECT d.StartDate FROM deleted d)
	--DECLARE @CustomerID INT = (SELECT d.CustomerID FROM deleted d)

 --   INSERT INTO AccountLogs ([AccountID],[AccountNumber],[StartDate],[CustomerID])
	--VALUES (@AccountId, @AccountNumber, @StartDate, @CustomerID)
	
	INSERT INTO AccountLogs
    SELECT * FROM deleted

	DELETE FROM [EmployeesAccounts]
	WHERE  AccountID = (SELECT AccountID FROM deleted)

	DELETE FROM [dbo].[Accounts] WHERE CustomerID = (SELECT CustomerID FROM deleted)
END 

DELETE FROM [dbo].[Accounts] WHERE CustomerID = 4