require 'pg'

class User
  attr_reader :email_address, :password

  def initialize(email_address:, password:)
    @email_address = email_address
    @password = password
  end

  def self.create(email_address, password)
    con = PG.connect(dbname: "makersbnb")
    con.exec("INSERT INTO user_info (email, password) VALUES ('#{email_address}', '#{password}')")
  end
end