SELECT t.DepartmentID, MAX(t.Salary) FROM [dbo].[Employees] AS t
	GROUP BY t.DepartmentID
	HAVING MAX(t.Salary)< 30000 OR
			MAX(t.Salary) >70000