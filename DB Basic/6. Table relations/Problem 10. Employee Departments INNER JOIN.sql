SELECT TOP 5 e.EmployeeID, e.FirstName, e.Salary, d.Name
	FROM [dbo].[Employees] AS e
INNER JOIN [dbo].[Departments] AS d
ON d.DepartmentID = e.DepartmentID
WHERE e.Salary > 15000
ORDER BY e.DepartmentID