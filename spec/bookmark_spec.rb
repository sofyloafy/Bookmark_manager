require 'bookmark'

describe Bookmark do
  describe '.all' do
    it "should return all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com','Makers');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com','Destroy All');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com','Google');")

      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end

    it "should insert a url and title into the database table" do
      Bookmark.create('https://www.bbc.co.uk/','BBC')
      expect(Bookmark.all).to include 'https://www.bbc.co.uk/'
    end
  end
end
