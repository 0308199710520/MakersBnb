require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require 'pg'
require_relative './lib/listing.rb'

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

  get '/listings' do
    
    @listings = Listing.all
    erb :listings

    
  end

  get '/listings/new' do
    erb :listing_new
  end
 
  post '/listings' do
    
    Listing.create(name: params['name'], description: params['description'],
       price: params['price'], date_from: params['date_from'], date_to: params['date_to'])
    


   
    
    
    redirect '/listings'
  
  end

  run! if app_file == $0

end
