SELECT e.EmployeeID, e.FirstName, p.Name
	FROM [dbo].[Employees] AS e
INNER JOIN [dbo].[EmployeesProjects] AS ep
	ON e.EmployeeID = ep.EmployeeID
LEFT JOIN  (SELECT * FROM [dbo].[Projects] AS p
			WHERE YEAR(p.StartDate) < 2005) AS p
ON ep.ProjectID = p.ProjectID
WHERE e.EmployeeID = 24