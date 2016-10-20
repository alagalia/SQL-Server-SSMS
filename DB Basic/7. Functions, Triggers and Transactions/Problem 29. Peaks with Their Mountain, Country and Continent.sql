SELECT p.PeakName, m.MountainRange AS [Mountain], c.CountryName, con.ContinentName FROM [dbo].[Peaks] AS p
JOIN [dbo].[Mountains] AS m
ON p.MountainId = m.Id
JOIN [dbo].[MountainsCountries] AS mc
ON mc.MountainId = m.Id
JOIN [dbo].[Countries] AS c
ON c.CountryCode = mc.CountryCode
JOIN [dbo].[Continents] AS con
ON con.ContinentCode = c.ContinentCode
ORDER BY p.PeakName, c.CountryName
