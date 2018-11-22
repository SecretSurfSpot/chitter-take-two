require 'pg'

def setup_test_database

  p 'setting up database.....'

  connection = PG.connect(dbname: 'chitter_peeps_test')

  # Clear the peeps table
  connection.exec("TRUNCATE peeps;")
  
  # Populate the peeps table with some data for the 'Peep.view_all_peeps' test
  connection.exec("INSERT into peeps(content) VALUES ('this is my first peep'),('second time around'),('third time lucky?');")

end
