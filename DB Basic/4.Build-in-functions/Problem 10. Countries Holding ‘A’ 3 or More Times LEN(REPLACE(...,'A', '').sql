SELECT c.CountryName, c.IsoCode FROM [dbo].[Countries] AS c
	WHERE LEN(c.CountryName) -LEN(REPLACE(c.CountryName, 'A', '')) >= 3 
	ORDER BY c.IsoCode

--SELECT c.CountryName, c.IsoCode, 
--REPLACE(c.CountryName, '[^A]', ''), 
--LEN(REPLACE(c.CountryName, '[^A]', '')) as 'COUNTER A',
-- LEN(c.CountryName) -LEN(REPLACE(c.CountryName, 'A', '')) as 'COUNTER A WITH -'
--FROM [dbo].[Countries] AS c
--	WHERE LEN(REPLACE(c.CountryName, '[^A]', '')) >= 3 
--	ORDER BY c.IsoCode