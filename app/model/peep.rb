require 'pg'

class Peep

  def self.view_all_peeps
    Database.setup_connection
    peeps = Database.run_query('select * from peeps')
    peeps.map { |peep| peep['content'] }
  end

  def self.create_new_peep(content: '')
    Database.setup_connection
    result = Database.run_query("insert into peeps(content) VALUES('#{content}')")
  end

end
