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

  post'/newuser' do 
    user = User.new
    user.create(email: params[:email], password: params[:password])
    redirect '/login'
  end 

  get '/login' do
    erb :login
  end 

  post '/login' do 
    user = User.new
    test1 = client.login(email: params[:email], password: params[:password])
    if test1 == true
      @email = session[:email]
      redirect '/spaces'
    else
      redirect '/'
    end
  end 

  get '/spaces' do
    'View our spaces'
  end

  run! if app_file == $0

end

