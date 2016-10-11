SELECT TOP 5 * FROM 
		(SELECT CountryName, Elevation, Lenght
				FROM (SELECT c.CountryName, 
								p.PeakName, 
								p.Elevation, 
								ROW_NUMBER() OVER(PARTITION BY c.CountryName ORDER BY p.Elevation DESC) AS PeaksElevation,
								r.[RiverName] AS RiverName,
								r.[Length] AS Lenght
						FROM [dbo].[Countries] AS c
						LEFT JOIN [dbo].[MountainsCountries] AS mc
							ON c.[CountryCode] = mc.[CountryCode]
						LEFT JOIN [dbo].[Mountains] AS m
							ON mc.[MountainId] = m.Id
						LEFT JOIN [dbo].[Peaks] AS p
							ON p.MountainId = m.Id
						LEFT JOIN [dbo].[CountriesRivers] AS cr
							ON cr.CountryCode = c.CountryCode
						LEFT JOIN [dbo].[Rivers] AS r
							ON cr.RiverId = r.Id
					 ) AS res
		WHERE PeaksElevation = 1
		) AS peak
ORDER BY Elevation DESC, CountryName