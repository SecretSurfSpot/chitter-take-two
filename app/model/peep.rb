require 'pg'

class Peep
  def self.view_all_peeps
    connection = PG.connect(dbname: 'Chitter_Peeps')
    result = connection.exec('select * from peeps')
    result.map { |peep| peep['content'] }
  end

end
