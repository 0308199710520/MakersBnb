require 'pg'
class Listing

  attr_accessor :name, :description, :price, :date_from, :date_to 

  def initialize(name:, description:, price:, date_from:, date_to:)
    @name = name
    @description = description
    @price = price
    @date_from = date_from
    @date_to = date_to
  end

  
  def self.all
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT * FROM listings")
    result.map { |listing| Listing.new(name:listing['name'], description: listing['description'], price: listing['price'],
      date_from: listing['date_from'], date_to: listing['date_to'])}


  end

  def self.create(name:, description:, price:, date_from:, date_to:)
   
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    connection.exec("INSERT INTO listings (name, description, price, date_from, date_to) VALUES('#{name}', '#{description}', '#{price}',
    '#{date_from}','#{date_to}') RETURNING id, name, description, price, date_from, date_to")

 

  end



end