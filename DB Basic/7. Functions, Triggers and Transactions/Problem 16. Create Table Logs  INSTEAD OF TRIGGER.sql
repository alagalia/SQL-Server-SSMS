--CREATE TABLE Logs (
--LogId INT PRIMARY KEY IDENTITY, 
--AccountId INT, 
--OldSum DECIMAL (18,8),
--NewSum DECIMAL(18, 8)
--)

CREATE TRIGGER  dbo.tr_LogsAfterUpdate 
ON [dbo].[Accounts]
INSTEAD OF UPDATE    
AS
BEGIN	

IF OBJECT_ID('[Logs]') IS NULL
	BEGIN
		CREATE TABLE Logs(
			LogId INT PRIMARY KEY IDENTITY, 
			AccountId INT, 
			OldSum DECIMAL (18,8),
			NewSum DECIMAL(18, 8)
			)
	END
	DECLARE @AccountId INT = (SELECT i.Id FROM  inserted i);
	DECLARE @NewSum decimal(10,2) = (SELECT i.Balance FROM  inserted i);
	DECLARE @OldSum decimal(10,2) = (SELECT a.Balance FROM Accounts AS a
										WHERE a.Id = @AccountId)

    INSERT INTO Logs (AccountId, OldSum, NewSum)
	VALUES (@AccountId, @OldSum, @NewSum)
	
	UPDATE [dbo].[Accounts]
	SET  Balance = @NewSum
	WHERE Id = @AccountId
	PRINT 'AFTER INSERT trigger fired.'
END 

UPDATE [dbo].[Accounts]
SET Balance = 20.03
WHERE Id = 1