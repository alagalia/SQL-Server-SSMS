SELECT TOP 5 c.CountryName, r.RiverName FROM [dbo].[Countries] AS c
LEFT JOIN [dbo].[CountriesRivers] AS cr
	ON c.CountryCode = cr.CountryCode
FULL JOIN [dbo].[Rivers] AS r
	ON cr.RiverId =r.Id
WHERE c.ContinentCode = 'AF'
ORDER BY c.CountryName
