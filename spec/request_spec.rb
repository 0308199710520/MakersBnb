require 'request'

describe Request do


  describe '.create' do
    it "creates a booking request" do
      request = Request.create(check_in: '22/10/2021', check_out: '24/11/2021', listing_id: 10).first
      expect(request['check_in']).to eq '22/10/2021'
      expect(request['check_out']).to eq '24/11/2021'
      expect(request['listing_id']).to eq "10"
    end
  end



end