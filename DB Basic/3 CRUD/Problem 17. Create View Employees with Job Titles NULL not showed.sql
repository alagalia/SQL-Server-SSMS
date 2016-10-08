--NULL does not showed in results---
CREATE VIEW V_EmployeeNameJobTitle AS
	SELECT CONCAT(e.FirstName, ' ', e.MiddleName, ' ', e.LastName) AS [Full Name], e.JobTitle
	FROM [dbo].[Employees] AS e


--SELECT * FROM V_EmployeeNameJobTitle