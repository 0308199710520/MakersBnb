require 'pg'

class Request

  attr_accessor :check_in, :check_out, :listing_id 

  def initialize( check_in:, check_out:, listing_id:)
  
   @check_out = check_out
   @check_in = check_in
  
   @listing_id = listing_id
  end


  def self.all
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM bookings")
    result.map { |request| Request.new(check_in:request['check_in'], check_out: request['check_out'],
      listing_id: request['listing_id'])}


  end

  def self.create(check_in:, check_out:, listing_id:)
   
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO bookings (check_in, check_out, listing_id) VALUES( '#{check_in}', '#{check_out}',
    '#{listing_id}') RETURNING check_in, check_out, listing_id")

  end

end