require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require 'sinatra/flash'
require './lib/user.rb'

class MakersBnb < Sinatra::Base
  enable :sessions
  

  configure :development do
    register Sinatra::Reloader
    register Sinatra::Flash
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
    test1 = user.login(email: params[:email], password: params[:password])
    if test1 == true
      @email = session[:email]
      redirect '/spaces'
    else
      flash[:alert] = "Please check your username and password"
      redirect '/login'
    end
  end 

  get '/spaces' do
    'View our spaces'
  end

  run! if app_file == $0

end

