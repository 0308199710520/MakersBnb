require 'pg'

class User
  attr_reader :email, :password, :id

  def create(email:, password:)
    # if password == confirm_password

      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'makersbnb_test')
      else 
        connection = PG.connect(dbname: 'makersbnb')
      end

      result = connection.exec("INSERT INTO user_info (email, password) VALUES ('#{email}', '#{password}');")

  end

  def login(email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("SELECT * FROM user_info WHERE email LIKE '#{email}' AND password LIKE '#{password}';")
    result = result.map { |email| email['email'] }

    if result.empty?
      return false
    else
      return true
    end
    
  end 
end


