require 'pg'

class Request


  def self.all
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM bookings")
    result.map { |listing| Listing.new(id: listing['id'], name:listing['name'], description: listing['description'], price: listing['price'],
      date_from: listing['date_from'], date_to: listing['date_to'])}


  end

end