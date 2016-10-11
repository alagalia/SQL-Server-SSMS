CREATE PROCEDURE usp_GetTownsStartingWith (@string VARCHAR(50))
AS
BEGIN	
	SELECT t.Name FROM [dbo].[Towns] AS t
	WHERE LOWER(t.Name) LIKE LOWER(@string+'%')
END

EXEC usp_GetTownsStartingWith 'b'

