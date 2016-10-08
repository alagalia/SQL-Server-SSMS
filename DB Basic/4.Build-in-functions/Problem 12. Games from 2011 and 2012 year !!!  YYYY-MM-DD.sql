SELECT TOP 50 g.Name ,replace(convert(NVARCHAR, g.Start, 111), '/', '-') FROM [dbo].[Games] as g
	where DATEPART(year,g.Start) = 2011 OR
		  DATEPART(year,g.Start) = 2012
	ORDER BY g.Start,
			 g.Name
