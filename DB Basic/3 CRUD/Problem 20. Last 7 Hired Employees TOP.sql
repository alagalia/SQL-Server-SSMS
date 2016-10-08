use SoftUni 

SELECT TOP 7 e.FirstName, e.Lastname, e.HireDate
 FROM [dbo].[Employees] AS e
 ORDER BY e.HireDate DESC

