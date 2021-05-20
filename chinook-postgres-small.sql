
-- -- /*******************************************************************************
-- --    Chinook Database - Version 1.4
-- --    Script: Chinook_PostgreSql.sql
-- --    Description: Creates and populates the Chinook database.
-- --    DB Server: PostgreSql
-- --    Author: Luis Rocha
-- --    License: http://www.codeplex.com/ChinookDatabase/license

-- --    Modified By: John Atten
-- --    Modification Date: 3/1/2014
-- --    Summary of Changes:
-- --     - Changed integer PKs to serial (auto-incrementing) Pks
-- --     - Added Transactions table to excercie Biggie code against a bigserial type
-- --     - Imported "Actors", "Cities", "Countries" and "Films" tables from pg dvdrentals Db to excercise 
-- --       Biggie code against Full-Text Search table. 
-- -- ********************************************************************************/


-- ----------------------------
-- Sequence structure for album_album_id_seq
-- ----------------------------
CREATE SEQUENCE "albums_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 2147483647
 START 347
 CACHE 1;
SELECT setval('"public"."albums_id_seq"', 347, true);


-- ----------------------------
-- Sequence structure for artist_artist_id_seq
-- ----------------------------
CREATE SEQUENCE "artists_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 2147483647
 START 275
 CACHE 1;
SELECT setval('"public"."artists_id_seq"', 275, true);


-- ----------------------------
-- Sequence structure for track_track_id_seq
-- ----------------------------
CREATE SEQUENCE "tracks_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 2147483647
 START 3503
 CACHE 1;
SELECT setval('"public"."tracks_id_seq"', 3503, true);

-- /*******************************************************************************
--    Create Tables
-- ********************************************************************************/

CREATE TABLE albums
(
    id int DEFAULT nextval('albums_id_seq'::regclass) NOT NULL,
    title VARCHAR(160) NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT pk_albums PRIMARY KEY  (id)
);

CREATE TABLE artists
(
    id int DEFAULT nextval('artists_id_seq'::regclass) NOT NULL,
    name VARCHAR(120),
    CONSTRAINT pk_artists PRIMARY KEY  (id)
);

CREATE TABLE tracks
(
    id int DEFAULT nextval('tracks_id_seq'::regclass) NOT NULL,
    name VARCHAR(200) NOT NULL,
    album_id INT,
    media_type_id INT NOT NULL,
    genre_id INT,
    composer VARCHAR(220),
    milliseconds INT NOT NULL,
    bytes INT,
    unit_price NUMERIC(10,2) NOT NULL,
    CONSTRAINT pk_tracks PRIMARY KEY  (id)
);



/*******************************************************************************
   Create Primary Key Unique Indexes
********************************************************************************/

/*******************************************************************************
   Create Foreign Keys
********************************************************************************/
ALTER TABLE albums ADD CONSTRAINT fk_album_artist_id
    FOREIGN KEY (artist_id) REFERENCES artists (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX ifk_album_artist_id ON albums (artist_id);

ALTER TABLE tracks ADD CONSTRAINT fk_track_album_id
    FOREIGN KEY (album_id) REFERENCES albums (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX ifk_track_album_id ON tracks (album_id);


/*******************************************************************************
   Populate Tables
********************************************************************************/
INSERT INTO artists (id, name) VALUES (1, N'AC/DC');
INSERT INTO artists (id, name) VALUES (2, N'Accept');
INSERT INTO artists (id, name) VALUES (3, N'Aerosmith');
INSERT INTO artists (id, name) VALUES (4, N'Alanis Morissette');
INSERT INTO artists (id, name) VALUES (5, N'Alice In Chains');
INSERT INTO artists (id, name) VALUES (6, N'Antônio Carlos Jobim');
INSERT INTO artists (id, name) VALUES (7, N'Apocalyptica');
INSERT INTO artists (id, name) VALUES (8, N'Audioslave');
INSERT INTO artists (id, name) VALUES (9, N'BackBeat');
INSERT INTO artists (id, name) VALUES (10, N'Billy Cobham');
INSERT INTO artists (id, name) VALUES (11, N'Black Label Society');
INSERT INTO artists (id, name) VALUES (12, N'Black Sabbath');
INSERT INTO artists (id, name) VALUES (13, N'Body Count');
INSERT INTO artists (id, name) VALUES (14, N'Bruce Dickinson');
INSERT INTO artists (id, name) VALUES (15, N'Buddy Guy');
INSERT INTO artists (id, name) VALUES (16, N'Caetano Veloso');
INSERT INTO artists (id, name) VALUES (17, N'Chico Buarque');
INSERT INTO artists (id, name) VALUES (18, N'Chico Science & Nação Zumbi');
INSERT INTO artists (id, name) VALUES (19, N'Cidade Negra');
INSERT INTO artists (id, name) VALUES (20, N'Cláudio Zoli');
INSERT INTO artists (id, name) VALUES (21, N'Various artistss');
INSERT INTO artists (id, name) VALUES (22, N'Led Zeppelin');
INSERT INTO artists (id, name) VALUES (23, N'Frank Zappa & Captain Beefheart');
INSERT INTO artists (id, name) VALUES (24, N'Marcos Valle');
INSERT INTO artists (id, name) VALUES (25, N'Milton Nascimento & Bebeto');
INSERT INTO artists (id, name) VALUES (26, N'Azymuth');
INSERT INTO artists (id, name) VALUES (27, N'Gilberto Gil');
INSERT INTO artists (id, name) VALUES (28, N'João Gilberto');
INSERT INTO artists (id, name) VALUES (29, N'Bebel Gilberto');
INSERT INTO artists (id, name) VALUES (30, N'Jorge Vercilo');

INSERT INTO albums (id, title, artist_id) VALUES (1, N'For Those About To Rock We Salute You', 1);
INSERT INTO albums (id, title, artist_id) VALUES (2, N'Balls to the Wall', 2);
INSERT INTO albums (id, title, artist_id) VALUES (3, N'Restless and Wild', 2);
INSERT INTO albums (id, title, artist_id) VALUES (4, N'Let There Be Rock', 1);
INSERT INTO albums (id, title, artist_id) VALUES (5, N'Big Ones', 3);
INSERT INTO albums (id, title, artist_id) VALUES (6, N'Jagged Little Pill', 4);
INSERT INTO albums (id, title, artist_id) VALUES (7, N'Facelift', 5);
INSERT INTO albums (id, title, artist_id) VALUES (8, N'Warner 25 Anos', 6);
INSERT INTO albums (id, title, artist_id) VALUES (9, N'Plays Metallica By Four Cellos', 7);
INSERT INTO albums (id, title, artist_id) VALUES (10, N'Audioslave', 8);
INSERT INTO albums (id, title, artist_id) VALUES (11, N'Out Of Exile', 8);
INSERT INTO albums (id, title, artist_id) VALUES (12, N'BackBeat Soundtrack', 9);
INSERT INTO albums (id, title, artist_id) VALUES (13, N'The Best Of Billy Cobham', 10);
INSERT INTO albums (id, title, artist_id) VALUES (14, N'Alcohol Fueled Brewtality Live! [Disc 1]', 11);
INSERT INTO albums (id, title, artist_id) VALUES (15, N'Alcohol Fueled Brewtality Live! [Disc 2]', 11);
INSERT INTO albums (id, title, artist_id) VALUES (16, N'Black Sabbath', 12);
INSERT INTO albums (id, title, artist_id) VALUES (17, N'Black Sabbath Vol. 4 (Remaster)', 12);
INSERT INTO albums (id, title, artist_id) VALUES (18, N'Body Count', 13);
INSERT INTO albums (id, title, artist_id) VALUES (19, N'Chemical Wedding', 14);
INSERT INTO albums (id, title, artist_id) VALUES (20, N'The Best Of Buddy Guy - The Millenium Collection', 15);
INSERT INTO albums (id, title, artist_id) VALUES (21, N'Prenda Minha', 16);
INSERT INTO albums (id, title, artist_id) VALUES (22, N'Sozinho Remix Ao Vivo', 16);
INSERT INTO albums (id, title, artist_id) VALUES (23, N'Minha Historia', 17);
INSERT INTO albums (id, title, artist_id) VALUES (24, N'Afrociberdelia', 18);
INSERT INTO albums (id, title, artist_id) VALUES (25, N'Da Lama Ao Caos', 18);
INSERT INTO albums (id, title, artist_id) VALUES (26, N'Acústico MTV [Live]', 19);
INSERT INTO albums (id, title, artist_id) VALUES (27, N'Cidade Negra - Hits', 19);
INSERT INTO albums (id, title, artist_id) VALUES (28, N'Na Pista', 20);
INSERT INTO albums (id, title, artist_id) VALUES (29, N'Axé Bahia 2001', 21);
INSERT INTO albums (id, title, artist_id) VALUES (30, N'BBC Sessions [Disc 1] [Live]', 22);
INSERT INTO albums (id, title, artist_id) VALUES (31, N'Bongo Fury', 23);
INSERT INTO albums (id, title, artist_id) VALUES (32, N'Carnaval 2001', 21);
INSERT INTO albums (id, title, artist_id) VALUES (33, N'Chill: Brazil (Disc 1)', 24);
INSERT INTO albums (id, title, artist_id) VALUES (34, N'Chill: Brazil (Disc 2)', 6);
INSERT INTO albums (id, title, artist_id) VALUES (44, N'Physical Graffiti [Disc 1]', 22);
INSERT INTO albums (id, title, artist_id) VALUES (45, N'Sambas De Enredo 2001', 21);

INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (1, N'For Those About To Rock (We Salute You)', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 343719, 11170334, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (2, N'Balls to the Wall', 2, 2, 1, 342562, 5510424, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (3, N'Fast As a Shark', 3, 2, 1, N'F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman', 230619, 3990994, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (4, N'Restless and Wild', 3, 2, 1, N'F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman', 252051, 4331779, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (5, N'Princess of the Dawn', 3, 2, 1, N'Deaffy & R.A. Smith-Diesel', 375418, 6290521, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (6, N'Put The Finger On You', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 205662, 6713451, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (7, N'Let''s Get It Up', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 233926, 7636561, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (8, N'Inject The Venom', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 210834, 6852860, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (9, N'Snowballed', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 203102, 6599424, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (10, N'Evil Walks', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 263497, 8611245, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (11, N'C.O.D.', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 199836, 6566314, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (12, N'Breaking The Rules', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 263288, 8596840, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (13, N'Night Of The Long Knives', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 205688, 6706347, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (14, N'Spellbound', 1, 1, 1, N'Angus Young, Malcolm Young, Brian Johnson', 270863, 8817038, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (15, N'Go Down', 4, 1, 1, N'AC/DC', 331180, 10847611, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (16, N'Dog Eat Dog', 4, 1, 1, N'AC/DC', 215196, 7032162, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (17, N'Let There Be Rock', 4, 1, 1, N'AC/DC', 366654, 12021261, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (18, N'Bad Boy Boogie', 4, 1, 1, N'AC/DC', 267728, 8776140, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (19, N'Problem Child', 4, 1, 1, N'AC/DC', 325041, 10617116, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (20, N'Overdose', 4, 1, 1, N'AC/DC', 369319, 12066294, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (21, N'Hell Ain''t A Bad Place To Be', 4, 1, 1, N'AC/DC', 254380, 8331286, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (22, N'Whole Lotta Rosie', 4, 1, 1, N'AC/DC', 323761, 10547154, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (23, N'Walk On Water', 5, 1, 1, N'Steven Tyler, Joe Perry, Jack Blades, Tommy Shaw', 295680, 9719579, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (24, N'Love In An Elevator', 5, 1, 1, N'Steven Tyler, Joe Perry', 321828, 10552051, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (25, N'Rag Doll', 5, 1, 1, N'Steven Tyler, Joe Perry, Jim Vallance, Holly Knight', 264698, 8675345, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (26, N'What It Takes', 5, 1, 1, N'Steven Tyler, Joe Perry, Desmond Child', 310622, 10144730, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (27, N'Dude (Looks Like A Lady)', 5, 1, 1, N'Steven Tyler, Joe Perry, Desmond Child', 264855, 8679940, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (28, N'Janie''s Got A Gun', 5, 1, 1, N'Steven Tyler, Tom Hamilton', 330736, 10869391, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (29, N'Cryin''', 5, 1, 1, N'Steven Tyler, Joe Perry, Taylor Rhodes', 309263, 10056995, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (30, N'Amazing', 5, 1, 1, N'Steven Tyler, Richie Supa', 356519, 11616195, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (31, N'Blind Man', 5, 1, 1, N'Steven Tyler, Joe Perry, Taylor Rhodes', 240718, 7877453, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (32, N'Deuces Are Wild', 5, 1, 1, N'Steven Tyler, Jim Vallance', 215875, 7074167, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (33, N'The Other Side', 5, 1, 1, N'Steven Tyler, Jim Vallance', 244375, 7983270, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (34, N'Crazy', 5, 1, 1, N'Steven Tyler, Joe Perry, Desmond Child', 316656, 10402398, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (35, N'Eat The Rich', 5, 1, 1, N'Steven Tyler, Joe Perry, Jim Vallance', 251036, 8262039, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (36, N'Angel', 5, 1, 1, N'Steven Tyler, Desmond Child', 307617, 9989331, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (37, N'Livin'' On The Edge', 5, 1, 1, N'Steven Tyler, Joe Perry, Mark Hudson', 381231, 12374569, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (38, N'All I Really Want', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 284891, 9375567, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (39, N'You Oughta Know', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 249234, 8196916, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (40, N'Perfect', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 188133, 6145404, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (41, N'Hand In My Pocket', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 221570, 7224246, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (42, N'Right Through You', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 176117, 5793082, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (43, N'Forgiven', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 300355, 9753256, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (44, N'You Learn', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 239699, 7824837, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (45, N'Head Over Feet', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 267493, 8758008, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (46, N'Mary Jane', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 280607, 9163588, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (47, N'Ironic', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 229825, 7598866, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (48, N'Not The Doctor', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 227631, 7604601, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (49, N'Wake Up', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 293485, 9703359, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (50, N'You Oughta Know (Alternate)', 6, 1, 1, N'Alanis Morissette & Glenn Ballard', 491885, 16008629, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (51, N'We Die Young', 7, 1, 1, N'Jerry Cantrell', 152084, 4925362, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (52, N'Man In The Box', 7, 1, 1, N'Jerry Cantrell, Layne Staley', 286641, 9310272, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (53, N'Sea Of Sorrow', 7, 1, 1, N'Jerry Cantrell', 349831, 11316328, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (54, N'Bleed The Freak', 7, 1, 1, N'Jerry Cantrell', 241946, 7847716, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (55, N'I Can''t Remember', 7, 1, 1, N'Jerry Cantrell, Layne Staley', 222955, 7302550, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (56, N'Love, Hate, Love', 7, 1, 1, N'Jerry Cantrell, Layne Staley', 387134, 12575396, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (57, N'It Ain''t Like That', 7, 1, 1, N'Jerry Cantrell, Michael Starr, Sean Kinney', 277577, 8993793, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (58, N'Sunshine', 7, 1, 1, N'Jerry Cantrell', 284969, 9216057, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (59, N'Put You Down', 7, 1, 1, N'Jerry Cantrell', 196231, 6420530, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (60, N'Confusion', 7, 1, 1, N'Jerry Cantrell, Michael Starr, Layne Staley', 344163, 11183647, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (61, N'I Know Somethin (Bout You)', 7, 1, 1, N'Jerry Cantrell', 261955, 8497788, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (62, N'Real Thing', 7, 1, 1, N'Jerry Cantrell, Layne Staley', 243879, 7937731, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (63, N'Desafinado', 8, 1, 2, 185338, 5990473, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (64, N'Garota De Ipanema', 8, 1, 2, 285048, 9348428, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (65, N'Samba De Uma Nota Só (One Note Samba)', 8, 1, 2, 137273, 4535401, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (66, N'Por Causa De Você', 8, 1, 2, 169900, 5536496, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (67, N'Ligia', 8, 1, 2, 251977, 8226934, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (68, N'Fotografia', 8, 1, 2, 129227, 4198774, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (69, N'Dindi (Dindi)', 8, 1, 2, 253178, 8149148, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (70, N'Se Todos Fossem Iguais A Você (Instrumental)', 8, 1, 2, 134948, 4393377, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (71, N'Falando De Amor', 8, 1, 2, 219663, 7121735, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (72, N'Angela', 8, 1, 2, 169508, 5574957, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (73, N'Corcovado (Quiet Nights Of Quiet Stars)', 8, 1, 2, 205662, 6687994, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (74, N'Outra Vez', 8, 1, 2, 126511, 4110053, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (75, N'O Boto (Bôto)', 8, 1, 2, 366837, 12089673, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (76, N'Canta, Canta Mais', 8, 1, 2, 271856, 8719426, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (77, N'Enter Sandman', 9, 1, 3, N'Apocalyptica', 221701, 7286305, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (78, N'Master Of Puppets', 9, 1, 3, N'Apocalyptica', 436453, 14375310, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (79, N'Harvester Of Sorrow', 9, 1, 3, N'Apocalyptica', 374543, 12372536, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (80, N'The Unforgiven', 9, 1, 3, N'Apocalyptica', 322925, 10422447, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (81, N'Sad But True', 9, 1, 3, N'Apocalyptica', 288208, 9405526, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (82, N'Creeping Death', 9, 1, 3, N'Apocalyptica', 308035, 10110980, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (83, N'Wherever I May Roam', 9, 1, 3, N'Apocalyptica', 369345, 12033110, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (84, N'Welcome Home (Sanitarium)', 9, 1, 3, N'Apocalyptica', 350197, 11406431, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (85, N'Cochise', 10, 1, 1, N'Audioslave/Chris Cornell', 222380, 5339931, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (86, N'Show Me How to Live', 10, 1, 1, N'Audioslave/Chris Cornell', 277890, 6672176, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (87, N'Gasoline', 10, 1, 1, N'Audioslave/Chris Cornell', 279457, 6709793, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (88, N'What You Are', 10, 1, 1, N'Audioslave/Chris Cornell', 249391, 5988186, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (89, N'Like a Stone', 10, 1, 1, N'Audioslave/Chris Cornell', 294034, 7059624, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (90, N'Set It Off', 10, 1, 1, N'Audioslave/Chris Cornell', 263262, 6321091, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (91, N'Shadow on the Sun', 10, 1, 1, N'Audioslave/Chris Cornell', 343457, 8245793, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (92, N'I am the Highway', 10, 1, 1, N'Audioslave/Chris Cornell', 334942, 8041411, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (93, N'Exploder', 10, 1, 1, N'Audioslave/Chris Cornell', 206053, 4948095, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (94, N'Hypnotize', 10, 1, 1, N'Audioslave/Chris Cornell', 206628, 4961887, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (95, N'Bring''em Back Alive', 10, 1, 1, N'Audioslave/Chris Cornell', 329534, 7911634, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (96, N'Light My Way', 10, 1, 1, N'Audioslave/Chris Cornell', 303595, 7289084, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (97, N'Getaway Car', 10, 1, 1, N'Audioslave/Chris Cornell', 299598, 7193162, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (98, N'The Last Remaining Light', 10, 1, 1, N'Audioslave/Chris Cornell', 317492, 7622615, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (99, N'Your Time Has Come', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 255529, 8273592, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (100, N'Out Of Exile', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 291291, 9506571, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (101, N'Be Yourself', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 279484, 9106160, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (102, N'Doesn''t Remind Me', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 255869, 8357387, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (103, N'Drown Me Slowly', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 233691, 7609178, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (104, N'Heaven''s Dead', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 276688, 9006158, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (105, N'The Worm', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 237714, 7710800, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (106, N'Man Or Animal', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 233195, 7542942, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (107, N'Yesterday To Tomorrow', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 273763, 8944205, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (108, N'Dandelion', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 278125, 9003592, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (109, N'#1 Zero', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 299102, 9731988, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (110, N'The Curse', 11, 1, 4, N'Cornell, Commerford, Morello, Wilk', 309786, 10029406, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (111, N'Money', 12, 1, 5, N'Berry Gordy, Jr./Janie Bradford', 147591, 2365897, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (112, N'Long Tall Sally', 12, 1, 5, N'Enotris Johnson/Little Richard/Robert "Bumps" Blackwell', 106396, 1707084, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (113, N'Bad Boy', 12, 1, 5, N'Larry Williams', 116088, 1862126, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (114, N'Twist And Shout', 12, 1, 5, N'Bert Russell/Phil Medley', 161123, 2582553, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (115, N'Please Mr. Postman', 12, 1, 5, N'Brian Holland/Freddie Gorman/Georgia Dobbins/Robert Bateman/William Garrett', 137639, 2206986, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (116, N'C''Mon Everybody', 12, 1, 5, N'Eddie Cochran/Jerry Capehart', 140199, 2247846, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (117, N'Rock ''N'' Roll Music', 12, 1, 5, N'Chuck Berry', 141923, 2276788, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (118, N'Slow Down', 12, 1, 5, N'Larry Williams', 163265, 2616981, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (119, N'Roadrunner', 12, 1, 5, N'Bo Diddley', 143595, 2301989, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (120, N'Carol', 12, 1, 5, N'Chuck Berry', 143830, 2306019, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (121, N'Good Golly Miss Molly', 12, 1, 5, N'Little Richard', 106266, 1704918, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (122, N'20 Flight Rock', 12, 1, 5, N'Ned Fairchild', 107807, 1299960, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (123, N'Quadrant', 13, 1, 2, N'Billy Cobham', 261851, 8538199, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (124, N'Snoopy''s search-Red baron', 13, 1, 2, N'Billy Cobham', 456071, 15075616, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (125, N'Spanish moss-"A sound portrait"-Spanish moss', 13, 1, 2, N'Billy Cobham', 248084, 8217867, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (126, N'Moon germs', 13, 1, 2, N'Billy Cobham', 294060, 9714812, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (127, N'Stratus', 13, 1, 2, N'Billy Cobham', 582086, 19115680, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (128, N'The pleasant pheasant', 13, 1, 2, N'Billy Cobham', 318066, 10630578, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (129, N'Solo-Panhandler', 13, 1, 2, N'Billy Cobham', 246151, 8230661, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (130, N'Do what cha wanna', 13, 1, 2, N'George Duke', 274155, 9018565, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (131, N'Intro/ Low Down', 14, 1, 3, 323683, 10642901, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (132, N'13 Years Of Grief', 14, 1, 3, 246987, 8137421, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (133, N'Stronger Than Death', 14, 1, 3, 300747, 9869647, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (134, N'All For You', 14, 1, 3, 235833, 7726948, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (135, N'Super Terrorizer', 14, 1, 3, 319373, 10513905, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (136, N'Phoney Smile Fake Hellos', 14, 1, 3, 273606, 9011701, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (137, N'Lost My Better Half', 14, 1, 3, 284081, 9355309, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (138, N'Bored To Tears', 14, 1, 3, 247327, 8130090, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (139, N'A.N.D.R.O.T.A.Z.', 14, 1, 3, 266266, 8574746, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (140, N'Born To Booze', 14, 1, 3, 282122, 9257358, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (141, N'World Of Trouble', 14, 1, 3, 359157, 11820932, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (142, N'No More Tears', 14, 1, 3, 555075, 18041629, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (143, N'The Begining... At Last', 14, 1, 3, 365662, 11965109, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (144, N'Heart Of Gold', 15, 1, 3, 194873, 6417460, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (145, N'Snowblind', 15, 1, 3, 420022, 13842549, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (146, N'Like A Bird', 15, 1, 3, 276532, 9115657, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (147, N'Blood In The Wall', 15, 1, 3, 284368, 9359475, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (148, N'The Beginning...At Last', 15, 1, 3, 271960, 8975814, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (149, N'Black Sabbath', 16, 1, 3, 382066, 12440200, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (150, N'The Wizard', 16, 1, 3, 264829, 8646737, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (151, N'Behind The Wall Of Sleep', 16, 1, 3, 217573, 7169049, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (152, N'N.I.B.', 16, 1, 3, 368770, 12029390, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (153, N'Evil Woman', 16, 1, 3, 204930, 6655170, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (154, N'Sleeping Village', 16, 1, 3, 644571, 21128525, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (155, N'Warning', 16, 1, 3, 212062, 6893363, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (156, N'Wheels Of Confusion / The Straightener', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 494524, 16065830, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (157, N'Tomorrow''s Dream', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 192496, 6252071, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (158, N'Changes', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 286275, 9175517, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (159, N'FX', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 103157, 3331776, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (160, N'Supernaut', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 285779, 9245971, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (161, N'Snowblind', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 331676, 10813386, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (162, N'Cornucopia', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 234814, 7653880, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (163, N'Laguna Sunrise', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 173087, 5671374, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (164, N'St. Vitus Dance', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 149655, 4884969, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (165, N'Under The Sun/Every Day Comes and Goes', 17, 1, 3, N'Tony Iommi, Bill Ward, Geezer Butler, Ozzy Osbourne', 350458, 11360486, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (166, N'Smoked Pork', 18, 1, 4, 47333, 1549074, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (167, N'Body Count''s In The House', 18, 1, 4, 204251, 6715413, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (168, N'Now Sports', 18, 1, 4, 4884, 161266, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (169, N'Body Count', 18, 1, 4, 317936, 10489139, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (170, N'A Statistic', 18, 1, 4, 6373, 211997, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (171, N'Bowels Of The Devil', 18, 1, 4, 223216, 7324125, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (172, N'The Real Problem', 18, 1, 4, 11650, 387360, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (173, N'KKK Bitch', 18, 1, 4, 173008, 5709631, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (174, N'D Note', 18, 1, 4, 95738, 3067064, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (175, N'Voodoo', 18, 1, 4, 300721, 9875962, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (176, N'The Winner Loses', 18, 1, 4, 392254, 12843821, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (177, N'There Goes The Neighborhood', 18, 1, 4, 350171, 11443471, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (178, N'Oprah', 18, 1, 4, 6635, 224313, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (179, N'Evil Dick', 18, 1, 4, 239020, 7828873, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (180, N'Body Count Anthem', 18, 1, 4, 166426, 5463690, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (181, N'Momma''s Gotta Die Tonight', 18, 1, 4, 371539, 12122946, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (182, N'Freedom Of Speech', 18, 1, 4, 281234, 9337917, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (183, N'King In Crimson', 19, 1, 3, N'Roy Z', 283167, 9218499, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (184, N'Chemical Wedding', 19, 1, 3, N'Roy Z', 246177, 8022764, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (185, N'The Tower', 19, 1, 3, N'Roy Z', 285257, 9435693, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (186, N'Killing Floor', 19, 1, 3, N'Adrian Smith', 269557, 8854240, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (187, N'Book Of Thel', 19, 1, 3, N'Eddie Casillas/Roy Z', 494393, 16034404, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (188, N'Gates Of Urizen', 19, 1, 3, N'Roy Z', 265351, 8627004, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (189, N'Jerusalem', 19, 1, 3, N'Roy Z', 402390, 13194463, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (190, N'Trupets Of Jericho', 19, 1, 3, N'Roy Z', 359131, 11820908, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (191, N'Machine Men', 19, 1, 3, N'Adrian Smith', 341655, 11138147, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (192, N'The Alchemist', 19, 1, 3, N'Roy Z', 509413, 16545657, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (193, N'Realword', 19, 1, 3, N'Roy Z', 237531, 7802095, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (194, N'First Time I Met The Blues', 20, 1, 6, N'Eurreal Montgomery', 140434, 4604995, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (195, N'Let Me Love You Baby', 20, 1, 6, N'Willie Dixon', 175386, 5716994, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (196, N'Stone Crazy', 20, 1, 6, N'Buddy Guy', 433397, 14184984, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (197, N'Pretty Baby', 20, 1, 6, N'Willie Dixon', 237662, 7848282, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (198, N'When My Left Eye Jumps', 20, 1, 6, N'Al Perkins/Willie Dixon', 235311, 7685363, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (199, N'Leave My Girl Alone', 20, 1, 6, N'Buddy Guy', 204721, 6859518, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (200, N'She Suits Me To A Tee', 20, 1, 6, N'Buddy Guy', 136803, 4456321, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (201, N'Keep It To Myself (Aka Keep It To Yourself)', 20, 1, 6, N'Sonny Boy Williamson [I]', 166060, 5487056, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (202, N'My Time After Awhile', 20, 1, 6, N'Robert Geddins/Ron Badger/Sheldon Feinberg', 182491, 6022698, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (203, N'Too Many Ways (Alternate)', 20, 1, 6, N'Willie Dixon', 135053, 4459946, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (204, N'Talkin'' ''Bout Women Obviously', 20, 1, 6, N'Amos Blakemore/Buddy Guy', 589531, 19161377, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (205, N'Jorge Da Capadócia', 21, 1, 7, N'Jorge Ben', 177397, 5842196, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (206, N'Prenda Minha', 21, 1, 7, N'Tradicional', 99369, 3225364, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (207, N'Meditação', 21, 1, 7, N'Tom Jobim - Newton Mendoça', 148793, 4865597, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (208, N'Terra', 21, 1, 7, N'Caetano Veloso', 482429, 15889054, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (209, N'Eclipse Oculto', 21, 1, 7, N'Caetano Veloso', 221936, 7382703, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (210, N'Texto "Verdade Tropical"', 21, 1, 7, N'Caetano Veloso', 84088, 2752161, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (211, N'Bem Devagar', 21, 1, 7, N'Gilberto Gil', 133172, 4333651, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (212, N'Drão', 21, 1, 7, N'Gilberto Gil', 156264, 5065932, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (213, N'Saudosismo', 21, 1, 7, N'Caetano Veloso', 144326, 4726981, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (214, N'Carolina', 21, 1, 7, N'Chico Buarque', 181812, 5924159, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (215, N'Sozinho', 21, 1, 7, N'Peninha', 190589, 6253200, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (216, N'Esse Cara', 21, 1, 7, N'Caetano Veloso', 223111, 7217126, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (217, N'Mel', 21, 1, 7, N'Caetano Veloso - Waly Salomão', 294765, 9854062, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (218, N'Linha Do Equador', 21, 1, 7, N'Caetano Veloso - Djavan', 299337, 10003747, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (219, N'Odara', 21, 1, 7, N'Caetano Veloso', 141270, 4704104, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (220, N'A Luz De Tieta', 21, 1, 7, N'Caetano Veloso', 251742, 8507446, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (221, N'Atrás Da Verd-E-Rosa Só Não Vai Quem Já Morreu', 21, 1, 7, N'David Corrêa - Paulinho Carvalho - Carlos Sena - Bira do Ponto', 307252, 10364247, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (222, N'Vida Boa', 21, 1, 7, N'Fausto Nilo - Armandinho', 281730, 9411272, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (223, N'Sozinho (Hitmakers Classic Mix)', 22, 1, 7, 436636, 14462072, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (224, N'Sozinho (Hitmakers Classic Radio Edit)', 22, 1, 7, 195004, 6455134, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (225, N'Sozinho (Caêdrum ''n'' Bass)', 22, 1, 7, 328071, 10975007, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (226, N'Carolina', 23, 1, 7, 163056, 5375395, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (227, N'Essa Moça Ta Diferente', 23, 1, 7, 167235, 5568574, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (228, N'Vai Passar', 23, 1, 7, 369763, 12359161, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (229, N'Samba De Orly', 23, 1, 7, 162429, 5431854, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (230, N'Bye, Bye Brasil', 23, 1, 7, 283402, 9499590, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (231, N'Atras Da Porta', 23, 1, 7, 189675, 6132843, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (232, N'Tatuagem', 23, 1, 7, 172120, 5645703, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (233, N'O Que Será (À Flor Da Terra)', 23, 1, 7, 167288, 5574848, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (234, N'Morena De Angola', 23, 1, 7, 186801, 6373932, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (235, N'Apesar De Você', 23, 1, 7, 234501, 7886937, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (236, N'A Banda', 23, 1, 7, 132493, 4349539, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (237, N'Minha Historia', 23, 1, 7, 182256, 6029673, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (238, N'Com Açúcar E Com Afeto', 23, 1, 7, 175386, 5846442, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (239, N'Brejo Da Cruz', 23, 1, 7, 214099, 7270749, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (240, N'Meu Caro Amigo', 23, 1, 7, 260257, 8778172, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (241, N'Geni E O Zepelim', 23, 1, 7, 317570, 10342226, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (242, N'Trocando Em Miúdos', 23, 1, 7, 169717, 5461468, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (243, N'Vai Trabalhar Vagabundo', 23, 1, 7, 139154, 4693941, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (244, N'Gota D''água', 23, 1, 7, 153208, 5074189, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (245, N'Construção / Deus Lhe Pague', 23, 1, 7, 383059, 12675305, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (246, N'Mateus Enter', 24, 1, 7, N'Chico Science', 33149, 1103013, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (247, N'O Cidadão Do Mundo', 24, 1, 7, N'Chico Science', 200933, 6724966, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (248, N'Etnia', 24, 1, 7, N'Chico Science', 152555, 5061413, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (249, N'Quilombo Groove [Instrumental]', 24, 1, 7, N'Chico Science', 151823, 5042447, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (250, N'Macô', 24, 1, 7, N'Chico Science', 249600, 8253934, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (251, N'Um Passeio No Mundo Livre', 24, 1, 7, N'Chico Science', 240091, 7984291, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (252, N'Samba Do Lado', 24, 1, 7, N'Chico Science', 227317, 7541688, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (253, N'Maracatu Atômico', 24, 1, 7, N'Chico Science', 284264, 9670057, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (254, N'O Encontro De Isaac Asimov Com Santos Dumont No Céu', 24, 1, 7, N'Chico Science', 99108, 3240816, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (255, N'Corpo De Lama', 24, 1, 7, N'Chico Science', 232672, 7714954, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (256, N'Sobremesa', 24, 1, 7, N'Chico Science', 240091, 7960868, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (257, N'Manguetown', 24, 1, 7, N'Chico Science', 194560, 6475159, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (258, N'Um Satélite Na Cabeça', 24, 1, 7, N'Chico Science', 126615, 4272821, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (259, N'Baião Ambiental [Instrumental]', 24, 1, 7, N'Chico Science', 152659, 5198539, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (260, N'Sangue De Bairro', 24, 1, 7, N'Chico Science', 132231, 4415557, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (261, N'Enquanto O Mundo Explode', 24, 1, 7, N'Chico Science', 88764, 2968650, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (262, N'Interlude Zumbi', 24, 1, 7, N'Chico Science', 71627, 2408550, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (263, N'Criança De Domingo', 24, 1, 7, N'Chico Science', 208222, 6984813, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (264, N'Amor De Muito', 24, 1, 7, N'Chico Science', 175333, 5881293, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (265, N'Samidarish [Instrumental]', 24, 1, 7, N'Chico Science', 272431, 8911641, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (266, N'Maracatu Atômico [Atomic Version]', 24, 1, 7, N'Chico Science', 273084, 9019677, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (267, N'Maracatu Atômico [Ragga Mix]', 24, 1, 7, N'Chico Science', 210155, 6986421, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (268, N'Maracatu Atômico [Trip Hop]', 24, 1, 7, N'Chico Science', 221492, 7380787, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (269, N'Banditismo Por Uma Questa', 25, 1, 7, 307095, 10251097, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (270, N'Banditismo Por Uma Questa', 25, 1, 7, 243644, 8147224, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (271, N'Rios Pontes & Overdrives', 25, 1, 7, 286720, 9659152, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (272, N'Cidade', 25, 1, 7, 216346, 7241817, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (273, N'Praiera', 25, 1, 7, 183640, 6172781, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (274, N'Samba Makossa', 25, 1, 7, 271856, 9095410, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (275, N'Da Lama Ao Caos', 25, 1, 7, 251559, 8378065, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (276, N'Maracatu De Tiro Certeiro', 25, 1, 7, 88868, 2901397, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (277, N'Salustiano Song', 25, 1, 7, 215405, 7183969, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (278, N'Antene Se', 25, 1, 7, 248372, 8253618, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (279, N'Risoflora', 25, 1, 7, 105586, 3536938, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (280, N'Lixo Do Mangue', 25, 1, 7, 193253, 6534200, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, milliseconds, bytes, unit_price) VALUES (281, N'Computadores Fazem Arte', 25, 1, 7, 404323, 13702771, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (282, N'Girassol', 26, 1, 8, N'Bino Farias/Da Gama/Lazão/Pedro Luis/Toni Garrido', 249808, 8327676, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (283, N'A Sombra Da Maldade', 26, 1, 8, N'Da Gama/Toni Garrido', 230922, 7697230, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (284, N'Johnny B. Goode', 26, 1, 8, N'Chuck Berry', 254615, 8505985, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (285, N'Soldado Da Paz', 26, 1, 8, N'Herbert Vianna', 194220, 6455080, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (286, N'Firmamento', 26, 1, 8, N'Bino Farias/Da Gama/Henry Lawes/Lazão/Toni Garrido/Winston Foser-Vers', 222145, 7402658, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (287, N'Extra', 26, 1, 8, N'Gilberto Gil', 304352, 10078050, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (288, N'O Erê', 26, 1, 8, N'Bernardo Vilhena/Bino Farias/Da Gama/Lazão/Toni Garrido', 236382, 7866924, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (289, N'Podes Crer', 26, 1, 8, N'Bino Farias/Da Gama/Lazão/Toni Garrido', 232280, 7747747, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (290, N'A Estrada', 26, 1, 8, N'Bino Farias/Da Gama/Lazão/Toni Garrido', 248842, 8275673, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (291, N'Berlim', 26, 1, 8, N'Da Gama/Toni Garrido', 207542, 6920424, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (292, N'Já Foi', 26, 1, 8, N'Bino Farias/Da Gama/Lazão/Toni Garrido', 221544, 7388466, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (293, N'Onde Você Mora?', 26, 1, 8, N'Marisa Monte/Nando Reis', 256026, 8502588, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (294, N'Pensamento', 26, 1, 8, N'Bino Farias/Da Gamma/Lazão/Rás Bernard', 173008, 5748424, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (295, N'Conciliação', 26, 1, 8, N'Da Gama/Lazão/Rás Bernardo', 257619, 8552474, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (296, N'Realidade Virtual', 26, 1, 8, N'Bino Farias/Da Gama/Lazão/Toni Garrido', 195239, 6503533, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (297, N'Mensagem', 26, 1, 8, N'Bino Farias/Da Gama/Lazão/Rás Bernardo', 225332, 7488852, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (298, N'A Cor Do Sol', 26, 1, 8, N'Bernardo Vilhena/Da Gama/Lazão', 231392, 7663348, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (299, N'Onde Você Mora?', 27, 1, 8, N'Marisa Monte/Nando Reis', 298396, 10056970, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (300, N'O Erê', 27, 1, 8, N'Bernardo Vilhena/Bino/Da Gama/Lazao/Toni Garrido', 206942, 6950332, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (301, N'A Sombra Da Maldade', 27, 1, 8, N'Da Gama/Toni Garrido', 285231, 9544383, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (302, N'A Estrada', 27, 1, 8, N'Da Gama/Lazao/Toni Garrido', 282174, 9344477, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (303, N'Falar A Verdade', 27, 1, 8, N'Bino/Da Gama/Ras Bernardo', 244950, 8189093, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (304, N'Firmamento', 27, 1, 8, N'Harry Lawes/Winston Foster-Vers', 225488, 7507866, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (305, N'Pensamento', 27, 1, 8, N'Bino/Da Gama/Ras Bernardo', 192391, 6399761, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (306, N'Realidade Virtual', 27, 1, 8, N'Bino/Da Gamma/Lazao/Toni Garrido', 240300, 8069934, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (307, N'Doutor', 27, 1, 8, N'Bino/Da Gama/Toni Garrido', 178155, 5950952, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (308, N'Na Frente Da TV', 27, 1, 8, N'Bino/Da Gama/Lazao/Ras Bernardo', 289750, 9633659, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (309, N'Downtown', 27, 1, 8, N'Cidade Negra', 239725, 8024386, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (310, N'Sábado A Noite', 27, 1, 8, N'Lulu Santos', 267363, 8895073, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (311, N'A Cor Do Sol', 27, 1, 8, N'Bernardo Vilhena/Da Gama/Lazao', 273031, 9142937, 0.99);
INSERT INTO tracks (id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price) VALUES (312, N'Eu Também Quero Beijar', 27, 1, 8, N'Fausto Nilo/Moraes Moreira/Pepeu Gomes', 211147, 7029400, 0.99);
