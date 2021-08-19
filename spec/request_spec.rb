require 'request'

describe Request do

  describe '.all' do
    it 'displays booking request data' do


      b = Request.create(listing_id: 8, check_in: '20/09/2021', check_out: '29/09/2021')
      b = Request.all

      expect(b.first).to be_a Request
      expect(b.first.listing_id).to eq '8'
      #expect(b.first.user_id).to eq '1'
      expect(b.first.check_in).to eq '20/09/2021'
      expect(b.first.check_out).to eq '29/09/2021'
    end
  end 

  describe '.create' do
    it "creates a booking request" do
      request = Request.create(check_in: '22/10/2021', check_out: '24/11/2021', listing_id: 10).first
      expect(request['check_in']).to eq '22/10/2021'
      expect(request['check_out']).to eq '24/11/2021'
      #expect(request['user_id']).to eq "2"
      expect(request['listing_id']).to eq "10"
    end
  end



end