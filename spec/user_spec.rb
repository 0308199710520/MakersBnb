require_relative "../lib/user.rb"
require './spec/setup_test_database'
require "pg"

describe User do
  #it { is_expected.to respond_to(:create) }
  describe "#create" do
    it "should store the email and password in the database when provided them" do
      setup_test_database

      User.create("user@gmail.com", "password")
      con = PG.connect(dbname: "makersbnb")
      content = con.exec("SELECT email, password FROM user_info").map{|each| each}
      expect(content[0]["email"]).to eq "user@gmail.com"
      expect(content[0]["password"]).to eq "password"
    end
  end
end