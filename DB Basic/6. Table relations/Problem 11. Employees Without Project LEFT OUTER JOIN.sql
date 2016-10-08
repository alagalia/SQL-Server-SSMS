SELECT TOP 3 e.EmployeeID, e.FirstName,  ep.ProjectID
	FROM [dbo].[Employees] AS e
LEFT JOIN [dbo].[EmployeesProjects] AS ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL
ORDER BY e.EmployeeID