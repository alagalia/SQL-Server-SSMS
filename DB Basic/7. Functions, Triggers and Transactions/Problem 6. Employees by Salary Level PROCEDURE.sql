CREATE PROCEDURE usp_EmployeesBySalaryLevel (@level VARCHAR(50))
AS
	BEGIN
		IF (@level = 'low')
		BEGIN
			SELECT e.[FirstName] AS 'FirstName', 
				   e.[LastName] AS 'Last Name',
				FROM [dbo].[Employees] AS e
				WHERE e.salary<30000
		END
		ELSE IF (@level = 'average ')
		BEGIN
		SELECT e.[FirstName] AS 'FirstName', 
			   e.[LastName] AS 'Last Name',
			   e.Salary
				FROM [dbo].[Employees] AS e
			   WHERE e.salary>=30000 AND e.salary <=50000
		END
		ELSE
		BEGIN
		SELECT e.[FirstName] AS 'FirstName', 
			   e.[LastName] AS 'Last Name',
			   e.Salary
				FROM [dbo].[Employees] AS e
			   WHERE e.salary > 50000
		END
	END

EXEC usp_EmployeesBySalaryLevel 'high'