require 'sinatra'
require 'pg'

feature 'Homepage' do
  scenario "it should have a button take to form" do
    visit '/'
    expect(page).to have_button "Add bookmark"
  end
end

feature 'Add bookmark' do
  scenario 'it should allow user input' do
    visit '/addbookmark'
    expect(page).to have_content "Add bookmark:"
    expect(page).to have_field "url"
  end
  
  scenario 'We should be able to see an added bookmark' do
    visit '/addbookmark'
    fill_in 'url', with: 'https://www.bbc.co.uk/'
    fill_in 'title', with: 'BBC'
    click_button 'Submit'
    expect(page).to have_link('BBC', href: 'https://www.bbc.co.uk')
  end
end

feature 'Bookmark Manager' do
  scenario "it should produce bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com','Makers');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com','Destroy All');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com','Google');")

    visit '/bookmarks'

    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
