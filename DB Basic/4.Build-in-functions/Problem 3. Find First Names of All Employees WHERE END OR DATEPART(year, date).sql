SELECT e.FirstName FROM [dbo].[Employees] AS e
	WHERE (e.DepartmentID = 3 OR e.DepartmentID = 10) 
	AND (DATEPART(year, e.HireDate)>= 1995  AND DATEPART(year, e.HireDate)<=2005)

