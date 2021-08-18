feature 'login' do 
  scenario 'a user can login' do 
    visit '/login'
    fill_in("email", with: 'test@gmail.com') 
    fill_in('password', with: 'password123')
    click_button('Login')

    expect(page.current_path).to eq ('/spaces')
  end
end 