require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'

require 'sinatra/flash'
require './lib/user.rb'
require 'sinatra/flash'
require 'pg'
require_relative './lib/listing.rb'
require_relative './lib/booking.rb'
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
      redirect '/listings'
    else
      flash[:notice] = "Incorrect email or password, try again"
      redirect '/login'
    end
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

  get '/listings/booking' do
    @listing_id = params['listing_id']
    @listed = Booking.display_booking(@listing_id)
    erb :'listings/booking'
    
  end

  get '/listings/booking/confirmation' do
    @check_in = session[:check_in] 
    @check_out = session[:check_out]
   
    erb :'listings/booking/confirmation'
  end

  post '/listings/booking/confirmation' do
    session[:check_in] = params['check_in']
    session[:check_out] = params['check_out']
    redirect '/listings/booking/confirmation' 

    #need to replace sessions with a 
    #Booking.create(check_in: params['check_in'],check_out: params['check_out']) also booking, listing and user id
    
  end
  


  run! if app_file == $0

end

