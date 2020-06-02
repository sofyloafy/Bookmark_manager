require 'sinatra/base'

class BookmarkManager < Sinatra::Base

  get '/' do
    "Welcome!"
  end

  get '/bookmarks' do
    @bookmarks = ['https://github.com/makersacademy/course/blob/master/bookmark_manager/03_viewing_bookmarks',
                  'https://www.bbc.co.uk/'
                ]
    erb :bookmarks
  end

  run! if app_file == $0

end
