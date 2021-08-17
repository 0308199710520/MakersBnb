require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require 'pg'

class MakersBnb < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end 

  get '/login' do 
      erb :login
  end

  post '/login' do 
    user = User.create(email: params[email], passworld: params[:password])
    redirect '/spaces'
  end 

  post '/spaces' do
    'welcome'
  end


  run! if app_file == $0

end


#CREATE DATABASE makersbnb
#CREATE TABLE user(id SerialPrimaryKey, email Varchar(50), password Varchar(10))