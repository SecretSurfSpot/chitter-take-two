-- CREATE DATABASE "chitter_peeps";
-- CREATE DATABASE "chitter_peeps_test";
CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(30) DEFAULT 'Guest', content VARCHAR(80), created_at DATE DEFAULT timenow());
