use Haclymorph

create proc GetGamesForConsole
@IDConsole int
as
begin
select * from Game 
inner join Console on Console.IDConsole = Game.ConsoleID
where Game.ConsoleID = @IDConsole
end

create proc GetConsole
@IDConsole int
as
begin
select * from Console where Console.IDConsole = @IDConsole
end

CREATE PROC GetGameForId
@IDGame int
as
begin
select * from Game as g
inner join Console as c on g.ConsoleID = c.IDConsole
inner join Publisher as p on g.PublisherID = p.IDPublisher
inner join Genre as ge on g.GenreID = ge.IDGenre
where g.IDGame = @IDGame
end

CREATE PROC InsertUser
@FirstName nvarchar(50),
@LastName nvarchar(50),
@StreetName nvarchar(50),
@HouseNumber int,
@PostalNumber nvarchar(50),
@TownName nvarchar(50),
@Email nvarchar(50),
@UserPassword nvarchar(50)
as
begin
DECLARE @UserID int 
INSERT INTO Street(StreetName) VALUES (@StreetName)
INSERT INTO Town(PostalNumber, TownName) VALUES (@PostalNumber, @TownName)
SET @UserID = SCOPE_IDENTITY()
INSERT INTO UserAddress(HouseNumber, StreetID, TownID) VALUES (@HouseNumber, @UserID, @UserID)
INSERT INTO RegisteredUser(FirstName, LastName, Email, AddressID, UserPassword, IsAdmin)
VALUES (@FirstName, @LastName, @Email, @UserID, @UserPassword, 0)
end

CREATE PROC GetUserForEmail
@Email nvarchar(50)
as
begin
select * from RegisteredUser as r
inner join UserAddress as u on r.AddressID = u.IDAddress
inner join Town as t on u.TownID = t.IDTown
inner join Street as s on u.StreetID = s.IDStreet
where r.Email = @Email
end

CREATE PROC InsertPurchase
@PurchaseMethod nvarchar(50),
@RegisteredUserID int,
@PurchaseID int output
as
begin
INSERT INTO PurchaseHistory(PurchaseMethod, PurchaseDateTime, RegisteredUserID)
VALUES (@PurchaseMethod, getdate(), @RegisteredUserID)
select @PurchaseID = SCOPE_IDENTITY()
end


CREATE PROC InsertPurchaseGame
@PurchaseHistoryID int, 
@GameID int,
@Amount int
as
begin
INSERT INTO PurchaseGame(PurchaseHistoryID, GameID, Amount) 
VALUES (@PurchaseHistoryID, @GameID, @Amount)
end

CREATE PROC GetCompletePurchaseHistoryTableRows
as
begin
select * from PurchaseHistory 
inner join PurchaseGame on PurchaseHistory.IDPurchase = PurchaseGame.PurchaseHistoryID
inner join Game on PurchaseGame.GameID = Game.IDGame
inner join RegisteredUser on PurchaseHistory.RegisteredUserID = RegisteredUser.IDUser
end

CREATE PROC GetPurchaseHistoryTableRowsForUser
@UserId int
as
begin
select * from PurchaseHistory 
inner join PurchaseGame on PurchaseHistory.IDPurchase = PurchaseGame.PurchaseHistoryID
inner join Game on PurchaseGame.GameID = Game.IDGame
inner join RegisteredUser on PurchaseHistory.RegisteredUserID = RegisteredUser.IDUser
where PurchaseHistory.RegisteredUserID = @UserId
end

create proc InitializeDatabase
as
begin
INSERT INTO Console(ConsoleName) VALUES ('NINTENDO SWITCH')
INSERT INTO Console(ConsoleName) VALUES ('PC')
INSERT INTO Console(ConsoleName) VALUES ('XBOX ONE')
INSERT INTO Console(ConsoleName) VALUES ('PLAYSTATION 4')

--doom, wolfenstein 2
INSERT INTO Publisher(PublisherName) VALUES ('Bethesda Softworks')
INSERT INTO Publisher(PublisherName) VALUES ('Nintendo')
--anthem, bfv, fifa, need for speed, sims, nhl
INSERT INTO Publisher(PublisherName) VALUES ('Electronic Arts')
--far cry, assassins creed, ghost recon
INSERT INTO Publisher(PublisherName) VALUES ('Ubisoft')
--football manager
INSERT INTO Publisher(PublisherName) VALUES ('SEGA')
--just cause 4, hitman
INSERT INTO Publisher(PublisherName) VALUES ('Square Enix')
--overwatch
INSERT INTO Publisher(PublisherName) VALUES ('Blizzard Entertainment')
--bloodborne, days gone, death stranding
INSERT INTO Publisher(PublisherName) VALUES ('Sony Interactive Entertainment')
--borderlands, civ 6, wwe2k19
INSERT INTO Publisher(PublisherName) VALUES ('2K')
--call of duty, ctr, sekiro
INSERT INTO Publisher(PublisherName) VALUES ('Activision')
--injustice 2, incredibles 2
INSERT INTO Publisher(PublisherName) VALUES ('Warner Bros. Interactive Entertainment')

--doom, battlefield, far cry, overwatch, wolfenstein, call of duty
INSERT INTO Genre(GenreName) VALUES ('First-person shooter')
--smash, injustice 2
INSERT INTO Genre(GenreName) VALUES ('Fighting game')
--anthem, bloodborne, borderlands
INSERT INTO Genre(GenreName) VALUES ('Action role-playing game')
--assassins creed, pokemon, zelda, just cause, days gone, death stranding, sekiro, incredibles
INSERT INTO Genre(GenreName) VALUES ('Action-adventure game')
--mario tennis, fifa, football manager, nhl 19, wwe2k19
INSERT INTO Genre(GenreName) VALUES ('Sport')
--mario maker 2
INSERT INTO Genre(GenreName) VALUES ('2D Platformer')
--splatoon, ghost recon
INSERT INTO Genre(GenreName) VALUES ('Third-person shooter')
--super mario odyssey
INSERT INTO Genre(GenreName) VALUES ('Platform game')
--need for speed, crash team racing
INSERT INTO Genre(GenreName) VALUES ('Racing video game')
--sims
INSERT INTO Genre(GenreName) VALUES ('Life simulation game')
--civ 6
INSERT INTO Genre(GenreName) VALUES ('Turn-based strategy game')
--hitman
INSERT INTO Genre(GenreName) VALUES ('Stealth game')

 
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Super Smash Bros. Ultimate','Super Smash Bros. Ultimate is a fighting game for up to eight players in which characters from Nintendo games and other third-party franchises must try to knock each other out of an arena. Each player has a percentage meter which raises when they take damage, making them easier to launch in the air and out of the arena.[2] Standard battles use one of three victory conditions: Timed, where players aim to win the most points by defeating opponents within a time limit, Stock, where players have a set number of lives and must aim to be the last player standing, and Stamina, where players must simply reduce their opponents health down to zero to defeat them. Players can adjust the rules to their liking and save them as presets for future matches.', 550, 'resources/images/switch/smash-ultimate.jpg', 2, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Doom','Doom (previously known as Doom 4 and stylized as DOOM) is a soft reboot of the Doom franchise produced by id Software and published by Bethesda Softworks. The game was released on May 13, 2016. It is currently available on PC, PS4, and Xbox One, and was released on the Nintendo Switch on November 10, 2017. The game features the Doom Slayer, an ancient warrior awakened during a demonic incursion on Mars in 2148 after the Union Aerospace Corporation scientist Dr. Olivia Pierce allows Hell to invade. A sequel, Doom Eternal, was announced in 2018 and expected to be released on March 20, 2020.', 250, 'resources/images/switch/doom.jpg', 1, 1, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Mario Tennis Aces','Mario Tennis Aces is a multiplayer sports game for the Nintendo Switch and the eighth installment in the Mario Tennis series. It is also the first game in the series since Mario Tennis: Power Tour on the Game Boy Advance to feature a story mode, in which Mario must advance through a number of missions and stop a powerful tennis racket, Lucien, from destroying the Kingdom of Bask, the games setting. While the gameplay engine appears to be based on that of Mario Tennis: Ultra Smash, it refines the traditional tennis gameplay of the series by introducing several new techniques. One of the prime features in this game is an energy gauge which can be charged throughout the course of a match by rallying the ball. Energy grants the ability to slow down the time during a match in order to catch a ball more easily. Under certain conditions, it can also be used to stop time and launch the ball from a first-person perspective to the other side of the court through Zone Shots and Special Shots. These are powerful types of shots that can damage or break the opponents racket if not countered correctly. The game also offers expanded online features, mostly through tournaments and co-op challenges, where players can participate to unlock exclusive content. Since release, the game has been updated with new playable characters, story mode levels, modes of play, and tournament features, most notably a rank classification.', 400, 'resources/images/switch/mario-tennis-aces.jpg', 5, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Pokemon Lets Go Pikachu','Pokémon: Lets Go, Pikachu! and Pokémon: Lets Go, Eevee![b] are 2018 remakes of the 1998 role-playing video game Pokémon Yellow. They were developed by Game Freak, published by The Pokémon Company and Nintendo for the Nintendo Switch. Announced in May 2018, Lets Go, Pikachu! and Lets Go, Eevee! were released worldwide for the Nintendo Switch on November 16, 2018. The games are part of the seventh generation of the Pokémon video game series and are the first of such to be released for a home game console. They feature connectivity with the mobile game Pokémon Go and support an optional controller, the Poké Ball Plus.', 450, 'resources/images/switch/pokemon-lets-go-pikachu.jpg', 4, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Pokemon Shield','Pokémon Shield is one of the two latest Pokémon adventures. It takes place in the Galar region, which is inspired by the UK, and features three new starters, and brings back gym battles. Older Pokémon seem to make an appearance as well, so youll see some of your favorites.', 550, 'resources/images/switch/pokemon-shield.jpg', 4, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Splatoon 2','Like its predecessor, Splatoon 2 is a third-person shooter in which players control characters, known as Inklings and Octolings, and use colored ink as ammunition. Ink is also used to cover the ground, or any paintable surface, in order to swim or refill their ink tanks. Inklings and Octolings can morph between humanoid, or kid form, where they switch from walking, and shooting, into squid form where they can quickly swim through ink of their own color, and replenish their ink supply, as well as return to full health. The sequel adds new standard, sub and special weapons, including dual-wield pistols called Dualies that allow the player to perform dodge rolls, shotgun-like weapons called Brellas that enable defensive maneuvers with folding shields, and jetpacks known as Inkjets.', 500, 'resources/images/switch/splatoon-2.jpg', 7, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('The Legend of Zelda: Breath of the Wild','The Legend of Zelda: Breath of the Wild[a] is an action-adventure game developed and published by Nintendo, released for the Nintendo Switch and Wii U consoles on March 3, 2017. Breath of the Wild is set at the end of the Zelda timeline; the player controls Link, who awakens from a hundred-year slumber to defeat Calamity Ganon before it can destroy the kingdom of Hyrule.', 500, 'resources/images/switch/zelda-breath-of-the-wild.jpg', 4, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('The Legend of Zelda: Links Awakening','The Legend of Zelda: Links Awakening[a] is an action-adventure game developed by Grezzo and published by Nintendo for the Nintendo Switch. It was released on September 20, 2019. As of December 2019, the game has sold over 4 million copies worldwide, making it one of the best-selling Nintendo Switch games. Links Awakening is a remake of the 1993 game for the Game Boy. It retains the originals top-down perspective and gameplay, along with elements from the 1998 re-release Links Awakening DX. The game features a "retro-modern" art style unique within the series with toy-like character designs, diorama-like world designs, and tilt-shift visuals that evoke the original games presentation on the Game Boy. It also features customizable dungeons which the player can create and then complete for rewards.', 550, 'resources/images/switch/zelda-links-awakening.jpg', 4, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Mario Kart 8 Deluxe','Mario Kart 8[b] is a kart racing video game and the eighth major installment in the Mario Kart series, developed and published by Nintendo for their Wii U home video game console. The game was announced at E3 2013 and released worldwide in May 2014. Like in other games in the series, in Mario Kart 8, players control characters from the Mario franchise and participate in kart racing on various race tracks, using a variety of items to hinder opponents or gain advantages in the race. While incorporating game mechanics originally featured in earlier Mario Kart games, Mario Kart 8 introduces anti-gravity sections that allow players to drive on walls or ceilings, in addition to allowing them to bump into one another for a short boost. The game features single-player and multiplayer gamemodes, including online via the Nintendo Network.', 550, 'resources/images/switch/mario-kart-8.jpg', 9, 2, 1)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Super Mario Maker 2','Like its predecessor, Super Mario Maker 2 is a side-scrolling platform game in which players create their own courses using assets from across the Super Mario series and publish them onto the internet for others to play. Players can choose from a selection of prior Super Mario games to base their courses visual style and gameplay on, including Super Mario Bros., Super Mario Bros. 3, Super Mario World, New Super Mario Bros. U, and a newly introduced Super Mario 3D World theme. Gameplay mechanics and enemy behaviors can vary between the styles, with some elements being limited to specific styles. The sequel adds various assets and tools, including assets and a course theme based on Super Mario 3D World. It also introduces local and online multiplayer modes including co-op course creation, where up to 2 players can locally create stages together at the same time; as well as allowing up to 4 online players to complete user-made courses, cooperatively or competitively. Super Mario Maker 2 also features a new single-player campaign known as Story Mode.', 550, 'resources/images/switch/mario-maker-2.jpg', 6, 2, 1)



INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Anthem','Anthem is an online multiplayer action role-playing video game developed by BioWare and published by Electronic Arts. The game was released worldwide for Microsoft Windows, PlayStation 4 and Xbox One on February 22, 2019. Set on an unnamed planet, players assume the role of Freelancers, heroic adventurers who wear powerful exosuits to defend humanity from the threats beyond their cities walls. The games title refers to the Anthem of Creation, a powerful and mysterious force responsible for most of the extraordinary technology, phenomena, and threats in the world. In the main narrative, the players Freelancer is tasked with stopping the villainous Monitor from seizing control of the Anthem.', 200, 'resources/images/pc/anthem.png', 3, 3, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Battlefield V','Battlefield V is a first-person shooter video game developed by EA DICE and published by Electronic Arts. Battlefield V is the sixteenth installment in the Battlefield series. It was released worldwide for Microsoft Windows, PlayStation 4, and Xbox One on November 20, 2018. Those who pre-ordered the Deluxe Edition of the game were granted early access to the game on November 15, 2018, and Origin Access Premium subscribers on PC received access to the game on November 9, 2018. The game is based on World War II and is a thematic continuation of its World War I based precursor Battlefield 1.', 300, 'resources/images/pc/battlefield-v.jpg', 1, 3, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Far Cry New Dawn','Far Cry New Dawn is a 2019 first-person shooter developed by Ubisoft Montreal and published by Ubisoft. The game is a spin-off of the Far Cry series and a narrative sequel to Far Cry 5. As a result, it features many pre-existing gameplay elements from the series, including a large open world, capturing of outposts, and AI or co-op companions; but also introduces several elements from RPG gameplay, including an upgradeable home base and increased reliance of crafting from limited supplies. It is set in the fictional Hope County, Montana and uses a reimagined version of Far Cry 5s map. The nuclear war portrayed in Far Cry 5 has reshaped the landscape so that new areas have become available for the player to explore while others are inaccessible.', 350, 'resources/images/pc/far-cry-new-dawn.jpg', 1, 4, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Fifa 20','FIFA 20 is a football simulation video game published by Electronic Arts as part of the FIFA series. It is the 27th installment in the FIFA series, and was released on 27 September 2019 for Microsoft Windows, PlayStation 4, Xbox One, and Nintendo Switch. Gameplay changes to FIFA 20 focus primarily on a new feature titled VOLTA Football. The mode, which translates to return in Portuguese, focuses on street football rather than the traditional matches associated with the FIFA series. It includes several options to play in three versus three, four versus four and five versus five matches, as well as with professional futsal rules. The mode will incorporate the same engine, but places emphasis on skill and independent play rather than tactical or team play.', 500, 'resources/images/pc/fifa-20.jpg', 5, 3, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Football Manager 2020','Football Manager 2020 (officially abbreviated as FM20) is a 2019 football-management simulation video game developed by Sports Interactive and published by Sega as a successor to Football Manager 2019. It was released worldwide on 18 November 2019. In June 2019, it was announced that FM20 will be a launch title for the Stadia streaming platform.', 200, 'resources/images/pc/football-manager-2020.jpg', 5, 5, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Just Cause 4','Just Cause 4 is an action-adventure game played from a third-person perspective. The player assumes the role of series protagonist Rico Rodriguez. The game takes place in Solis, a large open world consisting of different biomes including snowy mountains and deserts. Rico can transverse in the games world using his wingsuit and grappling hook, whose functions are expanded to include the ability to attach hot air balloons and rocket boosters on objects. A new wind and particle system was introduced, and it affects Ricos traversal with his wingsuit. The game also features a weather system and environmental hazards such as tornados and thunderstorms.', 250, 'resources/images/pc/just-cause-4.jpg', 4, 6, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Need for Speed Heat','Need for Speed Heat is a racing game set in an open world environment called Palm City, a fictionalised version of the city of Miami, Florida and its surrounding area. The in-game map features diverse geography, including mountainous areas and open fields. Unlike Need for Speed Payback, the game does not include a 24-hour day-night cycle, but players can switch between day and night. During the day, players can take part in sanctioned race events, which reward players with cash to spend on new cars and upgrades. They can also take part in illegal street races at night, which would earn players rep. The more rep player earns, the more aggressive the police will be during the night. Players must escape the cops and get back to their safehouse, before they are busted, or their car is wrecked. When players return to a safehouse, the rep they have earned during the night will be multiplied by their "Heat Level". If players are arrested, they will lose their rep multiplier, but will still receive their unmultiplied rep.', 400, 'resources/images/pc/need-for-speed-heat.jpg', 9, 3, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Overwatch','Overwatch is a team-based multiplayer first-person shooter developed and published by Blizzard Entertainment. Described as a "hero shooter," Overwatch assigns players into two teams of six, with each player selecting from a roster of over 30 characters, known as "heroes," each with a unique style of play that is divided into three general roles that fit their purpose. Players on a team work together to secure and defend control points on a map or escort a payload across the map in a limited amount of time. Players gain cosmetic rewards that do not affect gameplay, such as character skins and victory poses, as they play the game.', 150, 'resources/images/pc/overwatch.jpg', 1, 7, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('The Sims 4','The Sims 4 is a life simulation game, similar to its predecessors. Players create a Sim character and control their life to explore different personalities which change the way the game plays out. Sims can multitask. Sims moodlets change the gameplay by influencing the sims emotional state, introducing new interaction options.Similar to previous Sims games, player-created challenges abound. One of the most prevalent is the Legacy Challenge, in which players create a single Sim and try to make its family line last for ten generations.', 350, 'resources/images/pc/the-sims-4.jpg', 10, 3, 2)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Wolfenstein II: The New Colossus','Wolfenstein II: The New Colossus is an action-adventure first-person shooter video game developed by MachineGames and published by Bethesda Softworks. It was released on 27 October 2017 for Microsoft Windows, PlayStation 4, and Xbox One, and was released on 29 June 2018 for Nintendo Switch. The eighth main entry in the Wolfenstein series and the sequel to 2014s Wolfenstein: The New Order, the game is set in an alternate history which takes place in 1961 following the Nazi victory in the Second World War. The story follows war veteran William "B.J." Blazkowicz and his efforts to fight against the Nazi regime in the United States. The game is played from a first-person perspective and most of its levels are navigated on foot.', 200, 'resources/images/pc/wolfenstein-2-the-new-colossus.jpg', 1, 1, 2)



INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Anthem','Anthem is an online multiplayer action role-playing video game developed by BioWare and published by Electronic Arts. The game was released worldwide for Microsoft Windows, PlayStation 4 and Xbox One on February 22, 2019. Set on an unnamed planet, players assume the role of Freelancers, heroic adventurers who wear powerful exosuits to defend humanity from the threats beyond their cities walls. The games title refers to the Anthem of Creation, a powerful and mysterious force responsible for most of the extraordinary technology, phenomena, and threats in the world. In the main narrative, the players Freelancer is tasked with stopping the villainous Monitor from seizing control of the Anthem.', 200, 'resources/images/xbox/anthem.jpg', 3, 3, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Battlefield V','Battlefield V is a first-person shooter video game developed by EA DICE and published by Electronic Arts. Battlefield V is the sixteenth installment in the Battlefield series. It was released worldwide for Microsoft Windows, PlayStation 4, and Xbox One on November 20, 2018. Those who pre-ordered the Deluxe Edition of the game were granted early access to the game on November 15, 2018, and Origin Access Premium subscribers on PC received access to the game on November 9, 2018. The game is based on World War II and is a thematic continuation of its World War I based precursor Battlefield 1.', 300, 'resources/images/xbox/battlefield-v.jpg', 1, 3, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Call of Duty: Modern Warfare','Call of Duty: Modern Warfare is a first-person shooter video game developed by Infinity Ward and published by Activision. Serving as the sixteenth overall installment in the Call of Duty series, as well as a reboot of the Modern Warfare sub-series, it was released on October 25, 2019, for Microsoft Windows, PlayStation 4, and Xbox One. The game takes place in a realistic and modern setting. The campaign follows a CIA officer and British SAS forces as they team up with rebels from the fictional country of Urzikstan, combating together against Russian forces who have invaded the country. The games Special Ops mode features cooperative play missions that follow up the campaigns story. The multiplayer mode supports cross-platform multiplayer for the first time in the series.', 300, 'resources/images/xbox/call-of-duty-modern-warfare.jpg', 1, 10, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Ghost Recon: Breakpoint','Like its predecessor Wildlands, Breakpoint is a tactical shooter game set in an open world environment. It is played from a third-person perspective and uses an optional first-person view for aiming weapons. Players take on the role of Lieutenant Colonel Anthony "Nomad" Perryman, a member of the Delta Company, First Battalion, 5th Special Forces Group, also known as "Ghosts", a fictional elite special operations unit of the United States Army under the Joint Special Operations Command. The game world, Auroa, is an open world environment that features a variety of landscapes, and these can be used for tactical advantages. For instance, players can slide down rocky terrain and use mud to camouflage themselves.', 300, 'resources/images/xbox/ghost-recon-breakpoint.jpg', 7, 4, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Hitman','Hitman is an action-adventure stealth video game in which players control Agent 47, a genetically-enhanced assassin, from a third-person perspective, as he travels to international locations and carries out contracted assassinations of criminal targets across the globe. As in other games in the Hitman series, players are given a large amount of room for creativity in approaching their assassinations. As such, players may utilise long-ranged rifles to snipe a target from a long distance, or they may decide to assassinate the target at close range by using the aforementioned blade weapons or 47s specially-equipped garrote wire. A common method to approach a mission is to incapacitate other non-player characters and wear their outfits as disguises, which allows the player to gain access to restricted areas more easily.', 100, 'resources/images/xbox/hitman.jpg', 12, 6, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Injustice 2','Injustice 2 is a fighting game in which players compete in one-on-one combat using characters from the DC Universe and other third-party franchises. Using different combinations of directional inputs and button presses, players must perform basic attacks, special moves, and combos to try to damage and knock out the opposing fighter. Injustice 2 retains numerous gameplay mechanics from Injustice: Gods Among Us, including environment interaction, stage transitions, clashes, and character traits. The trait system, like before, provides a temporary buff or ability that complements each characters playstyle. The super meter, which allows players to execute enhanced special moves and unlock powerful "super moves" when fully charged, also returns.', 200, 'resources/images/xbox/injustice-2.jpg', 2, 11, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('NHL 19','NHL 19 is an ice hockey simulation video game developed by EA Vancouver and published by EA Sports. It was released on PlayStation 4 and Xbox One on September 14, 2018. NHL 19 included new game modes that allowed players to play on outdoor rinks, online. With new gameplay technology, EA Sports also announced that skating had more acceleration, action, speed, and responsiveness than in previous installments. NHL 19’s new feature “World of Chel” allows the player to explore various modes while maintaining the player’s character progression.', 300, 'resources/images/xbox/nhl-19.jpg', 5, 3, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Sekiro: Shadows Die Twice','Sekiro: Shadows Die Twice is an action-adventure video game developed by FromSoftware and published by Activision. The game takes place in the Sengoku period in Japan, and follows a shinobi known as Wolf as he attempts to take revenge on a samurai clan who attacked him and kidnapped his lord. Gameplay is focused on stealth, exploration, and combat, with a particular emphasis on boss battles. Although most of the game takes place in fictional areas, some areas are inspired by real-world buildings and locations in Japan. The game also makes strong references to Buddhist mythology and philosophy. While creating the game, director Hidetaka Miyazaki wanted to create a new intellectual property (IP) that marked a departure from the Souls series of games also made by FromSoftware, and looked to series such as Tenchu for inspiration.', 350, 'resources/images/xbox/sekiro-shadows-die-twice.jpg', 4, 10, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('The Incredibles','Lego The Incredibles is a Lego-themed action-adventure video game developed by TT Fusion, based on both The Incredibles and Incredibles 2 films.The gameplay is very similar to the previous Lego installments, with puzzles designed for younger players, various waves of fighting enemies and, of course, two players cooperative gameplay. The game allows the player to control various super-heroes and villains alike from both films (including supers that have appeared in neither film but are listed in the National Supers Agency database in the special features of The Incredibles videodisc release), each with their own special abilities and superpowers.', 300, 'resources/images/xbox/the-incredibles.jpg', 4, 11, 3)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('WWE 2K19','WWE 2K19 is a professional wrestling video game developed by Yukes and published by 2K Sports. WWE 2K19 arrives as the latest entry to the flagship WWE video game franchise and features cover Superstar AJ Styles. WWE 2K19 will showcase a massive roster of popular WWE Superstars, Legends and Hall of Famers, as well as NXT favorites. Experience authentic WWE gameplay, extensive creation options, engaging match types, fan-favorite modes and much more!', 300, 'resources/images/xbox/wwe-2k19.jpg', 5, 9, 3)



INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Assassins creed IV: Black Flag','Assassins Creed IV: Black Flag is an action-adventure video game developed by Ubisoft Montreal and published by Ubisoft. It is the sixth major installment in the Assassins Creed series. The plot is set in a fictional history of real-world events and follows the centuries-old struggle between the Assassins, who fight for peace with free will, and the Templars, who desire peace through control. The framing story is set in the 21st century and describes the player as an Abstergo agent. The main story is set in the 18th century Caribbean during the Golden Age of Piracy, and follows notorious Welsh pirate Edward Kenway, grandfather and father of Assassins Creed III protagonist Ratonhnhaké:ton and antagonist Haytham Kenway, respectively, who stumbles upon the Assassin/Templar conflict. The attempted establishment of a Republic of Pirates utopia (free from either British or Spanish rule) is a significant plot element.', 150, 'resources/images/ps4/assassins-creed-black-flag.jpg', 4, 4, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Assassins creed Odyssey','Assassins Creed Odyssey is an action role-playing video game developed by Ubisoft Quebec and published by Ubisoft. Assassins Creed Odyssey places more emphasis on role-playing elements than previous games in the series. The game contains dialogue options, branching quests and multiple endings. The player is able to choose between siblings Alexios and Kassandra as to whom they use as the main character. The game features a notoriety system in which mercenaries chase after the player if they commit crimes like killing or stealing in the presence of others.The player character is a Greek mercenary and a descendant of the Spartan king Leonidas I. They inherit his broken spear, which is forged into a blade to become a weapon that grants the player special abilities in combat. The game uses a skill tree system that allows the player to unlock new abilities.', 350, 'resources/images/ps4/assassins-creed-odyssey.jpg', 4, 4, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Assassins creed Origins','Assassins Creed Origins is an action-adventure video game developed by Ubisoft Montreal and published by Ubisoft.Assassins Creed Origins is an action-adventure stealth game played from a third-person perspective. Players complete quests—linear scenarios with set objectives—to progress through the story, earn experience points, and acquire new skills. Outside of quests, the player can freely roam the open world environment on foot, horseback, camel-back, horse-drawn vehicles or boat to explore locations, complete optional side-quests and unlock weapons.', 300, 'resources/images/ps4/assassins-creed-origins.jpg', 4, 4, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Battlefield V','Battlefield V is a first-person shooter video game developed by EA DICE and published by Electronic Arts. Battlefield V is the sixteenth installment in the Battlefield series. It was released worldwide for Microsoft Windows, PlayStation 4, and Xbox One on November 20, 2018. Those who pre-ordered the Deluxe Edition of the game were granted early access to the game on November 15, 2018, and Origin Access Premium subscribers on PC received access to the game on November 9, 2018. The game is based on World War II and is a thematic continuation of its World War I based precursor Battlefield 1.', 300, 'resources/images/ps4/battlefield-v.jpg', 1, 3, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Bloodborne','Bloodborne is an action role-playing game developed by FromSoftware and published by Sony Computer Entertainment for the PlayStation 4.The game is played from a third-person perspective. Players control a customizable protagonist and the gameplay is focused on weapons-based combat and exploration. Players battle varied enemies, including bosses, while using items such as swords and firearms as they journey through the story, exploring the games different locations, interacting with non-player characters, collecting key items involved in the story, and discovering and unraveling the worlds many mysteries. The player makes their way through different locations within the decrepit Gothic world of Yharnam, while battling varied enemies, including bosses, collecting different types of items that have many uses, interacting with the strange non-player characters, opening up shortcuts, and continuing through the main story.', 250, 'resources/images/ps4/bloodborne.jpg', 3, 8, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Borderlands 3','Borderlands 3 is an action role-playing first-person shooter video game developed by Gearbox Software and published by 2K Games. Borderlands 3 is a loot-driven first-person shooter. Players, either playing alone or in parties of up to four people, make a character from one of the four classes available, and take on various missions given out by non-playable characters (NPCs) and at bounty boards to gain experience, in-game monetary rewards, and reward items. Players can also gain these items by defeating enemies throughout the game. As the player gains level, they gain skills points to allocate across a skill tree. The game introduces four new playable characters: Amara, a "Siren" who summons ethereal fists; Moze, a young "Gunner" who rides the mecha Iron Bear; Zane, an "Operative" with a variety of gadgets; and FL4K, a robot "Beastmaster" who summons creatures to aid in fights.', 300, 'resources/images/ps4/borderlands-3.jpg', 3, 9, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Call of Duty: Modern Warfare Remastered','Call of Duty: Modern Warfare Remastered is a 2016 first-person shooter game developed by Raven Software and published by Activision. It is a remastered version of 2007s Call of Duty 4: Modern Warfare. Call of Duty: Modern Warfare Remastered features the same core gameplay as the original version: it is a first-person shooter in which the player controls several characters. However, it includes a few modifications. For example, while in the prone position, the players equipped weapon is now visible. The game uses "dual render technology" for sniper rifle scopes when aiming, providing the player with a view of the scope and blurred surroundings, as opposed to a black screen representing the scope interior present in the original. Throughout the campaign, new predetermined first-person animations are present on a few occasions.In multiplayer modes, if a weapon is equipped, players now have the ability to taunt their opponents, such as allowing the player to inspect the exterior of their gun.', 200, 'resources/images/ps4/call-of-duty-modern-warfare-remastered.png', 1, 10, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Civilization VI','Sid Meiers Civilization VI is a turn-based strategy 4X video game developed by Firaxis Games, published by 2K Games, and distributed by Take-Two Interactive. Civilization VI is a turn-based strategy video game in which one or more players compete alongside computer-controlled AI opponents to grow their individual civilization from a small tribe to control of the entire planet across several periods of development. This can be accomplished by achieving one of several victory conditions, all based on the 4X gameplay elements, "eXplore, eXpand, eXploit, and eXterminate". Players found cities, gather nearby resources to build and expand them by adding various city improvements, and build military units to explore and attack opposing forces, while managing the technology development, culture, and government civics for their civilization and their diplomatic relationships with the other opponents.', 200, 'resources/images/ps4/civilization-vi.jpg', 11, 9, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Crash Team Racing: Nitro Fueled','Crash Team Racing Nitro-Fueled (stylized as CTR: Crash Team Racing Nitro-Fueled) is a kart racing game developed by Beenox and published by Activision. It is a remaster of Crash Team Racing, which was originally developed by Naughty Dog for the PlayStation in 1999. Like the original Crash Team Racing, Nitro-Fueled is a racing game featuring characters from the Crash Bandicoot series. Players must avoid obstacles and navigate the various tracks to reach the finish line, performing boosts via power sliding and jumping to gain speed, and using power-ups scattered across the track to give themselves a boost or hinder their opponents. The game supports local quick races and grand prix circuits, multiple battle modes, and online multiplayer, as well as featuring a full adventure mode with new areas, characters and boss battles being unlocked as the player progresses.', 300, 'resources/images/ps4/crash-team-racing-nitro-fueled.jpg', 9, 10, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Days Gone','Days Gone is a 2019 action-adventure survival horror video game developed by SIE Bend Studio and published by Sony Interactive Entertainment for the PlayStation 4. Set in a post-apocalyptic Oregon two years after the start of a global pandemic, former outlaw-turned-drifter Deacon St. John discovers the possibility of his wife Sarah still being alive, which leads Deacon on a quest to find her. Days Gone is played from a third-person perspective, in which the player can explore an open world environment. Players can use firearms, melee weapons and improvised weapons, and can use stealth to defend against hostile humans and cannibalistic creatures known as Freakers. A major game mechanic is Deacons motorcycle, which is used as the player characters primary mode of transportation as well as mobile inventory.', 300, 'resources/images/ps4/days-gone.jpg', 4, 8, 4)
INSERT INTO Game(GameName, GameDescription, Price, ImgPath, GenreID, PublisherID,  ConsoleID) 
VALUES('Death Stranding','Death Stranding is an action game developed by Kojima Productions.Death Stranding is an action game set in an open world, and also includes asynchronous online functions. Kojima compared the genre to how his earlier game Metal Gear—now considered to be a stealth game—was called an action game during its release because the stealth genre was not considered to exist at the time. The player controls Sam Bridges, a porter for a company known as Bridges. The player is tasked with delivering supply cargo to various isolated cities known as KNOTs, as well as isolated researchers and survivalists, while also connecting them to a communications system known as the Chiral Network. The player is evaluated by the company and recipients based on their performance (including via "likes" similar to social networks), including whether the cargo was delivered, and if it is intact among other factors. These merits are, in turn, used to level up the players statistics, such as stability and weight capacity, and increase their standing with individual locations and characters (which can improve rewards). How cargo is packed by the player, and the overall weight being carried, affect Sams ability to navigate through the environments.', 400, 'resources/images/ps4/death-stranding.jpg', 4, 8, 4)

--INITIALIZING THE ADMIN USER
INSERT INTO Street(StreetName)
VALUES('Savska')
INSERT INTO Town (PostalNumber, TownName)
VALUES ('10000', 'Zagreb')
INSERT INTO UserAddress(HouseNumber, StreetID, TownID)
VALUES(15, 1, 1)
INSERT INTO RegisteredUser(FirstName, LastName, Email, UserPassword, IsAdmin, AddressID)
VALUES('Admin', 'User', 'admin@mail.hr', 'Password123', 1, 1)

end
