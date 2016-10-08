SELECT e.DepartmentID, MIN(e.Salary) FROM [dbo].[Employees] AS e
WHERE (e.DepartmentId = 2 OR e.DepartmentId = 5 OR e.DepartmentId = 7)
		AND e.HireDate >= '2000-01-01'
GROUP BY e.DepartmentID
