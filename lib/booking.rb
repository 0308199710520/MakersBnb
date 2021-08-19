require 'pg'

class Booking


  def self.display_booking(id)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM listings WHERE id = '#{id}'")
    p result.class
    p result[0]['name']
    listed_hash = {name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], 
    date_from: result[0]['date_from'], date_to: result[0]['date_to']}
    listed_hash
    # result.map { |listing| listing['name'] }
    end

    def self.create(user_id:, listing_id:, booking_id:, check_in:, check_out:)

    end
end