create database marvel_characters;
use marvel_characters;
CREATE TABLE marvels (ID INTEGER PRIMARY KEY,
    name TEXT,
    popularity INTEGER,
    alignment TEXT,
    gender TEXT, 
    height_m varchar(256),
    weight_kg varchar(256),
    hometown TEXT,
    intelligence INTEGER,
    strength INTEGER,
    speed INTEGER,
    durability INTEGER,
    energy_Projection INTEGER,
    fighting_Skills INTEGER);
    
INSERT INTO marvels VALUES(1, "Spider Man", 1, "Good", "Male", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4); 
INSERT INTO marvels VALUES(2, "Iron Man", 20, "Neutral", "Male", 1.98, 102.58, "USA", 6, 6, 5, 6, 6, 4); 
INSERT INTO marvels VALUES(3, "Hulk", 18, "Neutral", "Male", 2.44, 635.29, "USA", 1, 7, 3, 7, 5, 4); 
INSERT INTO marvels VALUES(4, "Wolverine", 3, "Good", "Male", 1.6, 88.46, "Canada", 2, 4, 2, 4, 1, 7);
INSERT INTO marvels VALUES(5, "Thor", 5, "Good", "Male", 1.98, 290.3, "Asgard", 2, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(6, "Green Goblin", 91, "Bad", "Male", 1.93, 174.63, "USA", 4, 4, 3, 4, 3, 3);
INSERT INTO marvels VALUES(7, "Magneto", 11, "Neutral", "Male", 1.88, 86.18, "Germany", 6, 3, 5, 4, 6, 4);
INSERT INTO marvels VALUES(8, "Thanos", 47, "Bad", "Male", 2.01, 446.79, "Titan", 6, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(9, "Loki", 32, "Bad", "Male", 1.93, 238.14, "Jotunheim", 5, 5, 7, 6, 6, 3);
INSERT INTO marvels VALUES(10, "Doctor Doom", 19, "Bad", "Male", 2.01, 188.24, "Latveria", 6, 4, 5, 6, 6, 4);
INSERT INTO marvels VALUES(11, "Jean Grey", 8, "Good", "Female", 1.68, 52.16, "USA", 3, 2, 7, 7, 7, 4);
INSERT INTO marvels VALUES(12, "Rogue", 4, "Good", "Female", 1.73, 54.43, "USA", 7, 7, 7, 7, 7, 7);
INSERT INTO marvels VALUES(13, "Storm", 2, "Good", "Female", 1.80, 66, "Kenya", 2, 2, 3, 2, 5, 4);
INSERT INTO marvels VALUES(14, "Nightcrawler", 6, "Good", "Male", 1.75, 73, "Germany", 3, 2, 7, 2, 1, 3);
INSERT INTO marvels VALUES(15, "Gambit", 7, "Good", "Male", 1.88, 81, "EUA", 2, 2, 2, 2, 2, 4);
INSERT INTO marvels VALUES(16, "Captain America", 9, "Good", "Male", 1.88, 108, "EUA", 3, 3, 2, 3, 1, 6);
INSERT INTO marvels VALUES(17, "Cyclops", 10, "Good", "Male", 1.90, 88, "EUA", 3, 2, 2, 2, 5, 4);
INSERT INTO marvels VALUES(18, "Emma Frost", 12, "Neutral", "Female", 1.78, 65, "EUA", 4, 4, 2, 5, 5, 3);
INSERT INTO marvels VALUES(19, "Kitty Pryde", 13, "Good", "Female", 1.68, 50, "EUA", 4, 2, 2, 3, 1, 5);
INSERT INTO marvels VALUES(20, "Daredevil", 14, "Good", "Male", 1.83, 91, "EUA", 3, 3, 2, 2, 4, 5);
INSERT INTO marvels VALUES(21, "Punisher", 50, "Neutral", "Male", 1.85, 91, "EUA", 3, 3, 2, 2, 1, 6);
INSERT INTO marvels VALUES(22, "Silver Surfer", 33, "Good", "Male", 1.93, 102, "Zenn-La", 3, 7, 7, 6, 7, 2);
INSERT INTO marvels VALUES(23, "Ghost Rider", 86, "Good", "Male", 1.88, 99, "EUA", 2, 4, 3, 5, 4, 2);
INSERT INTO marvels VALUES(24, "Venon", 78, "Neutral", "Male", 1.90, 118, "EUA", 3, 4, 2, 6, 1, 4);
INSERT INTO marvels VALUES(25, "Juggernaut", 76, "Neutral", "Male", 2.87, 862, "EUA", 2, 7, 2, 7, 1, 4);
INSERT INTO marvels VALUES(26, "Professor X", 58, "Good", "Male", 1.83, 86, "EUA", 5, 2, 2, 2, 5, 3);

select * from marvels;

select count(*) from marvels;

#Who are the Strongest marvel characters?;
select name, (select max(strength) from marvels) as strong_characters from marvels;


#Average height of marvel characters;
select avg(height_m) as average_height from marvels;

#Number of hometowns of marvel characters; 
select count(distinct(hometown)) as distinct_hometowns from marvels;

#Marvel character with least popularity;
select name, popularity, (select min(popularity) from marvels)as least_popular from marvels where popularity=1;

#Strongest female marvel character;
select name, gender, strength from marvels where strength=7
having gender='Female';

#Fastest marvel characters by alignment;
select id, name, alignment, speed
from marvels where speed=7 
order by alignment;

#Intelligent marvel characters;
select ID, name, gender, intelligence, (select avg(intelligence) from marvels) as avg_intelligence
from marvels;

#Skilled gender;
select gender, avg(fighting_Skills) as normal_fighting_skills from marvels where fighting_Skills>3
group by gender;

select avg(fighting_Skills) from marvels;

#Above Average skilled races;
select hometown, avg(fighting_Skills) as normal_fighting_skills from marvels
group by hometown
having avg(fighting_Skills)>4.1154;


update marvels set name='Venom' where ID=24;


#CASE;
  ALTER TABLE marvels add column franchise text;
  alter table marvels drop column to_do;
  
       UPDATE marvels
       SET franchise= CASE 
       WHEN name='Spider Man' THEN 'SPIDER MAN'
       WHEN name='Iron Man' THEN 'IRON MAN'
       WHEN name='Hulk' THEN 'INCREDIBLE HULK'
       WHEN name='Wolverine' THEN 'X-MEN'
       WHEN name='Thor' THEN 'THOR'
       WHEN name='Green Goblin' THEN 'SPIDER MAN'
       WHEN name='Magneto' THEN 'X-MEN'
       WHEN name='Thanos' THEN 'AVENGERS'
       WHEN name='Loki' THEN 'LOKI'
       WHEN name='Doctor Doom' THEN 'THE FANTASTIC FOUR'
       WHEN name='Jean Grey' THEN 'X-MEN'
       WHEN name='Rogue' THEN 'X-MEN'
       WHEN name='Storm' THEN 'X-MEN'
       WHEN name='Nightcrawler' THEN 'X-MEN'
       WHEN name='Gambit' THEN 'X-MEN'
       WHEN name='Captain America' THEN 'CAPTAIN AMERICA'
       WHEN name='Cyclops' THEN 'X-MEN'
       WHEN name='Emma Frost' THEN 'X-MEN'
       WHEN name='Kitty Pryde' THEN 'X-MEN'
       WHEN name='Daredevil' THEN 'DAREDEVIL'
       WHEN name='Punisher' THEN 'THE PUNISHER'
       WHEN name='Silver Surfer' THEN 'FANTASTIC FOUR'
       WHEN name='Ghost Rider' THEN 'GHOST RIDER'
       WHEN name='Venom' THEN 'VENOM'
       WHEN name='Juggernaut' THEN 'X-MEN'
       WHEN name='Professor X' THEN 'X-MEN'
        
       ELSE MCU  
       
       END;

select * from marvels;

#OR;
select * 
from marvels 
where intelligence=7 or strength=7 or speed=7 or durability=7 or energy_Projection=7 or fighting_Skills=7;

#AND;
select * 
from marvels 
where alignment='Good' and fighting_Skills>3;

#AND with OR;
select * 
from marvels 
where (intelligence=7 or strength=7 or speed=7 or durability=7 or energy_Projection=7 or fighting_Skills=7) and alignment='Good';

select * 
from marvels 
where marvels in(intelligence=7, strength=7, speed=7, durability=7, energy_Projection=7, fighting_Skills=7) and alignment='Good';
