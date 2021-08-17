require 'pg'
class Listing
  
  def self.all
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT * FROM listings")
    result.map { |listing| listing['name'] }
  end

  def self.create(name:)
   
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    connection.exec("INSERT INTO listings (name) VALUES('#{name}')")
  end



end