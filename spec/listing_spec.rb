require 'listing'

describe Listing do
  
  describe '.all' do
    it "returns the listings" do
      connection = PG.connect(dbname: 'makers_bnb_test')
      
      listing = Listing.create(name: 'zagora', description: "desert oasis")
      
      listings = Listing.all

      expect(listings.length).to eq 2
      expect(listings.first).to be_a Listing
      expect(listings.first.name).to eq 'zagora'
      expect(listings.first.description).to eq 'desert oasis'



    end
  end

  describe '.create' do
    it "creates a listing with a name and a description" do
      listing = Listing.create(name: 'small house', description: 'in bradford').first
      expect(listing['name']).to eq 'small house'
      expect(listing['description']).to eq 'in bradford'
    end
  end
end


