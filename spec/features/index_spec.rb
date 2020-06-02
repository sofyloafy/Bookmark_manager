require 'sinatra'

feature 'Bookmark Manager' do
  scenario "it should redirect to bookmarks" do
    visit '/'
    expect(page).to have_content 'Welcome!'
  end


  scenario "it should produce bookmarks" do
    visit '/bookmarks'
    expect(page).to have_content 'https://github.com/makersacademy/course/blob/master/bookmark_manager/03_viewing_bookmarks'
    expect(page).to have_content 'https://www.bbc.co.uk/'
  end
end