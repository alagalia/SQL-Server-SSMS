SELECT c.CountryName,  c.CountryCode,
	CASE 
		WHEN c.CurrencyCode = 'EUR' THEN 'Euro'
		ELSE 'Not Euro'
	END AS 'Currency'
	FROM [dbo].[Countries] AS c
ORDER BY c.CountryName

SELECT * FROM [dbo].[Countries]