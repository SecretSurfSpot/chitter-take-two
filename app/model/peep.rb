require 'pg'

class Peep
  def self.all
    connection = PG.connect(dbname: 'Chitter_Peeps')
    result = connection.exec('select * from peeps')
    result.map { |peep| peep['content'] }
  end

end
