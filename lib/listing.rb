require 'pg'
class Listing

  attr_accessor :name, :description 

  def initialize(name:, description:)
    @name = name
    @description = description
  end

  
  def self.all
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT * FROM listings")
    result.map { |listing| Listing.new(name:listing['name'], description: listing['description'])}


  end

  def self.create(name:, description:)
   
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    connection.exec("INSERT INTO listings (name, description) VALUES('#{name}', '#{description}') RETURNING id, name, description")

 

  end



end