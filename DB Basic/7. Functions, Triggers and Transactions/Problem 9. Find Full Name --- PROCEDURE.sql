CREATE PROCEDURE usp_GetHoldersFullName  AS
BEGIN 
SELECT e.FirstName +' '+ e.LastName FROM [dbo].[AccountHolders] AS e
END

EXEC usp_GetHoldersFullName