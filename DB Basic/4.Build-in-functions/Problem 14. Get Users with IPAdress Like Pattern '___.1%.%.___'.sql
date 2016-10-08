SELECT  u.Username, u.IpAddress AS [IP Address] FROM [dbo].[Users] AS u
	WHERE u.IpAddress LIKE '___.1%.%.___'
	ORDER BY u.Username