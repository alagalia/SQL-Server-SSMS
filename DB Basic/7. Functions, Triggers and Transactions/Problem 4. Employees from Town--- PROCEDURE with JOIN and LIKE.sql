CREATE PROCEDURE usp_GetEmployeesFromTown (@town VARCHAR(50))
AS
	BEGIN
		SELECT e.[FirstName] AS 'FirstName', 
			   e.[LastName] AS 'Last Name'
			FROM [dbo].[Employees] AS e
		INNER JOIN [dbo].[Addresses] AS a
			ON e.AddressID = a.AddressID
		INNER JOIN [dbo].[Towns] AS t
			ON a.TownID = t.TownID
		WHERE t.Name LIKE @town
	END

EXEC usp_GetEmployeesFromTown 'sofia'