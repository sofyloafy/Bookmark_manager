require 'sinatra'

feature 'Bookmark Manager' do
  scenario "it should produce bookmark homepage" do
    visit '/'
    expect(page).to have_content 'Welcome to Bookmark Manager!'
  end
end