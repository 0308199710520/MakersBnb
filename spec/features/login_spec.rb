feature 'login' do 

  scenario 'homepage has a sign in button' do
    visit('/')
    click_link('Sign In')
    expect(current_path).to eq '/login'
  end

  scenario 'a user can login' do 
    visit '/login'
    fill_in("email", with: 'test@gmail.com') 
    fill_in('password', with: 'password123')
    click_button('Login')

    expect(page.current_path).to eq ('/spaces')
  end
end 