require "bcrypt"
require 'pg'

class User

  def create(email:, password:)
      con = connection()

      result = con.exec("INSERT INTO user_info (email, password) VALUES ('#{email}', '#{BCrypt::Password.create(password)}');")
  end

  def login(email:, password:)
    con = connection()
    
    result = con.exec("SELECT * FROM user_info WHERE email LIKE '#{email}'")
    result = result.map { |email| email["email"] if BCrypt::Password.new(email["password"]) == password }.compact
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
