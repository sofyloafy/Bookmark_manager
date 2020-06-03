require 'pg'

p 'Please hold, cleaning database...'

def refresh_database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec( "TRUNCATE TABLE bookmarks;")
end