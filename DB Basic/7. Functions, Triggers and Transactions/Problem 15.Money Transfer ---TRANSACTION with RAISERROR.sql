CREATE PROCEDURE usp_MoneyTransfer 
		(@AccountIdFrom INT, @AccountIdTo INT, @moneyAmount DECIMAL(20,8))   AS
BEGIN 
	
		DECLARE @numberOfAccounts INT = (SELECT COUNT(*) FROM [dbo].[Accounts])
		DECLARE @moneyIdFrom INT = (SELECT a.Balance FROM [dbo].[Accounts] AS a
									WHERE a.Id = @AccountIdFrom)
		BEGIN TRAN
			UPDATE [dbo].[Accounts] 
			SET Balance -= @moneyAmount
			WHERE Id = @AccountIdFrom

			UPDATE [dbo].[Accounts] 
			SET Balance += @moneyAmount
			WHERE Id = @AccountIdTo

		IF (@AccountIdFrom > @numberOfAccounts OR 
			@AccountIdTo > @numberOfAccounts OR
			@moneyAmount > @moneyIdFrom OR
			@moneyAmount < 0
			)
		BEGIN
			RAISERROR ('Invalid parameters', 16,1)
			ROLLBACK
		END
		ELSE
		BEGIN
			COMMIT
		END
END

EXEC usp_MoneyTransfer 2, 5, 22