-- CREATE DATABASE "chitter_peeps";
-- CREATE DATABASE "chitter_peeps_test";
CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(30) DEFAULT 'Guest', content VARCHAR(80), created_at TIMESTAMP default CURRENT_TIMESTAMP);
-- INSERT into peeps(content) VALUES('I''m new to peeping, this is my very first peep :)!'),('Hey, I''m Tom, and I like peeping, is that wrong?!?!'),('This is my third peep in about 10 minutes, I think I''m addicted');
