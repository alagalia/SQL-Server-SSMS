DECLARE insertCur CURSOR 
FOR 
-- ������ �� �������� � �������. ������� ������ ����� �� ������� Users
SELECT u.UserName
FROM [dbo].[Users] as u

DECLARE @a VARCHAR(MAX)

OPEN insertCur 
FETCH NEXT FROM insertCur INTO @a
	WHILE @@FETCH_STATUS = 0 
		BEGIN
			PRINT @a
			FETCH NEXT FROM insertCur INTO @a
		END
	CLOSE insertCur
DEALLOCATE insertCur