CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan (@num MONEY)
AS
BEGIN 
	SELECT ah.FirstName, ah.LastName
		FROM [dbo].[AccountHolders]  AS ah
	INNER JOIN [dbo].[Accounts] AS a
		ON a.[AccountHolderId] = ah.[Id]
	GROUP BY ah.FirstName, ah.LastName
	HAVING SUM(a.Balance)> @num 
END

usp_GetHoldersWithBalanceHigherThan 300000
