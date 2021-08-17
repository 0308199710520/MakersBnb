require 'pg'

class User
  attr_reader :email, :password

  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end

    connection.exec("INSERT INTO user_info (email, password) VALUES ('#{email}', '#{password}')")
    # User.new(email: result[0]['email'], password: result[0]['password'],)

  end
end