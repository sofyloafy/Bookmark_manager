require 'bookmark'

describe Bookmark do
  describe '.all' do
    it "should return all bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: "Destroy All")
      Bookmark.create(url: "http://www.google.com", title: "Google")

      bookmarks = Bookmark.all
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id.to_i).to be_a_kind_of Integer
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
end
