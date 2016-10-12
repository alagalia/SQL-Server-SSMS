CREATE PROCEDURE usp_WithdrawMoney (@AccountId INT, @moneyAmount DECIMAL(20,8))   AS
BEGIN 
		UPDATE [dbo].[Accounts] 
		SET Balance -= @moneyAmount
		WHERE Id = @AccountId
END
