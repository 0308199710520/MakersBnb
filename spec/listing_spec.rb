require 'listing'

describe Listing do
  
  describe '.all' do
    it "returns the listings" do
      connection = PG.connect(dbname: 'makers_bnb')
      connection.exec("INSERT INTO listings (name) VALUES ('zagora');")

      listings = Listing.all

      expect(listings).to include('zagora')


    end
  end
end