require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require 'pg'
require './lib/user.rb'

class MakersBnb < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end 

  post '/login' do 
    User.create(email: params[:email], password: params[:password])
    erb :login
  end 

   post '/spaces' do
    'View our spaces'
  end


  run! if app_file == $0

end


#CREATE DATABASE makersbnb
#CREATE TABLE user(id SerialPrimaryKey, email Varchar(50), password Varchar(10))