CREATE DATABASE Test
USE Test


CREATE TABLE AccountHolders (
AccountHoldersID INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(50), 
LastName VARCHAR (50),
SSN VARCHAR(50)
)

INSERT INTO AccountHolders (FirstName, LastName)
VALUES
('Petar', 'Dimitrov'),
('Nikolay', 'Petkov'),
('Lidinka', 'Plamenova'),
('Svetoslav', 'Dimitrov'),
('Alexander', 'Krustev')


CREATE TABLE Accounts (
AccountsID INT PRIMARY KEY IDENTITY,
Balance MONEY,
AccountHolderId INT,
CONSTRAINT FK_Accounts_AccountHolders FOREIGN KEY (AccountHolderId)
	REFERENCES AccountHolders(AccountHoldersID)
)


INSERT INTO Accounts (Balance, AccountHolderId)
VALUES
(10000, 5),
(34500, 4),
(321998, 1),
(4309, 2),
(111111, 3),
(222, 1),
(0, 3),
(10, 2),
(1700, 1),
(5678300, 5)
