require 'pg'
class Listing

  attr_accessor :name, :description, :price, :date_from 

  def initialize(name:, description:, price:, date_from:)
    @name = name
    @description = description
    @price = price
    @date_from = date_from
  end

  
  def self.all
    
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("SELECT * FROM listings")
    result.map { |listing| Listing.new(name:listing['name'], description: listing['description'], price: listing['price'],
      date_from: listing['date_from'])}


  end

  def self.create(name:, description:, price:, date_from:)
   
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else
      connection = PG.connect(dbname: 'makers_bnb')
    end

    connection.exec("INSERT INTO listings (name, description, price, date_from) VALUES('#{name}', '#{description}', '#{price}',
    '#{date_from}') RETURNING id, name, description, price, date_from")

 

  end



end