require 'listing'

describe Listing do
  
  describe '.all' do
    it "returns the listings" do
      connection = PG.connect(dbname: 'makers_bnb_test')
      
      listing = Listing.create(name: 'zagora', description: "desert oasis", price: 10, date_from: '10/10/2021')
      
      listings = Listing.all

      expect(listings.first).to be_a Listing
      expect(listings.first.name).to eq 'zagora'
      expect(listings.first.description).to eq 'desert oasis'
      expect(listings.first.price).to eq '10'
      expect(listings.first.date_from).to eq '10/10/2021'



    end
  end

  describe '.create' do
    it "creates a listing with a name and a description" do
      listing = Listing.create(name: 'small house', description: 'in bradford', price: 10, date_from: '15/10/2021').first
      expect(listing['name']).to eq 'small house'
      expect(listing['description']).to eq 'in bradford'
      expect(listing['price']).to eq '10'
      expect(listing['date_from']).to eq '15/10/2021'
    end
  end
end



