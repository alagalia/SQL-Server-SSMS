SELECT i.Name AS [Item],
	   i.Price,
	   i.MinLevel, 
	   gt.Name
FROM Items AS i
LEFT JOIN [dbo].[GameTypeForbiddenItems] as forb
ON i.Id = forb.ItemId
LEFT JOIN [dbo].[GameTypes] AS gt
ON forb.GameTypeId = gt.Id
ORDER BY gt.Name DESC, i.Name ASC