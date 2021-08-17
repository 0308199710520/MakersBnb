CREATE DATABASE makersbnb;

-- create table for user info --
CREATE TABLE user_info(id SERIAL PRIMARY KEY, email VARCHAR(50), password VARCHAR(20));

--create test table for user info when in dev --
CREATE TABLE user_info_test(id SERIAL PRIMARY KEY, email VARCHAR(50), password VARCHAR(20));