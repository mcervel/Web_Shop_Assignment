Use Haclymorph
use master

CREATE DATABASE Haclymorph
use Haclymorph

CREATE TABLE Street
(
IDStreet int CONSTRAINT PK_Street PRIMARY KEY IDENTITY,
StreetName nvarchar (50) NOT NULL
)

CREATE TABLE Town
(
IDTown int CONSTRAINT PK_Town PRIMARY KEY IDENTITY,
PostalNumber nvarchar(50) NOT NULL,
TownName nvarchar (50) NOT NULL
)

CREATE TABLE UserAddress
(
IDAddress int CONSTRAINT PK_Address PRIMARY KEY IDENTITY,
HouseNumber int NOT NULL,
StreetID int CONSTRAINT FK_RegisteredUser_Street FOREIGN KEY REFERENCES Street(IDStreet) NOT NULL,
TownID int CONSTRAINT FK_RegisteredUser_Town FOREIGN KEY REFERENCES Town(IDTown) NOT NULL
)

CREATE TABLE RegisteredUser
(
IDUser int CONSTRAINT PK_RegisteredUser PRIMARY KEY IDENTITY,
FirstName nvarchar (50) NOT NULL,
LastName nvarchar (50) NOT NULL,
Email nvarchar (50) NOT NULL,
UserPassword nvarchar (50) NOT NULL,
IsAdmin bit NOT NULL,
AddressID int CONSTRAINT FK_RegisteredUser_UserAddress FOREIGN KEY REFERENCES UserAddress(IDAddress) NOT NULL
)

CREATE TABLE Console
(
IDConsole int CONSTRAINT PK_Category PRIMARY KEY IDENTITY,
ConsoleName nvarchar (50) NOT NULL
)

CREATE TABLE Publisher
(
IDPublisher int CONSTRAINT PK_Publisher PRIMARY KEY IDENTITY,
PublisherName nvarchar(50)
)

CREATE TABLE Genre
(
IDGenre int CONSTRAINT PK_Genre PRIMARY KEY IDENTITY,
GenreName nvarchar(50)
)

CREATE TABLE Game
(
IDGame int CONSTRAINT PK_Game PRIMARY KEY IDENTITY,
GameName nvarchar(50) NOT NULL,
GameDescription nvarchar(max) NOT NULL,
Price int NOT NULL,
ImgPath nvarchar(100) NOT NULL,
PublisherID int CONSTRAINT FK_Game_Publisher FOREIGN KEY REFERENCES Publisher(IDPublisher) NOT NULL,
GenreID int CONSTRAINT FK_Game_Genre FOREIGN KEY REFERENCES Genre(IDGenre) NOT NULL,
ConsoleID int CONSTRAINT FK_Game_Console FOREIGN KEY REFERENCES Console(IDConsole) NOT NULL
)

CREATE TABLE LoginHistory
(
IDLogin int CONSTRAINT PK_Login PRIMARY KEY IDENTITY,
LoginDateTime datetime NOT NULL,
LoginIPAddress nvarchar(50) NOT NULL,
RegisteredUserID int CONSTRAINT FK_LoginHistory_RegisteredUser FOREIGN KEY REFERENCES RegisteredUser(IDUser) NOT NULL
)

CREATE TABLE PurchaseHistory
(
IDPurchase int CONSTRAINT PK_Purchase PRIMARY KEY IDENTITY,
PurchaseMethod nvarchar(50) NOT NULL,
PurchaseDateTime datetime NOT NULL,
RegisteredUserID int CONSTRAINT FK_PurchaseHistory_RegisteredUser FOREIGN KEY REFERENCES RegisteredUser(IDUser) NOT NULL
)

CREATE TABLE PurchaseGame
(
PurchaseHistoryID int CONSTRAINT FK_PurchaseGame_PurchaseHistory FOREIGN KEY REFERENCES PurchaseHistory(IDPurchase) NOT NULL,
GameID int CONSTRAINT FK_PurchaseGame_Game FOREIGN KEY REFERENCES Game(IDGame) NOT NULL,
Amount int NOT NULL
)