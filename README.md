# Chitter - Take Two

Chitter Take Two, created with Ruby, Sinatra, Rack, with testing frameworks RSpec (Unit tests) and Capybara (Feature tests) and a PostgreSQL database.
The app was developed using BDD, TDD and OOP principles and the MVC architectural pattern.

## Requirements


### Database Setup
- Connect to psql: via Terminal, on the command line, enter: `psql`
- Create the development and test databases: `CREATE DATABASE "chitter_peeps";` and `CREATE DATABASE "chitter_peeps_test";`

Test database table: create:
- Connect to the test database: `\c chitter_peeps_test`
- Create the peeps table: `CREATE TABLE peeps(id SERIAL PRIMARY KEY, username VARCHAR(30) DEFAULT 'Guest', content VARCHAR(80), created_at DATE DEFAULT timenow());`

Development database table: create & populate:
- Connect to the development database: `\c chitter_peeps`
- Create the peeps table: (run the same sql as for the test database, above)
- Insert some values into the peeps table: `INSERT into peeps(content) VALUES('I''m new to peeping, this is my very first peep :)!'),('Hey, I''m Tom, and I like peeping, is that wrong?!?!'),('This is my third peep in about 10 minutes, I think I''m addicted');`

- Create the peeps table (`using the 01_create_peeps_table.sql file`)

## How chitter-take-two was created
### Basic Setup
- Create the project directory: `mkdir chitter-take-two`
- Navigate to the project root, then initialise the directory for git: `git init`
- Create a Gemfile (Gems are Ruby modules/libraries): `bundle init`
- Edit the Gemfile, including all Ruby modules required, Gemfile example below:
`source "https://rubygems.org"

gem 'rake'
gem 'sinatra'

group :test do
  gem 'pg'
  gem 'rspec'
  gem 'capybara'
  gem 'rubocop', '0.56.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end`
- Install the Rubv gems: `bundle install` this will fetch all gems, then install them
- Initialise RSPec: `rspec --init` this sets the project up to use RSpec, creating a .rspec file and a spec folder, with a spec_helper file inside

### Setup for Improving Testing
- The 'simplecov' gem provides the % code coverage achieved by the tests
- The 'simplecov-console' gem provides a better console display of the code coverage breakdown

To utilise the installed 'simplecov' gems, in the spec_helper.rb file, at the top, the following code was added:
```
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
```

### Setup for Improving Code Quality
- The 'rubocop' gem is a static Ruby code analyser, providing errors and warnings on the quality of the code syntax when compared with code guidelines detailed in the [Ruby Style Guide](https://github.com/rubocop-hq/ruby-style-guide)

### Setup for Web Apps
- The 'sinatra' gem is a lightweight web application framework and DSL for Ruby projects
- The 'capybara' gem is a web-based test automation framework, allowing creation of functional tests that simulate user interaction with the front end web element of the application

### Setup for PostgreSQL(Database)
- The 'pg' gem provides an interface from the application to the PostgreSQL database

### Setup Sinatra and Rack
 - Sinatra, as mentioned above is a web app framework, Sinatra is also dependant on Rack
 - Rack is a Ruby webserver interface
 To config Sinatra and Rack:

 Initially, create a file called 'app.rb' in the project root, with the following code:
```
 require 'sinatra/base'

class Chitter < Sinatra::Base

get '/' do 
  'Hello World' 
end

run! if app_file == $0
 end
```

Now configure the `rackup` command to run the application in 'app.rb' - create a file called 'config.ru' in the project root, with the following code:
```
require_relative "./app"

run Chitter
```
### Setup Capybara to communicate with Sinatra
 - This configuration required modification to the spec_helper.rb file, the following code was added at the top of the file:
```
 ENV['RACK_ENV'] = 'test'

 # Bring in contents of the app.rb file
 require './app.rb'
 # require all testing gems
 require 'capybara'
 require 'capybara/rspec'
 require 'rspec'
 # Tell Capybara to talk to Chitter
 Capybara.app = Chitter
```
