feature 'login' do 


  scenario 'a user can login with correct password' do 
    visit '/login'
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO user_info (email, password) VALUES ('user@gmail.com', 'password123');")
    fill_in("email", with: 'user@gmail.com') 
    fill_in('password', with: 'password123')
    click_button('Login')

    expect(page.current_path).to eq ('/listings')
  end

  scenario 'a user can login with correct password' do 
    visit '/login'
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO user_info (email, password) VALUES ('user@gmail.com', 'password123');")
    fill_in("email", with: 'user@gmail.com') 
    fill_in('password', with: 'wrongpassword')
    click_button('Login')

    expect(page.current_path).to eq ('/login')
  end
end 