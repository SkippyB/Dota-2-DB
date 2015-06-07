/* Create database file*/
/* 

drop database Yee_Eric_db;*/
create database Yee_Eric_db;
use Yee_Eric_db;

/*

Players (ID, nickname, server location, MMR, team MMR) 

Games (ID, time, score, ranked/unranked, game mode)



Items (ID, Damage, Int, Agi, Str, BAT, ASPD, Armor, Magic resist, speed, special effects).
*/
CREATE TABLE PLAYERS (
	ID			Integer		NOT NULL UNIQUE, 
    Nickname	Char(20)	NOT NULL,
    Main_Server	Char(12)	NULL,
	Solo_MMR	Integer		NULL,
    Team_MMR	Integer		NULL,
    CONSTRAINT	PLAYER_PK	 PRIMARY KEY (ID),
	CHECK (Main_Server IN ('US West', 'US East', 'Europe East', 'Europe West', 'Asia', 'Austrailia', NULL))
	);
    
CREATE TABLE GAMES (
	ID			Integer 	NOT NULL UNIQUE,
    Duration	Char(8)		NOT NULL,
    Dire_Score	Integer		NOT NULL,
    Rad_Score	Integer		NOT NULL,
    Ranked		Bool		NOT NULL,
    Game_Mode	Char(20)	NOT NULL,
    Winner		Char(10)	NOT NULL,
	CONSTRAINT	 GAMES_PK	PRIMARY KEY (ID),
    
    CHECK (Winner IN ('Radiant', 'Dire')),
	CHECK (Game_Mode IN ('All Pick', 'Random Draft', 'Single Draft', 'Captain\'s Draft', 'Captain\'s Mode', 'All Random',
							'Ability Draft', 'Limited Heroes', 'Holiday', 'Custom', 'Least Played'))
                            
	);
/*

HeroStats(ID, Name, Damage, Int, Agi, Str, BAT, ASPD, Armor, Magic resist, range, speed, cast time, backswing) 

HeroPlayed (Player.ID, Game.ID, HeroStats.ID, team, win/loss, kills, deaths, assists, last hits, denies, healing,
 tower damage, damage done)
*/
CREATE TABLE HERO_STATS (
	ID				Integer		NOT NULL UNIQUE,
    Hero_Name		Char(20)	NOT NULL,
    Health			Integer		NOT NULL,
    Damage			integer		NOT NULL,
	Intelect		integer		NOT NULL,
    Strength		Integer 	NOT NULL,
    Agility			Integer 	NOT NULL,
	Intelect_Gain		Decimal(2,1)		NOT NULL,
    Strength_Gain		Decimal(2,1) 	NOT NULL,
    Agility_Gain		Decimal(2,1) 	NOT NULL,
    BAT				Decimal(2,1) 	NOT NULL,
    Armor			Decimal(3,2) 	NOT NULL,
    Magic_Resist	Integer 	NOT NULL,
    Atk_Range		Integer 	NOT NULL,
    Movespeed		Integer		NOT NULL,
    Cast_Time		Decimal(6,5)		NOT NULL,
    Backswing		Decimal(6,5)		NOT NULL,
	CONSTRAINT HERO_STATS_PK Primary Key (ID)
	);
CREATE TABLE HERO_PLAYED (
	Player_ID		Integer		NOT NULL,
    Game_ID			integer		NOT NULL,
	Hero_Stats_ID	integer		NOT NULL,
    Team			Char(7)		NOT NULL,
    Kills			Integer 	NOT NULL,
    Deaths			Integer	NOT NULL,
    Assists			Integer NOT NULL,
    Last_Hits		Integer 	NOT NULL,
    Denies			Integer 	NOT NULL,
    Healing			Integer 	NOT NULL,
    Tower_DMG		Integer 	NOT NULL,
    Hero_DMG		Integer 	NOT NULL,
    CHECK (Team IN ('Radiant', 'Dire')),
    CONSTRAINT HERO_PLAYED_PK PRIMARY KEY (Player_ID, Game_ID),
    CONSTRAINT HERO_PLAYED_RELATION FOREIGN KEY (Player_ID) REFERENCES PLAYERS (ID),
	CONSTRAINT HERO_PLAYED_RELATION2 FOREIGN KEY (Game_ID) REFERENCES GAMES (ID),
	CONSTRAINT HERO_PLAYED_RELATION3 FOREIGN KEY (Hero_Stats_ID) REFERENCES HERO_STATS (ID)


	);

/* Create database file*/
/*create database Dota_2;*/
use Yee_Eric_db;
/*

Players (ID, nickname, server location, MMR, team MMR) 

Games (ID, time, score, ranked/unranked, game mode)



Items (ID, Damage, Int, Agi, Str, BAT, ASPD, Armor, Magic resist, speed, special effects).
*/

INSERT INTO PLAYERS VALUES (0, 'SkippyB', 'US West', 500, 1000);
INSERT INTO PLAYERS VALUES (1, 'Pandobra', 'US West', 512, 1337);
INSERT INTO PLAYERS VALUES (2, 'Dogflip', 'US East', 564, 5534);
INSERT INTO PLAYERS VALUES (3, 'Adawynn', 'US West', 584, 999);
INSERT INTO PLAYERS VALUES (4, 'Tainted', 'US West', 845, 345);
INSERT INTO PLAYERS VALUES (5, 'beanos', 'US East', 456, 989);
INSERT INTO PLAYERS VALUES (6, 'gage', 'Europe West', 846, 3);
INSERT INTO PLAYERS VALUES (7, 'pyro', 'Europe West', 854, 512);
INSERT INTO PLAYERS VALUES (8, 'SkippyB-', 'Asia', 678, 789);
INSERT INTO PLAYERS VALUES (9, 'JoeyJojo', 'Asia', 768, 800);
INSERT INTO PLAYERS VALUES (10, 'Chris', 'Asia', 2, 9001);

INSERT INTO GAMES VALUES (0, '01:40:32', 5, 4, TRUE, 'Ability Draft', 'Dire');

INSERT INTO HERO_STATS VALUES (0, 'Meepo', 540, 34, 26, 24, 28, 1.6, 1.2, 
								1.4, 1.7, 5.6, 35, 128, 310, .5, .2);
INSERT INTO HERO_STATS VALUES (1, 'Meepo', 540, 34, 26, 24, 28, 1.6, 1.2, 
								1.4, 1.7, 5.6, 35, 128, 310, .5, .2);
INSERT INTO HERO_STATS VALUES (2, 'Meepo', 540, 34, 26, 24, 28, 1.6, 1.2, 
								1.4, 1.7, 5.6, 35, 128, 310, .5, .2);
INSERT INTO HERO_STATS VALUES (3, 'Meepo', 540, 34, 26, 24, 28, 1.6, 1.2, 
								1.4, 1.7, 5.6, 35, 128, 310, .5, .2);
INSERT INTO HERO_STATS VALUES (4, 'Meepo', 540, 34, 26, 24, 28, 1.6, 1.2, 
								1.4, 1.7, 5.6, 35, 128, 310, .5, .2);
INSERT INTO HERO_STATS VALUES (5, 'Warlock', 440, 30, 36, 34, 21, 2.3, 4.1, 
								2.4, 1.6, 1.0, 25, 550, 310, .5, .2);
INSERT INTO HERO_STATS VALUES (6, 'Chen', 570, 23, 33, 31, 26, 3.1, 2.2, 
								4.4, 1.5, 4.6, 25, 450, 310, .1, .4);
INSERT INTO HERO_STATS VALUES (7, 'Invoker', 322, 34, 26, 24, 28, 3.4, 2.2, 
								1.4, 1.7, 2.0, 25, 400, 310, 0.0, .6);
INSERT INTO HERO_STATS VALUES (8, 'Anti-Mage', 420, 34, 26, 24, 28, 2.6, 4.2, 
								1.4, 1.5, 3.1, 25, 128, 310, .3, .25);
INSERT INTO HERO_STATS VALUES (9, 'Garen', 730, 70, 36, 31, 30, 5.0, 4.0, 
								5.0, 1.0, 8.7, 50, 200, 310, 0.0, 0.0);

                                
INSERT INTO HERO_PLAYED VALUES (0, 0, 0, 'Radiant', 12, 8, 15,
								423, 6, 0, 4957, 163452);
INSERT INTO HERO_PLAYED VALUES (1, 0, 1, 'Radiant', 11, 6, 16,
								423, 6, 0, 23452, 165834);
INSERT INTO HERO_PLAYED VALUES (2, 0, 2, 'Radiant', 22, 7, 44,
								423, 6, 0, 8234, 59467);
INSERT INTO HERO_PLAYED VALUES (3, 0, 3, 'Radiant', 33, 5, 25,
								423, 6, 243, 4723, 73456);
INSERT INTO HERO_PLAYED VALUES (4, 0, 4, 'Radiant',  72, 3, 11,
								423, 6, 0, 7245, 65434);
INSERT INTO HERO_PLAYED VALUES (5, 0, 5, 'Dire', 12, 0, 0,
								423, 6, 0, 82234, 582345);
INSERT INTO HERO_PLAYED VALUES (6, 0, 6, 'Dire',  22, 9, 1,
								423, 6, 44, 7245, 284324);
INSERT INTO HERO_PLAYED VALUES (7, 0, 7, 'Dire', 31, 5, 4,
								423, 6, 0, 23, 84234);
INSERT INTO HERO_PLAYED VALUES (8, 0, 8, 'Dire', 7, 11, 22,
								423, 6, 0, 54, 57243);
INSERT INTO HERO_PLAYED VALUES (9, 0, 9, 'Dire', 5, 15, 25,
								423, 6, 1342, 2345, 2754);



