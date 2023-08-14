DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

--Tables: region, user, post, category

CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    region_name VARCHAR,
    country_name VARCHAR
);

CREATE TABLE "user"
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR,
    last_name VARCHAR,
    region_id INTEGER REFERENCES region(id)
);

CREATE TABLE catagory
(
    id SERIAL PRIMARY KEY,
    cat_type VARCHAR,
    cat_desc VARCHAR
);

CREATE TABLE post
(
    id SERIAL PRIMARY KEY,
    cat_id INTEGER REFERENCES catagory(id),
    post_title VARCHAR,
    post_desc VARCHAR,
    user_id INTEGER REFERENCES "user"(id),
    region_id INTEGER REFERENCES region(id),
    posting_address VARCHAR
);