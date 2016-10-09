SELECT c.ContinentCode, c1.CurrencyCode, c.MaxCurrencyUsage AS CurrencyUsage FROM (
				SELECT ContinentCode, MAX(CurrencyUsage) AS MaxCurrencyUsage FROM
					(SELECT cn.ContinentCode, 
								cur.CurrencyCode, 
								COUNT(cur.CurrencyCode) AS CurrencyUsage
							FROM [dbo].[Continents] AS cn
							INNER JOIN [dbo].[Countries] AS cr
								ON cn.ContinentCode = cr.ContinentCode
							INNER JOIN [dbo].[Currencies] AS cur
								ON cr.CurrencyCode = cur.CurrencyCode
							GROUP BY  cur.CurrencyCode, cn.ContinentCode
							HAVING COUNT(cur.CurrencyCode) <>1
					) AS  a
			GROUP BY ContinentCode
			) AS c
LEFT JOIN (SELECT cn.ContinentCode, 
								cur.CurrencyCode, 
								COUNT(cur.CurrencyCode) AS CurrencyUsage
							FROM [dbo].[Continents] AS cn
							INNER JOIN [dbo].[Countries] AS cr
								ON cn.ContinentCode = cr.ContinentCode
							INNER JOIN [dbo].[Currencies] AS cur
								ON cr.CurrencyCode = cur.CurrencyCode
							GROUP BY  cur.CurrencyCode, cn.ContinentCode
							HAVING COUNT(cur.CurrencyCode) <>1
					) AS c1
ON c.ContinentCode = c1.ContinentCode
WHERE c.MaxCurrencyUsage = c1.CurrencyUsage
