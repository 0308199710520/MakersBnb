require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require 'pg'

class MakersBnb < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end 

  post '/new_user' do 
    'Account created'
  end

  get '/listings/new' do
    erb :listing_new
  end
 
  post '/listings' do
    'Listing created'
  
  end

  run! if app_file == $0

end
