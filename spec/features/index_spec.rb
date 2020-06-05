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
end

feature 'Bookmark Manager' do
  scenario "it should produce bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com','Makers Academy');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com','Destroy All');")
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com','Google');")

    visit '/bookmarks'

    expect(page).to have_content "Makers"
    expect(page).to have_content "Destroy All"
    expect(page).to have_content "Google"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    # Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All')
    # Bookmark.create(url: 'http://www.google.com', title: 'Google')

    visit('/bookmarks')

    expect(page).to have_link("Makers Academy", href: 'http://www.makersacademy.com')
    # expect(page).to have_link('Destroy All',  href: 'http://www.destroyallsoftware.com')
    # expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
