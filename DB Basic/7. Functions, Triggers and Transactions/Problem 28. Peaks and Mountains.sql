SELECT p.PeakName, m.MountainRange, p.Elevation FROM [dbo].[Peaks] AS p
JOIN [dbo].[Mountains] AS m
ON p.MountainId = m.Id
ORDER BY p.Elevation DESC,
p.PeakName