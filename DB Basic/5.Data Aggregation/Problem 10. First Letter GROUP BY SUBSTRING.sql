SELECT SUBSTRING(w.FirstName,1,1) AS first_letter
	FROM [dbo].[WizzardDeposits] AS w
	WHERE w.DepositGroup = 'Troll Chest'
	GROUP BY SUBSTRING(w.FirstName,1,1)
 ORDER BY first_letter
