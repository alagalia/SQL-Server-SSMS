CREATE FUNCTION ufn_CalculateFutureValue 
			(@sum DECIMAL(20,8), @interest DECIMAL(20,8), @years INT)			
RETURNS DECIMAL(20,4)
AS
BEGIN
--DECLARE @sum MONEY = 1000
--DECLARE @interest DECIMAL(20,2) = 10
--DECLARE @years INT =5
	DECLARE @result DECIMAL(20,4)
	SET @result = @sum * (POWER((1+@interest), @years))
	RETURN @result
END

SELECT dbo.ufn_CalculateFutureValue(1000, 10, 5)