create database Music_Acting;
use Music_Acting;
CREATE TABLE Famous_People (id INT PRIMARY KEY,
  name VARCHAR(255),
  birthdate DATE,
  nationality VARCHAR(100),
  profession VARCHAR(100)
);
INSERT INTO Famous_People (id, name, birthdate, nationality, profession)
VALUES 
(01, 'Chris Brown', '1989-05-05', 'American', 'Singer/Actor'),
(02, 'John Legend', '1978-12-28', 'American', 'Singer/Actor'),
(03, 'Whitney Houston', '1963-09-08', 'American', 'Singer'),
(04, 'Davido', '1992-11-21', 'Nigerian', 'Singer'),
(05, 'Angelique Kidjo', '1960-07-14', 'Beninese', 'Singer'),
(06, 'Femi Kuti', '1962-06-16', 'Nigerian', 'Singer'),
(07, 'Ben Lee', '1979-11-09', 'Australian', 'Singer/Actor'),
(08, 'Winston Duke', '1986-11-15', 'Trinidadian-Tobagonian', 'Actor'),
(09, 'Jackie Appiah', '1983-05-12', 'Ghanaian', 'Actress'),
(10, 'Genevieve Nnaji', '1979-03-03', 'Nigerian', 'Actress'),
(11, 'Idris Elba', '1972-08-06', 'British-Ghanaian', 'Actor'),
(12, 'Lady Gaga', '1986-03-28', 'American', 'Actress/Singer'),
(13, 'Queen Latifah', '1970-03-18', 'American', 'Actress/Singer'),
(14, 'Dwayne Johnson', '1972-05-02', 'American', 'Actor'),
(15, 'Jason Statham', '1967-07-26', 'English', 'Actor'),
(16, 'Will Smith', '1968-09-25', 'American', 'Actor/Singer');

select * from Famous_People; 

### Update on Famous people
ALTER TABLE Famous_people
ADD COLUMN gender TEXT;

UPDATE Famous_people
SET gender = CASE
WHEN id IN (1,2,4,67,8,11,14,15,16) THEN 'Male'

ELSE 'Female'
END;

CREATE TABLE Music (
  id INT PRIMARY KEY,
  song_title VARCHAR(255),
  album_title VARCHAR(255),
  release_year INT,
  genre VARCHAR(100),
  famous_person_id INT,
  FOREIGN KEY (famous_person_id) REFERENCES Famous_People(id)
);


INSERT INTO Music (id, song_title, album_title, release_year, genre, famous_person_id)
VALUES 
(1, 'Look at Me Now', 'F.A.M.E.', 2011, 'R&B', 1),  -- Chris Brown
(2, 'All of Me', 'Love in the Future', 2013, 'R&B', 2),  -- John Legend
(3, 'I Will Always Love You', 'The Bodyguard', 1992, 'Pop', 3),  -- Whitney Houston
(4, 'Fall', 'A Good Time', 2019, 'Afrobeats', 4),  -- Davido
(5, 'Afirika', 'Fifa', 2010, 'World Music', 5),  -- Angélique Kidjo
(6, 'Ordinary People', 'Get Lifted', 2004, 'R&B', 2),  -- John Legend
(7, 'I Wanna Dance with Somebody', 'Whitney', 1987, 'Pop', 3),  -- Whitney Houston
(8, 'If', 'A Good Time', 2019, 'Afrobeats', 4),  -- Davido
(9, 'Batonga', 'Logozo', 1994, 'World Music', 5),  -- Angélique Kidjo
(10, 'Africa for Africa', 'Africa for Africa', 2010, 'Afrobeat', 6),  -- Femi Kuti
(11, 'Catch My Disease', 'Awake Is the New Sleep', 2005, 'Indie Rock', 7),  -- Ben Lee
(12, 'Poker Face', 'The Fame', 2008, 'Pop', 12),  -- Lady Gaga
(13, 'Order in the Court', 'Order in the Court', 1998, 'Hip-Hop', 13),  -- Queen Latifah
(14, 'Gettin Jiggy Wit It', 'Big Willie Style', 1997, 'Hip-Hop', 16),  -- Will Smith
(15, 'Telephone', 'The Fame Monster', 2010, 'Pop', 12),  -- Lady Gaga
(16, 'Ladies First', 'Black Reign', 1993, 'Hip-Hop', 13),  -- Queen Latifah
(17, 'Wild Wild West', 'Willennium', 1999, 'Hip-Hop', 16),  -- Will Smith
(18, 'Bad Romance', 'The Fame Monster', 2009, 'Pop', 12),  -- Lady Gaga
(19, 'U.N.I.T.Y.', 'Black Reign', 1993, 'Hip-Hop', 13);  -- Queen Latifah

select * from Music;

CREATE TABLE Movies (
  id INT PRIMARY KEY,
  title VARCHAR(255),
  release_year INT,
  genre VARCHAR(100),
  famous_person_id INT,
  FOREIGN KEY (famous_person_id) REFERENCES Famous_People(id)
);
#drop table Movies;

INSERT INTO Movies (id, title, release_year, genre, famous_person_id)
VALUES 
(1, 'Battle of the Year', 2013, 'Dance/Action', 1),  -- Chris Brown
(2, 'La La Land', 2016, 'Romantic Musical Comedy', 2),  -- John Legend
(3, 'The Bodyguard', 1992, 'Romance/Thriller', 3),  -- Whitney Houston
(4, 'Half of a Yellow Sun', 2013, 'Drama', 10),  -- Genevieve Nnaji
(5, 'American Gangster', 2007, 'Biography/Crime', 11),  -- Idris Elba
(6, 'A Star is Born', 2018, 'Romance/Drama', 12),  -- Lady Gaga
(7, 'Girls Trip', 2017, 'Comedy', 13),  -- Queen Latifah
(8, 'Jumanji: Welcome to the Jungle', 2017, 'Action/Adventure', 14),  -- Dwayne Johnson
(9, 'The Fast and the Furious', 2001, 'Action', 14),  -- Dwayne Johnson
(10, 'The Expendables', 2010, 'Action', 15),  -- Jason Statham
(11, 'Bad Boys for Life', 2020, 'Action', 16),  -- Will Smith
(12, 'Ijé', 2010, 'Drama', 10),  -- Genevieve Nnaji
(13, 'Thor', 2011, 'Action/Adventure', 11),  -- Idris Elba
(14, 'Mama Africa', 2011, 'Documentary', 5),  -- Angélique Kidjo
(15, 'Luther', 2010, 'Crime/Drama', 11),  -- Idris Elba
(16, 'Rampage', 2018, 'Action/Adventure', 14),  -- Dwayne Johnson
(17, 'The Fate of the Furious', 2017, 'Action', 14);  -- Dwayne Johnson

select * from Movies;

CREATE TABLE Awards (
  id INT PRIMARY KEY,
  award_name VARCHAR(255),
  category VARCHAR(100),
  year INT,
  famous_person_id INT,
  FOREIGN KEY (famous_person_id) REFERENCES Famous_People(id)
);

CREATE TABLE Awards (
  id INT PRIMARY KEY,
  award_name VARCHAR(255),
  category VARCHAR(100),
  year INT,
  famous_person_id INT,
  FOREIGN KEY (famous_person_id) REFERENCES Famous_People(id)
);

INSERT INTO Awards (id, award_name, category, year, famous_person_id)
VALUES 
(1, 'BET Award for Best Collaboration', 'Music', 2011, 1),  -- Chris Brown
(2, 'Academy Award for Best Original Song', 'Music', 2017, 2),  -- John Legend
(3, 'Grammy Award for Record of the Year', 'Music', 1986, 3),  -- Whitney Houston
(4, 'Africa Magic Viewers Choice Award for Best Actress', 'Acting', 2013, 10),  -- Genevieve Nnaji
(5, 'Grammy Award for Best World Music Album', 'Music', 2004, 6),  -- Femi Kuti
(6, 'NAACP Image Award for Outstanding Actor', 'Acting', 2014, 11),  -- Idris Elba
(7, 'Academy Award for Best Original Song', 'Music', 2019, 12),  -- Lady Gaga
(8, 'Golden Globe Award for Best Actress', 'Acting', 2008, 13),  -- Queen Latifah
(9, 'Teen Choice Award for Choice Movie Actor', 'Acting', 2017, 14),  -- Dwayne Johnson
(10, 'MTV Movie Award for Best Fight', 'Acting', 2015, 15),  -- Jason Statham
(11, 'Grammy Award for Best Rap Solo Performance', 'Music', 1998, 16),  -- Will Smith
(12, 'Africa Movie Academy Award for Best Actress', 'Acting', 2010, 10),  -- Genevieve Nnaji
(13, 'Screen Actors Guild Award for Outstanding Performance', 'Acting', 2016, 11),  -- Idris Elba
(14, 'Billboard Music Award for Top Artist', 'Music', 2019, 12),  -- Lady Gaga
(15, 'Black Reel Award for Best Actress', 'Acting', 2008, 13),  -- Queen Latifah
(16, 'People Choice Award for Favorite Premium Cable Star', 'Acting', 2016, 14),  -- Dwayne Johnson
(17, 'Critics Choice Movie Award for Best Actor', 'Acting', 2014, 11),  -- Idris Elba
(18, 'MTV Africa Music Award for Best Live Act', 'Music', 2015, 4),  -- Davido
(19, 'American Music Award for Favorite Soul/R&B Male Artist', 'Music', 2013, 1),  -- Chris Brown
(20, 'Billboard Music Award for Top R&B Album', 'Music', 2014, 2);  -- John Legend

select * from Awards;

CREATE TABLE Collaborations (
  id INT PRIMARY KEY,
  famous_person_id1 INT,
  famous_person_id2 INT,
  project_title VARCHAR(255),
  FOREIGN KEY (famous_person_id1) REFERENCES Famous_People(id),
  FOREIGN KEY (famous_person_id2) REFERENCES Famous_People(id)
);

INSERT INTO Collaborations (id, famous_person_id1, famous_person_id2, project_title)
VALUES 
(1, 1, 2, 'Look at Me Now'), 
(2, 3, 12, 'The Bodyguard Soundtrack'), 
(3, 4, 6, 'Fall (Remix)'), 
(4, 11, 14, 'Fast & Furious Presents: Hobbs & Shaw'), 
(5, 13, 16, 'Girls Trip'), 
(6, 7, 10, 'Lionheart'), 
(7, 5, 9, 'Mama Africa'), 
(8, 12, 2, 'A Star is Born'), 
(9, 1, 16, 'Bad Boys for Life'), 
(10, 14, 15, 'Jumanji: Welcome to the Jungle'), 
(11, 11, 13, 'Luther'), 
(12, 4, 6, 'A Good Time'), 
(13, 3, 12, 'I Will Always Love You (Remix)'), 
(14, 2, 1, 'Love in the Future'), 
(15, 10, 9, 'Half of a Yellow Sun'), 
(16, 5, 7, 'Femi Kuti: Live at the Africa Shrine'), 
(17, 16, 14, 'Men in Black 3'), 
(18, 13, 11, 'Girls Trip 2'), 
(19, 12, 2, 'La La Land'), 
(20, 6, 4, 'Africa for Africa');

select * from Collaborations; 

DROP TABLE Contributions_Impact;

CREATE TABLE Contributions_Impact (
    id INT PRIMARY KEY AUTO_INCREMENT,
    famous_person_id INT NOT NULL,
    industry VARCHAR(100) NOT NULL,
    contribution_description VARCHAR(255) NOT NULL,
    year INT NOT NULL,
    impact VARCHAR(255) NOT NULL
);

INSERT INTO Contributions_Impact
VALUES 
(1, 'Music', 'Social Justice', 2005, 'Emotional Impact'),
(2, 'Music', 'Psychological Storytelling', 2016, 'Inspiration'),
(3, 'Music', 'Psychological Empowerment', 1992, 'Inspiration'),
(4, 'Film', 'Tourism Promotion', 2013, 'Cultural Impact'),
(5, 'Music', 'Social Justice', 1994, 'Inspiration'),
(6, 'Music', 'Promotes Tourism', 2010, 'Global Awareness'),
(7, 'Film', 'Women Empowerment', 2018, 'Inspiration'),
(8, 'Music', 'Mental Health Awareness', 2018, 'Reduced Stigma'),
(9, 'Film', 'Action Film Revolution', 2001, 'Safety Measures'),
(10, 'Film', 'Comedy Innovation', 2017, 'Reduced Stigma'),
(11, 'Film', 'Psychological Empowerment', 2010, 'Safety Measures'),
(12, 'Music', 'Promotes Tourism', 2008, 'Inspiration'),
(13, 'Film', 'Promotes Tourism', 2002, 'Global Awareness'),
(14, 'Film', 'Action-Adventure', 2017, 'Safety Measures'),
(15, 'Film', 'Action Adventure', 2010, 'Safety Measures'),
(16, 'Music', 'Hip-Hop Innovation', 1997, 'Inspiration'),
(17, 'Film', 'Science Fiction', 2012, 'Educational'),
(18, 'Music', 'Charity Single', 2017, 'Thought-Provoking'),
(19, 'Film', 'Action Comedy', 2020, 'Heartwarming'),
(20, 'Music', 'R&B Revival', 2011, 'Entertainment'),
(21, 'Music', 'Inspirational Anthems', 2015, 'Inspiration'),
(22, 'Film', 'Historical Drama', 2014, 'Educational'),
(23, 'Music', 'Experimental Sound', 2019, 'Entertainment'),
(24, 'Film', 'Romantic Comedy', 2018, 'Heartwarming'),
(25, 'Music', 'Social Commentary', 2020, 'Thought-Provoking');

### Famous people with the most Collaborations
SELECT 
    famous_person_id, name,
    COUNT(*) AS collaboration_count
FROM (
    SELECT famous_person_id1 AS famous_person_id FROM Collaborations
    UNION ALL
    SELECT famous_person_id2 AS famous_person_id FROM Collaborations
) AS combined
LEFT JOIN Famous_People
ON combined.famous_person_id = Famous_People.id
GROUP BY famous_person_id
ORDER BY collaboration_count DESC
LIMIT 5;

### Famous people with the least collaborations
SELECT 
    famous_person_id, name,
    COUNT(*) AS collaboration_count
FROM (
    SELECT famous_person_id1 AS famous_person_id FROM Collaborations
    UNION ALL
    SELECT famous_person_id2 AS famous_person_id FROM Collaborations
) AS combined
LEFT JOIN Famous_People
ON combined.famous_person_id = Famous_People.id
GROUP BY famous_person_id
ORDER BY collaboration_count
LIMIT 5;

### Where do the famous people come from
SELECT name, nationality, profession
FROM Famous_People;

### Profession and nationality of famous people with collabs
SELECT name, nationality, profession, project_title
FROM Famous_People
JOIN Collaborations
ON Famous_people.id = Collaborations.famous_person_id1 
ORDER BY Collaborations.project_title; 

### Award Category for music
SELECT Famous_people.name, Music.album_title AS Album, Music.genre AS Genre, Awards.award_name AS Award_title, Awards.year AS Year, Awards.category AS Category
FROM Famous_people
LEFT JOIN Awards ON Famous_people.id = Awards.famous_person_id AND Awards.category = 'Music'
LEFT JOIN Music ON Awards.famous_person_id = Music.famous_person_id AND Awards.category = 'Music'
LIMIT 10;

### Award Category for Movies
SELECT Famous_people.name, Movies.title AS Movie_Title, Movies.genre AS Genre, Awards.award_name AS Award_title, Awards.year AS Year, Awards.category AS Category
FROM Famous_people
LEFT JOIN Awards ON Famous_people.id = Awards.famous_person_id AND Awards.category = 'Acting'
LEFT JOIN Movies ON Awards.famous_person_id = Movies.famous_person_id AND Awards.category = 'Acting'
ORDER BY category DESC
LIMIT 10;

