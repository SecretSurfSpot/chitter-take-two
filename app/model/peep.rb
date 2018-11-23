require 'pg'

class Peep

  attr_reader :id, :username, :content, :created_at

  def initialize(id:, username:, content:, created_at:)
    @id = id
    @username = username
    @content = content
    @created_at = created_at
  end

  def self.view_all_peeps
    Database.setup_connection
    peeps = Database.run_query('SELECT * FROM peeps')
    # peeps.map { |peep| peep['content'] }

    peeps.map do |peep|
      Peep.new(id: peep["id"], username: peep["username"], content: peep["content"], created_at: peep["created_at"])
    end
  end

  def self.create_new_peep(content:)
    Database.setup_connection
    result = Database.run_query("INSERT INTO peeps(content) VALUES('#{content}') RETURNING id, username, content, created_at;")
  end

end
