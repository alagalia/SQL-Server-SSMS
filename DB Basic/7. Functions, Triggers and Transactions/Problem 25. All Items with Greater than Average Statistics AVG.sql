--average Items mind, luck and speed. 

SELECT i.Name, i.Price, i.MinLevel, stat.Strength, stat.Defence, stat.Speed, stat.Luck, stat.Mind
	FROM [dbo].[Items] AS i
	JOIN [dbo].[Statistics] AS stat
	  ON i.StatisticId = stat.Id
	  WHERE stat.Mind > (SELECT AVG(stat.Mind) FROM [dbo].[Statistics] AS stat)
			AND stat.Luck > (SELECT AVG(stat.Luck) FROM [dbo].[Statistics] AS stat)
			AND stat.Speed > (SELECT AVG(stat.Speed) FROM [dbo].[Statistics] AS stat)
ORDER BY i.Name
