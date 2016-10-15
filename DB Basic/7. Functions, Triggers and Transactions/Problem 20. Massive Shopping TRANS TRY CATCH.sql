--1. ����������� ��������� �� ������������ �� ���������. ���������� �� ����������� ��-������
DECLARE @gameId INT, @userId INT, @userGameId INT, @userCash MONEY
	 
	SELECT
		@userId = Users.Id,
		@gameId = Games.Id,
		@userGameId = UsersGames.Id,
		@userCash = UsersGames.Cash
	FROM Users
	JOIN UsersGames ON
	UsersGames.UserId = Users.Id
	JOIN Games ON
	Games.Id = UsersGames.GameId
	WHERE Users.FirstName = 'Stamat'
	AND Games.Name = 'Safflower';

--2. ������ ����������� � ����������� ���������, �� �� �������� ���� ��-������
DECLARE @SumOfItemsLevel11to12 MONEY = (SELECT SUM([Price])
									FROM [dbo].[Items]
									WHERE (MinLevel BETWEEN 11 AND 12))

DECLARE @SumOfItemsLevel19to21 MONEY = (SELECT SUM([Price])
									FROM [dbo].[Items]
									WHERE (MinLevel BETWEEN 19 AND 21))
--3. ���������� ������������
BEGIN TRAN

BEGIN TRY -- ������ �� ����-�
	UPDATE [dbo].[UsersGames] 
			SET Cash -= @SumOfItemsLevel11to12
			WHERE Id = @userGameId

	INSERT INTO [dbo].[UserGameItems] (ItemId, UserGameId)
	SELECT Id, @userGameId FROM Items WHERE MinLevel BETWEEN 11 AND 12
COMMIT
END TRY --���� �� ����-�

BEGIN CATCH -- ������ �� ���-�
		--RAISERROR ('Something is wrong', 16,1)
		ROLLBACK
END	CATCH  -- ���� �� ���-�

-- 4. ��������� �.3 � ����� ��������
BEGIN TRAN
BEGIN TRY
	UPDATE [dbo].[UsersGames] 
			SET Cash -= @SumOfItemsLevel19to21
			WHERE Id = @userGameId

	INSERT INTO [dbo].[UserGameItems] (ItemId, UserGameId)
	SELECT Id, @userGameId FROM Items WHERE MinLevel BETWEEN 19 AND 21
COMMIT
END TRY
BEGIN CATCH
		--RAISERROR ('Something is wrong', 16,1)
		ROLLBACK
END	CATCH

-- 5. Extract all item names in the given game sorted by name alphabetically
SELECT i.Name FROM [dbo].[Items] AS i
JOIN [dbo].[UserGameItems] AS ugi
ON i.Id = ugi.ItemId
AND ugi.UserGameId = @userGameId
ORDER BY i.Name
