SELECT 
	   u.Username AS [Username],
	   g.Name AS [Game],
	   COUNT(i.Price) AS [Items Count],	   
	   SUM(i.Price) AS [Items Price]
 FROM [dbo].[Users] AS u
 JOIN [dbo].[UsersGames] AS ug
   ON u.Id = ug.UserId
 JOIN [dbo].[Games] AS g
   ON ug.GameId = g.Id
 JOIN [dbo].[UserGameItems] AS ugi
   ON ug.Id = ugi.UserGameId
 JOIN [dbo].[Items] AS i
   ON ugi.ItemId = i.Id
GROUP BY u.Username, g.Name
HAVING COUNT(i.Price) >= 10
ORDER BY [Items Count] DESC,
		 [Items Price] DESC,
		 Username ASC
