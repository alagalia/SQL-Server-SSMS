CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY) 
RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @resultAsString VARCHAR(50);
	IF (@salary<30000)
		BEGIN
			SET @resultAsString = 'Low'
		END
	ELSE IF(@salary>=30000 AND @salary <=50000)
		BEGIN
			SET @resultAsString = 'Average'
		END
	ELSE 
		BEGIN
			SET @resultAsString = 'High'
		END
	RETURN @resultAsString
END

print ufn_GetSalaryLevel 2