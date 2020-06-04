require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    result = connection.exec('SELECT * FROM bookmarks')
    result.map { |bookmark| bookmark['title'] }
  end

  def self.create(url, title)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks(url, title) VALUES ('#{url}','#{title}');")
  end

   # def select
   #   connection = PG.connect(dbname: "bookmark_manager")
   #   select = connection.exec('SELECT url FROM bookmarks WHERE title = #{@selection};')
   # end

end
