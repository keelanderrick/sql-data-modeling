-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic


CREATE TABLE persons
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
  id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL
);

CREATE TABLE locations
(
  id SERIAL PRIMARY KEY,
  country_name TEXT NOT NULL,
  city_name TEXT NOT NULL
);

CREATE TABLE tickets
(
  id SERIAL PRIMARY KEY,
  person_id INT,
  airline_id INT,
  seat TEXT NOT NULL,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_location_id INT,
  to_location_id INT,
  FOREIGN KEY (person_id) REFERENCES persons(id),
  FOREIGN KEY (airline_id) REFERENCES airlines(id),
  FOREIGN KEY (from_location_id) REFERENCES locations(id),
  FOREIGN KEY (to_location_id) REFERENCES locations(id)
);

INSERT INTO persons (first_name, last_name) VALUES ('Jennifer', 'Finch'), ('Thadeus', 'Gathercoal'), ('Sonja', 'Pauley');
INSERT INTO locations (city_name, country_name) VALUES ('Washington DC', 'United States'), ('Seattle', 'United States'), ('Tokyo', 'Japan'), ('London', 'United Kingdom'),('Los Angeles', 'United States'),('Las Vegas', 'United States');
INSERT INTO airlines (airline_name) VALUES ('United'), ('British Airways'), ('Delta');
INSERT INTO tickets (person_id, airline_id, seat, departure, arrival, from_location_id, to_location_id) 
VALUES 
(1,1,'33B','2018-04-08 09:00:00','2018-04-08 12:00:00',1,2),
(2,2,'8A','2018-12-19 12:45:00','2018-12-19 16:15:00',3,4),
(3,3,'12F','2018-01-02 07:00:00','2018-01-02 08:03:00',5,6);