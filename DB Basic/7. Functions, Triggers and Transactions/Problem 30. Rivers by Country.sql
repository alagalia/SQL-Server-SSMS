SELECT  c.CountryName, con.ContinentName, COUNT(cr.RiverId) AS RiversCount, 
CASE 
	WHEN SUM(r.Length) IS NULL THEN 0
	ELSE SUM(r.Length)
	END AS TotalLength
  FROM [dbo].[Countries] AS c
  JOIN [dbo].[Continents] AS con
    ON con.ContinentCode = c.ContinentCode
  LEFT JOIN [dbo].[CountriesRivers] cr
    ON cr.CountryCode= c.CountryCode
  LEFT JOIN [dbo].[Rivers] AS r
	ON r.Id = cr.riverId
 GROUP BY con.ContinentName, c.CountryName
 ORDER BY COUNT(cr.RiverId) DESC, SUM(r.Length) DESC, c.CountryName