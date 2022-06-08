-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  passenger_id INTEGER REFERENCES passenger
);

CREATE TABLE flight
(
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

INSERT INTO tickets
  (seat, departure, arrival)
VALUES
  ('33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  ('8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  ('12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  ('20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  ('23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  ('18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  ('9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  ('1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  ('32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  ('10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');

INSERT INTO passengers
(first_name, last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Jennifer', 'Slater'),
('Waneta', 'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin', 'Leathes'),
('Berkie', 'Wycliff'),
('Cory', 'Squibbes');

INSERT INTO flight
(airline, from_city, from_country, to_city, to_country)
VALUES
('united','Washington DC', 'United States', 'Seattle', 'United States'),
('British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
('Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
('Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
('TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
('Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
('United', 'New York', 'United States', 'Charlotte', 'United States'),
('American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
('Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');
