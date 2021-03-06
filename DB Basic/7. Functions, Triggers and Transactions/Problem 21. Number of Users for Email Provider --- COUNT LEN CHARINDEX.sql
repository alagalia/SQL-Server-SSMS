/****** Script for SelectTopNRows command from SSMS  ******/
SELECT result.[Email Provider], COUNT(result.[Email Provider]) AS [Number Of Users] FROM 
				(SELECT  
					RIGHT(u.Email, LEN(u.Email) - CHARINDEX('@', u.Email)) as [Email Provider]
					FROM [dbo].[Users] AS u
				) AS  result
GROUP BY result.[Email Provider]
ORDER BY [Number Of Users] DESC, [Email Provider] ASC
