
SELECT * INTO TableTwo FROM [dbo].[Employees] AS e
	WHERE e.Salary > 30000

DELETE from TableTwo 
	WHERE ManagerId = 42

UPDATE TableTwo
	SET Salary = Salary + 5000
	WHERE DepartmentID = 1

SELECT t.DepartmentID,  AVG(t.Salary) FROM [dbo].[TableTwo] AS t
	GROUP BY t.DepartmentID

