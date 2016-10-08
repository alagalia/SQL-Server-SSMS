SELECT p.PeakName, r.RiverName, 
LOWER(p.PeakName + RIGHT(r.RiverName, LEN(RiverName)-1)) AS [Mix] 
FROM [dbo].[Peaks] AS p,[dbo].[Rivers] AS r
	WHERE RIGHT(p.PeakName, 1) = LEFT(r.RiverName, 1)
	ORDER BY Mix
