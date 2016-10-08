SELECT TOP 5 e.EmployeeID, e.FirstName, p.Name
	FROM [dbo].[Employees] AS e
INNER JOIN [dbo].[EmployeesProjects] AS ep
	ON e.EmployeeID = ep.EmployeeID
INNER JOIN [dbo].[Projects] AS p
	ON p.ProjectID = ep.ProjectID
WHERE p.StartDate > '20020813'
	AND p.EndDate IS NULL
ORDER BY e.EmployeeID ASC