SELECT c.CountryCode, COUNT(m.MountainRange) AS MountainRanges 
FROM [dbo].[Countries] AS c
INNER JOIN [dbo].[MountainsCountries] AS mc
	ON	c.CountryCode = MC.CountryCode
INNER JOIN [dbo].[Mountains] AS m
	ON mc.MountainId = m.Id
WHERE c.CountryCode IN ('US','RU','BG')
GROUP BY c.CountryCode