DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

--Tables: team, player, match, referee, match

CREATE TABLE season
(
    id SERIAL PRIMARY KEY,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    max_teams INTEGER
);

CREATE TABLE team
(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    count INTEGER,
    wins INTEGER,
    losses INTEGER
);

CREATE TABLE player
(
    id SERIAL PRIMARY KEY,
    team_id INTEGER REFERENCES team(id),
    first_name VARCHAR,
    last_name VARCHAR,
    jersey_num INTEGER,
    tot_goals INTEGER
);

CREATE TABLE referee
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    age INTEGER
);

CREATE TABLE match
(
    id SERIAL PRIMARY KEY,
    "date" TIMESTAMP,
    referee_id INTEGER REFERENCES referee(id),
    home_team INTEGER REFERENCES team(id),
    away_team INTEGER REFERENCES team(id)
);

CREATE TABLE match_goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES player(id),
    match_id INTEGER REFERENCES match(id),
    tot_goals INTEGER
);