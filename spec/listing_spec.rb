require 'listing'

describe Listing do
  
  describe '.all' do
    it "returns the listings" do
      connection = PG.connect(dbname: 'makers_bnb_test')
      connection.exec("INSERT INTO listings (name) VALUES ('zagora');")
      connection.exec("INSERT INTO listings (name) VALUES ('arogaz');")

      listings = Listing.all

      expect(listings).to include('zagora')
      expect(listings).to include('arogaz')


    end
  end

  describe '.create' do
    it "creates a listing with a name" do
      Listing.create(name: 'bradford')
      expect(Listing.all).to include('bradford')
    end
  end
end