CREATE FUNCTION ufn_IsWordComprised(@setOfLetters VARCHAR(50), @word VARCHAR (50)) 
RETURNS BIT
AS
BEGIN
	DECLARE @foundedChars INT = 0;
	DECLARE @result BIT;
	DECLARE @startIndex INT = 1 ;

	WHILE (@startIndex<=LEN(@word))
		BEGIN
			DECLARE @currentChar VARCHAR(1) = SUBSTRING(@word, @startIndex, 1)
			IF (CHARINDEX(@currentChar, @setOfLetters)>0)
				BEGIN
					SET @foundedChars += 1
				END
			SET @startIndex +=1
		END
		IF (LEN(@word) = @foundedChars)
			SET @result = 1
		ELSE
			SET @result = 0
	RETURN @result
END

