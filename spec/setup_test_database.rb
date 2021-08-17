require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'user_info_test')
  connection.exec("TRUNCATE user_info_test;")
end

