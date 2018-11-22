# Chitter - Take Two

Chitter Take Two, created with Ruby, Sinatra, Rack, RSpec (testing framework) and postgresql, using BDD, TDD and OOP principles and the MVC architectural pattern.

## Requirements


## Database Setup
- Connect to psql: via Terminal, on the command line, enter: `psql`
- Create the development and test databases: `CREATE DATABASE "chitter_peeps";` and `CREATE DATABASE "chitter_peeps_test";`
- Connect to the test database: `\c chitter_peeps_test`
- Create the peeps table: `CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(30) DEFAULT 'Guest', content VARCHAR(80), created_at DATE DEFAULT timenow());`



- Create the peeps table (`using the 01_create_peeps_table.sql file`)
