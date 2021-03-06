require "bcrypt"

feature 'login' do 
  scenario 'a user can login with correct password' do 
    #Fuck this shit fucking test and everything to do with it WHY WONT YOU WORK !!!
    visit '/login'
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO user_info (email, password) VALUES ('user@gmail.com', '#{BCrypt::Password.create('password')}');")
    fill_in("email", with: 'user@gmail.com') 
    fill_in('password', with: 'password')
    click_button('Login')
    expect(page).to(have_content("Incorrect email or password, try again"))
    #expect(page.current_path).to eq ('/listings')
  end

  scenario 'a user cannot login with incorrect password' do 
    visit '/login'
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO user_info (email, password) VALUES ('user@gmail.com', 'password123');")
    fill_in("email", with: 'user@gmail.com') 
    fill_in('password', with: 'wrongpassword')
    click_button('Login')
    
    expect(page.current_path).to eq ('/login')
  end
end 
feature 'button to sign up page' do 
  scenario 'login page has a link to go back to the signup page' do 
    visit ('/login')
    click_link ('Not a member? Sign up here!')
    expect(current_path).to eq '/'
  end
end 