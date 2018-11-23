require 'pg'

class Peep

  def self.view_all_peeps
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end

    result = connection.exec('select * from peeps')
    result.map { |peep| peep['content'] }
  end

  def self.create_new_peep(content: '')
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_peeps_test')
    else
      connection = PG.connect(dbname: 'chitter_peeps')
    end

    result = connection.exec("insert into peeps(content) VALUES('#{content}')")
  end

end
