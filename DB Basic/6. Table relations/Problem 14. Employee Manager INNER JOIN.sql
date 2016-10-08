SELECT ee.EmployeeID, ee.FirstName, ee.ManagerID, em.FirstName 
	FROM [dbo].[Employees] AS ee
INNER JOIN [dbo].[Employees] AS em
ON ee.ManagerID = em.EmployeeID
WHERE ee.ManagerID IN (3, 7)
ORDER BY EmployeeID