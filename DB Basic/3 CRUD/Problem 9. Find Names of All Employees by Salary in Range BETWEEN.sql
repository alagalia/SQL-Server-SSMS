SELECT e.FirstName, e.LastName, e.JobTitle FROM [dbo].[Employees] as e
	WHERE e.Salary BETWEEN 20000 AND 30000