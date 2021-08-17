require 'pg'
class Listing
  
  def self.all
    connection = PG.connect(dbname: 'makers_bnb')
    result = connection.exec("SELECT * FROM listings")
    result.map { |bookmark| bookmark['name'] }
  end


end