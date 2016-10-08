SELECT c.CountryCode, m.MountainRange, p.PeakName, p.Elevation
	FROM [dbo].[Countries] AS c
INNER JOIN [dbo].[MountainsCountries] AS mc
	ON c.CountryCode = mc.CountryCode
INNER JOIN [dbo].[Mountains] AS m
	ON mc.MountainId = m.Id
INNER JOIN [dbo].[Peaks] AS p
	ON m.Id = p.MountainId
WHERE c.CountryName = 'Bulgaria'
	AND p.Elevation > 2835
ORDER BY p.Elevation DESC