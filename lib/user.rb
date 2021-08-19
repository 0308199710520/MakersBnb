
require 'pg'

class User

  def create(email:, password:)
      connection = connection()
      
      result = connection.exec("INSERT INTO user_info (email, password) VALUES ('#{email}', '#{password}');")

  end

  def login(email:, password:)

    connection = connection()

    result = connection.exec("SELECT * FROM user_info WHERE email LIKE '#{email}' AND password LIKE '#{password}';")
    result = result.map { |email| email['email'] }
    return result.length > 0 
  end 

  def password_same?(password:, confirm_password:)
    return password == confirm_password
  end

  def connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else 
      connection = PG.connect(dbname: 'makersbnb')
    end
  end
end
