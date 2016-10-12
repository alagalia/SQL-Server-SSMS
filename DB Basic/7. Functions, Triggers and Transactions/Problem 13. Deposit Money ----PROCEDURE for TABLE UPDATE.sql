CREATE PROCEDURE usp_DepositMoney (@AccountId INT, @moneyAmount DECIMAL(20,8))   AS
BEGIN 
		UPDATE [dbo].[Accounts] 
		SET Balance += @moneyAmount
		WHERE Id = @AccountId
END

--BEGIN TRAN
--	EXEC usp_DepositMoney 1, 10
--COMMIT
