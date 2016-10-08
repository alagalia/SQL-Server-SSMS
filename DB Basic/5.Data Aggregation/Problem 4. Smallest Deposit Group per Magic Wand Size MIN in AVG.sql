SELECT w.DepositGroup AS 'LowestAverageWand' 
		FROM [dbo].[WizzardDeposits] AS w
		GROUP BY w.DepositGroup
HAVING AVG(w.MagicWandSize) = (SELECT MIN(avgTable.LowestAverageWand)
								FROM (SELECT w.DepositGroup, AVG(w.MagicWandSize) AS 'LowestAverageWand' 
								FROM [dbo].[WizzardDeposits] AS w
								GROUP BY w.DepositGroup
								) as avgTable)




