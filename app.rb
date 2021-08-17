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

  post '/new_user' do 
    'Account created'
  end
  
  get '/user/login' do 
      erb :login
  end

  post '/user/logins' do 
    @email_address = params[:email_address]
    @password = params[:password]
    erb :login_user
  end 


  run! if app_file == $0

end
