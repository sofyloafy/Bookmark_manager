require 'bookmark'

describe Bookmark do
  describe '.all' do
    it "should return all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title:"Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title:"Destroy All")
      Bookmark.create(url: "http://www.google.com", title:"Google")

      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end

    it "should insert a url and title into the database table" do
      Bookmark.create(url: 'https://www.bbc.co.uk/', title:'BBC')
      expect(Bookmark.all()).to include 'https://www.bbc.co.uk/'
    end
  end
end
