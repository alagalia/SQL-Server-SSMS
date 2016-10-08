SELECT SUM(res.Diff) FROM
(SELECT A.Id , A.FirstName AS CurName, B.FirstName AS NxtName, A.DepositAmount-B.DepositAmount AS Diff
FROM [dbo].[WizzardDeposits] AS A
	JOIN [dbo].[WizzardDeposits] AS B 
	ON A.Id = B.Id - 1) AS res

