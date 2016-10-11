SELECT TOP 5 PeakResults.CountryName, PeakResults.HighestPeakElevation, RiverResult.LongestRiverLength FROM 
			(SELECT res.CountryName, 
			        res.HighestPeakElevation,
					res.ElevationOrder
					FROM (
						SELECT c.CountryName, 
						p.Elevation AS HighestPeakElevation, 
						DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY p.Elevation DESC) as ElevationOrder,
						p.PeakName
						FROM [dbo].[Countries] AS c
						LEFT JOIN [dbo].[MountainsCountries] AS mc
							ON c.[CountryCode] = mc.[CountryCode]
						LEFT JOIN [dbo].[Mountains] AS m
							ON mc.[MountainId] = m.Id
						LEFT JOIN [dbo].[Peaks] AS p
						ON p.MountainId = m.Id
					) AS res
			) AS PeakResults
			JOIN (SELECT 
			   c.CountryName,
			   r.RiverName,
			   DENSE_RANK() OVER (PARTITION BY c.CountryName ORDER BY r.Length DESC) as RiberLengthOrder,
			   r.Length AS LongestRiverLength
				FROM [dbo].[Countries] AS c
				LEFT JOIN [dbo].[CountriesRivers] AS cr
					ON c.[CountryCode] = cr.[CountryCode]
				LEFT JOIN [dbo].[Rivers] AS r
					ON cr.RiverId = r.Id			
	) AS RiverResult
ON PeakResults.CountryName = RiverResult.CountryName
AND RiverResult.RiberLengthOrder = 1
AND PeakResults.ElevationOrder = 1

ORDER BY PeakResults.HighestPeakElevation DESC, PeakResults.CountryName