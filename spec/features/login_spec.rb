feature 'login' do 
  scenario 'a user can login' do 
    visit '/user/login'
    fill_in('email_address', with: 'user@gmail.com')
    fill_in('password', with: 'password')
    click_button('Login')

    expect(page).to have_content "user@gmail.com, password"
  end
end 