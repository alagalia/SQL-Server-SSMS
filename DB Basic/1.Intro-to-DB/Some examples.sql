SELECT Name, Age FROM Minions
ORDER BY Name ASC, Age DESC

-- UPDATE----
UPDATE Minions
SET Age = 10
WHERE Age is NULL

UPDATE Minions
SET Age+=1
WHERE Age<20