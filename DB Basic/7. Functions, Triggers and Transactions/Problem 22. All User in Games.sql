SELECT g.Name AS [Game], 
	   gt.Name AS [Game Type], 
	   u.Username AS [Username],
	   ug.[Level] AS [Level],
	   ug.Cash AS [Cash],
	   ch.Name AS [Character] 
FROM [dbo].[Users] AS u
JOIN [dbo].[UsersGames] AS ug
ON u.Id = ug.UserId
JOIN [dbo].[Games] AS g
ON ug.GameId = g.Id
JOIN [dbo].[GameTypes] AS gt
ON gt.Id = g.GameTypeId
JOIN [dbo].[Characters] AS ch
ON ug.CharacterId = ch.Id
ORDER BY ug.[Level] DESC,
		 u.Username,
		 g.Name