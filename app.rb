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

  get '/login' do
    erb :login
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

