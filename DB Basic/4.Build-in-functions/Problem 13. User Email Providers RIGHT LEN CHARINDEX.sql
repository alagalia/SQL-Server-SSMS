SELECT u.Username as 'Username', 
	  RIGHT(u.Email, LEN(u.Email) - CHARINDEX('@', u.Email)) as [Email Provider]
 	  FROM [dbo].[Users] as u 
ORDER BY [Email Provider],
		 u.Username