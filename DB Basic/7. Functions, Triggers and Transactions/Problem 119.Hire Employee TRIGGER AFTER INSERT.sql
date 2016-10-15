CREATE TRIGGER  dbo.tr_NewEmployee 
ON [dbo].[Employees]
AFTER INSERT    
AS
BEGIN	
	UPDATE [dbo].[EmployeesLoans] 
	   SET EmployeeID = (SELECT i.EmployeeID FROM inserted AS i) 
	   WHERE EmployeeID = (SELECT i.EmployeeID FROM inserted AS i) - 1
END 

  INSERT INTO Employees([EmployeeID]
      ,[FirstName]
      ,[HireDate]
      ,[Salary]
      ,[BranchID])
 VALUES (31, 'Jake', '20161212', 500, 2)

