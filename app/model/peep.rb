require 'pg'

class Peep

  attr_reader :id, :username, :content

  def initialize(id:, username:, content:)
    @id = id
    @username = username
    @content = content
  end

  def self.view_all_peeps
    Database.setup_connection
    peeps = Database.run_query('select * from peeps')
    peeps.map { |peep| peep['content'] }
  end

  def self.create_new_peep(content:)
    Database.setup_connection
    result = Database.run_query("insert into peeps(content) VALUES('#{content}') RETURNING id, username, content;")

    # result = connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, url, title;")
    # Bookmark.new(id: result[0]['id'], url: result[0]['url'], title: result[0]['title'])

  end

end
