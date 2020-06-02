require 'bookmark'

describe Bookmark do
  describe '.all' do
    it "should return all bookmarks" do
      bookmarks = Bookmark.all
      expect(bookmarks).to include("https://github.com/makersacademy/course/blob/master/bookmark_manager/03_viewing_bookmarks")
      expect(bookmarks).to include("https://www.bbc.co.uk/")
    end
  end
end