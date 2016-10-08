SELECT TOP 10 e.FirstName, e.LastName, e.DepartmentId FROM [dbo].[Employees] as e
INNER JOIN
(SELECT e.DepartmentID, AVG(e.Salary) AS AverageSalary 
	FROM [dbo].[Employees] AS e
	GROUP BY e.DepartmentID) AS aSal
ON e.DepartmentID = aSal.DepartmentID
WHERE e.Salary > aSal.AverageSalary
ORDER BY e.DepartmentId