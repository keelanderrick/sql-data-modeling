-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbitted_star_id INT NOT NULL,
  galaxy_id INT NOT NULL,
  FOREIGN KEY (orbitted_star_id) REFERENCES stars(id),
  FOREIGN KEY (galaxy_id) REFERENCES galaxies(id)
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbitted_planet_id INT NOT NULL,
  FOREIGN KEY (orbitted_planet_id) REFERENCES planets(id)
);

INSERT INTO stars (name) VALUES ('The Sun'), ('Proxima Centauri'), ('Gliese 876');
INSERT INTO galaxies (name) VALUES ('Milky Way');
INSERT INTO planets (name, orbital_period_in_years, orbitted_star_id, galaxy_id) VALUES 
  ('Earth', 1.00, 1, 1), ('Mars', 1.88, 1, 1), ('Venus', 0.62, 1, 1),('Neptune', 164.8, 1, 1),('Proxima Centauri b', 0.03, 2, 1),('Gliese 876 b', 0.23, 3, 1);