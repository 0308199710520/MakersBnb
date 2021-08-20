--create database and table -- 
CREATE DATABASE makersbnb;

CREATE TABLE user_info(id SERIAL PRIMARY KEY, email VARCHAR(50), password VARCHAR(60));

--create test database for user info when in dev --
CREATE DATABASE makersbnb_test;

CREATE TABLE user_info(id SERIAL PRIMARY KEY, email VARCHAR(50), password VARCHAR(60));
