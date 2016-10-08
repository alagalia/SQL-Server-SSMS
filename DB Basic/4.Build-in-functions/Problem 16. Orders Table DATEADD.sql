SELECT p.ProductName, 
	p.OrderDate,
	DATEADD(DAY, 3, p.OrderDate) AS [Pay Due],
	DATEADD(MONTH, 1, p.OrderDate) AS [Deliver Due]
 FROM Orders AS p