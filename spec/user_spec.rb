require_relative "../lib/user.rb"
require './spec/setup_test_database'
require "pg"
require "bcrypt"
describe User do

  describe "#create" do
    it "should store the email and password in the database when provided them" do
      user = User.new
      user.create(email: "user@gmail.com", password: "password")
      
      con = PG.connect(dbname: "makersbnb_test")
      content = con.exec("SELECT email, password FROM user_info").map{|each| each}
      
      expect(content[0]["email"]).to eq "user@gmail.com"
      expect(BCrypt::Password.new(content[0]["password"])).to eq "password"
    end
  end
end