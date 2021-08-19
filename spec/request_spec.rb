require 'request'

describe Request do

  describe '.all' do
    it 'displays booking request data' do

      brequest = Request.create(user_id: 1, listing_id: 8, check_in: '20/09/2021', check_out: '29/09/2021')
      b = Request.all

      expect(b.first).to be_a Booking
    end
  end 



end