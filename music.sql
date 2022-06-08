-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  artists TEXT[] NOT NULL
);

CREATE TABLE album
(
  id SERIAL PRIMARY KEY,
  songs_id INTEGER REFERENCES songs,
  producers TEXT[] NOT NULL,
  release_date DATE NOT NULL,
  album_name TEXT [] NOT NULL
);

INSERT INTO songs
  (title, duration_in_seconds, artists)
VALUES
  ('MMMBop', 238,'{"Hanson"}'),
  ('Bohemian Rhapsody', 355, '{"Queen"}'),
  ('One Sweet Day', 282, '{"Mariah Cary", "Boyz II Men"}'),
  ('Shallow', 216, '{"Lady Gaga", "Bradley Cooper"}'),
  ('How You Remind Me', 223, '{"Nickelback"}'),
  ('New York State of Mind', 276, '{"Jay Z", "Alicia Keys"}'),
  ('Dark Horse', 215, '{"Katy Perry", "Juicy J"}'),
  ('Moves Like Jagger', 201, '{"Maroon 5", "Christina Aguilera"}'),
  ('Complicated', 244, '{"Avril Lavigne"}'),
  ('Say My Name', 240, '{"Destiny''s Child"}');

INSERT INTO album
(producers, album_name, release_date)
VALUES
('{"Dust Brothers", "Stephen Lironi"}', '{"Middle of Nowhere"}', '04-15-1997'),
('{"Roy Thomas Baker"}', '{"A Night at the Opera"}', '10-31-1975'),
('{"Walter Afanasieff"}', '{"Daydream"}', '11-14-1995'),
('{"Benjamin Rice"}', '{"A Star Is Born"}', '09-27-2018'),
('{"Rick Parashar"}', '{"Silver Side Up"}', '08-21-2001'),
('{"Al Shux"}', '{"The Blueprint 3"}', '10-20-2009'),
('{"Max Martin", "Cirkut"}', '{"Prism"}', '12-17-2013'),
('{"Shellback", "Benny Blanco"}', '{"Hands All Over"}', '06-21-2011'),
('{"The Matrix"}', '{"Let Go"}', '05-14-2002'),
('{"Darkchild"}', '{"The Writings on the Wall"}', '11-07-1999');