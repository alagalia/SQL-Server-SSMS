SELECT TOP 5 e.EmployeeID, e.JobTitle, e.AddressID, a.AddressText
	FROM [dbo].[Employees] AS e
INNER JOIN [dbo].[Addresses] AS a
ON a.AddressID = e.AddressID
ORDER BY a.AddressID 