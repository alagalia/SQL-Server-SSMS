CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber (@num MONEY)
AS
BEGIN 
SELECT e.FirstName, e.LastName
	FROM [dbo].[Employees] AS e
WHERE e.Salary >= @num
END

EXEC usp_GetEmployeesSalaryAboveNumber 48100
