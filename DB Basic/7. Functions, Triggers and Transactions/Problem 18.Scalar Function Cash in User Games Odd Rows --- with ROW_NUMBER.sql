CREATE FUNCTION ufn_CashInUsersGames (@gameName NVARCHAR(MAX))
RETURNS @resultCash TABLE ( SumCash MONEY )
AS
BEGIN
	DECLARE @ResultSum MONEY = (SELECT SUM(innerResult1.Cash) FROM
			(SELECT * FROM 
						   (SELECT g.Name, 
						           ug.Cash, 
								   ROW_NUMBER() OVER (ORDER BY Cash DESC) AS rowNumber
							   FROM UsersGames AS ug
							   INNER JOIN Games AS g 
							      ON ug.GameId = g.Id
							   WHERE g.Name = @gameName
						   ) AS innerResult
			               WHERE innerResult.rowNumber % 2 = 1) AS innerResult1
		   ) 
INSERT INTO @resultCash (SumCash)
VALUES (@ResultSum)
RETURN
END

ufn_CashInUsersGames 'Bali'