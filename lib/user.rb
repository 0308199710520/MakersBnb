require 'pg'

class User
  attr_reader :email, :password, :id

  def initialize(email:, password:, id:)
    @id
    @email = email
    @password = password
  end

  def self.create(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO user_info (email, password) VALUES ('#{email}', '#{password}')
    Returning id, email, password;")

    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      password: result[0]['password']
    )
  
  end

  def self.authenticate(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM user_info WHERE email LIKE '#{email}' AND password LIKE '#{password}';")
    result = result.map { |email| email['email'] }

    
  end 
end


