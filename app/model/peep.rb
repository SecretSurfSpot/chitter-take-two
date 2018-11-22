require 'pg'

class Peep

  def self.view_all_peeps
    connection = PG.connect(dbname: 'Chitter_Peeps')
    result = connection.exec('select * from peeps')
    result.map { |peep| peep['content'] }
  end

  def self.create_new_peep(content: '')
    connection = PG.connect(dbname: 'Chitter_Peeps')
    result = connection.exec("insert into peeps(content) VALUES('#{content}')")
  end
  
end
