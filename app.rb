require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/addbookmark' do
    erb(:addbookmark)
  end

 
  post '/bookmarks' do
    @bookmarks= Bookmark.create(url: params["url"], title: params["title"])
    p @bookmarks
    redirect '/bookmarks'
  end


  get '/bookmarks' do
    @bookmarks = Bookmark.all
    p @bookmarks
    erb(:bookmarks)
  end

# <ul>
#   <%= @bookmarks.each do |bookmark| %>
#     <li>
#       <a href="<%= bookmark.url %>">
#         <%= bookmark.title %>
#       </a>
#     </li>
#   <% end %>
# </ul>

  run! if app_file == $0

end
