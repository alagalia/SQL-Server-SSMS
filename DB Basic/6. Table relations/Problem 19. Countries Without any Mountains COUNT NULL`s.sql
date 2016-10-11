SELECT COUNT(*) AS CountryCode
 FROM [dbo].[Countries] AS c
LEFT JOIN [dbo].[MountainsCountries] AS mc
ON c.CountryCode = mc.CountryCode
WHERE mc.CountryCode IS NULL