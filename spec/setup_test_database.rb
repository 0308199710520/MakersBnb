require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'makersbnb_test')
  connection.exec("TRUNCATE user_info;")
  connection.exec("TRUNCATE listings;")
end

